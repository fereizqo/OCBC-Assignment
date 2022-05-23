//
//  ButtonStyle.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct BlackButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.black))
            .padding([.leading, .trailing])
//            .clipShape(Capsule())
    }
}

struct WhiteButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(RoundedRectangle(cornerRadius: 25.0).stroke(.black, lineWidth: 2.5))
            .padding([.leading, .trailing])
//            .clipShape(Capsule())
    }
}
