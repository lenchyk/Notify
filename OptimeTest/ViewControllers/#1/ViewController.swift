//
//  ViewController.swift
//  OptimeTest
//
//  Created by Lena Soroka on 06.10.2022.
//

import UIKit
import LayoutHelper
import LayoutHelper.Swift

class ViewController: UIViewController {
    @IBOutlet private var topStackViewContraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setConstraintsForiPad()
    }

    private func setConstraintsForiPad() {
        switch UIDevice.model {
        case .iPadPro11inch:
            if UIDevice.current.orientation == .portrait {
                topStackViewContraint.constant = Constants.iPad11Portrait
            } else {
                topStackViewContraint.constant = Constants.iPad11Landscape
            }
        case .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4:
            if UIDevice.current.orientation == .portrait {
                topStackViewContraint.constant = Constants.iPad11Portrait
            } else {
                topStackViewContraint.constant = Constants.iPad11Landscape
            }
        case .iPadPro9_7_inch, .iPad2, .iPad3, .iPad4, .iPad5, .iPad6, .iPadAir, .iPadAir2:
            if UIDevice.current.orientation == .portrait {
                topStackViewContraint.constant = Constants.iPad9_7Portrait
            } else {
                topStackViewContraint.constant = Constants.iPad9_7Landscape
            }
        case .iPadPro10_5_inch:
            if UIDevice.current.orientation == .portrait {
                topStackViewContraint.constant = Constants.iPad10_5Portrait
            } else {
                topStackViewContraint.constant = Constants.iPad10_5Landscape
            }
        case .iPadPro12_9_inch, .iPadPro12_9_inch2, .iPadPro12_9_inch3:
            if UIDevice.current.orientation == .portrait {
                topStackViewContraint.constant = Constants.iPad12_9Portrait
            } else {
                topStackViewContraint.constant = Constants.iPad12_9Landscape
            }
        case .simulator: break
        case .unrecognized: break
        }
    }
}

