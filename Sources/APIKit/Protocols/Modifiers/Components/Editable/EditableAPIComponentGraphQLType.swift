

internal protocol EditableAPIComponentGraphQLType: APIComponentGraphQLType, AnyObject {
    var graphQLTypeAttribute: GraphQLTypeAttribute { get set }
}
