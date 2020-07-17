

internal struct LogicComponentGraphQLTypeModifier {
    var graphQLType: GraphQLType
    
    init(_ graphQLType: GraphQLType) {
        self.graphQLType = graphQLType
    }
}

extension APIComponent where Self: APIComponentGraphQLType {
    public func graphQLType(_ graphQLType: GraphQLType) -> Self {
        guard let editableAPIComponentGraphQLType = self as? EditableAPIComponentGraphQLType else {
            precondition(false, "\(Self.self) is EditableAPIComponentGraphQLType is not fulfulled. Anything conforming to APIComponentGraphQLType must also internally conform to EditableAPIComponentGraphQLType")
        }
        
        editableAPIComponentGraphQLType.graphQLTypeAttribute.graphQLType = graphQLType
        return self
    }
}
