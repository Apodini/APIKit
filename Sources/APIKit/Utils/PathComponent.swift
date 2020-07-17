
/// An enum representing REST path components.
public enum PathComponent: ExpressibleByStringLiteral, CustomStringConvertible {
    
    case constant(String)
    case parameter(String)
    
    public init(stringLiteral value: String) {
        if value.hasPrefix(":") {
            self = .parameter(.init(value.dropFirst()))
        } else {
            self = .constant(value)
        }
    }
    
    public var description: String {
        switch self {
        case .parameter(let name):
            return ":" + name
        case .constant(let constant):
            return constant
        }
    }
}

extension String {
    public var pathComponents: [PathComponent] {
        self.split(separator: "/").map { .init(stringLiteral: .init($0)) }
    }
}

extension Array where Element == PathComponent {
    public var string: String {
        self.map(\.description).joined(separator: "/")
    }
}
