//
//  Api.swift
//  SuperHero
//
//  Created by HR on 2020/02/22.
//  Copyright © 2020 HR. All rights reserved.
//

import Foundation
import SwiftUI

public class DataApi: ObservableObject{
            
    @Published var SuperHeroList = [SuperHeroModel]()
        
    var base_url:String = "https://superheroapi.com/api/2881871825189324/"
    
    func GetSuperHero(id:String){
        let session = URLSession.shared
        let url = URL(string: base_url + "\(id)")!
        let task = session.dataTask(with: url) { data, response, error in
            print(data!)
            
            if(error != nil){
                print(error!.localizedDescription)
            }
        }
        task.resume()
    }
    
    func SearchByName(name:String){
        
        let session = URLSession.shared
        
        let url = URL(string:  "https://superheroapi.com/api/2881871825189324/search/batman")!
        
        let task = session.dataTask(with: url) {(data, response, error) in
            
            do{
                if data != nil{
                    let decoded = try JSONDecoder().decode(ListSuperHeroModel.self, from: data!)
                    
                    DispatchQueue.main.async{
                        self.SuperHeroList = decoded.results
                    }
                }
                
            }catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
                
        }
        task.resume()
    }

    
}
