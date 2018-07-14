//
//  ServiceClass.swift
//  headtTest
//
//  Created by Jay Kumar on 7/10/18.
//  Copyright © 2018 Jay Kumar. All rights reserved.
//

import UIKit

class ServiceClass: NSObject {
    class func getShoping(_ completion: @escaping (NSArray,NSArray) -> ()){
        guard let url = URL.init(string: "https://stark-spire-93433.herokuapp.com/json") else{return}
        let task = URLSession.shared.dataTask(with: url){(data,response, error) in
            guard let data = data else{return}
            do{
                if let result = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary{
                    let catResult = result["categories"] as! NSArray
                    let rankResult = result["rankings"] as! NSArray
                    //print(catResult,rankResult)
                    completion(catResult,rankResult)
                }
                
            }catch {
                //Catch Error here...
            }
        }
        task.resume()
        
    }

}
