//
//  TransferView.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct TransferView: View {
    @State var textPayee: String
    @State var textAmount: String
    @State var textDesc: String
    @State var isAlertPayee: Bool
    @State var isAlertAmount: Bool
    @State var isAlertDesc: Bool
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                SquareTextField(text: $textPayee, isAlert: $isAlertPayee, dialogTitleText: "Payee", alertText: "")
                    .padding(.top)
                SquareTextField(text: $textAmount, isAlert: $isAlertAmount, dialogTitleText: "Amount", alertText: "")
                SquareTextField(text: $textDesc, isAlert: $isAlertDesc, dialogTitleText: "Descriptionn", alertText: "")
            }
            
            Spacer()
            
            Button() {
                print("test")
            } label: {
                Text("Transfer Now")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
            .buttonStyle(BlackButton())
        }
        .navigationTitle("Transfer")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView(textPayee: "", textAmount: "", textDesc: "", isAlertPayee: false, isAlertAmount: false, isAlertDesc: false)
    }
}
