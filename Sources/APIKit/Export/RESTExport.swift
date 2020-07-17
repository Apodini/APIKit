
/// A struct defining a REST endpoint export.
public struct RESTExport: Codable {
    /// URL/Path of the REST endpoint including path-parameters.
    let path: String
    /// HTTP type of the REST endpoint.
    let httpType: HTTPType
    /// AuthGuard assigned to the logic.
    let _guard: String?
    /// `AuthenticationType` assigned to the logic.
    let authenticationType: AuthenticationType
    /// Request type information with property names and data types.
    let requestParameters: [ParameterExport]
    /// Response type information with property names and data types.
    let responseParameters: [PropertyTypeExport]
}
