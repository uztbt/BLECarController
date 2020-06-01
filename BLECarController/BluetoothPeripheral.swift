//
//  BluetoothPeripheral.swift
//  BLECarController
//
//  Created by tabatay89 on 2020/05/12.
//

import CoreBluetooth

class BluetoothPeripheral: NSObject {
    public static let serviceUUID = CBUUID.init(string: "49662679-5858-4a57-8253-3b29f954643a")
    public static let steeringCharacteristicUUID = CBUUID.init(string: "dbba9389-a24f-49f4-9063-8bc7e479bc35")
    public static let motorCharacteristicUUID = CBUUID.init(string: "43a5be68-47a6-4bf7-a903-89405a0fc603")
}
