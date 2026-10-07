// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
// Generated file. Do not edit.
//

import PackageDescription

let package = Package(
    name: "FlutterGeneratedPluginSwiftPackage",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "FlutterGeneratedPluginSwiftPackage", type: .static, targets: ["FlutterGeneratedPluginSwiftPackage"])
    ],
    dependencies: [
        .package(name: "webview_flutter_wkwebview", path: "../.packages/webview_flutter_wkwebview-3.23.8"),
        .package(name: "pointer_interceptor_ios", path: "../.packages/pointer_interceptor_ios-0.10.1"),
        .package(name: "wakelock_plus", path: "../.packages/wakelock_plus-1.3.2"),
        .package(name: "package_info_plus", path: "../.packages/package_info_plus-8.3.1"),
        .package(name: "video_player_avfoundation", path: "../.packages/video_player_avfoundation-2.7.1"),
        .package(name: "url_launcher_ios", path: "../.packages/url_launcher_ios-6.3.3"),
        .package(name: "shared_preferences_foundation", path: "../.packages/shared_preferences_foundation-2.5.4"),
        .package(name: "path_provider_foundation", path: "../.packages/path_provider_foundation-2.4.0"),
        .package(name: "image_picker_ios", path: "../.packages/image_picker_ios-0.8.12+2"),
        .package(name: "file_picker", path: "../.packages/file_picker-10.1.9"),
        .package(name: "device_info_plus", path: "../.packages/device_info_plus-11.5.0"),
        .package(name: "FlutterFramework", path: "../.packages/FlutterFramework")
    ],
    targets: [
        .target(
            name: "FlutterGeneratedPluginSwiftPackage",
            dependencies: [
                .product(name: "webview-flutter-wkwebview", package: "webview_flutter_wkwebview"),
                .product(name: "pointer-interceptor-ios", package: "pointer_interceptor_ios"),
                .product(name: "wakelock-plus", package: "wakelock_plus"),
                .product(name: "package-info-plus", package: "package_info_plus"),
                .product(name: "video-player-avfoundation", package: "video_player_avfoundation"),
                .product(name: "url-launcher-ios", package: "url_launcher_ios"),
                .product(name: "shared-preferences-foundation", package: "shared_preferences_foundation"),
                .product(name: "path-provider-foundation", package: "path_provider_foundation"),
                .product(name: "image-picker-ios", package: "image_picker_ios"),
                .product(name: "file-picker", package: "file_picker"),
                .product(name: "device-info-plus", package: "device_info_plus"),
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ]
        )
    ]
)
