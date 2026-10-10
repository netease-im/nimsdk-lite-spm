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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMSDK.xcframework.zip", checksum: "88b6a421ac5b0d27c84172781cf0c391873b3564bdcc2324783877022a600873"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMSocketRocket.xcframework.zip", checksum: "b8dc075ed9968a6e5e5f268d70c7acc2b848e1dc7b61a798c9be7cc64b0b91ec"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMQuic.xcframework.zip", checksum: "219528a2bfb000e2cb34dd0b095566494e728c1c44c93815950cded329811257"),
        remoteBinary("NIMHA", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMHA.xcframework.zip", checksum: "abbf9fff9065ab44830bcc3403db73c0184a4b0325c4e95ae8c1d8a615393431"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMAWSCore.xcframework.zip", checksum: "a76dbe16551f1b54e9972cd8ed830ef8a7be44a812a361676ccc3c66cce6ffcd"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMAWSS3.xcframework.zip", checksum: "db206b315d7870ded43c83c1ae2eb227916149b142bd3f5c1215b0c4ef322caa"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1791621734554/NIM_iOS_SDK_v9.21.18_eed1c1b/NIMQChat.xcframework.zip", checksum: "996981a83e6a4bff275310d2cdfd8af3a2983742765af4e903c112a698f01f05"),
    ]
)
