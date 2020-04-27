//
//  GetRoutes.swift
//  Application
//
//  Created by Gabriel Rodrigues Gazal Rocha on 23/04/20.
//

import Foundation
import LoggerAPI
import KituraContracts

func initializeGetRoutes(app: App){
    app.router.get("/hello"){
        request, response, next in
        
        response.send("Eae kiturinha")
        next()
    }
}
