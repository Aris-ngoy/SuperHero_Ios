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
                        .foregroundColor(.secondary)
                    Text(subTitle)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text(extraText.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                Spacer()
            }
            .padding()
            .background(Color.black.opacity(0.7))
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}
