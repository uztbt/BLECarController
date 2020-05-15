//
//  Buttons.swift
//  BLECarController
//
//  Created by tabatay89 on 2020/05/11.
//

import SwiftUI

struct ForwardButton: View {
    var carData: CarData
    var body: some View {
        Button(action: {
            print("Pressed")
            self.carData.changeCommand(command: 1)
        }){
            ForwardImage()
        }
    }
}

struct BackwardButton: View {
    var carData: CarData
    var body: some View {
        Button(action: {
            print("Pressed")
            self.carData.changeCommand(command: 2)
        }){
            BackwardImage()
        }
    }
}
struct LeftButton: View {
    var body: some View {
        Button(action: {print("Pressed")}){
            LeftImage()
        }
    }
}
struct RightButton: View {
    var body: some View {
        Button(action: {print("Pressed")}){
            RightImage()
        }
    }
}


struct ControlButtons: View {
    var carData: CarData
    
    var body: some View {
        VStack(spacing: -30.0) {
            ForwardButton(carData: carData)
            HStack(spacing: 70.0) {
                LeftButton()
                
                RightButton()
            }
            .padding()
            BackwardButton(carData: carData)
        }
    }
}

struct ControlButtons_Previews: PreviewProvider {
    static var previews: some View {
        ControlButtons(carData: CarData{(command: UInt8) -> Void in
            print(command)
        })
    }
}
