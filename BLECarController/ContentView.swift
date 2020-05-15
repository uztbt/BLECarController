//
//  ContentView.swift
//  BLECarController
//
//  Created by tabatay89 on 2020/05/11.
//

import SwiftUI

var centerColor = Color(red: 0x96/255, green: 0xde/255, blue: 0xda/255)
var endColor = Color(red: 0x50/255, green: 0xc9/255, blue: 0xc3/255)

struct ContentView: View {
    @EnvironmentObject var carData: CarData
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [
                centerColor, endColor
            ]), center: .center, startRadius: 2, endRadius: 650)
            
            VStack {
                VStack(alignment: .leading){
                    Text(carData.carName)
                        .font(.title)
                        .foregroundColor(Color.white)
                    HStack {
                        Text("Connection Status:")
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                        Text(carData.connected ?"connected":"connecting").font(.subheadline
                        )
                        .foregroundColor(Color.white)
                    }
                }
                .padding()
                ControlButtons(carData: carData)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CarData{(command: UInt8) -> Void in
            print(command)
        })
    }
}
