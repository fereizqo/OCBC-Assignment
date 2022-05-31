//
//  DropdownList.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 25/05/22.
//

import SwiftUI

struct DropdownList: View {
    var data: [PayeeData]
    var onDataSelected: ((_ data: PayeeData) -> Void)?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.data, id:\.self) { datum in
                    DropdownRow(datum: datum, onDataSelected: self.onDataSelected)
                }
            }
        }
        .frame(height: 200)
        .padding(.vertical, 5)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black, lineWidth: 3)
        )
        .background(Color.white)
        .shadow(color: .gray, radius: 5)
    }
}

struct DropdownList_Previews: PreviewProvider {
    static var previews: some View {
        DropdownList(data: [
            PayeeData(id: "12", name: "test", accountNo: "3241-123"),
            PayeeData(id: "123", name: "test", accountNo: "3241-1232")
        ])
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
