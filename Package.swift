// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "Lottie",
  platforms: [.iOS("11.0"), .macOS("10.10"), .tvOS("11.0")],
  products: [.library(name: "Lottie", targets: ["Lottie", "_LottieStub"])],
  targets: [
    .binaryTarget(
      name: "Lottie",
      url: "https://github.com/airbnb/lottie-ios/releases/download/4.1.2/Lottie.xcframework.zip",
      checksum: "3fc1e8054e3749caee0ae189770b6793a6ab3292b4d9d8fd1b8762265339c14b"),
    
    // Without at least one regular (non-binary) target, this package doesn't show up
    // in Xcode under "Frameworks, Libraries, and Embedded Content". That prevents
    // Lottie from being embedded in the app product, causing the app to crash when
    // ran on a physical device. As a workaround, we can include a stub target
    // with at least one source file.
    .target(
      name: "_LottieStub",
      dependencies: ["Lottie"]),
    
    .testTarget(
      name: "LottieTests",
      dependencies: ["Lottie"],
      path: "Tests")
  ])
