//
//  SquareTextField.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct SquareTextField: View {
    @State var username: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Username")
                    .font(.headline)
                    .padding([.top, .leading, .trailing], 10.0)
                TextField("Enter username", text: $username)
                    .padding([.leading, .bottom, .trailing], 10.0)
            }
            .background(RoundedRectangle(cornerRadius: 4.0).stroke(.black, lineWidth: 2.5))
            
            Text("Username is required")
                .foregroundColor(.red)
        }
        .padding(.all)
    }
}

struct SquareTextField_Previews: PreviewProvider {
    static var previews: some View {
        SquareTextField()
            .previewLayout(.fixed(width: 400, height: 130))
    }
}
