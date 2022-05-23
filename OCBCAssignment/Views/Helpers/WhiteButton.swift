//
//  WhiteButton.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct WhiteButton: View {
    var body: some View {
        Button() {
            print("test")
        } label: {
            Text("Register")
                .font(.title2)
                .bold()
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(RoundedRectangle(cornerRadius: 25.0).stroke(.black, lineWidth: 2.5))
        .padding([.leading, .trailing])
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        WhiteButton()
    }
}
