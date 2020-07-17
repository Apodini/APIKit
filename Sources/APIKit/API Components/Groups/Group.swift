
/// A class that provides grouping functionality for `APIComponent`s.
public class Group: EditableRESTGroup, EditableGRPCServiceGroup, EditableGuardComponent {
    /// Defines if the group is a REST group.
    /// If the class is a REST group, `restGroupAttribute` contains the `PathComponent`s.
    public internal(set) var restGroupAttribute: RESTGroupAttribute = RESTGroupAttribute()
    /// Defines if the group is a gRPC service group.
    /// If the class is a gRPC service group, `grpcServiceAttribute` contains the service name.
    public internal(set) var grpcServiceAttribute: GRPCServiceAttribute = GRPCServiceAttribute()
    /// Defines if the group is a guard group.
    /// If the class is a gRuard group, `guardAttribute` contains the `Guard` type.
    public internal(set) var guardAttribute: GuardAttribute = GuardAttribute()
    
    /// The content of an `APIComponent` can harbour other components like Groups and logic components.
    public var content: APIComponent
    
    init(
        @APIComponentBuilder content: () -> APIComponent
    ) {
        self.content = content()
    }
}

/// An extension for defining default registration functionality to `Group`.
extension Group {
    
    /// Default implementation for the registration method.
    ///
    /// - Parameter apiExport: The export struct (`APIExport`) containing the export data up to this point.
    /// - Parameter _guard: The `Guard` object that is handed over by a `Group` component.
    /// - Parameter restPath: The REST path as `PathComponent`s up to this point.
    /// - Parameter grpcService: If the `APIComponent` is grouped into a gRPC service, the name of the service is handed over.
    public func register(to apiExport: inout APIExport, _guard: Guard?, restPath: [PathComponent], grpcService: String?) {
        
        if let grpcServiceName = self.grpcServiceAttribute.serviceName,
            let grpcService = grpcService {
            precondition(false, "Can't create GRPC Service \"\(grpcServiceName)\" as Child of GRPC Service \"\(grpcService)\"")
        }
        
        content.register(
            to: &apiExport,
            _guard: self.guardAttribute._guard ?? _guard,
            restPath: restPath + (self.restGroupAttribute.pathComponents ?? []),
            grpcService: self.grpcServiceAttribute.serviceName ?? grpcService
        )
    }
}
