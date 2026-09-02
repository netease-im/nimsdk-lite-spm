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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1788336521939/NIM_iOS_SDK_v9.21.15_561d0e9/NIMSDK.xcframework.zip", checksum: "991da5dbff09fee73356bbda9e20da95717c73ed5d7b273c21ec154ae25dabe2"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1788336521939/NIM_iOS_SDK_v9.21.15_561d0e9/NIMSocketRocket.xcframework.zip", checksum: "71c3b05f66cc0be4d6c04dd04d2176247fdcee2d758edb3eaedf3cc954959d66"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1788336521939/NIM_iOS_SDK_v9.21.15_561d0e9/NIMQuic.xcframework.zip", checksum: "02e37bd4634c27e99f2850c81a9b9ee5fa05232c1af42f05fe69d225fedec074"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1788336521939/NIM_iOS_SDK_v9.21.15_561d0e9/NIMNOS.xcframework.zip", checksum: "536cb67d8427f9bc0bb86e200ce8b49693dde76b260d8603a465cf104fad99c6"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1788336521939/NIM_iOS_SDK_v9.21.15_561d0e9/NIMFCS.xcframework.zip", checksum: "caf8511c57451e5e15725f93cb55ef361f9e076c334d75907188bbc23096e7c6"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1788336521939/NIM_iOS_SDK_v9.21.15_561d0e9/NIMAWSCore.xcframework.zip", checksum: "c4c37274427f909939f0af8d8a4d299c74dbf9eb3a850b48c14aae7c66ee6054"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1788336521939/NIM_iOS_SDK_v9.21.15_561d0e9/NIMAWSS3.xcframework.zip", checksum: "e04c8869bf4b2bb4095cf9e3548c3f19572c591174a82b1fd314ae8a16f42ae7"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1788336521939/NIM_iOS_SDK_v9.21.15_561d0e9/NIMQChat.xcframework.zip", checksum: "37b1a817571869ef8debd3b03512cbd89b0f0a8f707e801d2d721fff22dc985f"),
    ]
)
