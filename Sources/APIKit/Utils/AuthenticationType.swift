
/// An enum defining supported authentication types.
public enum AuthenticationType: String, Codable {
    /// Bearer token located in request header (authorization header).
    case bearer
    /// Basic credentials located in request header (authorization header).
    case basic
    /// No authentication
    case none
}
