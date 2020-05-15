//
//  ForwardImage.swift
//  BLECarController
//
//  Created by tabatay89 on 2020/05/11.
//

import SwiftUI

struct StopImage: View {
    var body: some View {
        Image("stop_square")
        .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 2)
    }
}

struct StopImage_Previews: PreviewProvider {
    static var previews: some View {
        StopImage()
    }
}
