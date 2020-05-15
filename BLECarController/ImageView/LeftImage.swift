//
//  ForwardImage.swift
//  BLECarController
//
//  Created by tabatay89 on 2020/05/11.
//

import SwiftUI

struct LeftImage: View {
    var body: some View {
        Image("left_arrow")
        .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 2)
    }
}

struct LeftImage_Previews: PreviewProvider {
    static var previews: some View {
        LeftImage()
    }
}
