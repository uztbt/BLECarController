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

struct RightButton: View {
    var carData: CarData
    var body: some View {
        Button(action: {
            print("Pressed")
            self.carData.changeCommand(command: 2)
        }){
            RightImage()
        }
    }
}

struct BackwardButton: View {
    var carData: CarData
    var body: some View {
        Button(action: {
            print("Pressed")
            self.carData.changeCommand(command: 3)
        }){
            BackwardImage()
        }
    }
}

struct LeftButton: View {
    var carData: CarData
    var body: some View {
        Button(action: {
            print("Pressed")
            self.carData.changeCommand(command: 4)
        }){
            LeftImage()
        }
    }
}

struct StopButton: View {
    var carData: CarData
    var body: some View {
        Button(action: {
            print("Pressed")
            self.carData.changeCommand(command: 0)
        }){
            StopImage()
        }
    }
}


struct ControlButtons: View {
    var carData: CarData
    
    var body: some View {
        VStack {
            ForwardButton(carData: carData)
            HStack {
                LeftButton(carData: carData)
                StopButton(carData: carData)
                RightButton(carData: carData)
            }
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
