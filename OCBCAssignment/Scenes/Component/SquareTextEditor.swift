//
//  SquareTextEditor.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 25/05/22.
//

import SwiftUI

struct SquareTextEditor: View {
    @Binding var text: String
    @Binding var isAlert: Bool
    var dialogTitleText: String
    var alertText: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(dialogTitleText)
                    .font(.headline)
                    .padding([.top, .leading, .trailing], 10.0)
                ZStack(alignment: .leading) {
                    if text.count < 1 {
                        Text("Description")
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                            .padding([.leading, .trailing], 5)
                            .keyboardType(keyboardType)
                            .lineSpacing(5)
                    }
                    TextEditor(text: $text)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .padding([.leading, .trailing], 5)
                        .keyboardType(keyboardType)
                        .lineSpacing(5)
                }
//                TextEditor(text: $text)
//                    .disableAutocorrection(true)
//                    .textInputAutocapitalization(.never)
//                    .padding([.leading, .trailing], 5)
//                    .keyboardType(keyboardType)
//                    .lineSpacing(5)
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

struct SquareTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        SquareTextEditor(text: .constant(""),
                         isAlert: .constant(true),
                         dialogTitleText: "Username", alertText: "")
             .previewLayout(.fixed(width: 400, height: 130))
    }
}
