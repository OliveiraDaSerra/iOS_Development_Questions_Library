//
//  LoadingScreenVC.swift
//  Question_Library
//
//  Created by Nuno Oliveira on 09/07/2018.
//  Copyright © 2018 Nuno Oliveira. All rights reserved.
//

import UIKit
import Alamofire

class LoadingScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: Web requests
    func getServerHealthStatus() -> Void {
        
    }
}