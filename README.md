# APIKit

![APIKit Logo](images/apiKitLogo_256.png)

![Swift 5.2](https://img.shields.io/badge/Swift-5.2-green.svg)
[![License](http://img.shields.io/:License-MIT-blue.svg)](http://doge.mit-license.org)

APIKit is a Swift library to give you more flexibility when developing web APIs. In its current version APIKit
is a POC for a framework that provides a declarative, composeable DSL which makes developing APIs against
a communication protocol (CCP) natural interface a breeze. APIKit handles the mapping to concrete CCPs with
no hassle.

## Example

Below is an example of an API that manages Vehicles and Customers beloging to a car vendor.

```Swift
struct CarVendorAPI: API {
    var content: APILogic {
        Version("v1") {
            CRUD<Car>()
            
            Group {
                ReadOne<Customer>()
                Update<Customer>()
            }.RESTGroup("customer")
            
            CRUD<Customer>()
        }
    }
}
```

## Installation

### Swift Package Manager

You can install APIKit via Swift Package Manager by adding the following line to your `Package.swift`:

```Swift
import PackageDescription

let package = Package(
    [...]
    dependencies: [
        .Package(url: "https://github.com/Apodini/APIKit.git", majorVersion: XYZ)
    ]
)
```

## Contributing
Contributions to this projects are welcome. Please make sure to read the [contribution guidelines](https://github.com/Apodini/.github/blob/release/CONTRIBUTING.md) first.

## License
APIKit is licensed under the MIT License. See [LICENSE](LICENSE) file for more information.
