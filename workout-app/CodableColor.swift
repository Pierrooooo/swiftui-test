import SwiftUI

// Custom struct to wrap Color for Codable conformance
struct CodableColor: Codable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double

    init(color: Color) {
        let uiColor = UIColor(color)
        var redValue: CGFloat = 0
        var greenValue: CGFloat = 0
        var blueValue: CGFloat = 0
        var alphaValue: CGFloat = 0

        uiColor.getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: &alphaValue)

        self.red = Double(redValue)
        self.green = Double(greenValue)
        self.blue = Double(blueValue)
        self.alpha = Double(alphaValue)
    }

    var toColor: Color {
        Color(red: red, green: green, blue: blue, opacity: alpha)
    }
}
