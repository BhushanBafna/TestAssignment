//
//  ItemListAndSearchBarView.swift
//  Assignment_SwiftUI
//
//  Created by Apple on 01/08/24.
//

import SwiftUI

struct ItemListAndSearchBarView: View {
    @Binding var searchedText: String
    var filteredItemList: [Items]

    var body: some View {
        LazyVStack(pinnedViews: .sectionHeaders) {
            Section {
                ForEach(filteredItemList, id: \.imageLink) { item in
                    ItemCellView(itemData: item)
                }
            } header: {
                SearchBarView(searchedText: $searchedText)
            }
        }
    }
}

#Preview {
    ItemCellView(itemData: Items(name: "", imageLink: "", description: ""))
}
