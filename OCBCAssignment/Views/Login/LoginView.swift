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
                SquareTextField()
                
                Spacer()
                
                VStack(spacing: 0.0) {
                    BlackButton()
                        .padding(.bottom)
                    WhiteButton()
                        .padding(.bottom)
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
