
/// A struct defining a gRPC export.
public struct GRPCExport: Codable {
    /// Name of the gRPC logic.
    let name: String
    /// Name of the gRPC service.
    let service: String?
    /// AuthGuard assigned to the logic.
    let _guard: String?
    /// `AuthenticationType` assigned to the logic.
    let authenticationType: AuthenticationType
    /// Request type information with property names and data types.
    let requestParameters: [ParameterExport]
    /// Response type information with property names and data types.
    let responseParameters: [PropertyTypeExport]
}

