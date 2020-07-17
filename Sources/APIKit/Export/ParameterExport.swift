
/// A struct defining an export of a parameter.
public struct ParameterExport: Codable {
    /// Type of the parameter
    let parameterType: ParameterType
    /// Type description of the parameter
    let parameter: PropertyTypeExport
}
