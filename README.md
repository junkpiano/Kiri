# Kiri

[![Build Status](https://app.bitrise.io/app/424291a7bf33dccc/status.svg?token=Aly3abCuniQQlbd52BQY5A&branch=master)](https://app.bitrise.io/app/424291a7bf33dccc)

Kiri is yet another network abstraction layer on top of `Alamofire`.

## Usage

```Swift
Kiri<ServiceObject>(request: request).send() { response, error in
    print(response)
}
```

## Installation

### Cocoapods

    pod "Kiri", :git => "https://github.com/junkpiano/Kiri.git"

### Swift Package Manager

    .package(url: "https://github.com/junkpiano/Kiri.git", from: "1.0.2")

### Carthage

not yet.
