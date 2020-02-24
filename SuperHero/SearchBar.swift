//
//  SearchBar.swift
//  SuperHero
//
//  Created by HR on 2020/02/22.
//  Copyright © 2020 HR. All rights reserved.
//

import SwiftUI

struct SearchBar : View {
    
    @Binding var searchText: String
    
    var body: some View {
        VStack{
            HStack {
                Image("round_search_black_48pt_1x")
                    .resizable()
                    .frame(width: 25.0, height:25.0, alignment: .center)
                TextField(" Enter some text", text: $searchText)
                Button(action:{
                    print("clear")
                })
                {
                    Image("round_clear_black_48pt_1x")
                    .resizable()
                    .frame(width: 25.0, height:25.0, alignment: .center)
                }.opacity(0.0)
            }
            .padding(10)
            .background(Color.white)
        }.padding()        
    }
}
