
/// An empty default value when no `APIComponent` is needet.
public struct APIComponentStub: APIComponent {
    
}

extension APIComponentStub {
    
    /// An empty default implementation of `.register()` to avoid endless loops
    /// when registering `APIComponentStub`s.
    ///
    /// - Parameter apiExport: The export struct (`APIExport`) containing the export data up to this point.
    /// - Parameter _guard: The `Guard` object that is handed over by a `Group` component.
    /// - Parameter restPath: The REST path as `PathComponent`s up to this point.
    /// - Parameter grpcService: If the `APIComponent` is grouped into a gRPC service, the name of the service is handed over.
    public func register(to apiExport: inout APIExport, _guard: Guard?, restPath: [PathComponent], grpcService: String?) {}
}
