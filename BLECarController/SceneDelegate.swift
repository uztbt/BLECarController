//
//  SceneDelegate.swift
//  BLECarController
//
//  Created by tabatay89 on 2020/05/11.
//

import UIKit
import SwiftUI
import CoreBluetooth

class SceneDelegate: UIResponder, UIWindowSceneDelegate,
    CBPeripheralDelegate,
    CBCentralManagerDelegate
{
    // CB Properties
    private var cbCentralManager: CBCentralManager!
    private var cbPeripheral: CBPeripheral!
    private var cbSteeringCharacteristic: CBCharacteristic!
    private var cbMotorCharacteristic: CBCharacteristic!
    private var carData: CarData!

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("CB central manager's state was updated")
        guard central.state == .poweredOn else {
            print("CB central manager is powered off")
            return
        }
        print("CB central manager is scanning for", BluetoothPeripheral.serviceUUID)
        cbCentralManager.scanForPeripherals(withServices: [BluetoothPeripheral.serviceUUID], options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {

        print("centralManager didDiscover ", peripheral)
        self.cbCentralManager.stopScan()
        // Copy the peripheral instance
        self.cbPeripheral = peripheral
        self.cbPeripheral.delegate = self
        
        // Connect!
        self.cbCentralManager.connect(self.cbPeripheral, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        guard peripheral == self.cbPeripheral else {
            print("Connected to a different peripheral than the intended one")
            return
        }
        print("Connected to the intended peripheral")
        carData.carName = peripheral.name!
        carData.connected = true
        peripheral.discoverServices([BluetoothPeripheral.serviceUUID])
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let services = peripheral.services {
            for service in services {
                if service.uuid == BluetoothPeripheral.serviceUUID {
                    print("The service of BluetoothPeripheral found")
                    peripheral.discoverCharacteristics([
                        BluetoothPeripheral.steeringCharacteristicUUID,
                        BluetoothPeripheral.motorCharacteristicUUID
                    ], for: service)
                    return
                }
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                switch characteristic.uuid {
                case BluetoothPeripheral.steeringCharacteristicUUID:
                    print("Steering characteristic found: ", characteristic)
                    cbSteeringCharacteristic = characteristic
                case BluetoothPeripheral.motorCharacteristicUUID:
                    print("Motor characteristic found: ", characteristic)
                    cbMotorCharacteristic = characteristic
                default:
                    continue
                }
            }
        }
    }

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        print("cbCentralManager set")
        cbCentralManager = CBCentralManager(delegate: self, queue: nil)
        carData = CarData(sendSteeringCommand: { (steering) in
            print("Send steering " + String(steering))
            self.cbPeripheral.writeValue(Data([steering]), for: self.cbSteeringCharacteristic, type: .withResponse)
        }, sendMotorCommand: { (motor) in
            print("Send Motor " + String(motor))
            self.cbPeripheral.writeValue(Data([motor]), for: self.cbMotorCharacteristic, type: .withResponse)
        })

        // Create the SwifsendCommand: <#(Int) -> Void#>tUI view that provides the window contents.
        let contentView = ContentView().environmentObject(carData)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


struct SceneDelegate_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
