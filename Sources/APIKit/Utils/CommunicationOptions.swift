
/// A `OptionSet` defining possible communication options.
public struct CommunicationOptions: OptionSet {
    /// Represents the state of the `OptionSet`.
    public let rawValue: Int
    
    /// Bit for the REST Protocol
    static let REST = CommunicationOptions(rawValue: 1 << 0)
    /// Bit for the WebSocket Protocol
    static let WebSocket = CommunicationOptions(rawValue: 1 << 1)
    /// Bit for the GraphQL Protocol
    static let graphQL = CommunicationOptions(rawValue: 1 << 2)
    /// Bit for the gRPC Protocol
    static let gRPC = CommunicationOptions(rawValue: 1 << 3)
    
    /// Convenience prperty for setting all communication protocols at once
    static let all: CommunicationOptions = [.REST, .WebSocket, .graphQL, .gRPC]
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
