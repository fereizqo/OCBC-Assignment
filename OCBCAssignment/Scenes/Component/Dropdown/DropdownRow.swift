//
//  DropdownRow.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 25/05/22.
//

import SwiftUI

struct DropdownRow: View {
    var datum: PayeeData
    var onDataSelected: ((_ datum: PayeeData) -> Void)?
    
    var body: some View {
        Button(action: {
            if let onDataSelected = onDataSelected {
                onDataSelected(self.datum)
            }
        }, label: {
            HStack {
                Text(self.datum.accountNo)
                    .font(.body)
                    .foregroundColor(.black)
                Spacer()
            }
        })
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
    }
}

struct DropdownRow_Previews: PreviewProvider {
    static var previews: some View {
        DropdownRow(datum: PayeeData(id: "123", name: "aset", accountNo: "123-123"))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
