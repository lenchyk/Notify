//
//  DeviceModel.swift
//  OptimeTest
//
//  Created by Lena Soroka on 07.10.2022.
//

import Foundation

public enum DeviceModel : String {
    
    //Simulator
    case simulator            = "simulator/sandbox",
         // iPad
         iPad2                = "iPad 2",
         iPad3                = "iPad 3",
         iPad4                = "iPad 4",
         iPadAir              = "iPad Air",
         iPadAir2             = "iPad Air 2",
         iPad5                = "iPad 5",
         iPad6                = "iPad 6",
         iPadMini             = "iPad Mini",
         iPadMini2            = "iPad Mini 2",
         iPadMini3            = "iPad Mini 3",
         iPadMini4            = "iPad Mini 4",
         iPadPro9_7_inch      = "iPad Pro (9.7-inch)",
         iPadPro12_9_inch     = "iPad Pro (12.9-inch)",
         iPadPro12_9_inch2    = "iPad Pro (12.9-inch) (2nd generation)",
         iPadPro12_9_inch3    = "iPad Pro (12.9-inch) (3rd generation)",
         iPadPro10_5_inch     = "iPad Pro (10.5-inch)",
         iPadPro11inch        = "iPad Pro (11-inch)",
         
         unrecognized         = "?unrecognized?"
}
