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
    @Published var command = 0
    var sendCommand: (UInt8) -> Void
    
    init(sendCommand: @escaping (UInt8) -> Void) {
        self.sendCommand = sendCommand
    }
    
    func changeCommand(command: UInt8) {
        sendCommand(command)
    }
}
