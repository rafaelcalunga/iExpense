//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Rafael Calunga on 2020-09-24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
