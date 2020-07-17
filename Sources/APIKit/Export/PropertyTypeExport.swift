
/// A struct defining an export of a type/object in Swift.
public struct PropertyTypeExport: Codable {
    /// Name of the parameter
    let name: String
    /// Type of the parameter
    let type: String?
    /// Properties of the parameter if it is a complex type
    let properties: [PropertyTypeExport]?
    
    init(name: String, type: String) {
        self.name = name
        self.type = type
        self.properties = nil
    }
    
    init(name: String, type: String, properties: [PropertyTypeExport]) {
        self.name = name
        self.type = type
        self.properties = properties
    }
}
