// swift-tools-version:5.7
import PackageDescription

func remoteBinary(_ name: String, url: String, checksum: String) -> Target {
    .binaryTarget(
        name: name,
        url: url,
        checksum: checksum
    )
}

let commonLinkerSettings: [LinkerSetting] = [
    .linkedFramework("SystemConfiguration"),
    .linkedFramework("AVFoundation"),
    .linkedFramework("CoreTelephony"),
    .linkedFramework("AudioToolbox"),
    .linkedFramework("CoreMedia"),
    .linkedFramework("VideoToolbox"),
    .linkedLibrary("sqlite3"),
    .linkedLibrary("z"),
    .linkedLibrary("c++"),
    .linkedLibrary("resolv"),
]

let package = Package(
    name: "NIMSDK_LITE",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "NIMSDK_LITE", targets: ["NIMSDK_LITE_NOS"]),
        .library(name: "NOS", targets: ["NIMSDK_LITE_NOS"]),
        .library(name: "FCS", targets: ["NIMSDK_LITE_FCS"]),
        .library(name: "QChat", targets: ["NIMSDK_LITE_QChat"]),
        .library(name: "FTS", targets: ["NIMSDK_LITE_FTS"]),
    ],
    targets: [
        .target(
            name: "NIMSDK_LITE_NOS",
            dependencies: [
                "NIMSDK",
                "NIMSocketRocket",
                "NIMQuic",
                "NIMHA"
            ],
            path: "Sources/NOS",
            linkerSettings: commonLinkerSettings
        ),
        .target(
            name: "NIMSDK_LITE_FCS",
            dependencies: [
                "NIMSDK",
                "NIMSocketRocket",
                "NIMQuic",
                "NIMHA",
                "NIMAWSCore",
                "NIMAWSS3"
            ],
            path: "Sources/FCS",
            linkerSettings: commonLinkerSettings
        ),
        .target(
            name: "NIMSDK_LITE_QChat",
            dependencies: [
                "NIMQChat"
            ],
            path: "Sources/QChat",
            linkerSettings: commonLinkerSettings
        ),
        .target(
            name: "NIMSDK_LITE_FTS",
            dependencies: [
                "NIMDBEx"
            ],
            path: "Sources/FTS",
            linkerSettings: commonLinkerSettings
        ),
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMSDK.xcframework.zip", checksum: "3c7ec0826e1d6e3cf59b2908fb830e3b7f3d8361d7704ae4d73d519bdd2cf8b1"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMSocketRocket.xcframework.zip", checksum: "61cc7670eccf24468525b103833ea8a0b8281e648ac8db36e7a9189a086b39eb"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMQuic.xcframework.zip", checksum: "2851473c3c7ab211ee0b2b1b10f855ef784cad7955dbe74374ad73019af1758f"),
        remoteBinary("NIMHA", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMHA.xcframework.zip", checksum: "b609f73c4b250aafce7a607759b8d1c8ad5610af360c6583d13175cac066e6a5"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMAWSCore.xcframework.zip", checksum: "9d53a9e74a68a901b0754063585ec38295f29ef087497c19cda37b96f6c315f9"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMAWSS3.xcframework.zip", checksum: "f0a94323268ebb424f264c49777e7b5be29e046bf959a4a5862dd4049158515a"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMQChat.xcframework.zip", checksum: "a6dd0c508ad9ba08b162c5cc75905c2e4b600b30007743bb35a59a1e79cfc813"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1792491536811/NIM_iOS_SDK_v10.10.2_f50dde8/NIMDBEx.xcframework.zip", checksum: "a618faba119ec755a6d4ba640613eae226a9634749be63946a1c84180d49a1aa"),
    ]
)
