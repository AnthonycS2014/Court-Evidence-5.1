//
//  PredicateList.swift
//  Court Evidence Predicates
//
//  Created by Anthony Shorter on 5/20/20.
//  Copyright © 2020 Anthony Shorter. All rights reserved.
//

import SwiftUI

struct PredicateList: View {
    var body: some View {
        NavigationView {
            List(predicateData) { predicates in
                NavigationLink(destination: PredicateDetail(predicates: predicates, note: (""))) { PredicateRow(predicates: predicates)
                    }.background(Color.yellow).cornerRadius(10)
                }.navigationBarTitle(Text("Predicates List"))
        }
}
}
struct PredicateList_Previews: PreviewProvider {
    static var previews: some View {
        PredicateList()
    }
}
