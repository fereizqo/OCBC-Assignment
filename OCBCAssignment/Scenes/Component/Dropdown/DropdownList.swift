//
//  DropdownList.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 25/05/22.
//

import SwiftUI

struct DropdownList: View {
    var data: [DropdownData]
    var onDataSelected: ((_ data: DropdownData) -> Void)?
    
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
            DropdownData(key: "test 1", value: "test 1"),
            DropdownData(key: "test 2", value: "test 2")
        ])
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
