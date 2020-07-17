

internal struct LogicComponentNameModifier {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

extension APIComponent where Self: NameableAPILogicComponent {
    public func name(_ name: String) -> Self {
        guard let editableNameableAPILogicComponent = self as? EditableNameableAPILogicComponent else {
            precondition(false, "\(Self.self) is EditableNameableAPILogicComponent is not fulfulled. Anything conforming to NameableAPILogicComponent must also internally conform to EditableNameableAPILogicComponent")
        }
        
        editableNameableAPILogicComponent.logicNameAttribute.name = name
        return self
    }
}
