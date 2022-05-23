//
//  BlackButton.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct BlackButton: View {
    var body: some View {
        Button() {
            print("test")
        } label: {
            Text("Login")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.black))
        .padding([.leading, .trailing])
    }
}

struct BlackButton_Previews: PreviewProvider {
    static var previews: some View {
        BlackButton()
    }
}
