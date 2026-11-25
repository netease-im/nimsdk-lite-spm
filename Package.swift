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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1795576447478/NIM_iOS_SDK_v10.11.15_294eb10/NIMSDK.xcframework.zip", checksum: "e9628b2321ed99cc34f900a0a3a08f91f78bea5628b9c8b385b8444e3c5bd20f"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1795576447478/NIM_iOS_SDK_v10.11.15_294eb10/NIMSocketRocket.xcframework.zip", checksum: "d4c94100d915952252beedbc051977e1a3b3f47b740212591079427792fac04d"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1795576447478/NIM_iOS_SDK_v10.11.15_294eb10/NIMQuic.xcframework.zip", checksum: "0f483bf7a7eab7e6f0651ee73e79263c2af1c3812edff958a7e35b8774002126"),
        remoteBinary("NIMHA", url: "https://yx-web-nosdn.netease.im/package/1795576447478/NIM_iOS_SDK_v10.11.15_294eb10/NIMHA.xcframework.zip", checksum: "e67b577d5ddf8a0a68ff498adca685b3688c6fbc5cc6a66d15d770aefd5adbcd"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1795576447478/NIM_iOS_SDK_v10.11.15_294eb10/NIMAWSCore.xcframework.zip", checksum: "d32c4264e9bef05e2598b32333cb7a6e06f37ef247564d9c7684faa8e600304b"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1795576447478/NIM_iOS_SDK_v10.11.15_294eb10/NIMAWSS3.xcframework.zip", checksum: "c06488588c14d520557e37317955a6903ec3e14ec048f8f0288a1a4e136a6e4c"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1795576447478/NIM_iOS_SDK_v10.11.15_294eb10/NIMQChat.xcframework.zip", checksum: "f3b70ba6221fbd91fc97e009196fdec102751890f34d0c56ccb5256c42ca1bcd"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1795576447478/NIM_iOS_SDK_v10.11.15_294eb10/NIMDBEx.xcframework.zip", checksum: "fd0e2f8a099db5bf9e13fe9d4ac4bd56443bb1e0ea0778b62796a44d2cabcd5d"),
    ]
)
