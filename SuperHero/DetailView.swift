//
//  DetailView.swift
//  SuperHero
//
//  Created by HR on 2020/02/22.
//  Copyright © 2020 HR. All rights reserved.
//

struct Data{
    var name: String
    var id: String
}

import SwiftUI

struct DetailView: View{
    
    var SuperHero: SuperHeroModel
        
    var body: some View{
        ScrollView{
            VStack{
                HStack{
                    NetImage(url: SuperHero.image.url, heightMax: 300.0)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                    )
                }
                
                HStack{
                    VStack(alignment: .leading) {
                        
                        Text(SuperHero.name)
                            .font(.headline)
                            .foregroundColor(.secondary)

                        Text(SuperHero.biography.fullname)
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        Text(SuperHero.biography.publisher.uppercased())
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.bottom)
                        
                        Text(SuperHero.biography.placeOfBirth)
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                            .frame(width: 180,alignment: .leading)
                    }
                    .layoutPriority(100)
                    Divider()
                    VStack(alignment: .leading){
                        Text("HEIGHT \n" + SuperHero.appearance.height[1])
                        .font(.headline)
                        .foregroundColor(.secondary)
                        Text("WIDTH \n" + SuperHero.appearance.weight[1])
                        .font(.headline)
                        .foregroundColor(.secondary)
                    }
                }
               
            
                
                
            }.navigationBarTitle(SuperHero.name)
            .padding()
            
        }
    }
}
