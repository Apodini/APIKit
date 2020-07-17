
/// A struct defining a GraphQL export.
public struct GraphQLExport: Codable {
    /// Name of the GraphQL query/mutation.
    let name: String
    /// GraphQL query type (query or mutation).
    let graphQLType: GraphQLType
    /// AuthGuard assigned to the logic.
    let _guard: String?
    /// `AuthenticationType` assigned to the logic.
    let authenticationType: AuthenticationType
    /// Request type information with property names and data types.
    let requestParameters: [ParameterExport]
    /// Response type information with property names and data types.
    let responseParameters: [PropertyTypeExport]
}

