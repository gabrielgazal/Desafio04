//
//  ReflectionRoute.swift
//  Application
//
//  Created by Gabriel Rodrigues Gazal Rocha on 23/04/20.
//

import Foundation
import LoggerAPI
import Kitura
import KituraContracts


func initializeReflectionRoutes(app:App){
    app.router.post("/reflections",handler: addReflection)
    app.router.get("/reflections",handler: getReflection)
    app.router.delete("/reflections",handler: deleteReflection)
    app.router.put("/reflections",handler: modifyReflection)
    app.router.get("/reflections", handler: getOneReflection)
}

func modifyReflection(id: String, reflection: Reflection,completion: @escaping(Reflection?, RequestError?) -> Void){
    
    reflection.update(id: id, completion)
}
func getOneReflection(id:String, completion:@escaping(Reflection?, RequestError?) -> Void){
    Reflection.find(id: id, completion)
}

func addReflection(entry:Reflection,completion: @escaping(Reflection?, RequestError?) -> Void){
    var storeReflection = entry
    storeReflection.id = UUID().uuidString
    storeReflection.save(completion)
}

//Desafio 4
func getReflection(params: ReflectionParams?, completion: @escaping([Reflection]?, RequestError?) -> Void){
    
    Reflection.findAll(matching: params, completion)
}
func convertePraDate(string: String!) -> Date{
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "ddMMyyyy"
    let date = dateFormatter.date(from: string)
    
    return date!
}
func convertePraDouble(string: String) -> Double{
    let formatter = NumberFormatter()
    formatter.locale = Locale.current
    formatter.numberStyle = .decimal
    let number: Double = formatter.number(from: string) as! Double
    
    return number
}
//###########################

func deleteReflection(id: String, completion: @escaping(RequestError?) -> Void){
    Reflection.delete(id: id, completion)
}

