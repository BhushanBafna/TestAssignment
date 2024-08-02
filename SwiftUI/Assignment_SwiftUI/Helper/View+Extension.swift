//
//  View+Extension.swift
//  Carousel-SwiftUI
//
//  Created by Apple on 01/08/24.
//

import SwiftUI

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        if shouldHide {
            self.hidden()
        } else {
            self
        }
    }
}
