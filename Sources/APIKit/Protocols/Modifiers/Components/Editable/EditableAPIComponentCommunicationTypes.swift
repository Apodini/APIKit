

internal protocol EditableAPIComponentCommunicationTypes: APIComponentCommunicationTypes, AnyObject {
    var communicationTypesAttribute: CommunicationOptionsAttribute { get set }
}
