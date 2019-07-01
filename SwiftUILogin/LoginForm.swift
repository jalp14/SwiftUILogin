//
//  LoginForm.swift
//  SwiftUILogin
//
//  Created by Jalp on 01/07/2019.
//  Copyright © 2019 JDC0rp. All rights reserved.
//

import SwiftUI

struct LoginForm : View {
    var body: some View {
        NavigationView {
            Form {
               Text("My Form")
            }.navigationBarTitle(Text("Login"))
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
