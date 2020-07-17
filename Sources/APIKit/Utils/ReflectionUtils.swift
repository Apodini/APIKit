import Runtime

internal enum ReflectionUtils {
    
    /// Method to retrieve response types and proerties with respective type information.
    ///
    /// - Parameter type: Response Type ad MetaType
    ///
    /// - Returns: Response Type as `PropertyTypeExport` `Array`
    static func responseTypeToExport(type: Any.Type) -> [PropertyTypeExport] {
        parameterTypeExportRec(of: type)
    }
    
    /// Method to retrieve request types and proerties with respective type information.
    ///
    /// - Parameter type: Request Type ad MetaType
    ///
    /// - Returns: Request Type as `ParameterExport` `Array`
    static func requestTypeToExport(type: Any.Type) -> [ParameterExport] {
        
        let info = guardedTypeInfo(of: type)
        
        var parameters: [ParameterExport] = []
        
        info.properties.forEach {
            let refelctiveType = String(reflecting: $0.type)
            let parameterTypeInfo = guardedTypeInfo(of: $0.type)
            
            if refelctiveType.hasPrefix("APIKit.Path") {
                // PATH PARAMETER
                parameters.append(
                    ParameterExport(
                        parameterType: .pathComponent,
                        parameter: generateParameterTypeExport(
                            of: parameterTypeInfo.genericTypes.first!,
                            name: String($0.name.dropFirst())
                        )
                    )
                )
            } else if refelctiveType.hasPrefix("APIKit.Query") {
                // QUERY Parameter
                parameters.append(
                    ParameterExport(
                        parameterType: .light,
                        parameter: generateParameterTypeExport(
                            of: parameterTypeInfo.genericTypes.first!,
                            name: String($0.name.dropFirst())
                        )
                    )
                )
            } else if refelctiveType.hasPrefix("APIKit.Body") {
                // BODY PARAMETER
                parameters.append(
                    ParameterExport(
                        parameterType: .encoded,
                        parameter: generateParameterTypeExport(
                            of: parameterTypeInfo.genericTypes.first!,
                            name: String($0.name.dropFirst())
                        )
                    )
                )
            } else {
                // When there is no property wrapper, we ignore the property.
                print("Found a request prpoerty that has no property wrapper! Ingnoring ...")
            }
        }
        
        return parameters
    }
    
    
    fileprivate static func generateParameterTypeExport(of type: Any.Type, name: String) -> PropertyTypeExport {
        let info = guardedTypeInfo(of: type)
        let refelctiveType = String(reflecting: info.type)
        
        if refelctiveType.hasPrefix("Swift.Array") {
            // We have to handle Arrays different of Swift base types
            return PropertyTypeExport(
                name: name,
                type: "Array",
                properties: parameterTypeExportRec(of: info.genericTypes.first!)
            )
        } else if refelctiveType.hasPrefix("Swift.") {
            // Swift base types (e.g. String, Int, Float, ...)
            return PropertyTypeExport(
                name: name,
                type: String(describing: info.type)
            )
        }
        
        // Costom (complex) types
        
        return PropertyTypeExport(
            name: name,
            type: "Object",
            properties: parameterTypeExportRec(of: info.type)
        )
    }
    
    fileprivate static func parameterTypeExportRec(of type: Any.Type) -> [PropertyTypeExport] {
        let info = guardedTypeInfo(of: type)
        
        var typeExports: [PropertyTypeExport] = []
        
        info.properties.forEach {
            let refelctiveType = String(reflecting: $0.type)
            let propertyInfo = guardedTypeInfo(of: $0.type);
            
            if refelctiveType.hasPrefix("Swift._") {
                // We do not export Swift "internal" properties
                print("Found Swift internal property. Ignoring ...")
            } else if refelctiveType.hasPrefix("Swift.Array") {
                // Array Type
                typeExports.append(
                    PropertyTypeExport(
                        name: $0.name,
                        type: "Array",
                        properties: parameterTypeExportRec(of: propertyInfo.genericTypes.first!)
                    )
                )
            } else if refelctiveType.hasPrefix("Swift") {
                // Simple Type
                typeExports.append(
                    PropertyTypeExport(
                        name: $0.name,
                        type: String(describing: $0.type)
                    )
                )
            } else {
                // Complex Type
                typeExports.append(
                    PropertyTypeExport(
                        name: $0.name,
                        type: "Object",
                        properties: parameterTypeExportRec(of: $0.type)
                    )
                )
            }
        }
        
        return typeExports
    }
    
    /// Guard wrapper for Runtimes `Runtime.typeInfo()`.
    ///
    /// - Parameter type: MetaType of Type to code reflect.
    ///
    /// - Returns: `Runtime.TypeInfo` of type to reflect.
    fileprivate static func guardedTypeInfo(of type: Any.Type) -> TypeInfo {
        guard let info = try? typeInfo(of: type) else {
            precondition(false, "Type reflection is not working properly.")
        }
        
        return info
    }
}
