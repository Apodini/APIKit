
/// Base Protocol for an API based in thr APiKit Framwork.
/// Defines the base export function for API tree traversal.
public protocol API {
    /// The content of an API harbours `APIComponents` like Groups and CRUD endpoints.
    var content: APIComponent { get }
    
    /// A method needet to export the API.
    func export() -> APIExport
}

/// An extension to provide the default export implementation.
extension API {
    /// Default implementation for exporting an API.
    /// It creates a new export struct and starts API tree traversal.
    public func export() -> APIExport {
        var apiExport = APIExport()
        content.register(to: &apiExport, _guard: DefaultGuard(), restPath: [], grpcService: nil)
        return apiExport
    }
}
