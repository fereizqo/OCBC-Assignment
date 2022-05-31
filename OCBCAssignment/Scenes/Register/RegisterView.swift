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
    @ObservedObject var viewModel = RegisterViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
                    .tint(Color.black)
                    .progressViewStyle(.circular)
                    .background(Color.clear)
            } else {
                VStack {
                    SquareTextField(text: $textUser, isAlert: $isAlertUser, dialogTitleText: "Username", alertText: "Username is required")
                        .padding(.top)
                    SquareSecureTextField(text: $textPassword, isAlert: $isAlertPassword, dialogTitleText: "Password", alertText: "Password is required")
                        .padding(.top)
                    SquareSecureTextField(text: $textPasswordConfirm, isAlert: $isAlertPasswordConfirm, dialogTitleText: "Confirm Password", alertText: "Confirm password not match")
                        .padding(.top)
                    
                    Spacer()
                    
                    Button() {
                        isAlertUser = textUser.count == 0
                        isAlertPassword = textPassword.count == 0
                        isAlertPasswordConfirm = textPassword != textPasswordConfirm
                        if !isAlertUser && !isAlertPassword && !isAlertPasswordConfirm {
                            viewModel.doRegister(username: textUser, password: textPassword)
                        }
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
                .alert(isPresented: $viewModel.isApiAlert) {
                    Alert(title: Text("Error"),
                          message: Text(viewModel.alertText ?? "Failed to fetch server"),
                          dismissButton: .default(Text("Ok")))
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(textUser: "test", textPassword: "", textPasswordConfirm: "", isAlertUser: false, isAlertPassword: false, isAlertPasswordConfirm: false)
    }
}
