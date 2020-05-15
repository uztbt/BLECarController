//
//  ForwardImage.swift
//  BLECarController
//
//  Created by tabatay89 on 2020/05/11.
//

import SwiftUI

struct BackwardImage: View {
    var body: some View {
        Image("backward_arrow")
        .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 2)
    }
}

struct BackwardImage_Previews: PreviewProvider {
    static var previews: some View {
        BackwardImage()
    }
}
