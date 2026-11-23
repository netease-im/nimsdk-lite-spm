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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1795423293383/NIM_iOS_SDK_v9.21.19_a0bb472/NIMSDK.xcframework.zip", checksum: "5e9d91931eb9623a7dc483cd7d3a81cb281026319036b67d313782a3ee882ccb"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1795423293383/NIM_iOS_SDK_v9.21.19_a0bb472/NIMSocketRocket.xcframework.zip", checksum: "09d59be96d7b97fd9c61a175d531f94717955f699cee01a60b007b180d88718f"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1795423293383/NIM_iOS_SDK_v9.21.19_a0bb472/NIMQuic.xcframework.zip", checksum: "61921bfa4bf2b2ec3f23fae0b258687548cf532315bb95ebb7f0276e32d09a74"),
        remoteBinary("NIMHA", url: "https://yx-web-nosdn.netease.im/package/1795423293383/NIM_iOS_SDK_v9.21.19_a0bb472/NIMHA.xcframework.zip", checksum: "cf4f49a2adcb0d3656a7232215f08068e8855ad9a833f162af64a06af2cefb88"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1795423293383/NIM_iOS_SDK_v9.21.19_a0bb472/NIMAWSCore.xcframework.zip", checksum: "0e38bda0496d5d2187dbca99d6052d6622831c88894388bf13d4944b032fe217"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1795423293383/NIM_iOS_SDK_v9.21.19_a0bb472/NIMAWSS3.xcframework.zip", checksum: "cd87612b03bb11bab39553c78752e508c4fab8378bbded30b144463381510018"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1795423293383/NIM_iOS_SDK_v9.21.19_a0bb472/NIMQChat.xcframework.zip", checksum: "6043e8679153120f676d7d44abf9a3ba3f2a2bae304aade5694266c95d457985"),
    ]
)
