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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1781151495716/NIM_iOS_SDK_v10.9.91_6354988/NIMSDK.xcframework.zip", checksum: "007e8c976474a2d2c9f75fc5cce7bc1c59ed6b3209ba05c36c49fe7f7efccccb"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1781151495716/NIM_iOS_SDK_v10.9.91_6354988/NIMSocketRocket.xcframework.zip", checksum: "2b465fae5052e28d6bf5cb86ee136579a290f463e5c7f5adb7ff7478d8c73f2a"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1781151495716/NIM_iOS_SDK_v10.9.91_6354988/NIMQuic.xcframework.zip", checksum: "685cffa0bf9e1e471208147fa27986e16b58ee8df46bd41124bfe64efdcf363c"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1781151495716/NIM_iOS_SDK_v10.9.91_6354988/NIMNOS.xcframework.zip", checksum: "a660f83fb62917239c2e36a6a4743bb25028b8f77eafd2a0c4a603a2ae85315c"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1781151495716/NIM_iOS_SDK_v10.9.91_6354988/NIMFCS.xcframework.zip", checksum: "0ebb1aabf4b7c04a24bb0427f57d37d1ccb74cf2d3d7e0950ca370e392c2102f"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1781151495716/NIM_iOS_SDK_v10.9.91_6354988/NIMAWSCore.xcframework.zip", checksum: "0700c534601cfb6ada7906785d68791c4bf2a0218df86dee06286e8a18bc295f"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1781151495716/NIM_iOS_SDK_v10.9.91_6354988/NIMAWSS3.xcframework.zip", checksum: "ffa9f3099aabc0fc60fec0c2689aeeccb570ca1d4a67295d7d1f0b3b39bf33fd"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1781151495716/NIM_iOS_SDK_v10.9.91_6354988/NIMQChat.xcframework.zip", checksum: "2033a4397f9e9c7fa659f20797d2247d38c9874ae83ccdd59c774f1787079f90"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1781151495716/NIM_iOS_SDK_v10.9.91_6354988/NIMDBEx.xcframework.zip", checksum: "c6c5f8fc67aa3c50f5991514dfb46961f2d92124b30a87e806b0b9fc604355ab"),
    ]
)
