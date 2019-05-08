import UIKit


//test color helper properties
let colorLiteral = #colorLiteral(red: 0.9254901961, green: 0.2352941176, blue: 0.1019607843, alpha: 1)
let hexColor: UInt = 0xEC3C1A
let r = 236
let g = 60
let b = 26

//MARK: conversion functions

func rgbToHexString(r: Int, g: Int, b: Int) -> String {
    
    let rHex = String(format:"%02X", r) // this is the 0xEC component of a hex color, represented as a two character string.
    let gHex = String(format:"%02X", g) // this is the 0x3C component of a hex color, represented as a two character string.
    let bHex = String(format:"%02X", b) // this is the 0x1A component of a hex color, represented as a two character string.
    
    let hexString = rHex + gHex + bHex //Adds the strings to get the full hex string
    print(hexString) // This is the hex format like on line 4, withouth the "0x" and in a String instead of UInt

    return hexString //returns a hex string without the 0x prefix
}

func rgbToHex(r: Int, g: Int, b: Int) -> UInt {
    
    let hexString = rgbToHexString(r: r, g: g, b: b) // hexString from the above function
    
    let hexNumber = UInt(hexString, radix: 16)! //Convert the string into a UInt, note that the absolute number now matches the hexColor property number
    print(hexNumber)
    
    return hexNumber
}

//Returns an array of RGB parameters as UInt. For clarity I have not included the conversion to CGFloat and conversion for input into UIColor as seen on line 46-49
func hexToRGB(hex: UInt) -> [UInt] {
    let R = (hex >> 16) & 0xff // the >> and $ are advanced operators. for more info check out: https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html
    let G = (hex >> 08) & 0xff
    let B = (hex >> 00) & 0xff
    let array = [R,G,B]
    return array
}

//More functional representation for implementation into a project. Use the 0xffffff format for the hex parameter not a String.
func hexToUIColor(hex: UInt, alpha: CGFloat) -> UIColor {
    let R = CGFloat((hex >> 16) & 0xff) / 255
    let G = CGFloat((hex >> 08) & 0xff) / 255
    let B = CGFloat((hex >> 00) & 0xff) / 255
    let color = UIColor(red: R, green: G, blue: B, alpha: alpha)
    return color
}

//USAGE: Below are the usages of the conversion functions

//Find the hex string for an rgb color
let hexString = rgbToHexString(r: r, g: g, b: b)

//Convert rgb to absolute hex number with rgb parameters
let hex = rgbToHex(r: r, g: g, b: b)

//Convert hex number to rgb parameters
let rgb = hexToRGB(hex: hexColor)

//Convert hex to UIColor with an alpha of 1
let color = hexToUIColor(hex: hexColor, alpha: 1)

//tested solution goes through both functions and returns the correct RGB parameters!
let rgbTest = hexToRGB(hex: hex)






