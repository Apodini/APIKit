

internal protocol EditableAPIComponentHTTPType: APIComponentHTTPType, AnyObject {
    var httpTypeAttribute: HTTPTypeAttribute { get set }
}
