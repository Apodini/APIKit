

internal struct LogicComponentHTTPTypeModifier {
    var httpType: HTTPType
    
    init(_ httpType: HTTPType) {
        self.httpType = httpType
    }
}

extension APIComponent where Self: APIComponentHTTPType {
    public func httpType(_ httpType: HTTPType) -> Self {
        guard let editableAPIComponentHTTPType = self as? EditableAPIComponentHTTPType else {
            precondition(false, "\(Self.self) is EditableAPIComponentHTTPType is not fulfulled. Anything conforming to APIComponentHTTPType must also internally conform to EditableAPIComponentHTTPType")
        }
        
        editableAPIComponentHTTPType.httpTypeAttribute.httpType = httpType
        return self
    }
}
