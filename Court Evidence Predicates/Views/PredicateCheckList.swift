//
//  PredicateCheckList.swift
//  Court Evidence Predicates
//
//  Created by Anthony Shorter on 6/25/20.
//  Copyright © 2020 Anthony Shorter. All rights reserved.
//

import SwiftUI

struct PredicateCheckList: View {
    @State var predicates: Predicate
    
    var body: some View {
    
    VStack{
    Text(predicates.name)
        .font(.largeTitle)
        CheckView(isChecked: false, title: predicates.name)
           .font(.largeTitle)
        
    }
}

struct PredicateCheckList_Previews: PreviewProvider {
    static var previews: some View {
        PredicateCheckList(predicates: Predicate(id: 1, name: "Test", text: "", explanation: "", checklist: []))
    }
}
}
