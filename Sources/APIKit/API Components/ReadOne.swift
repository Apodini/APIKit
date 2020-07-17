import NIO

/// A class that provides application logic for reading one object of a generic type.
/// `T` conforming to `APIKitModel`.
public class ReadOne<T: APIKitModel>: APILogicComponent {
    
    /// The request type
    public struct ReadOneRequest {
        @Path()
        var id: String
    }
    
    /// The type of the `req` parameter of the `.handler()`.
    public typealias RequestType = ReadOneRequest
    /// The return type of the `.handler()`.
    public typealias ResponseType = T
    
    /// The logic name of the read function.
    public internal(set) var logicNameAttribute: LogicNameAttribute = LogicNameAttribute(name: "ReadOne\(T.self)")
    /// The `HTTPType` of the read function.
    public internal(set) var httpTypeAttribute: HTTPTypeAttribute = HTTPTypeAttribute(httpType: .get)
    /// The `GraphQLType` of the create function.
    public internal(set) var graphQLTypeAttribute: GraphQLTypeAttribute = GraphQLTypeAttribute(graphQLType: .query)
    /// The communication protocols the components get exported to.
    public internal(set) var communicationOptionsAttribute: CommunicationOptionsAttribute = CommunicationOptionsAttribute(communicationOptions: .all)
    
    /// The read one implementation of the handler function.
    /// Currently it is a placeholder, as we do not have an ORM included (out of the Bachelors Thesis' scope).
    public func handler(_ req: ReadOneRequest) -> EventLoopFuture<T> {
        "" as! EventLoopFuture<T>
    }
}
