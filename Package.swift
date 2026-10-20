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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1792497696304/NIM_iOS_SDK_v10.11.5_764a939/NIMSDK.xcframework.zip", checksum: "eea6853f2e6e95e1f6689a6d27b7672596186ed14f332859bcf7bc357acdb298"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1792497696304/NIM_iOS_SDK_v10.11.5_764a939/NIMSocketRocket.xcframework.zip", checksum: "aefe2f0981ed904d250f0b748e04fe23a32230193fe849760fd847a69f40f2bf"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1792497696304/NIM_iOS_SDK_v10.11.5_764a939/NIMQuic.xcframework.zip", checksum: "3316c38e5d87e772546d6ecd8d9ed395192ee2bda169798d37adf3d3b05de0bf"),
        remoteBinary("NIMHA", url: "https://yx-web-nosdn.netease.im/package/1792497696304/NIM_iOS_SDK_v10.11.5_764a939/NIMHA.xcframework.zip", checksum: "d708fe761e3b82e1ec87c289f161102f6decff7b5ae79b14f06f6c0ad1507174"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1792497696304/NIM_iOS_SDK_v10.11.5_764a939/NIMAWSCore.xcframework.zip", checksum: "8a71c11039746b5e2a5841b6e6b21acbfa71960b7c1f685df11d2b5c7f7407cf"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1792497696304/NIM_iOS_SDK_v10.11.5_764a939/NIMAWSS3.xcframework.zip", checksum: "1996eb2cdc2a5ed58c107389f149cafa2764b4682043e214ce1bca338947e02f"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1792497696304/NIM_iOS_SDK_v10.11.5_764a939/NIMQChat.xcframework.zip", checksum: "d2e3f053d2f6c25807505723811c046750630d564c658b21138e7d7d21155cda"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1792497696304/NIM_iOS_SDK_v10.11.5_764a939/NIMDBEx.xcframework.zip", checksum: "9d2573c2068f4c0857dc328645aa3c6032411c233d44027f8058134e46e6c39b"),
    ]
)
