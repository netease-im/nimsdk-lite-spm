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
                "NIMNOS"
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
                "NIMFCS",
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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1772190389114/NIM_iOS_SDK_v10.9.76_bde9bfe/NIMSDK.xcframework.zip", checksum: "2fe2a334952b0267dcc1b28152227eacd6b50be816651de6d6c8e4a3bed0aa60"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1772190389114/NIM_iOS_SDK_v10.9.76_bde9bfe/NIMSocketRocket.xcframework.zip", checksum: "e161c9b5d2f82d7967c1a736ba4039517aeaf1783b82d6442942ef8b683bca4c"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1772190389114/NIM_iOS_SDK_v10.9.76_bde9bfe/NIMQuic.xcframework.zip", checksum: "641353a3091d972b878ac79c0538650f3824aa914a0f1e005198de7c353d60b8"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1772190389114/NIM_iOS_SDK_v10.9.76_bde9bfe/NIMNOS.xcframework.zip", checksum: "4f9dfa8b5a5b19fb7a466a99e38eac98ff3e33fa94d7914a3c8c825d9979f2a7"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1772190389114/NIM_iOS_SDK_v10.9.76_bde9bfe/NIMFCS.xcframework.zip", checksum: "538842ba5cd2c2e1fef26d0d4ef0a7929909d6a6466db5c7ba7b7cd5158eaa85"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1772190389114/NIM_iOS_SDK_v10.9.76_bde9bfe/NIMAWSCore.xcframework.zip", checksum: "b79467e6ff79199f61eb793d1922e32612f7241a938a599c3050505bfc0a7e07"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1772190389114/NIM_iOS_SDK_v10.9.76_bde9bfe/NIMAWSS3.xcframework.zip", checksum: "ff5391bbc69b6865e0d4da9d3975ee3e4923243609ceb5bf9d51b6b8a56e7ff8"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1772190389114/NIM_iOS_SDK_v10.9.76_bde9bfe/NIMQChat.xcframework.zip", checksum: "b4d39349212337adf71c1c6476da2cbbfdd8fde6ac3d6f18bb8c4cacc7a4946b"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1772190389114/NIM_iOS_SDK_v10.9.76_bde9bfe/NIMDBEx.xcframework.zip", checksum: "811d9a986e6a12eca145b55c214e67996b7ce610efa3b837d419badc8b5400c0"),
    ]
)
