//
//  DashboardRow.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct DashboardRow: View {
    var username: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                Text(username)
                    .font(.body)
                    .bold()
                Spacer()
                Text("1,200.00")
                    .font(.headline)
                    .foregroundColor(.green)
                    .bold()
                
            }
            Text("4992-321-3321")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct DashboardRow_Previews: PreviewProvider {
    static var previews: some View {
        DashboardRow(username: "Jackie")
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
