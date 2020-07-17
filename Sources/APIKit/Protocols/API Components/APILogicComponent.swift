import NIO
import Runtime
import Foundation

/// A porotcol on top of `APILogic`.
/// Defines the base for all application logic components.
public protocol APILogicComponent: NameableAPILogicComponent, APIComponentHTTPType, APIComponentGraphQLType, APIComponentCommunicationTypes {
    
    /// `RequestType` for the application logic endpoint.
    associatedtype RequestType: Any
    /// `ResponseType` for the application logic endpoint.
    associatedtype ResponseType: Any
    
    /// Defines the logic name that can be overwritten by using the `name` modifier.
    var logicNameAttribute: LogicNameAttribute { get }
    /// Defines the `HTTPType` that can be overwritten by using the `httpType` modifier.
    var httpTypeAttribute: HTTPTypeAttribute { get }
    /// Defines the `GraphQLType` that can be overwritten by using the `graphQLType` modifier.
    var graphQLTypeAttribute: GraphQLTypeAttribute { get }
    /// Defines the `CommunicationOption`s that can be overwritten by using the `communicationOptions` modifier.
    var communicationOptionsAttribute: CommunicationOptionsAttribute { get }
    
    /// A method needet to implement the handler procedure of the endpoint.
    ///
    /// - Parameter req: An instance of `RequestType` continaing request data.
    ///
    /// - Returns: An instance of `ResponseType` containing response data wrapped in an `EventLoopFuture`.
    func handler(_ req: RequestType) -> EventLoopFuture<ResponseType>
}

/// An extension that defines the default `CommunicationsOptions`.
extension APILogicComponent {
    
    /// By default an `APILogicComponent` gets exportet to all communication protocols.
    public var communicationOptions: CommunicationOptions { .all }
}

/// An extension that defined the default implementation for registering an `APILogicCOmponent` to the export struct (`APIExport`).
extension APILogicComponent {
    
    /// Default implementation for the registration method.
    ///
    /// - Parameter apiExport: The export struct (`APIExport`) containing the export data up to this point.
    /// - Parameter _guard: The `Guard` object that is handed over by a `Group` component.
    /// - Parameter restPath: The REST path as `PathComponent`s up to this point.
    /// - Parameter grpcService: If the `APIComponent` is grouped into a gRPC service, the name of the service is handed over.
    public func register(to apiExport: inout APIExport, _guard: Guard?, restPath: [PathComponent], grpcService: String?) {
        
        let requestTypeExport = ReflectionUtils.requestTypeToExport(type: RequestType.self)
        let responseTypeExport = ReflectionUtils.responseTypeToExport(type: ResponseType.self)
        
        var guardName: String?
        
        if let _guard = _guard {
            guardName = String(describing: _guard)
        }
        
        let authenticationType = _guard?.authenticationType ?? .none
        
        let logicName = logicNameAttribute.name ?? UUID().uuidString
        
        if self.communicationOptionsAttribute.communicationOptions.contains(.REST) {
            let pathParameters = requestTypeExport.filter { parameterExport in
                parameterExport.parameterType == .pathComponent
            }
            
            let pathExtension: [PathComponent] = pathParameters.reduce([], { acc, pathParameterExport in
                acc + [.constant(pathParameterExport.parameter.name), .parameter(pathParameterExport.parameter.name)]
            })
            
            let restExport = RESTExport(
                path: (restPath + pathExtension).string,
                httpType: self.httpTypeAttribute.httpType,
                _guard: guardName,
                authenticationType: authenticationType,
                requestParameters: requestTypeExport,
                responseParameters: responseTypeExport
            )
            
            apiExport.rest.append(restExport)
        }
        
        if self.communicationOptionsAttribute.communicationOptions.contains(.WebSocket) {
            let webSocketExport = WebSocketExport(
                name: logicName,
                _guard: guardName,
                authenticationType: authenticationType,
                requestParameters: requestTypeExport,
                responseParameters: responseTypeExport
            )
            
            apiExport.webSocket.append(webSocketExport)
        }
        
        if self.communicationOptionsAttribute.communicationOptions.contains(.graphQL) {
            let graphQLExport = GraphQLExport(
                name: logicName,
                graphQLType: self.graphQLTypeAttribute.graphQLType,
                _guard: guardName,
                authenticationType: authenticationType,
                requestParameters: requestTypeExport,
                responseParameters: responseTypeExport
            )
            
            apiExport.graphQL.append(graphQLExport)
        }
        
        if self.communicationOptionsAttribute.communicationOptions.contains(.gRPC) {
            let gRPCExport = GRPCExport(
                name: logicName,
                service: grpcService ?? "default",
                _guard: guardName,
                authenticationType: authenticationType,
                requestParameters: requestTypeExport,
                responseParameters: responseTypeExport
            )
            
            apiExport.grpc.append(gRPCExport)
        }
    }
}
