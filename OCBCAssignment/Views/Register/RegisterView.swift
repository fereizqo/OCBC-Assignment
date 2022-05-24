//
//  RegisterView.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct RegisterView: View {
    @State var textUser: String
    @State var textPassword: String
    @State var textPasswordConfirm: String
    @State var isAlertUser: Bool
    @State var isAlertPassword: Bool
    @State var isAlertPasswordConfirm: Bool
    
    var body: some View {
        VStack {
            SquareTextField(text: $textUser, isAlert: $isAlertUser, dialogTitleText: "Username", alertText: "")
                .padding(.top)
            SquareSecureTextField(text: $textPassword, isAlert: $isAlertPassword, dialogTitleText: "Password", alertText: "")
                .padding(.top)
            SquareSecureTextField(text: $textPasswordConfirm, isAlert: $isAlertPasswordConfirm, dialogTitleText: "Confirm Password", alertText: "")
                .padding(.top)
            
            Spacer()
            
            Button() {
                print("test")
            } label: {
                Text("Register")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
            .buttonStyle(BlackButton())
        }
        .navigationTitle("Register")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(textUser: "test", textPassword: "", textPasswordConfirm: "", isAlertUser: false, isAlertPassword: false, isAlertPasswordConfirm: false)
    }
}
