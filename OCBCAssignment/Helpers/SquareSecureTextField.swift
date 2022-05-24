//
//  SquareSecureTextField.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 25/05/22.
//

import SwiftUI

struct SquareSecureTextField: View {
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
                SecureField(dialogTitleText, text: $text)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
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

struct SquareSecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        SquareSecureTextField(text: .constant("Test"), isAlert: .constant(true), dialogTitleText: "Username", alertText: "")
            .previewLayout(.fixed(width: 400, height: 130))
    }
}
