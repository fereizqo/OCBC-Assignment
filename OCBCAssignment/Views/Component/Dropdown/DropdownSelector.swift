//
//  DropdownSelector.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 25/05/22.
//

import SwiftUI

struct DropdownSelector: View {
    @State private var shouldShowDropdown = false
    @State private var selected: DropdownData? = nil
    @Binding var selectedData: DropdownData
    var placeholder: String
    var data: [DropdownData]
    var onDataSelected: ((_ data: DropdownData) -> Void)?
    private let buttonHeight: CGFloat = 40
    
    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }, label: {
            HStack {
                Text(selected == nil ? placeholder : selected!.value)
                    .font(.body)
                    .foregroundColor(selected == nil ? Color.gray : Color.black)
                
                Spacer()
                
                Image(systemName: self.shouldShowDropdown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 9, height: 5)
                    .font(.callout)
                    .foregroundColor(Color.black)
            }
        })
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
            .cornerRadius(5)
//            .overlay(
//                RoundedRectangle(cornerRadius: 5)
//                    .stroke(Color.gray, lineWidth: 1)
//            )
            .overlay(
                VStack {
                    if self.shouldShowDropdown {
                        Spacer(minLength: buttonHeight + 10)
                        DropdownList(data: self.data, onDataSelected: { datum in
                            shouldShowDropdown = false
                            selected = datum
                            selectedData = datum
                            self.onDataSelected?(datum)
                        })
                    }
                }, alignment: .topLeading
            )
    }
}

struct DropdownSelector_Previews: PreviewProvider {
    static var onDataSelected: ((_ data: DropdownData) -> Void) = { _ in }
    static var previews: some View {
        DropdownSelector(
            selectedData: .constant(DropdownData(key: "1", value: "1")),
            placeholder: "Test 1",
            data: [
                DropdownData(key: "1", value: "1"),
                DropdownData(key: "3", value: "3")
            ],
            onDataSelected: onDataSelected
        )
    }
}
