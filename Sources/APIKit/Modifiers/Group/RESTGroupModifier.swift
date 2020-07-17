

internal struct RESTGroupModifier {
    var pathComponents: [PathComponent]
    
    init(_ pathComponents: PathComponent...) {
        self.pathComponents = pathComponents
    }
}

extension APIComponent where Self: RESTGroup {
    public func RESTGroup(_ pathComponents: PathComponent...) -> Self {
        guard let editableRESTGroup = self as? EditableRESTGroup else {
            precondition(false, "\(Self.self) is EditableRESTGroup is not fulfulled. Anything conforming to RESTGroup must also internally conform to EditableRESTGroup")
        }
        
        editableRESTGroup.restGroupAttribute.pathComponents = pathComponents
        return self
    }
}
