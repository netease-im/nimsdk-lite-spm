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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1795424085216/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMSDK.xcframework.zip", checksum: "84a4d54a01d6faa406c31b807aa6f3e170ed9dedcb96b276bfe6e148288399b7"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1795424085216/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMSocketRocket.xcframework.zip", checksum: "8e6c7ebf791cdbdd9fe63dc76ac5c5d44c14b60e1426b753bed9d2656f36ed62"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1795424085216/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMQuic.xcframework.zip", checksum: "12224e2f235623bd0c7ebf3ee9a166a79925f768d07f5df6ba71e2f0ad0141f9"),
        remoteBinary("NIMHA", url: "https://yx-web-nosdn.netease.im/package/1795424085216/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMHA.xcframework.zip", checksum: "3165e971ca9b48f01f62e73b47f761483ec098c4719263b7eed41af75d13536b"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1795424085216/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMAWSCore.xcframework.zip", checksum: "550d629739a3b8b986b8fb0c520e07ae8a2b612e8241a32c830a016f45299ac0"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1795424085216/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMAWSS3.xcframework.zip", checksum: "afbb2cd745758d4385e0c8eac20341ba06007ce086a64855ab417b00843cd1d4"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1795424085216/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMQChat.xcframework.zip", checksum: "74771ee36af03752ab9838a889fb1339b1b70e9379c3fff1ec5650baca097fa9"),
    ]
)
