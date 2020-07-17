import NIO

/// A class that provides application logic for reding objects of a generic type.
/// `T` conforming to `APIKitModel`.
public class ReadAll<T: APIKitModel>: APILogicComponent {
    
    /// The type of the `req` parameter of the `.handler()`.
    public typealias RequestType = T
    /// The return type of the `.handler()`.
    public typealias ResponseType = T
    
    /// The logic name of the read function.
    public internal(set) var logicNameAttribute: LogicNameAttribute = LogicNameAttribute(name: "ReadAll\(T.self)")
    /// The `HTTPType` of the read function.
    public internal(set) var httpTypeAttribute: HTTPTypeAttribute = HTTPTypeAttribute(httpType: .get)
    /// The `GraphQLType` of the create function.
    public internal(set) var graphQLTypeAttribute: GraphQLTypeAttribute = GraphQLTypeAttribute(graphQLType: .query)
    /// The communication protocols the components get exported to.
    public internal(set) var communicationOptionsAttribute: CommunicationOptionsAttribute = CommunicationOptionsAttribute(communicationOptions: .all)
    
    /// The read all implementation of the handler function.
    /// Currently it is a placeholder, as we do not have an ORM included (out of the Bachelors Thesis' scope).
    public func handler(_ req: T) -> EventLoopFuture<T> {
        "" as! EventLoopFuture<T>
    }
}
