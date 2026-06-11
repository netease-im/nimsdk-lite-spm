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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMSDK.xcframework.zip", checksum: "31011ec03c4ed8682b1901c77d876eb89bbcb92278917b3123ba25521be311fc"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMSocketRocket.xcframework.zip", checksum: "c8fce129ee03d2c522d16c418644fa7b2f107515f1043a4517baa31342e88555"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMQuic.xcframework.zip", checksum: "93e6ab8baf48ebb988404a5bab04718b0ea3400065d893470708b08506bd3dfc"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMNOS.xcframework.zip", checksum: "c9b7018bc941b5308541903219b1fc24f9bbbbd51ccbbf57ea1cc4e0e71cc65b"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMFCS.xcframework.zip", checksum: "92171e6af565a04e7f2d8efb1130c635cb3663a734a0a9c72945b7ee933fc402"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMAWSCore.xcframework.zip", checksum: "c6e4377554719e33e5a4ea23be1de7ca97bfa162498320ed4e645532b267cd15"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMAWSS3.xcframework.zip", checksum: "0b96d4726624c3b8ba87642f1ff85aac045f7ac28feed129a8efcb81caf79816"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMQChat.xcframework.zip", checksum: "3ad42d6b77925656b269ed14f9bc3abcf5d88212ab205c79917a76ee3f94c8e3"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1781151785968/NIM_iOS_SDK_v10.10.0_46ee7c3/NIMDBEx.xcframework.zip", checksum: "438bac8b5ec1d037e54f82c27430ce41712c48078397c7eb66adfd7c7d184f17"),
    ]
)
