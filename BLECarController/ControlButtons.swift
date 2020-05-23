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

struct ForwardRightButton: View {
    var carData: CarData
    var body: some View {
        Button(action: {
            print("Pressed")
            self.carData.changeCommand(command: 2)
        }){
            RightImage().rotationEffect(Angle(degrees: -45))
        }
    }
}

struct ForwardLeftButton: View {
    var carData: CarData
    var body: some View {
        Button(action: {
            print("Pressed")
            self.carData.changeCommand(command: 3)
        }){
            LeftImage().rotationEffect(Angle(degrees: 45))
        }
    }
}

struct BackwardButton: View {
    var carData: CarData
    var body: some View {
        Button(action: {
            print("Pressed")
            self.carData.changeCommand(command: 4)
        }){
            BackwardImage()
        }
    }
}

struct BackwardRightButton: View {
    var carData: CarData
    var body: some View {
        Button(action: {
            print("Pressed")
            self.carData.changeCommand(command: 5)
        }){
            RightImage().rotationEffect(Angle(degrees: 45))
        }
    }
}

struct BackwardLeftButton: View {
    var carData: CarData
    var body: some View {
        Button(action: {
            print("Pressed")
            self.carData.changeCommand(command: 6)
        }){
            LeftImage().rotationEffect(Angle(degrees: -45))
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
            HStack {
                ForwardLeftButton(carData: carData)
                ForwardButton(carData: carData)
                ForwardRightButton(carData: carData)
            }
            StopButton(carData: carData)
            HStack {
                BackwardLeftButton(carData: carData)
                BackwardButton(carData: carData)
                BackwardRightButton(carData: carData)
            }
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
