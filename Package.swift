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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1792492963348/NIM_iOS_SDK_v10.10.10_2f1ff7e/NIMSDK.xcframework.zip", checksum: "4cfd4637b97ca8417a47c9d7479c00c37b4b69f1890c897cfa4d6c006c6485a1"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1792492963348/NIM_iOS_SDK_v10.10.10_2f1ff7e/NIMSocketRocket.xcframework.zip", checksum: "1d8dc559ad2c50798917774a82677ce0e7909a07f5177dd226db03c47fe68c6b"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1792492963348/NIM_iOS_SDK_v10.10.10_2f1ff7e/NIMQuic.xcframework.zip", checksum: "9be21fd88f94631c9c3bfe76655a338be891fccac6c416c05dc92eecf9752bfd"),
        remoteBinary("NIMHA", url: "https://yx-web-nosdn.netease.im/package/1792492963348/NIM_iOS_SDK_v10.10.10_2f1ff7e/NIMHA.xcframework.zip", checksum: "33f72b2fccb9c9deffeaaf7f6b8ecd88c73c01f16af1d723a80bc92b3c5805ab"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1792492963348/NIM_iOS_SDK_v10.10.10_2f1ff7e/NIMAWSCore.xcframework.zip", checksum: "4ee7fd58d054b091165453377afde27be07a82604395b31de158cd0169796911"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1792492963348/NIM_iOS_SDK_v10.10.10_2f1ff7e/NIMAWSS3.xcframework.zip", checksum: "450eddafd79470ef51ca0479b2bbedb303883185111dece435e4b8708f677fa6"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1792492963348/NIM_iOS_SDK_v10.10.10_2f1ff7e/NIMQChat.xcframework.zip", checksum: "2da55db94e06606c2175303a200d50f306c1f212cf352334124374c16aa6173e"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1792492963348/NIM_iOS_SDK_v10.10.10_2f1ff7e/NIMDBEx.xcframework.zip", checksum: "a851b9df20e19d7213dc9acd3015b6fdc5ad8b901f6f5fed016adeeb201fab7a"),
    ]
)
