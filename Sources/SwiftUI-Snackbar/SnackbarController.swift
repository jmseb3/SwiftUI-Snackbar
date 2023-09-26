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
        self.showSnackBar(message: message, label: nil ,duration: SnackbarDuration.Short,action: {})
    }
    
    public func showSnackBar(
        message: String,
        duration: SnackbarDuration = SnackbarDuration.Short
    ) {
        self.showSnackBar(message: message, label: nil ,duration: duration,action: {})
    }
    
    public func showSnackBar(
        message: String,
        label: String? = nil,
        action:  @escaping () -> Void
    ) {
        self.showSnackBar(message: message, label: label ,duration: SnackbarDuration.Short,action: action)
    }
    
    public func showSnackBar(
        message: String,
        label: String? = nil,
        duration: SnackbarDuration = SnackbarDuration.Short,
        action:  @escaping () -> Void
    ) {
        self.snackbarItem = SnackBarItem(
            message: message,
            actionLabel: label,
            duration: duration,
            performAction: action
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
        self.snackbarItem = nil
    }
}
