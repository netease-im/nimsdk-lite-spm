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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1792493369479/NIM_iOS_SDK_v10.10.11_0558855/NIMSDK.xcframework.zip", checksum: "6f62d0efa12028ad4568c5e4e339bfb9ad1d7c43d813c58fa59e8e75a24fb65c"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1792493369479/NIM_iOS_SDK_v10.10.11_0558855/NIMSocketRocket.xcframework.zip", checksum: "ce7edb229e841a343476f227bb00f96ed18943315c188809c41d3bedb1d6c71d"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1792493369479/NIM_iOS_SDK_v10.10.11_0558855/NIMQuic.xcframework.zip", checksum: "9a20302e211d9b2583bcd8acc2e86404703a9d5d6d8e59ede1319779c0fbcc28"),
        remoteBinary("NIMHA", url: "https://yx-web-nosdn.netease.im/package/1792493369479/NIM_iOS_SDK_v10.10.11_0558855/NIMHA.xcframework.zip", checksum: "36df949f2405a3beec55d2b42feb4c2964c529a278e5d78695062094025ed272"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1792493369479/NIM_iOS_SDK_v10.10.11_0558855/NIMAWSCore.xcframework.zip", checksum: "738efcf359f35cf5f548bb4305aca12397353ab180753f40880156eec1d9780b"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1792493369479/NIM_iOS_SDK_v10.10.11_0558855/NIMAWSS3.xcframework.zip", checksum: "8c8c89cd8da397c93cf7f7a694e0cbb0f55139268a2322375eca1e4e2ec7b0d8"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1792493369479/NIM_iOS_SDK_v10.10.11_0558855/NIMQChat.xcframework.zip", checksum: "2e625f7f6ec9f942b6ef4ead9a4ccb4128e68ba02d2f8613c38a6810711b6ace"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1792493369479/NIM_iOS_SDK_v10.10.11_0558855/NIMDBEx.xcframework.zip", checksum: "7da0977030081b7851675bad6f93fe960b4b3e08c097694f4dc31a621ec07566"),
    ]
)
