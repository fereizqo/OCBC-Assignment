//
//  DashboardView.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct DashboardView: View {
    let items = [
        Item(header: "Header 1", footer: "Footer 1", rows: ["A", "B", "C"]),
        Item(header: "Header 2", footer: "Footer 2", rows: ["C", "D"]),
        Item(header: "Header 3", footer: "Footer 3", rows: ["E"])
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Button(action: {
                        print("Logout")
                    }, label: {
                        Text("Logout")
                            .foregroundColor(.black)
                            .font(.headline)
                    })
                        .padding(.trailing)
                } // HStack - Logout
                .padding(.vertical, 10)
                
                VStack(alignment: .leading, spacing: 8) {
                    VStack(alignment: .leading) {
                        Text("You have")
                            .font(.body)
                        .bold()
                        Text("SGD 10,000.00")
                            .font(.title)
                            .bold()
                    }
                    VStack(alignment: .leading) {
                        Text("Account No")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("3213-321-123")
                            .font(.body)
                            .bold()
                    }
                    VStack(alignment: .leading) {
                        Text("Account Holder")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("Johny Depp")
                            .font(.body)
                            .bold()
                    }
                } // VStack - Account Status
                .padding(.leading, 20.0)
                .padding(.vertical, 20)
                .padding(.trailing, 80.0)
                .background(Color(uiColor: .white))
                .cornerRadius(10, corners: [.topRight, .bottomRight])
                .shadow(radius: 10)
                
                Text("Your transaction history")
                    .font(.headline)
                    .bold()
                    .padding(.leading, 20.0)
                    .padding(.top, 30)
                
                Spacer()
                
                List {
                    ForEach(items, id: \.self) { item in
                        Section(content: {
                            ForEach(item.rows, id: \.self) { row in
                                DashboardRow(username: row)
                            }
                        }, header: {
                            Text(item.header)
                        })
                    }
                } // List - Transaction
                // Ignore safe area to take up whole screen
                .background(Color(uiColor: UIColor(named: "GrayBack") ?? .systemGray6))
                .listStyle(.insetGrouped)
                .onAppear {
                    // Set the default to clear
                    UITableView.appearance().backgroundColor = .clear
                    UITableView.appearance().separatorColor = .clear
                }
                
                NavigationLink(destination: TransferView(
                    dataPayee: [
                        DropdownData(key: "1", value: "1"),
                        DropdownData(key: "3", value: "3")
                    ],
                    selectedPayee: DropdownData(key: "1", value: "1"),
                    textAmount: "",
                    textDesc: "",
                    isAlertPayee: false,
                    isAlertAmount: false,
                    isAlertDesc: false)) {
                    Text("Make Transfer")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.black))
                        .padding([.leading, .trailing])
                }
            }
            .background(Color(uiColor: UIColor(named: "GrayBack") ?? .systemGray6))
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .accentColor(.black)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}


struct Item: Hashable {
  let header: String
  let footer: String
  let rows: [String]
}
