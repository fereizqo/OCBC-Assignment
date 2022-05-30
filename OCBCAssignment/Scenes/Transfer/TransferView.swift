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
    @ObservedObject var viewModel = TransferViewModel()
    
    let items = [
        Item(header: "Header 1", footer: "Footer 1", rows: ["A", "B", "C"]),
        Item(header: "Header 2", footer: "Footer 2", rows: ["C", "D"]),
        Item(header: "Header 3", footer: "Footer 3", rows: ["E"])
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                ZStack {
                    VStack(spacing: 20) {
                        SquareDropdown(data: $dataPayee, isAlert: $isAlertPayee, selectedData: $selectedPayee, dialogTitleText: "Payee", alertText: "Payee is required")
                            .zIndex(3)
                            .padding(.top)
                        SquareTextField(text: $textAmount, isAlert: $isAlertAmount, dialogTitleText: "Amount", alertText: "Amount is required", keyboardType: .numberPad)
                            .zIndex(2)
                        SquareTextEditor(text: $textDesc, isAlert: $isAlertDesc, dialogTitleText: "Description", alertText: "Description is required")
                            .zIndex(1)
                            .padding(.bottom)
                    }
                }
            }
            
            Button() {
                isAlertDesc = textDesc.count == 0
                isAlertAmount = textAmount.count == 0
                isAlertPayee = selectedPayee.value.count == 0
                if !isAlertDesc && !isAlertAmount && !isAlertPayee {
                    viewModel.doTransfer(receipAccountNo: "", amount: Double(textAmount) ?? 0, description: textDesc)
                }
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
