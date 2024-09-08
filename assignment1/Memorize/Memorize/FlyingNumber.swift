//
//  FlyingNumber.swift
//  Memorize
//
//  Created by Anqi Wu on 9/8/24.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    
    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
