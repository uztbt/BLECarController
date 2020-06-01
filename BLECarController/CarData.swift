//
//  CarDarta.swift
//  BLECarController
//
//  Created by tabatay89 on 2020/05/16.
//

import Foundation

final class CarData: ObservableObject {
    @Published var carName = "-"
    @Published var connected = false
    @Published var steeringCommand = 0
    @Published var motorCommand = 0
    
    var sendSteeringCommand: (UInt8) -> Void
    var sendMotorCommand: (UInt8) -> Void
    
    init(sendSteeringCommand: @escaping (UInt8) -> Void, sendMotorCommand: @escaping (UInt8) -> Void) {
        self.sendSteeringCommand = sendSteeringCommand
        self.sendMotorCommand = sendMotorCommand
    }
    
    func changeSteeringCommand(command: UInt8) {
        sendSteeringCommand(command)
    }
    
    func changeMotorCommand(command: UInt8) {
        sendMotorCommand(command)
    }
}
