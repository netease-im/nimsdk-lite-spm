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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1792497569078/NIM_iOS_SDK_v10.11.0_3d72ba6/NIMSDK.xcframework.zip", checksum: "7c416e1f74ea88256f69b024e78e7c107a9e16db13f20dcc934463f820cf6a9a"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1792497569078/NIM_iOS_SDK_v10.11.0_3d72ba6/NIMSocketRocket.xcframework.zip", checksum: "abb8982c8e29cd758486b76cfad9c1f6a02189c8dee17a5faf8790f6c5a02194"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1792497569078/NIM_iOS_SDK_v10.11.0_3d72ba6/NIMQuic.xcframework.zip", checksum: "63cb74cb29cb47122d5e3597241b0112bb54dce22436554fc093678c33bfcc58"),
        remoteBinary("NIMHA", url: "https://yx-web-nosdn.netease.im/package/1792497569078/NIM_iOS_SDK_v10.11.0_3d72ba6/NIMHA.xcframework.zip", checksum: "b9f645d2c1255f282431f4c2f7e0c9c735a881d7ccddea1dcd7008e8488901c8"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1792497569078/NIM_iOS_SDK_v10.11.0_3d72ba6/NIMAWSCore.xcframework.zip", checksum: "723d0fbbc81486c318415ebc428982d7aece4716d5f16d0413130238b4bcaab6"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1792497569078/NIM_iOS_SDK_v10.11.0_3d72ba6/NIMAWSS3.xcframework.zip", checksum: "7c31955415c709fd34cf3db24c043340080134224ca921b5afc8f7f53fa15315"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1792497569078/NIM_iOS_SDK_v10.11.0_3d72ba6/NIMQChat.xcframework.zip", checksum: "d8fc3718ad71d412311f1dc262faec4952d51d7fee9ba2875d372e602bf96b02"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1792497569078/NIM_iOS_SDK_v10.11.0_3d72ba6/NIMDBEx.xcframework.zip", checksum: "3ec26f44adb5ed4dfbfdb9396fc6b5a5c0fbdc693e44bd6e4b2eddee66e3c4fb"),
    ]
)
