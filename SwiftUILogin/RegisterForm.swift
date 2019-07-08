//
//  RegisterForm.swift
//  SwiftUILogin
//
//  Created by Jalp on 01/07/2019.
//  Copyright © 2019 JDC0rp. All rights reserved.
//

import SwiftUI
import Combine

class Account : BindableObject {
    var didChange = PassthroughSubject<Void, Never>()
    
    static let accountTypes = ["Admin", "Manager", "Employee"]
    
    var accountType = 0 { didSet { update()}}
    
    var name = ""
    
    var username = ""
    
    var password = ""
    
    var surname = ""
    
    func update() {
        didChange.send(())
    }
    
}

struct RegisterForm : View {
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
                            Text("Name")
                            TextField($account.name) {
                                UIApplication.shared.windows[0].endEditing(true)
                            }.textFieldStyle(.roundedBorder)
                                .colorScheme(.light)
                                .padding(10)
                        }
                        
                        HStack {
                            Text("Surname")
                            TextField($account.surname) {
                                UIApplication.shared.windows[0].endEditing(true)
                            }.textFieldStyle(.roundedBorder)
                                .colorScheme(.light)
                                .padding(10)
                        }
                        
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
                        
                        
                        Picker(selection: $account.accountType, label: Text("Select account type")) {
                            ForEach(0..<Account.accountTypes.count) {
                                Text(Account.accountTypes[$0]).tag($0)
                            }
                        }
                        
                    }
                    .navigationBarTitle(Text("Register"))
                        .navigationBarItems(trailing: Button(action: { self.isPresented?.value = false } ) { Text("Done") })
                }
                Button(action: {
                    self.didShowAlert = true
                }) {
                    Text("Register")
                        .accentColor(.black)
                        .padding()
                        .background(Color.red)
                }
                .cornerRadius(9)
                    .presentation($didShowAlert) {
                        Alert(title: Text("Success"), message: Text("Registered Successfull!"), dismissButton: .default(Text("OK")))
                }
                .padding(20)
                
            }
        }
    }
}

#if DEBUG
struct RegisterForm_Previews : PreviewProvider {
    static var previews: some View {
        RegisterForm()
    }
}
#endif
