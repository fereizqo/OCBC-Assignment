//
//  SquareTextField.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct SquareTextField: View {
    @Binding var text: String
    @Binding var isAlert: Bool
    var dialogTitleText: String
    var alertText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(dialogTitleText)
                    .font(.headline)
                    .padding([.top, .leading, .trailing], 10.0)
                TextField(dialogTitleText, text: $text)
                    .padding([.leading, .bottom, .trailing], 10.0)
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

struct SquareTextField_Previews: PreviewProvider {
    static var previews: some View {
        SquareTextField(text: .constant("Test"), isAlert: .constant(true), dialogTitleText: "Username", alertText: "")
            .previewLayout(.fixed(width: 400, height: 130))
    }
}
