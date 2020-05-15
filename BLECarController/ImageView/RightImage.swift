//
//  ForwardImage.swift
//  BLECarController
//
//  Created by tabatay89 on 2020/05/11.
//

import SwiftUI

struct RightImage: View {
    var body: some View {
        Image("right_arrow")
        .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 2)
    }
}

struct RightImage_Previews: PreviewProvider {
    static var previews: some View {
        RightImage()
    }
}
