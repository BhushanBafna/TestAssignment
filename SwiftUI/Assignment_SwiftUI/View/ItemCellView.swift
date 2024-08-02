//
//  ItemCellView.swift
//  Carousel-SwiftUI
//
//  Created by Apple on 01/08/24.
//

import SwiftUI

struct ItemCellView: View {
    let itemData: Items
    var body: some View {
        HStack(alignment: .center) {
            Image(itemData.name)
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(.rect(cornerRadius: 5))
                .padding(.leading, 8)
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(itemData.name)
                    .font(.title3)
                Text(itemData.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(8)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .cornerRadius(5)
        .shadow(radius: 2)
        .padding(.horizontal, 12)
        
    }
}

#Preview {
    ItemCellView(itemData: Items(name: "Apple",
                                 imageLink: "https://images.pexels.com/photos/3746517/pexels-photo-3746517.jpeg?auto=compress&cs=tinysrgb&w=800",
                                 description: "A sweet, crunchy fruit that comes in many varieties. Rich in fiber and vitamin C."))
}
