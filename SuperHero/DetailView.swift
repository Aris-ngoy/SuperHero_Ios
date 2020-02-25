//
//  DetailView.swift
//  SuperHero
//
//  Created by HR on 2020/02/22.
//  Copyright © 2020 HR. All rights reserved.
//

struct Data{
    var id = UUID()
    var title: String
    var value: String
}

import SwiftUI

struct DetailView: View{
    
    var SuperHero: SuperHeroModel
    
    @State private var AppearanceList = [Data]()
        
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
                            .multilineTextAlignment(.leading)
                            .frame(width: 200,alignment: .leading)
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
               
                Text("APPEARANCE")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .lineLimit(3)
                
                ForEach(AppearanceList, id: \.id) { result in
                    VStack{
                        HStack{
                            Text(result.title.uppercased())
                             .font(.headline)
                             .foregroundColor(.primary)
                            Spacer()
                            Text(result.value)
                             .font(.headline)
                             .foregroundColor(.secondary)
                        }
                        Divider()
                    }.padding(.vertical)
                }
            }
                
                
            }.navigationBarTitle(SuperHero.name)
            .padding()
            .onAppear(){
                let app = Mirror(reflecting: self.SuperHero.appearance)
                for (label, value) in app.children {
                    if("\(value)" != "null" || "\(value)" != "-"){
                        let valData = Data(title: label!, value: "\(value)")
                        self.AppearanceList.append(valData)
                        print(self.AppearanceList.count)
                    }
                }
            }
        }
    }

