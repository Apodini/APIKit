import NIO

/// A class that provides application logic for updating objects of a generic type.
/// `T` conforming to `APIKitModel`.
public class Update<T: APIKitModel>: APILogicComponent {
    
    /// The request type
    public struct UpdateRequest {
        @Path()
        var id: String
        
        @Body()
        var model: T
    }
    
    /// The type of the `req` parameter of the `.handler()`.
    public typealias RequestType = UpdateRequest
    /// The return type of the `.handler()`.
    public typealias ResponseType = T
    
    /// The logic name of the update function.
    public internal(set) var logicNameAttribute: LogicNameAttribute = LogicNameAttribute(name: "Update\(T.self)")
    /// The `HTTPType` of the read function.
    public internal(set) var httpTypeAttribute: HTTPTypeAttribute = HTTPTypeAttribute(httpType: .post)
    /// The `GraphQLType` of the create function.
    public internal(set) var graphQLTypeAttribute: GraphQLTypeAttribute = GraphQLTypeAttribute(graphQLType: .mutation)
    /// The communication protocols the components get exported to.
    public internal(set) var communicationOptionsAttribute: CommunicationOptionsAttribute = CommunicationOptionsAttribute(communicationOptions: .all)
    
    /// The update implementation of the handler function.
    /// Currently it is a placeholder, as we do not have an ORM included (out of the Bachelors Thesis' scope).
    public func handler(_ req: UpdateRequest) -> EventLoopFuture<T> {
        "" as! EventLoopFuture<T>
    }
}
