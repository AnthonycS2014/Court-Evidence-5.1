//
//  PredicateRow.swift
//  Court Evidence Predicates
//
//  Created by Anthony Shorter on 5/20/20.
//  Copyright © 2020 Anthony Shorter. All rights reserved.
//

import SwiftUI

struct PredicateRow: View {
    
    var predicates: Predicate
    var body: some View {
        HStack {
            Text(predicates.name)
            .bold()
            .font(.callout)
            .padding()
        }.frame(minHeight: 0, maxHeight: 90)
        // adjusts frame height for two lines and eliminate ...
    }
}

struct PredicateRow_Previews: PreviewProvider {
    static var previews: some View {
        PredicateRow(predicates: predicateData[0])
            .previewLayout(.fixed(width: 320, height: 30))
    }
}
