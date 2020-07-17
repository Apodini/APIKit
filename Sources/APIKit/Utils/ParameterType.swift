
/// An enum for defining parameter types.
public enum ParameterType: String, Codable {
    /// Represents parameters that are part of the request body.
    case encoded
    /// Represents parameters thar are part of the querystring.
    case light
    /// Represents parameters that are part of the URL - path.
    case pathComponent
}
