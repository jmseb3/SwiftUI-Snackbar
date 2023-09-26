//
//  File.swift
//  
//
//  Created by WonHee Jung on 2023/09/26.
//

import SwiftUI

struct SnackBarView: View {
    
    let item : SnackBarItem
    let bgColor = Color(red: 37 / 255, green: 36 / 255, blue: 39 / 255)
    
    public var body: some View {
        HStack{
            HStack {
                Text(item.message)
                    .foregroundColor(Color.white)
                Spacer()
                if(item.actionLabel != nil) {
                    Button(item.actionLabel!) {
                        item.performAction()
                    }
                }
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 8))
        }
        .frame(minHeight: 48)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct SnackBarView_Preview: PreviewProvider {
    static var previews: some View {
        SnackBarView(item: SnackBarItem(
            message: "very very very very very very very very very very very very long text",
            actionLabel: "label",
            duration: SnackbarDuration.Short,
            performAction: {}
        ))
        .environmentObject(SnackbarController())
        
    }
}

