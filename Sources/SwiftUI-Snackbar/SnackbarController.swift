//
//  SnackbarController.swift
//
//
//  Created by WonHee Jung on 2023/09/26.
//

import Foundation

public class SnackbarController: ObservableObject {
    public init() {}
    
    @Published var snackbarItem : SnackBarItem? = nil
    
    public func showSnackBar(
        message: String
    ) {
        self.showSnackBar(message: message, label: nil ,duration: SnackbarDuration.Short,action: nil)
    }
    
    public func showSnackBar(
        message: String,
        duration: SnackbarDuration = SnackbarDuration.Short
    ) {
        self.showSnackBar(message: message, label: nil ,duration: duration,action: nil)
    }
    
    public func showSnackBar(
        message: String,
        label: String? = nil,
        action: SnackbarAction
    ) {
        self.showSnackBar(message: message, label: label ,duration: SnackbarDuration.Short,action: action)
    }
    
    public func showSnackBar(
        message: String,
        label: String? = nil,
        duration: SnackbarDuration = SnackbarDuration.Short,
        action: SnackbarAction?
    ) {
        self.snackbarItem = SnackBarItem(
            message: message,
            actionLabel: label,
            duration: duration,
            action: action
        )
        resetTask()
    }
    
    private var workItem: DispatchWorkItem? // Create a private DispatchWorkItem property
    
    private func resetTask() {
        guard let item  = snackbarItem else {
            return
        }
        workItem?.cancel()
        if (item.duration != SnackbarDuration.Indefinite) {
            let dispatchAfter = DispatchTimeInterval.seconds(item.toDelay())
            workItem = DispatchWorkItem { // Set the work item with the block you want to execute
                self.resetSnackBar()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + dispatchAfter,execute: workItem!)
        }
        
    }
    
    
    public func resetSnackBar() {
        self.snackbarItem?.action?.onDismiss()
        self.snackbarItem = nil
    }
}
