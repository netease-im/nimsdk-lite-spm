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
        remoteBinary("NIMSDK", url: "https://yx-web-nosdn.netease.im/package/1788334884199/NIM_iOS_SDK_v9.21.12_8c8a844/NIMSDK.xcframework.zip", checksum: "c790fdd7e72f34c9ac893eb157ca830d3f146d8ee8c4192433c7cdc9df689715"),
        remoteBinary("NIMSocketRocket", url: "https://yx-web-nosdn.netease.im/package/1788334884199/NIM_iOS_SDK_v9.21.12_8c8a844/NIMSocketRocket.xcframework.zip", checksum: "a61e7e72bfd544d336b412531814b52b543167524a91ddd1fe3a0f8d0d7a01e7"),
        remoteBinary("NIMQuic", url: "https://yx-web-nosdn.netease.im/package/1788334884199/NIM_iOS_SDK_v9.21.12_8c8a844/NIMQuic.xcframework.zip", checksum: "d297798e3c5cf74f698742c64c35a0597d920dfd99e4ddbc445b7b7569f35a89"),
        remoteBinary("NIMNOS", url: "https://yx-web-nosdn.netease.im/package/1788334884199/NIM_iOS_SDK_v9.21.12_8c8a844/NIMNOS.xcframework.zip", checksum: "100756eb848b5cbf0e75e4c25e9c6d330b8971092279459ae4033bdf107e52d9"),
        remoteBinary("NIMFCS", url: "https://yx-web-nosdn.netease.im/package/1788334884199/NIM_iOS_SDK_v9.21.12_8c8a844/NIMFCS.xcframework.zip", checksum: "11aca2df00e4d910df60e6cee728efca24dc3315ef9f8f635acd7d4bfdc222c1"),
        remoteBinary("NIMAWSCore", url: "https://yx-web-nosdn.netease.im/package/1788334884199/NIM_iOS_SDK_v9.21.12_8c8a844/NIMAWSCore.xcframework.zip", checksum: "40227f0462f5c8f1f99298f88bcbd2bdaca8a589a3f027cdcce35033e34e9daf"),
        remoteBinary("NIMAWSS3", url: "https://yx-web-nosdn.netease.im/package/1788334884199/NIM_iOS_SDK_v9.21.12_8c8a844/NIMAWSS3.xcframework.zip", checksum: "fe01fe3cd05fa68e28fb74325adcd1d32ee163af25a04a86e8ba1a81c7303030"),
        remoteBinary("NIMQChat", url: "https://yx-web-nosdn.netease.im/package/1788334884199/NIM_iOS_SDK_v9.21.12_8c8a844/NIMQChat.xcframework.zip", checksum: "f9dc99d2e522be1b7a4cff9e105740e7b411f67e3ff5313dd98da00db7123013"),
    ]
)
