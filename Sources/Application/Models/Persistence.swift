//
//  Persistence.swift
//  Application
//
//  Created by Gabriel Rodrigues Gazal Rocha on 26/04/20.
//

import Foundation
import SwiftKueryORM
import SwiftKueryPostgreSQL
import LoggerAPI

class Persistece{
    
    static func setUp(){
        let pool = PostgreSQLConnection.createPool(host: ProcessInfo.processInfo.environment["DBHOST"] ?? "localhost", port: 5432, options: [.databaseName("reflections"),.userName(ProcessInfo.processInfo.environment["DBUSER"] ?? "postgres"),.password(ProcessInfo.processInfo.environment["DBPASSWORD"] ?? "ni")], poolOptions: ConnectionPoolOptions.init(initialCapacity: 10, maxCapacity: 50, timeout: 10000));
        Database.default = Database(pool)
        
        do{
            try Reflection.createTableSync()
                
        }catch let error{
            if let requestError = error as? RequestError, requestError.rawValue ==  RequestError.ormQueryError.rawValue{
                Log.info("\(Reflection.tableName) already created")
            }else{
                Log.error(error as! String)
            }
            
        }
    }
}
