//
//  FloatingButtonView.swift
//  Carousel-SwiftUI
//
//  Created by Apple on 01/08/24.
//

import SwiftUI

struct FloatingButtonView: View {
    @State private var isShowingStatistic = false
    var topCharsCount: [(Character, Int)]
    var itemCount = 0
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Button("") {
                isShowingStatistic.toggle()
            }
            .buttonStyle(FloatingButtonStyle(systemImageName: "plus"))
            .sheet(isPresented: $isShowingStatistic) {
                BottomSheetView(topCharsCount: topCharsCount, itemCount: itemCount)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.height(220)])
            }
        }
    }
}
    
struct BottomSheetView: View {
    var topCharsCount: [(Character, Int)]
    var itemCount = 0
    
    var body: some View {
        Text(StringConstants.statistics)
            .font(.title2).bold()
        VStack(spacing: 8) {
            Text("\(StringConstants.itemsInList) \(itemCount)")
            Text(StringConstants.top3CharTxt)
            ForEach(0..<topCharsCount.count, id: \.self) { index in
                Text("Char \(topCharsCount[index].0) - \(topCharsCount[index].1)")
            }
        }
    }
}

struct FloatingButtonStyle: ButtonStyle {
    
    let systemImageName: String
    
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: systemImageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.white)
            .frame(width: 30, height: 30)
            .padding()
            .background(Color(.systemPink))
            .clipShape(Circle())
            .shadow(radius: 5)
    }
}

#Preview {
    FloatingButtonView(topCharsCount: [("a", 5), ("b", 3), ("c", 8)], itemCount: 4)
}
