//
//  BluetoothPeripheral.swift
//  BLECarController
//
//  Created by tabatay89 on 2020/05/12.
//

import CoreBluetooth

class BluetoothPeripheral: NSObject {
    public static let serviceUUID = CBUUID.init(string: "8d73daf8-208b-432d-bb8f-631e11a37a56")
    public static let characteristicUUID = CBUUID.init(string: "88e7e723-b754-4394-9ef5-a6b121e8dfce")
}
