//
//  SuperHeroModel.swift
//  SuperHero
//
//  Created by HR on 2020/02/23.
//  Copyright © 2020 HR. All rights reserved.
//

import Foundation


struct ImageModel: Decodable{
    var url:String
}

struct Connections: Decodable{
    var groupAffiliation: String
    var relatives: String
    
    enum CodingKeys: String, CodingKey
    {
        case groupAffiliation = "group-affiliation"
        case relatives

    }
}

struct Work: Decodable{
    var occupation: String
    var base: String
}


struct Appearance: Decodable{
    var gender: String
    var race: String
    var height: [String]
    var weight:[String]
    var eyeColor:String
    var hairColor:String
    
    enum CodingKeys: String, CodingKey
    {
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
        case gender
        case race
        case height
        case weight
    }
}


struct Biography: Decodable {
    var fullname:String
    var alterEgos:String
    var aliases: [String]
    var placeOfBirth:String
    var firstAppearance:String
    var publisher:String
    var alignment:String
    
    enum CodingKeys: String, CodingKey
    {
        case alterEgos = "alter-egos"
        case fullname = "full-name"
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case aliases
        case publisher
        case alignment
    }

}

struct Powerstats: Decodable{
    var intelligence: String
    var strength: String
    var speed: String
    var durability: String
    var power: String
    var combat: String
}


struct SuperHeroModel: Decodable {
    var id:String
    var name: String
    //var response: String
    var powerstats : Powerstats
    var biography: Biography
    var appearance: Appearance
    var work: Work
    var connections: Connections
    var image: ImageModel
}


struct ListSuperHeroModel: Decodable{
    var response: String
    var resultsFor:String
    var results : [SuperHeroModel]
    
    enum CodingKeys: String, CodingKey
    {
        case resultsFor = "results-for"
        case response
        case results
    }
}
