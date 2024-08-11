
// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum AssetCatalog {
  internal enum Assets {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal static let logo1 = ImageAsset(name: "logo 1")
    internal static let logo = ImageAsset(name: "logo")
  }
  internal enum Colors {
    internal static let brand = ColorAsset(name: "brand")
    internal static let brand100 = ColorAsset(name: "brand100")
    internal static let brand200 = ColorAsset(name: "brand200")
    internal static let brand300 = ColorAsset(name: "brand300")
    internal static let brand400 = ColorAsset(name: "brand400")
    internal static let brand50 = ColorAsset(name: "brand50")
    internal static let brand500 = ColorAsset(name: "brand500")
    internal static let brand600 = ColorAsset(name: "brand600")
    internal static let brand800 = ColorAsset(name: "brand800")
    internal static let brand900 = ColorAsset(name: "brand900")
    internal static let disableField = ColorAsset(name: "disable field")
    internal static let disable = ColorAsset(name: "disable")
    internal static let fieldShadow = ColorAsset(name: "field shadow")
    internal static let neutral = ColorAsset(name: "neutral")
    internal static let neutralDark = ColorAsset(name: "neutralDark")
    internal static let neutralLight = ColorAsset(name: "neutralLight")
    internal static let neutralMediam = ColorAsset(name: "neutralMediam")
    internal static let danger = ColorAsset(name: "danger")
    internal static let info = ColorAsset(name: "info")
    internal static let success = ColorAsset(name: "success")
    internal static let warning = ColorAsset(name: "warning")
    internal static let shadow = ColorAsset(name: "shadow")
    internal static let placeholder = ColorAsset(name: "placeholder")
    internal static let textDisabled = ColorAsset(name: "textDisabled")
    internal static let textHeading = ColorAsset(name: "textHeading")
    internal static let textNonActive = ColorAsset(name: "textNonActive")
    internal static let textParagraph = ColorAsset(name: "textParagraph")
  }
  internal enum Icons {
    internal static let ellipse96 = ImageAsset(name: "Ellipse 96")
    internal static let frame2118 = ImageAsset(name: "Frame 2118")
    internal static let frame2119 = ImageAsset(name: "Frame 2119")
    internal static let frame2120 = ImageAsset(name: "Frame 2120")
    internal static let frame2148 = ImageAsset(name: "Frame 2148")
    internal static let group = ImageAsset(name: "Group")
    internal static let radioButton = ImageAsset(name: "Radio Button")
    internal static let akarIconsShoppingBag = ImageAsset(name: "akar-icons_shopping-bag")
    internal static let cuate = ImageAsset(name: "cuate")
    internal static let fiUserAltLightActive = ImageAsset(name: "fi_ User_alt_light active")
    internal static let fiUserAltLight = ImageAsset(name: "fi_ User_alt_light")
    internal static let fiArrowLeft = ImageAsset(name: "fi_arrow-left")
    internal static let fiArrowRight = ImageAsset(name: "fi_arrow-right")
    internal static let fiDollarSign = ImageAsset(name: "fi_dollar-sign")
    internal static let fiFilter = ImageAsset(name: "fi_filter")
    internal static let fiHomeActive = ImageAsset(name: "fi_home active")
    internal static let fiHome = ImageAsset(name: "fi_home")
    internal static let fiSearch = ImageAsset(name: "fi_search")
    internal static let fiStar = ImageAsset(name: "fi_star")
    internal static let frame170 = ImageAsset(name: "frame-170")
    internal static let image29 = ImageAsset(name: "image 29")
    internal static let imageRemovebg1 = ImageAsset(name: "image-removebg- 1")
    internal static let loading = ImageAsset(name: "loading")
    internal static let onboardingChoose = ImageAsset(name: "onboarding choose")
    internal static let onboardingQuick = ImageAsset(name: "onboarding quick")
    internal static let onboardingRedeem = ImageAsset(name: "onboarding redeem")
    internal static let orderActive = ImageAsset(name: "order active")
    internal static let orderComplete = ImageAsset(name: "order complete")
    internal static let orderInprogress = ImageAsset(name: "order inprogress")
    internal static let order = ImageAsset(name: "order")
    internal static let otp = ImageAsset(name: "otp")
    internal static let star = ImageAsset(name: "star")
    internal static let success = ImageAsset(name: "success")
    internal static let unsplashLSm1B4L1Ns1 = ImageAsset(name: "unsplash_L-sm1B4L1Ns 1")
    internal static let unsplashLSm1B4L1Ns2 = ImageAsset(name: "unsplash_L-sm1B4L1Ns 2")
    internal static let unsplashLSm1B4L1Ns3 = ImageAsset(name: "unsplash_L-sm1B4L1Ns 3")
    internal static let unsplashLSm1B4L1Ns = ImageAsset(name: "unsplash_L-sm1B4L1Ns")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ColorAsset {
  let name: String

  internal var color: Color {
    Color(self)
  }
}

internal extension Color {
  /// Creates a named color.
  /// - Parameter asset: the color resource to lookup.
  init(_ asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    self.init(asset.name, bundle: bundle)
  }
}

internal struct ImageAsset {
  let name: String

  internal var image: Image {
    Image(name)
  }
}

internal extension Image {
  /// Creates a labeled image that you can use as content for controls.
  /// - Parameter asset: the image resource to lookup.
  init(_ asset: ImageAsset) {
    let bundle = Bundle(for: BundleToken.self)
    self.init(asset.name, bundle: bundle)
  }
}

private final class BundleToken {}
