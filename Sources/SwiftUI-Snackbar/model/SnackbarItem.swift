//
//  SnackBarItem.swift
//  
//
//  Created by WonHee Jung on 2023/09/26.
//
import Foundation

struct SnackBarItem {
    let message: String
    let actionLabel: String?
    let duration: SnackbarDuration
    let performAction: () -> Void
    
    func toDelay() -> Int {
        switch duration {
        case .Short : return 4
        case .Long : return 10
        case .Indefinite : return Int.max
        }
    }
}
