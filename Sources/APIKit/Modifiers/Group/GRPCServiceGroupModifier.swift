

internal struct GRPCServiceGroupModifier {
    var serviceName: String
    
    init(_ serviceName: String) {
        self.serviceName = serviceName
    }
}

extension APIComponent where Self: GRPCServiceGroup {
    public func GRPCService(_ serviceName: String) -> Self {
        guard let editableGRPCServiceGroup = self as? EditableGRPCServiceGroup else {
            precondition(false, "\(Self.self) is EditableGRPCServiceGroup is not fulfulled. Anything conforming to GRPCServiceGroup must also internally conform to EditableGRPCServiceGroup")
        }
        
        editableGRPCServiceGroup.grpcServiceAttribute.serviceName = serviceName
        return self
    }
}
