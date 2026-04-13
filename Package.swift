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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1776052504251/NIM_iOS_SDK_v10.9.81_f330cb3/NIMSDK.xcframework.zip", checksum: "71569f78d00ee9ef01b731bfe7cd492831913382ca9521298d6d7eaf685682ea"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1776052504251/NIM_iOS_SDK_v10.9.81_f330cb3/NIMSocketRocket.xcframework.zip", checksum: "9daf22aa668b03ae93bf1a149a7e180d955c0888d16961b77f29a6c0e1b892b2"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1776052504251/NIM_iOS_SDK_v10.9.81_f330cb3/NIMQuic.xcframework.zip", checksum: "efc728bd58d06e07a1e658079a112820b684c310effe7ddcc0cb3be82a923307"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1776052504251/NIM_iOS_SDK_v10.9.81_f330cb3/NIMNOS.xcframework.zip", checksum: "e67e221488e3bcf2c1c6ea3af44306374aad8a61a319103e359d276f271a2c81"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1776052504251/NIM_iOS_SDK_v10.9.81_f330cb3/NIMFCS.xcframework.zip", checksum: "9e921f016196e540bbf07db8bb8b938ab3f2b3de108cb6734c523975e517a3e4"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1776052504251/NIM_iOS_SDK_v10.9.81_f330cb3/NIMAWSCore.xcframework.zip", checksum: "93ce0d3476c2a9cbc6c93b0337ab98129353c07b9bdb847a14891436167620d5"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1776052504251/NIM_iOS_SDK_v10.9.81_f330cb3/NIMAWSS3.xcframework.zip", checksum: "a4331afbde2c6565325ec927c289063b9ac9da155e4f6d322e92054a04b2d3f7"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1776052504251/NIM_iOS_SDK_v10.9.81_f330cb3/NIMQChat.xcframework.zip", checksum: "e845269c05e5b2b0170cc5b439b755d1b729c69ac798c6a9cb19c4cdd8625515"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1776052504251/NIM_iOS_SDK_v10.9.81_f330cb3/NIMDBEx.xcframework.zip", checksum: "12c0de701085a81f5abafd3d11bb24ac57e5c4eb4a2dd20063a19e05bef0c9a9"),
    ]
)
