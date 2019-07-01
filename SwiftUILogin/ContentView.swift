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
        Spacer()
            HStack(alignment : .center, spacing : 20) {
                Spacer()
                
                PresentationButton(destination: LoginForm(), label: {
                    Text("Login")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .accentColor(.black)
                    .padding(10)
                    .background(Color.red)
                }) .cornerRadius(CGFloat(9))
                
                Spacer()
                
                PresentationButton(destination: RegisterForm(), label: {
                    Text("Register")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .accentColor(.black)
                        .padding(10)
                        .background(Color.red)
                }) .cornerRadius(CGFloat(9))
                
            Spacer()
            } .navigationBarTitle(Text("Welcome to app"))
            Spacer()
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
