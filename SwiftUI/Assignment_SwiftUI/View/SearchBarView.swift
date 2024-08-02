//
//  SearchBarView.swift
//  Carousel-SwiftUI
//
//  Created by Apple on 01/08/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchedText: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 40)
                .clipShape(.rect(cornerRadius: 7))
                .foregroundStyle(.secondary.opacity(0.3))
                .padding()
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                
                TextField(text: $searchedText) {
                    Text(StringConstants.searchPlaceholder)
                        .font(.system(size: 17))
                        .foregroundStyle(.gray)
                        .autocorrectionDisabled()
                }
                
                Button {
                    searchedText.removeAll()
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundStyle(.gray)
                }
                .hidden(searchedText.isEmpty ? true : false)
            }
            .padding([.leading, .trailing], 22)
        }
        .background(.white)
    }
}

#Preview {
    SearchBarView(searchedText: .constant(""))
}
