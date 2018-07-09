//
//  NetworkManager.swift
//  Question_Library
//
//  Created by Nuno Oliveira on 09/07/2018.
//  Copyright © 2018 Nuno Oliveira. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    //shared instance
    static let shared = NetworkManager()
    
    let reachabilityManager = NetworkReachabilityManager()
    
    func startNetworkReachabilityObserver() {

        // start listening
        reachabilityManager?.startListening()

        reachabilityManager?.listener = { status in
            switch status {
                
            case .notReachable:
                print("The network is not reachable")

                let storyboard = UIStoryboard(name: Constants.StoryboardIDs.MainStoryboard, bundle: nil)
//                let navCtrl = storyboard.instantiateViewController(withIdentifier: Constants.StoryboardViewControllerIDs.NavigationController) as! UINavigationController

                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let rootVC = appDelegate.window!.rootViewController as! UINavigationController

                if !( rootVC.topViewController is NoConnectionVC ) {
                    // It will DISABLE the left swipe gesture
                    rootVC.interactivePopGestureRecognizer?.isEnabled = false

                    let noConnectionVC = storyboard.instantiateViewController(withIdentifier: Constants.StoryboardViewControllerIDs.NoNetworkConnectionAvailable) as UIViewController
                    
                    rootVC.pushViewController(noConnectionVC, animated: true)
                }

            case .unknown :
                print("It is unknown whether the network is reachable")
                
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable over the WiFi connection")

                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let rootVC = appDelegate.window!.rootViewController as! UINavigationController

                if ( rootVC.topViewController is NoConnectionVC ) {
                    // It will ENABLE the left swipe gesture
                    rootVC.interactivePopGestureRecognizer?.isEnabled = true

                    rootVC.popViewController(animated: true)
                }
                
            case .reachable(.wwan):
                print("The network is reachable over the WWAN connection")
                
            }
        }
    }

    func stopNetworkReachabilityObserver() {
        reachabilityManager?.stopListening()
    }
}
