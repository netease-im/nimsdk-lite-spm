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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMSDK.xcframework.zip", checksum: "775522b2a8276cd1919b6c36108cea05591138d516226af89ecc903d25d6e9b5"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMSocketRocket.xcframework.zip", checksum: "76f8de4abbad7870759cccad48042e1b19cd24a1e783ce8cb59a36e22fdec940"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMQuic.xcframework.zip", checksum: "8e970c51d41862865327f032c3fb5b993f1ec4bbc52b3a95126b771820ff8ce3"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMNOS.xcframework.zip", checksum: "95b1a89e135eec9bdac2043adf945f2d9253bfecd9101d3143b992b75802441b"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMFCS.xcframework.zip", checksum: "d12a37119615d8caa7a0a57628baecfbf96949ef3dad5dc68ef34f75a6f0aef8"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMAWSCore.xcframework.zip", checksum: "8ce1c6e033a234a03554b6eeb0bc0146efec4575a4ffaa22199122f8ffb6af7b"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMAWSS3.xcframework.zip", checksum: "2da44aa153e98dd636e20fcda9adba6fbbdda8fc3194e311ef2ad9ed9524994c"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMQChat.xcframework.zip", checksum: "272f3c8d655b6c1359a5591a052c83c027bc7c29b13a4584e8d1983b131673a2"),
        remoteBinary("NIMDBEx", url: "https://yx-web-nosdn.netease.im/package/1772185741857/NIM_iOS_SDK_v10.9.70_efa4a55/NIMDBEx.xcframework.zip", checksum: "954ed47f95775979ca41827ee339ed2faf15ca82224401d676af71f7acbb626d"),
    ]
)
