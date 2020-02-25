//
//  CardView.swift
//  SuperHero
//
//  Created by HR on 2020/02/24.
//  Copyright © 2020 HR. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    var title:String
    var subTitle:String
    var extraText:String
    var imageUrl:String
    
    var body: some View {
        VStack {
            NetImage(url: imageUrl)
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text(subTitle)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .lineLimit(3)
                    Text(extraText.uppercased())
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .layoutPriority(100)
                Spacer()
            }
            .padding()
            .background(Color.black.opacity(0.8))
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}
