//
//  DashboardRow.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct DashboardRow: View {
    var data: TransactionData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                Text(data.receipient.accountHolder)
                    .font(.body)
                    .bold()
                Spacer()
                if data.transactionType == "transfer" {
                    Text("- \(data.amount, specifier: "%.2f")")
                        .font(.body)
                        .foregroundColor(.gray)
                        .bold()
                } else if data.transactionType == "received" {
                    Text("\(data.amount, specifier: "%.2f")")
                        .font(.body)
                        .foregroundColor(.green)
                        .bold()
                }
                
            }
            Text(data.receipient.accountNo)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct DashboardRow_Previews: PreviewProvider {
    static var previews: some View {
        DashboardRow(data: TransactionData(transactionID: "123", amount: 10, transactionTime: "2022-03-12T15:13:58.927Z", datumDescription: "2022-03-12T15:13:58.927Z", transactionType: "test", receipient: Receipient(accountNo: "11", accountHolder: "111")))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
