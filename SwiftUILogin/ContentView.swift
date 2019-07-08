//
//  ContentView.swift
//  SwiftUILogin
//
//  Created by Jalp on 01/07/2019.
//  Copyright © 2019 JDC0rp. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("New User? Click the button below to make a new account")
                        .padding()
                        .lineLimit(3)
                    PresentationLink(destination: RegisterForm(), label: {
                        Text("Register")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .accentColor(.black)
                            .padding(10)
                            .background(Color.red)
                    }).cornerRadius(9)
                }
                VStack {
                    Text("Already registered? Click the button below to log back in")
                        .padding()
                        .lineLimit(3)
                    PresentationLink(destination: LoginForm(), label: {
                        Text("Login")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .accentColor(.black)
                            .padding(10)
                            .background(Color.red)
                    }).cornerRadius(9)
                }.navigationBarTitle(Text("My App"))
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
