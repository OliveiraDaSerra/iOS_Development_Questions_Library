//
//  Constants.swift
//  Question_Library
//
//  Created by Nuno Oliveira on 09/07/2018.
//  Copyright © 2018 Nuno Oliveira. All rights reserved.
//

import Foundation

struct Constants {
    // Constanst related with WEB REQUESTS
    struct WebRequests {
        static let UrlBaseEndpoint = "https://private-anon-3fbb65c8be-blissrecruitmentapi.apiary-mock.com/"
        static let HealthSuffix    = "health"
        static let QuestionsSuffix = "questions"

        struct parameters {
            static let limit  = "limit="
            static let offset = "offset="
            static let filter = "filter="
        }
    }

    struct StoryboardIDs {
        static let MainStoryboard = "Main"
    }
    struct StoryboardViewControllerIDs {
        static let NavigationController         = "NavCtrl"
        static let LoadingScreen                = "LoadingScreenVC"
        static let QuestionList                 = "QuestionListVC"
        static let NoNetworkConnectionAvailable = "No_Network_Connection_Available"
    }

    struct StoryboardSegueIDs {
        static let QuestionList = "GoToQuestionList"
    }

    struct Connectivity {
        static let ReferenceEndpoint = "http://www.google.pt"
    }
}
