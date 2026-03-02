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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1772432227031/NIM_iOS_SDK_v9.21.10_0dce6f6/NIMSDK.xcframework.zip", checksum: "fb0e651f0d5ea6a028ea295e7e54c87f78b34108478fc8bd9a3475812e77bb30"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1772432227031/NIM_iOS_SDK_v9.21.10_0dce6f6/NIMSocketRocket.xcframework.zip", checksum: "fa224fddb0979fd0334f44e56201250176b6819f3314b599e9e9f5c77545cccc"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1772432227031/NIM_iOS_SDK_v9.21.10_0dce6f6/NIMQuic.xcframework.zip", checksum: "40214f1638368b7a471e94216e5b9bd35e8c98c9aa0b9203b9fe1411a1fa8d82"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1772432227031/NIM_iOS_SDK_v9.21.10_0dce6f6/NIMNOS.xcframework.zip", checksum: "fa92181442fa8c969538f11eec72878785c15cf2bf9f672d6bda3ac31a9a667e"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1772432227031/NIM_iOS_SDK_v9.21.10_0dce6f6/NIMFCS.xcframework.zip", checksum: "d4c9c9744a79880a382441ec2a911409b78140a1abc05120ee08d61009c7a2dd"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1772432227031/NIM_iOS_SDK_v9.21.10_0dce6f6/NIMAWSCore.xcframework.zip", checksum: "a97497ac6d3f9c2ccbcbab3a62fa6c66220a9556f00254a11fc303e8a0d34798"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1772432227031/NIM_iOS_SDK_v9.21.10_0dce6f6/NIMAWSS3.xcframework.zip", checksum: "0eb3ece82904df08f982a935accb29799048f9b140603f77bbcc61864f05182b"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1772432227031/NIM_iOS_SDK_v9.21.10_0dce6f6/NIMQChat.xcframework.zip", checksum: "f186aa4005a3586b18d467fa93ccf9e89f3f78bd7f0833461f5bb69ea1b376b7"),
    ]
)
