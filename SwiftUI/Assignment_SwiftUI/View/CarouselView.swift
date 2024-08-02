//
//  CarouselView.swift
//  Carousel-SwiftUI
//
//  Created by Apple on 01/08/24.
//

import SwiftUI

struct CarouselView: View {
    @Binding var selectedCategoryIndex: Int
    var categories: [CategoriesListData]
    
    var body: some View {
        TabView(selection: $selectedCategoryIndex) {
            ForEach(0..<categories.count, id: \.self) { index in
                Image(categories[index].name)
                    .resizable()
                    .clipShape(.rect(cornerRadius: 6))
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: 200)
        .contentMargins(20, for: .scrollContent)
        .padding([.leading, .trailing], 10)
        .tint(Color(.systemPink))
    }
}

