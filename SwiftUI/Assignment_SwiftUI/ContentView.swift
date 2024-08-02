//
//  ContentView.swift
//  Carousel-SwiftUI
//
//  Created by Apple on 01/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchedText = ""
    @StateObject var viewModel = CategoryViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    ScrollView {
                        CarouselView(selectedCategoryIndex: $viewModel.selectedCategoryIndex
                                     , categories: viewModel.categories)
                        
                        ItemListAndSearchBarView(searchedText: $searchedText, filteredItemList: viewModel.filteredItemList)
                            .onChange(of: searchedText) {
                                viewModel.filterItem(for: searchedText)
                            }
                    }
                }
                FloatingButtonView(topCharsCount: viewModel.topCharacters(), 
                                   itemCount: viewModel.filteredItemList.count)
                    .padding(.trailing, 30)
            }
            .onAppear {
                viewModel.loadData()
            }
            .onChange(of: viewModel.selectedCategoryIndex) {
                viewModel.loadDataAsPerCategory()
                searchedText.removeAll()
            }
            .navigationTitle(viewModel.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}

