

internal struct LogicComponentCommunicationOptionsModifier {
    var communicationOptions: CommunicationOptions
    
    init(_ communicationOptions: CommunicationOptions) {
        self.communicationOptions = communicationOptions
    }
}

extension APIComponent where Self: APIComponentCommunicationTypes {
    public func communicationOptions(_ communicationOptions: CommunicationOptions) -> Self {
        guard let editableAPIComponentCommunicationTypes = self as? EditableAPIComponentCommunicationTypes else {
            precondition(false, "\(Self.self) is EditableAPIComponentCommunicationTypes is not fulfulled. Anything conforming to APIComponentCommunicationTypes must also internally conform to EditableAPIComponentCommunicationTypes")
        }
        
        editableAPIComponentCommunicationTypes.communicationTypesAttribute.communicationOptions = communicationOptions
        return self
    }
}
