//
//  File.swift
//  
//
//  Created by WonHee Jung on 2023/09/27.
//

import Foundation
import SwiftUI

public struct SnackbarOption {
    static let shared = SnackbarOption()
    private init() {}
    
    // snackbar Color
    var bgColor = Color(red: 37 / 255, green: 36 / 255, blue: 39 / 255)
    
    var textColor = Color.white
}
