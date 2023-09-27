//
//  File.swift
//  
//
//  Created by WonHee Jung on 2023/09/26.
//

import SwiftUI

struct SnackBarView: View {
    
    let item : SnackBarItem
    
    public var body: some View {
        HStack{
            HStack {
                Text(item.message)
                    .foregroundColor(SnackbarOption.shared.textColor)
                Spacer()
                if(item.actionLabel != nil) {
                    Button(item.actionLabel!) {
                        item.action?.onPerformAction()
                    }
                }
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 8))
        }
        .frame(minHeight: 48)
        .background(SnackbarOption.shared.bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct SnackBarView_Preview: PreviewProvider {
    static var previews: some View {
        SnackBarView(
            item: SnackBarItem(
                message: "very very very very very very very very very very very very long text",
                actionLabel: "label",
                duration: SnackbarDuration.Short,
                action: nil
            )
            )
        .environmentObject(SnackbarController())
        
    }
}

