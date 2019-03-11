//
//  TrackingManager.swift
//  Broadcaster
//
//  Created by Andrey Kyashkin on 3/10/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import CoreBluetooth
import CoreLocation

enum BroadcastStatus {
    case undefined
    case enabled
    case disabled
}

// Made it look similar to LocationManager in a way of multiple instances existence at once

class TrackingManager: NSObject {
    
    override init() {
        super.init()
        
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
    
    private var peripheralManager: CBPeripheralManager!
    
    func createDeviceBeaconRegion() -> CLBeaconRegion {
        return CLBeaconRegion(proximityUUID: UUID(uuidString: Constants.proximityUUID)!,
                              major: CLBeaconMajorValue(Constants.major),
                              minor: CLBeaconMinorValue(Constants.minor),
                              identifier: Constants.beaconID)
    }
    
    func advertiseDevice(region: CLBeaconRegion) {
        let peripheralData = region.peripheralData(withMeasuredPower: nil)
        peripheralManager.startAdvertising(((peripheralData as NSDictionary) as! [String : Any]))
    }
    
    func startAdvertising() {
        advertiseDevice(region: createDeviceBeaconRegion())
    }
    
    func stopAdvertising() {
        peripheralManager.stopAdvertising()
    }
    
}

extension TrackingManager: CBPeripheralManagerDelegate {
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .poweredOn:
            startAdvertising()
            NotificationCenter.default.post(name: .broadcastStatusUpdateNotificationName, object: BroadcastStatus.enabled)
        case .poweredOff:
            stopAdvertising()
            NotificationCenter.default.post(name: .broadcastStatusUpdateNotificationName, object: BroadcastStatus.disabled)
        default:
            NotificationCenter.default.post(name: .broadcastStatusUpdateNotificationName, object: BroadcastStatus.undefined)
        }
    }
    
}
