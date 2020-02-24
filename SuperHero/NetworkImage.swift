//
//  NetworkImage.swift
//  SuperHero
//
//  Created by HR on 2020/02/24.
//  Copyright © 2020 HR. All rights reserved.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct NetImage: View{
    
    var url: String
    var heightMax : CGFloat = 200
    
    var body: some View{
        WebImage(url: URL(string: url))
        .onSuccess { image, cacheType in
            // Success
        }
        .resizable() // Resizable like SwiftUI.Image
        .placeholder(Image(systemName: "photo")) // Placeholder Image
        // Supports ViewBuilder as well
        .placeholder {
            Rectangle().foregroundColor(.gray)
        }
        .indicator(.activity) // Activity Indicator
        .animation(.easeInOut(duration: 0.5)) // Animation Duration
        .transition(.fade) // Fade Transition
        .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: heightMax)
    }
}
