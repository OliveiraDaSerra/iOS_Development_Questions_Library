//
//  LoadingScreenVC.swift
//  Question_Library
//
//  Created by Nuno Oliveira on 09/07/2018.
//  Copyright © 2018 Nuno Oliveira. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoadingScreenVC : UIViewController {

    // MARK: - Properties
    @IBOutlet weak var statusLabel  : UILabel!
    @IBOutlet weak var reloadButton : UIButton!
    

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.statusLabel.text = "Checking HEALTH WS status..."
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);

        // It HIDES the NAVIGATION BAR for this View Controller
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // It checks if the server is OK or not
        getServerHealthStatus();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


    // MARK: Web requests
    func getServerHealthStatus() -> Void {

        let urlPath = Constants.WebRequests.UrlBaseEndpoint + Constants.WebRequests.HealthSuffix

        Alamofire.request( urlPath ).responseJSON { (response) in
            print(response)

            if response.result.isSuccess {
//                let responseJSON = response.result.value

//                self.performSegue(withIdentifier: Constants.StoryboardSegueIDs.QuestionList, sender: nil)

                let storyboard = UIStoryboard(name: Constants.StoryboardIDs.MainStoryboard, bundle: nil)
                let questionListVC = storyboard.instantiateViewController(withIdentifier: Constants.StoryboardViewControllerIDs.QuestionList) as UIViewController
                self.navigationController?.pushViewController(questionListVC, animated: true)
            }
        }
    }
}
