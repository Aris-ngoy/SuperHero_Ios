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
    @State private var showingAlert = false
    @State private var IsLoading : Bool = false
    
    @ObservedObject var Api = DataApi()
    
    var body: some View{
            VStack {
                SearchBar(text: $searchText)
                 .padding(.horizontal)
                Button(action:{
                    if self.searchText.isEmpty{
                        self.showingAlert = true
                    }else{
                        self.Api.SearchByName(name: self.searchText)
                    }
                })
                {
                    VStack{
                        Text(Api.IsLoading == true ? "Loading ..." : "SEARCH")
                         .accentColor(Color.white)
                         .frame(minWidth: 0,maxWidth: .infinity, minHeight: 0, maxHeight: 50.0)
                        .background(Color.purple)
                    }.padding(.horizontal)
                    
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Warning !!!"), message: Text("Please Type your SuperHero's name to continue ..."), dismissButton: .default(Text("continue")))
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
