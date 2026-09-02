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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMSDK.xcframework.zip", checksum: "7f5dbcd1ea5cbc02e3ed4e6a4031b5c9f5d1cba58703cb843a9f2de61bdac200"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMSocketRocket.xcframework.zip", checksum: "520da7360e43c0f989570e12d21afec9cf720fcb04568b3ecec45865145c4c1c"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMQuic.xcframework.zip", checksum: "e6cc35dc755f2a67fdc429bb42917fc071b582b1cc8288d8c70c2ff60720b0ad"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMNOS.xcframework.zip", checksum: "acaa9f97f57c13b34b22b01f25bf5606682408d2fdc906b83b04b65c1af9f073"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMFCS.xcframework.zip", checksum: "d2f103e08434510708fc725da703f211f36029d3b5579a2de3802ce34bafa2e7"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMAWSCore.xcframework.zip", checksum: "87fc4a18d6ed789a0d1f6c2f4391afdd57b5eec7fe0032a764411414c0180656"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMAWSS3.xcframework.zip", checksum: "3bcdea8fa8be56022a2674927c24212d2627dc30d7cf0cb2571f95abf5b10bb7"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1788336720083/NIM_iOS_SDK_v9.21.17_927e028/NIMQChat.xcframework.zip", checksum: "f0299b90dd9fd20ea479bf482ab2a4fde364116865baa86787facdf23c6eaa3e"),
    ]
)
