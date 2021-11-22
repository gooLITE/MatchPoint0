//
//  Constant.swift
//  MatchPoint0
//
//  Created by Yu Sum Yung on 20/11/2021.
//

import Foundation
import UIKit

let themeColor = [
    ["Blue Pink", "#3478F6", "#EB445A"],
    ["Living Coral", "#EB7E70", "#6483AD"],
    ["Ultra Violet", "#5C4C87", "#DB9D90"],
    ["Sailor Blue", "#081F3D", "#BBEDD3"],
    ["Lime Punch", "#606060", "#DAEC50"],
    ["Cherry Tomato", "#DA403D", "#C9627F"],
    ["Forest Green", "#395E33", "#9EBB6D"],
    ["Royal Blue", "#215297", "#E3A785"],
    ["Electric Blue", "#2961AC", "#A4C2D3"],
    ["Cream Gold", "#C89AC2", "#DCC675"],
    ["Blazing Yellow", "#12181F", "#FAE851"],
    ["Twitter Blue", "#1B4284", "#4AA3F4"],
    ["Bubblegum Pink", "#CCCE98", "#DA7A8E"],
    ["Sky Blue", "#90AADE", "#FBF6F5"],
    ["Turkish Sea", "#29508B", "#A2A2A1"],
    ["Island Green", "#57AC6D", "#FBF6F5"],
    ["Mango Mojito", "#D1A250", "@61624A"],
    ["Pale Green", "#CCCE98", "#715488"],
    ["Navy Blue", "#F7ECEF", "#353D75"],
    ["Bright Red", "#E54B33", "#F6D449"],
    ["Black Green", "#2D693D", "#12181F"],
    ["White Orange", "#E7632A", "#FFFFFF"],
    ["Princess Blue", "#F8D875", "#215297"],
    ["Soybean", "#D4C5A2", "#333146"],
    ["Cantaloupe", "#F2A57F", "#EEC9BA"],
    ["Rose Pink", "#D06C89", "#371350"],
    ["Living Blue", "#EB7E70", "#6483AD"]
]



func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
