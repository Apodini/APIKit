
/// An enum representing CRUD types.
/// Maps to `HTTPType` and `GraphQLType` according to CRUD action.
public enum CRUDType {
    /// CREATE: Creates new entitys in the database.
    case create
    /// READ: Reads one or more entitys from the database.
    case read
    /// UPDATE: Updates one or more entitys in the database.
    case update
    /// DELETE: Deletes one or more entitys in the database.
    case delete
    
    /// Corresponding `HTTPType` of the `CRUDType`.
    var httpType: HTTPType {
        switch self {
        case .create:
            return .post
        case .read:
            return .get
        case .update:
            return .patch
        case .delete:
            return .delete
        }
    }
    
    /// Corresponding `GraphQLType` of the `CRUDType`.
    var graphQLType: GraphQLType {
        switch self {
        case .read:
            return .query
        case .create, .update, .delete:
            return .mutation
        }
    }
}
