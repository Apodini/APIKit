

internal protocol EditableGRPCServiceGroup: GRPCServiceGroup, AnyObject {
    var grpcServiceAttribute: GRPCServiceAttribute { get set }
}
