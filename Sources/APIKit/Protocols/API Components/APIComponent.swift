
/// A protocol all APIKit Components conform to.
/// `APIComponents` may be treated the same way interchangably.
public protocol APIComponent {
    
    /// The content of an `APIComponent` can harbour other components like Groups and logic components.
    var content: APIComponent { get }
    
    /// A method needet to implement the registration procedure to the export struct.
    ///
    /// - Parameter apiExport: The export struct (`APIExport`) containing the export data up to this point.
    /// - Parameter _guard: The `Guard` object that is handed over by a `Group` component.
    /// - Parameter restPath: The REST path as `PathComponent`s up to this point.
    /// - Parameter grpcService: If the `APIComponent` is grouped into a gRPC service, the name of the service is handed over.
    func register(to apiExport: inout APIExport, _guard: Guard?, restPath: [PathComponent], grpcService: String?)
}


/// An extension that provides a default stub implementation for `APIComponent`s that do not contain
/// other components.
extension APIComponent {
    
    /// A stub implementation for `content` for components that do not have it.
    public var content: APIComponent { APIComponentStub() }
}

/// An extension that defined the default implementation for registering an `APIComponent` to the export struct (`APIExport`).
extension APIComponent {
    
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
            restPath: restPath,
            grpcService: grpcService
        )
    }
}

/// An extension to make an `Array` of `APIComponent` conform to `APIComponent` and thus allowing
/// APIKit to handle an `Array` of `APIComponent`s like a single `APIComponent`.
extension Array: APIComponent where Element == APIComponent {
    
    /// An `Array` of `APIComponent`s is registered to `APIExport` by registering each of the `Array`'s elements.
    ///
    /// - Parameter apiExport: The export struct (`APIExport`) containing the export data up to this point.
    /// - Parameter _guard: The `Guard` object that is handed over by a `Group` component.
    /// - Parameter restPath: The REST path as `PathComponent`s up to this point.
    /// - Parameter grpcService: If the `APIComponent` is grouped into a gRPC service, the name of the service is handed over.
    public func register(to apiExport: inout APIExport, _guard: Guard?, restPath: [PathComponent], grpcService: String?) {
        forEach({
            $0.register(
                to: &apiExport,
                _guard: _guard,
                restPath: restPath,
                grpcService: grpcService
            )
        })
    }
}
