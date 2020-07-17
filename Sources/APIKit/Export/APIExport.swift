
/// A struct defining the base object for the export.
public struct APIExport: Codable {
    /// Holds exported REST endpoints (`[RESTExport]`)
    var rest: [RESTExport] = []
    /// Holds exported GraphQL endpoints (`[GraphQLExport]`)
    var graphQL: [GraphQLExport] = []
    /// Holds exported gRPC endpoints (`[GRPCExport]`)
    var grpc: [GRPCExport] = []
    /// Holds exported WebSocket endpoints (`[WebSocketExport]`)
    var webSocket: [WebSocketExport] = []
}
