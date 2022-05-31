//
//  SquareDropdown.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 25/05/22.
//

import SwiftUI

struct SquareDropdown: View {
    @Binding var data: [PayeeData]
    @Binding var isAlert: Bool
    @Binding var selectedData: PayeeData
    var dialogTitleText: String
    var alertText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(dialogTitleText)
                    .font(.headline)
                    .padding([.top, .leading, .trailing], 10.0)
                DropdownSelector(selectedData: $selectedData, placeholder: "Payee", data: data)
            }
            .background(RoundedRectangle(cornerRadius: 4.0).stroke(.black, lineWidth: 2.5))
            
            if isAlert {
                Text(alertText)
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
    }
}

struct SquareDropdown_Previews: PreviewProvider {
    static var previews: some View {
        SquareDropdown(
            data: .constant([
                PayeeData(id: "12", name: "test", accountNo: "123-123")
            ]),
            isAlert: .constant(true),
            selectedData: .constant(PayeeData(id: "23", name: "tes", accountNo: "123-123")),
            dialogTitleText: "Username",
            alertText: "")
            .previewLayout(.fixed(width: 400, height: 130))
    }
}
