//
//  LoginView.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            VStack {
                SquareTextField()
                    .padding(.top)
                SquareTextField()
                
                Spacer()
                
                VStack(spacing: 0.0) {
                    Button() {
                        print("test")
                    } label: {
                        Text("Login")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .buttonStyle(BlackButton())
                    .padding(.bottom)
                    
                    NavigationLink(destination: RegisterView()) {
                        Text("Register")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(RoundedRectangle(cornerRadius: 25.0).stroke(.black, lineWidth: 2.5))
                            .padding([.leading, .trailing])
                    }
                }
                
            }
            .navigationTitle("Login")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
