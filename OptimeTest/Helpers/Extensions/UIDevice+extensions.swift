//
//  UIDevice+extensions.swift
//  OptimeTest
//
//  Created by Lena Soroka on 07.10.2022.
//

import UIKit
import SystemConfiguration

public extension UIDevice {
    static let model: DeviceModel = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> DeviceModel {
            #if os(iOS)
            switch identifier {
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return .iPad2
            case "iPad3,1", "iPad3,2", "iPad3,3":           return .iPad3
            case "iPad3,4", "iPad3,5", "iPad3,6":           return .iPad4
            case "iPad4,1", "iPad4,2", "iPad4,3":           return .iPadAir
            case "iPad5,3", "iPad5,4":                      return .iPadAir2
            case "iPad6,11", "iPad6,12":                    return .iPad5
            case "iPad7,5", "iPad7,6":                      return .iPad6
            case "iPad2,5", "iPad2,6", "iPad2,7":           return .iPadMini
            case "iPad4,4", "iPad4,5", "iPad4,6":           return .iPadMini2
            case "iPad4,7", "iPad4,8", "iPad4,9":           return .iPadMini3
            case "iPad5,1", "iPad5,2":                      return .iPadMini4
            case "iPad6,3", "iPad6,4":                      return .iPadPro9_7_inch
            case "iPad6,7", "iPad6,8":                      return .iPadPro12_9_inch
            case "iPad7,1", "iPad7,2":                      return .iPadPro12_9_inch2
            case "iPad7,3", "iPad7,4":                      return .iPadPro10_5_inch
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return .iPadPro11inch
            case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return .iPadPro12_9_inch3
                
            case "i386", "x86_64":
                print("Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))")
                                                            return .simulator
            default:                                        return .unrecognized
            }
            #endif
        }
        
        return mapToDevice(identifier: identifier)
    }()
}

