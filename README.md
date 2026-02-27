# NIMSDK LITE SPM

Swift Package Manager distribution repo for NIM iOS SDK Lite.

## Installing

### Xcode

1. Open your project in Xcode.
2. Go to **File -> Add Package Dependencies...**
3. Enter:

```text
https://github.com/netease-im/nimsdk-lite-spm.git
```

4. Select a version rule (recommended: **Up to Next Major**).
5. Choose product(s) you need.

### Package.swift

```swift
// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "YourApp",
    dependencies: [
        .package(url: "https://github.com/netease-im/nimsdk-lite-spm.git", from: "10.9.76")
    ],
    targets: [
        .target(
            name: "YourApp",
            dependencies: [
                .product(name: "NIMSDK_LITE", package: "nimsdk-lite-spm")
            ]
        )
    ]
)
```

Available products in this package:

- `NIMSDK_LITE`
- `NOS`
- `FCS`
- `QChat`
- `FTS`

## Versioning

- SPM tags should map to released SDK versions.
- Binary URLs and SHA-256 checksums are stored in `Package.swift`.
- `nimsdk-spm` and `nimsdk-lite-spm` should not be integrated together in one app.

## Security

SwiftPM verifies each binary target with the SHA-256 checksum declared in `Package.swift`.
If a downloaded binary does not match the checksum, integration fails.
