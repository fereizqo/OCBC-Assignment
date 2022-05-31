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
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                        .tint(Color.black)
                        .progressViewStyle(.circular)
                        .background(Color.clear)
                }
                VStack {
                    VStack(spacing: 15) {
                        SquareTextField(text: $textUser, isAlert: $isAlertUser, dialogTitleText: "Username", alertText: "Username is required")
                        SquareSecureTextField(text: $textPassword, isAlert: $isAlertPassword, dialogTitleText: "Password", alertText: "Password is required")
                    } // VStack - Texfield
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    VStack(spacing: 0.0) {
                        Button() {
                            isAlertUser = textUser.count == 0
                            isAlertPassword = textPassword.count == 0
                            if !isAlertUser && !isAlertPassword {
                                viewModel.doLogin(username: textUser, password: textPassword)
                            }
                        } label: {
                            Text("Login")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                        }
                        .buttonStyle(BlackButton())
                        .padding(.bottom)
                        .fullScreenCover(isPresented: $viewModel.isLoginSuccess, content: DashboardView.init)
                        
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
                .alert(isPresented: $viewModel.isApiAlert) {
                    Alert(title: Text("Error"),
                          message: Text(viewModel.alertText ?? "Failed to fetch server"),
                          dismissButton: .default(Text("Ok")))
                }
            }
        }
        .accentColor(.black)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(textUser: "", textPassword: "", isAlertUser: false, isAlertPassword: false)
    }
}
