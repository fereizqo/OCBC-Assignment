//
//  TransferView.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct TransferView: View {
    @State var dataPayee: [DropdownData]
    @State var selectedPayee: DropdownData
    @State var textAmount: String
    @State var textDesc: String
    @State var isAlertPayee: Bool
    @State var isAlertAmount: Bool
    @State var isAlertDesc: Bool
    
    let items = [
        Item(header: "Header 1", footer: "Footer 1", rows: ["A", "B", "C"]),
        Item(header: "Header 2", footer: "Footer 2", rows: ["C", "D"]),
        Item(header: "Header 3", footer: "Footer 3", rows: ["E"])
    ]
    
    var body: some View {
        VStack {
            ZStack {
                VStack(spacing: 20) {
                    SquareDropdown(data: $dataPayee, isAlert: $isAlertPayee, selectedData: $selectedPayee, dialogTitleText: "Payee", alertText: "")
                        .padding(.top)
                        .zIndex(3)
                    SquareTextField(text: $textAmount, isAlert: $isAlertAmount, dialogTitleText: "Amount", alertText: "")
                        .zIndex(2)
                    SquareTextField(text: $textDesc, isAlert: $isAlertDesc, dialogTitleText: "Description", alertText: "")
                        .zIndex(1)
                }
            }
            
            Spacer()
            
            Button() {
                print("test \(selectedPayee)")
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
        TransferView(dataPayee: [DropdownData(key: "1", value: "1")],
                     selectedPayee: DropdownData(key: "1", value: "1"),
                     textAmount: "",
                     textDesc: "",
                     isAlertPayee: false,
                     isAlertAmount: false,
                     isAlertDesc: false)
    }
}
