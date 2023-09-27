# SwiftUI_SnackBar
This is very simple Snackbar

---

# Installation (SPM)
1. Go to File > Swift Packages > Add package dependency
2. Add it by pasting this link https://github.com/jmseb3/SwiftUI-Snackbar.git
3. Select the Version you want to add, the Branch or even the single Commit

# How To Use

## import
~~~swift
import SwiftUI_Snackbar
~~~

## make Controller 
~~~swift

import SwiftUI
import SwiftUI_Snackbar

@main
struct testApp: App {
    //make Controller
    let sc = SnackbarController()

    var body: some Scene {
        WindowGroup {
            SnackBarHost() {
                //Yout ContentView
                ContentView()
            }.environmentObject(sc)
        }
    }
}
~~~
on @main make SnackbarController and use **SnackBarHost**

## ContentView
~~~swift
struct ContentView: View {
    @EnvironmentObject var sc : SnackbarController
    
    @State var cnt :Int = 0
    var body: some View {
        VStack {
            Button("test") {
                cnt = cnt + 1
                sc.showSnackBar(
                    message: "test\(cnt)",
                    label: "ok"
                ) {
                    sc.resetSnackBar()
                }
            }
        }
        .padding()
    }
}
~~~
now you can use snackbar by **SnackbarController**

## SnackbarController
you can use under method
~~~swift
func showSnackBar(
    message: String
) 

func showSnackBar(
    message: String,
    duration: SnackbarDuration = SnackbarDuration.Short
)

func showSnackBar(
    message: String,
    label: String? = nil,
    action:  @escaping () -> Void
)

func showSnackBar(
    message: String,
    label: String? = nil,
    duration: SnackbarDuration = SnackbarDuration.Short,
    action:  @escaping () -> Void
)
~~~

## Result

## History