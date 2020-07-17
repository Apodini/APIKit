import NIO

/// A class that provides application logic for creating objects of a generic type.
/// `T` conforming to `APIKitModel`.
public class Create<T: APIKitModel>: APILogicComponent {
    
    /// The request type
    public struct CreateRequest {
        @Body()
        var model: T
    }
    
    /// The type of the `req` parameter of the `.handler()`.
    public typealias RequestType = CreateRequest
    /// The return type of the `.handler()`.
    public typealias ResponseType = T
    
    /// The logic name of the create function.
    public internal(set) var logicNameAttribute: LogicNameAttribute = LogicNameAttribute(name: "Create\(T.self)")
    /// The `HTTPType` of the create function.
    public internal(set) var httpTypeAttribute: HTTPTypeAttribute = HTTPTypeAttribute(httpType: .delete)
    /// The `GraphQLType` of the create function.
    public internal(set) var graphQLTypeAttribute: GraphQLTypeAttribute = GraphQLTypeAttribute(graphQLType: .mutation)
    /// The communication protocols the components get exported to.
    public internal(set) var communicationOptionsAttribute: CommunicationOptionsAttribute = CommunicationOptionsAttribute(communicationOptions: .all)
    
    /// The create implementation of the handler function.
    /// Currently it is a placeholder, as we do not have an ORM included (out of the Bachelors Thesis' scope).
    public func handler(_ req: CreateRequest) -> EventLoopFuture<T> {
        "" as! EventLoopFuture<T>
    }
}
