

internal struct GuardModifier {
    var _guard: Guard
    
    init(_ _guard: Guard) {
        self._guard = _guard
    }
}

extension APIComponent where Self: GuardComponent {
    public func use(_ _guard: Guard) -> Self {
        guard let editableGuardComponent = self as? EditableGuardComponent else {
            precondition(false, "\(Self.self) is EditableGuardComponent is not fulfulled. Anything conforming to GuardComponent must also internally conform to EditableGuardComponent")
        }
        
        editableGuardComponent.guardAttribute._guard = _guard
        return self
    }
}
