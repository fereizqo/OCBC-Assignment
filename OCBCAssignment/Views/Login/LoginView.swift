//
//  LoginView.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct LoginView: View {
    @State var textUser: String
    @State var textPassword: String
    @State var isAlertUser: Bool
    @State var isAlertPassword: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 15) {
                    SquareTextField(text: $textUser, isAlert: $isAlertUser, dialogTitleText: "Username", alertText: "Username is required")
                    SquareTextField(text: $textPassword, isAlert: $isAlertPassword, dialogTitleText: "Password", alertText: "Password is required")
                } // VStack - Texfield
                .padding(.top, 10)
                
                Spacer()
                
                VStack(spacing: 0.0) {
                    Button() {
                        if textUser.count == 0 {
                            isAlertUser = true
                        } else {
                            isAlertUser = false
                        }
                        if textPassword.count == 0 {
                            isAlertPassword = true
                        } else {
                            isAlertPassword = false
                        }
                        if textUser.count > 0 && textPassword.count > 0 {
                            print("ACTION: LOGIN")
                        }
                    } label: {
                        Text("Login")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .buttonStyle(BlackButton())
                    .padding(.bottom)
                    
                    NavigationLink(destination: RegisterView(textUser: "", textPassword: "", textPasswordConfirm: "", isAlertUser: false, isAlertPassword: false, isAlertPasswordConfirm: false)) {
                        Text("Register")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(RoundedRectangle(cornerRadius: 25.0).stroke(.black, lineWidth: 2.5))
                            .padding([.leading, .trailing])
                    }
                } // VStack - Button
                
            }
            .navigationTitle("Login")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(textUser: "", textPassword: "", isAlertUser: false, isAlertPassword: false)
    }
}
