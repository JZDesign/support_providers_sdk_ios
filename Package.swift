// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "ZendeskSupportProvidersSDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "ZendeskSupportProvidersSDK",
            targets: [
              "ZendeskSupportProvidersSDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskCoreSDK",
                 url: "https://github.com/zendesk/core_sdk_ios",
                 .exact("2.7.0"))
    ],
    targets: [
        .binaryTarget(
            name: "SupportProvidersSDK",
            path: "SupportProvidersSDK.xcframework"
        ),
        .target(name: "ZendeskSupportProvidersSDKTargets",
                dependencies: [
                    .target(name: "SupportProvidersSDK"),
                    .product(name: "ZendeskCoreSDK", package: "ZendeskCoreSDK")
                ],
                path: "Sources"
        )
    ]
)
