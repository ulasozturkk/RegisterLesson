
import Foundation
import UIKit

extension UIFont {
  static func customScaledFont(CustomFontName: String) -> UIFont {
    let customFont = UIFont(name: CustomFontName, size: UIFont.labelFontSize)!
    let fontMetrics = UIFontMetrics.default
    let scaledFont = fontMetrics.scaledFont(for: customFont)

    return scaledFont
  }
}
