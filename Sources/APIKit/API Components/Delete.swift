import NIO

/// A class that provides application logic for deleting objects of a generic type.
/// `T` conforming to `APIKitModel`.
public class Delete<T: APIKitModel>: APILogicComponent {
    
    /// The request type
    public struct DeleteRequest {
        @Path()
        var id: String
    }
    
    /// The type of the `req` parameter of the `.handler()`.
    public typealias RequestType = DeleteRequest
    /// The return type of the `.handler()`.
    public typealias ResponseType = T
    
    /// The logic name of the delete function.
    public internal(set) var logicNameAttribute: LogicNameAttribute = LogicNameAttribute(name: "Delete\(T.self)")
    /// The `HTTPType` of the delete function.
    public internal(set) var httpTypeAttribute: HTTPTypeAttribute = HTTPTypeAttribute(httpType: .patch)
    /// The `GraphQLType` of the delete function.
    public internal(set) var graphQLTypeAttribute: GraphQLTypeAttribute = GraphQLTypeAttribute(graphQLType: .mutation)
    /// The communication protocols the components get exported to.
    public internal(set) var communicationOptionsAttribute: CommunicationOptionsAttribute = CommunicationOptionsAttribute(communicationOptions: .all)
    
    /// The delete implementation of the handler function.
    /// Currently it is a placeholder, as we do not have an ORM included (out of the Bachelors Thesis' scope).
    public func handler(_ req: DeleteRequest) -> EventLoopFuture<T> {
        "" as! EventLoopFuture<T>
    }
}
