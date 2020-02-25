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
    
    @Published var IsLoading = false
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
        
        IsLoading = true
        
        let session = URLSession.shared
        
        let url = URL(string:  "https://superheroapi.com/api/2881871825189324/search/\(name)")!
        
        let task = session.dataTask(with: url) {(data, response, error) in
            
            do{
                if data != nil{
                    let decoded = try JSONDecoder().decode(ListSuperHeroModel.self, from: data!)
                    
                    DispatchQueue.main.async{
                        self.SuperHeroList = decoded.results
                        self.IsLoading = false
                    }
                }
                
                
            }catch let DecodingError.dataCorrupted(context) {
                print(context)
                self.IsLoading = false
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                self.IsLoading = false
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                self.IsLoading = false
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                self.IsLoading = false
            } catch {
                print("error: ", error)
                self.IsLoading = false
            }
                
        }
        task.resume()
    }

    
}
