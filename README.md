# Kiri

[![Build Status](https://app.bitrise.io/app/80f51ad794e53da0/status.svg?token=4hWZACszkxdI8oLoJ-_f0g)](https://app.bitrise.io/app/80f51ad794e53da0)

Kiri is yet another network abstraction layer on top of `Alamofire`.

## Usage

```Swift
Kiri<ServiceObject>(request: request).send() { response, error in
    print(response)
}
```

## Installation

    pod "Kiri", :git => "https://github.com/junkpiano/Kiri.git"

