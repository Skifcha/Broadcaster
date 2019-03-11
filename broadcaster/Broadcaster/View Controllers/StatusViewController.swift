//
//  StatusViewController.swift
//  Broadcaster
//
//  Created by Andrey Kyashkin on 3/10/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: .broadcastStatusUpdateNotificationName, object: nil, queue: .main) { [weak self] (notification) in
            if let status = notification.object as? BroadcastStatus {
                switch status {
                case .enabled:
                    self?.statusLabel.text = "Broadcast is on 👍"
                case .disabled:
                    self?.statusLabel.text = "Broadcast is off 🙊"
                case .undefined:
                    self?.statusLabel.text = "Undefined status 🤔"
                }
            }
        }
    }
    
    

}

