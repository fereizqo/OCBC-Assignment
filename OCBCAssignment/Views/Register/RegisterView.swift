//
//  RegisterView.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        NavigationView {
            VStack {
                SquareTextField()
                    .padding(.top)
                SquareTextField()
                SquareTextField()
                
                Spacer()
                
                Button() {
                    print("test")
                } label: {
                    Text("Login")
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
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
