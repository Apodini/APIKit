
/// A struct defining a WebSocket export.
public struct WebSocketExport: Codable {
    /// Name of the WebSocket logic.
    let name: String
    /// AuthGuard assigned to the logic.
    let _guard: String?
    /// `AuthenticationType` assigned to the logic.
    let authenticationType: AuthenticationType
    /// Request type information with property names and data types.
    let requestParameters: [ParameterExport]
    /// Response type information with property names and data types.
    let responseParameters: [PropertyTypeExport]
}
