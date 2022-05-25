//
//  DropdownSelector.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 25/05/22.
//

import SwiftUI

struct DropdownSelector: View {
    @State private var shouldShowDropdown = false
    @State private var selectedData: DropdownData? = nil
    var placeholder: String
    var data: [DropdownData]
    var onDataSelected: ((_ data: DropdownData) -> Void)?
    private let buttonHeight: CGFloat = 40
    
    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }, label: {
            HStack {
                Text(selectedData == nil ? placeholder : selectedData!.value)
                    .font(.body)
                    .foregroundColor(selectedData == nil ? Color.gray : Color.black)
                
                Spacer()
                
                Image(systemName: self.shouldShowDropdown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 9, height: 5)
                    .font(.callout)
                    .foregroundColor(Color.black)
            }
        })
            .padding(.horizontal, 10)
            .cornerRadius(5)
            .frame(width: .infinity, height: self.buttonHeight)
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
            placeholder: "Test 1",
            data: [
                DropdownData(key: "1", value: "1")
            ],
            onDataSelected: onDataSelected
        )
    }
}
