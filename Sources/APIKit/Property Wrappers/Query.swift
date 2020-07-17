
/// A property wrapper to mark properties as query parameters.
@propertyWrapper
struct Query<Value> {
    internal var _parsedValue: Parsed<Value>
    
    var wrappedValue: Value {
        get {
            switch _parsedValue {
            case .value(let v):
                return v
            case .definition:
                fatalError("Directly Initialized Error")
            }
        }
        set {
            _parsedValue = .value(newValue)
        }
    }
    
    internal init(
        _parsedValue: Parsed<Value>
    ) {
        self._parsedValue = _parsedValue
    }
}

extension Query where Value: LosslessStringConvertible {
    init() {
        self.init(
            _parsedValue: .definition(())
        )
    }
}
