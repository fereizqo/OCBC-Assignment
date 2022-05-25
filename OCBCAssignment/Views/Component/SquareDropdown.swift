//
//  SquareDropdown.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 25/05/22.
//

import SwiftUI

struct SquareDropdown: View {
    @Binding var data: [DropdownData]
    @Binding var isAlert: Bool
    var dialogTitleText: String
    var alertText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(dialogTitleText)
                    .font(.headline)
                    .padding([.top, .leading, .trailing], 10.0)
                DropdownSelector(placeholder: "Payee", data: data)
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
        SquareDropdown(data: .constant([DropdownData(key: "test 1", value: "test 1")]),isAlert: .constant(true), dialogTitleText: "Username", alertText: "")
            .previewLayout(.fixed(width: 400, height: 130))
    }
}
