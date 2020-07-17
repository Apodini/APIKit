
/// An enum representing HTTP types.
public enum HTTPType: String, Codable {
    /// GET: The GET method requests a representation of the specified resource.
    case get
    /// POST: The POST method is used to submit an entity to the specified resource, often causing a change in state or side effects on the server.
    case post
    /// PUT: The PUT method replaces all current representations of the target resource with the request payload.
    case put
    /// PATCH: The PATCH method is used to apply partial modifications to a resource.
    case patch
    /// DELETE: The DELETE method deletes the specified resource.
    case delete
}
