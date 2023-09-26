// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct SnackBarHost<Content: View>: View {
    
    @EnvironmentObject var snackbarController : SnackbarController
    private let content: () -> Content
    
    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }
    
    public var body: some View {
        VStack {
            ZStack {
                //Content
                VStack {
                    content()
                }
                //SnackBar
                let item = snackbarController.snackbarItem
                if(item != nil) {
                    VStack {
                        Spacer()
                        SnackBarView(item: item!).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    }
                    .transition(AnyTransition.opacity.animation(.easeInOut))
                }
               
            }
        }
    }
}
