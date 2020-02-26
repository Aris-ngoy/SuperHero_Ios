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
    @State private var BiographyList = [Data]()
    @State private var PowersetsList = [Data]()
    @State private var WorkList = [Data]()
    @State private var ConnectionList = [Data]()
    
    func SetBiographies(){
        let app = Mirror(reflecting: self.SuperHero.biography)
       for (label, value) in app.children {
           let valData = Data(title: label!, value: "\(value)")
           if valData.value != "null"{
               self.BiographyList.append(valData)
           }
       }
    }
    
    func SetAppearance(){
        let app = Mirror(reflecting: self.SuperHero.appearance)
        for (label, value) in app.children {
            let valData = Data(title: label!, value: "\(value)")
            if valData.value != "null"{
                self.AppearanceList.append(valData)
            }
        }
    }
    
    func SetPowerSets(){
        let app = Mirror(reflecting: self.SuperHero.powerstats)
        for (label, value) in app.children {
            let valData = Data(title: label!, value: "\(value)")
            if valData.value != "null"{
                self.PowersetsList.append(valData)
            }
        }
    }
    
    func SetWork(){
      let app = Mirror(reflecting: self.SuperHero.work)
        for (label, value) in app.children {
            let valData = Data(title: label!, value: "\(value)")
            if valData.value != "null"{
                self.WorkList.append(valData)
            }
        }
    }
    
    func SetConnections(){
        let app = Mirror(reflecting: self.SuperHero.connections)
        for (label, value) in app.children {
            let valData = Data(title: label!, value: "\(value)")
            if valData.value != "null"{
                self.ConnectionList.append(valData)
            }
        }
    }
        
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
               
                DetailViewItem(
                ListItens: PowersetsList,
                title: "POWERSETS")
                
                DetailViewItem(
                ListItens: BiographyList,
                title: "BIOGRAPHY")
                
                }
                
                DetailViewItem(
                ListItens: AppearanceList,
                title: "APPEARANCE")
            
                DetailViewItem(
                ListItens: WorkList,
                title: "WORK")
            
                DetailViewItem(
                ListItens: ConnectionList,
                title: "CONNECTIONS")
                
                
            }.navigationBarTitle(SuperHero.name)
            .padding()
            .onAppear(){
                self.SetPowerSets()
                self.SetAppearance()
                self.SetBiographies()
            }
        }
    }


struct DetailViewItem:View {
    
    var ListItens:[Data]
    var title:String
    
    var body : some View{
        VStack(alignment:.leading){
            Text(title)
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(.primary)
            .lineLimit(3)
            .padding()
            
            ForEach(ListItens, id: \.id) { result in
                VStack{
                    HStack{
                        Text(result.title.uppercased())
                         .font(.headline)
                         .foregroundColor(.secondary)
                        Spacer()
                        Text(result.value)
                         .font(.headline)
                         .foregroundColor(.secondary)
                         .multilineTextAlignment(.trailing)
                         .frame(width: 150,alignment: .trailing)
                    }
                    Divider()
                }.padding(.vertical)
            }
        }
    }
}
