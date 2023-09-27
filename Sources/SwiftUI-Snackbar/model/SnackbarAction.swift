//
//  File.swift
//  
//
//  Created by WonHee Jung on 2023/09/27.
//

import Foundation

// Snackbar Action when dismiss / click label
public protocol SnackbarAction {
    func onDismiss()
    func onPerformAction()
}
