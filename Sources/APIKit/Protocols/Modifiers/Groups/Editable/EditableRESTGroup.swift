

internal protocol EditableRESTGroup: RESTGroup, AnyObject {
    var restGroupAttribute: RESTGroupAttribute { get set }
}
