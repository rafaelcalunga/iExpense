//
//  ContentView.swift
//  iExpense
//
//  Created by Rafael Calunga on 2020-09-23.
//

import SwiftUI

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text("\(item.name)")
                }
                .onDelete(perform: removeItems)
            }
            //.listStyle(PlainListStyle())
            .navigationTitle("iExpense")
            .navigationBarItems(trailing:
                Button(action: {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    self.expenses.items.append(expense)
                }) {
                    Image(systemName: "plus")
                }
            )
        }
    }
    
    func removeItems(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
