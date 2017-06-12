//
//  AppDelegate.swift
//  RWDevCon
//
//  Created by Ailson Cordeiro Filho on 09/06/17.
//  Copyright © 2017 Ailson Cordeiro Filho. All rights reserved.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {
    var window: UIWindow?
    
    var appController : TVApplicationController?
    static let TVBaseUrl = "http://localhost:8080/"
    static let TVBoostUrl = "\(AppDelegate.TVBaseUrl)js/application.js"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let appControllerContext = TVApplicationControllerContext()
        
        guard let javaScriptURL = URL(string: AppDelegate.TVBoostUrl) else { fatalError("unable to create NSURL") }
        appControllerContext.javaScriptApplicationURL = javaScriptURL
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseUrl
        
        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
        return true
    }
    
}

