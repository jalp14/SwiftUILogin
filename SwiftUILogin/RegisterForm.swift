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
    
    var name = "Your Name"
    
    func update() {
        didChange.send(())
    }
    
}

struct RegisterForm : View {
    @ObjectBinding var account = Account()
    var body: some View {
        NavigationView {
            Form {
                TextField($account.name) {
                    UIApplication.shared.keyWindow?.endEditing(true)
                } .textFieldStyle(.roundedBorder)
                .padding()
                
                Picker(selection: $account.accountType, label: Text("Select account type")) {
                    ForEach(0..<Account.accountTypes.count) {
                        Text(Account.accountTypes[$0]).tag($0)
                    }
                    }
            }
            .navigationBarTitle(Text("Register"))
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
