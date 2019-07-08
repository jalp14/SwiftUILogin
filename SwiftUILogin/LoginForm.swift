//
//  LoginForm.swift
//  SwiftUILogin
//
//  Created by Jalp on 01/07/2019.
//  Copyright © 2019 JDC0rp. All rights reserved.
//

import SwiftUI
import Combine


struct LoginForm : View {
    @ObjectBinding var account = Account()
    // Used to dismiss the view
    @Environment(\.isPresented) var isPresented : Binding<Bool>?
    
    @State var didShowAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    VStack {
                        HStack {
                            Text("Please fill in the details to log in")
                                .fontWeight(.semibold)
                                .font(.caption)
                        }.padding(.horizontal)
                        HStack {
                            Text("Username")
                            TextField($account.username) {
                                UIApplication.shared.windows[0].endEditing(true)
                            }.textFieldStyle(.roundedBorder)
                                .colorScheme(.light)
                                .padding(10)
                        }
                        HStack {
                            Text("Password")
                            SecureField($account.password) {
                                UIApplication.shared.windows[0].endEditing(true)
                            }.textFieldStyle(.roundedBorder)
                                .colorScheme(.light)
                                .padding(10)
                        }
                    }
                        
                        .navigationBarTitle(Text("Login"))
                        .navigationBarItems(trailing: Button(action: {
                            self.isPresented?.value = false } ) {
                                Text("Done")
                        })
                }
                
                
                Button(action: {
                    self.didShowAlert = true
                }) {
                    Text("Login")
                        .accentColor(.black)
                        .padding()
                        .background(Color.red)
                }
                .cornerRadius(9)
                    .presentation($didShowAlert) {
                        Alert(title: Text("Success"), message: Text("Authentication Successfull!"), dismissButton: .default(Text("OK")))
                }
                .padding(20)
            }
        }
    }
}

#if DEBUG
struct LoginForm_Previews : PreviewProvider {
    static var previews: some View {
        LoginForm()
    }
}
#endif
