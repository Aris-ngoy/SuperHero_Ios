//
//  HomeView.swift
//  SuperHero
//
//  Created by HR on 2020/02/22.
//  Copyright © 2020 HR. All rights reserved.
//

import SwiftUI

struct SearchView:View{
    
    @State private var searchText : String = ""
    
    @ObservedObject var Api = DataApi()
    
    var body: some View{
            VStack {
                SearchBar(searchText: $searchText)
                Button(action:{
                    self.Api.SearchByName(name: self.searchText)
                })
                {
                    Text("SEARCH")
                    .accentColor(Color.white)
                    .padding()
                    .frame(width: 340, height: 40, alignment: .center)
                    .background(Color.purple)
                }
                
                List(Api.SuperHeroList, id: \.id) { item in
                       VStack(alignment: .leading) {
                        NavigationLink(destination: DetailView(SuperHero: item)){
                            CardView(title: item.name, subTitle: item.biography.fullname, extraText: item.biography.publisher, imageUrl: item.image.url)
                        }
                    }
                }
            }.navigationBarTitle("Search",displayMode: .inline)
        }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
