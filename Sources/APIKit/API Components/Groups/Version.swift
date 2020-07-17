
/// A class that provides versioning functionality for `APIComponent`s.
public class Version: APIComponent {
    
    /// Defines  the version string that is added to the REST path.
    var version: String
    
    /// The content of an `APIComponent` can harbour other components like Groups and logic components.
    public var content: APIComponent
    
    init(
        _ version: String,
        @APIComponentBuilder content: () -> APIComponent
    ) {
        self.version = version
        self.content = content()
    }
    
    convenience init(
        _ version: Int,
        @APIComponentBuilder content: () -> APIComponent
    ) {
        self.init("v\(version)", content: content)
    }
}

/// An extension for defining default registration functionality to `Version`.
extension Version {
    
    /// Default implementation for the registration method.
    ///
    /// - Parameter apiExport: The export struct (`APIExport`) containing the export data up to this point.
    /// - Parameter _guard: The `Guard` object that is handed over by a `Group` component.
    /// - Parameter restPath: The REST path as `PathComponent`s up to this point.
    /// - Parameter grpcService: If the `APIComponent` is grouped into a gRPC service, the name of the service is handed over.
    public func register(to apiExport: inout APIExport, _guard: Guard?, restPath: [PathComponent], grpcService: String?) {
        content.register(
            to: &apiExport,
            _guard: _guard,
            restPath: restPath + [.constant(self.version)],
            grpcService: grpcService
        )
    }
}
