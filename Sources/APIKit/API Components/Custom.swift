import NIO
import Foundation

/// A class that provides wrapper logic for custom application logic with generic request and response types.
/// `ReqType` conforming to `AnyObject`.
/// `ResType` conforming to `AnyObject`.
public class Custom<ReqType: AnyObject, ResType: AnyObject>: APILogicComponent {
    /// The type of the `req` parameter of the `.handler()`.
    public typealias RequestType = ReqType
    /// The return type of the `.handler()`.
    public typealias ResponseType = ResType
    
    /// The logic name of the custom function.
    public internal(set) var logicNameAttribute: LogicNameAttribute = LogicNameAttribute(name: "CustomFunction_\(UUID().uuidString)")
    /// The `HTTPType` of the custom function.
    public internal(set) var httpTypeAttribute: HTTPTypeAttribute = HTTPTypeAttribute(httpType: .get)
    /// The `GraphQLType` of the custom function.
    public internal(set) var graphQLTypeAttribute: GraphQLTypeAttribute = GraphQLTypeAttribute(graphQLType: .query)
    /// The communication protocols the component gets exported to.
    public internal(set) var communicationOptionsAttribute: CommunicationOptionsAttribute = CommunicationOptionsAttribute(communicationOptions: .all)
    
    /// The custom handler function
    ///
    /// - Parameter req: An instance of `ReqType` that contains the request data.
    ///
    /// - Returns: An instance of `ResType` containing the response data.
    var customHandler: (_ req: ReqType) -> EventLoopFuture<ResType>
    
    init(
        _ customHandler: @escaping (_ req: ReqType) -> EventLoopFuture<ResType>
    ) {
        self.customHandler = customHandler
    }
}

/// An extension that defines the default handler behaviour.
extension Custom {
    
    /// The handler method calls the custom handler.
    ///
    /// - Parameter req: An instance of `ReqType` that contains the request data.
    ///
    /// - Returns: An instance of `ResType` containing the response data.
    public func handler(_ req: ReqType) -> EventLoopFuture<ResType> {
        self.customHandler(req)
    }
}
