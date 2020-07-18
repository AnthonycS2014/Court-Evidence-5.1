//
//  CheckListView.swift
//  Court Evidence Predicates
//
//  Created by Anthony Shorter on 6/25/20.
//  Copyright © 2020 Anthony Shorter. All rights reserved.
//

import SwiftUI

struct CheckView: View {
    @State var isChecked:Bool = false
 //   @State private var isShareSheetShowing = false
    
    var title:String
    func toggle(){isChecked = !isChecked}
    var body: some View {
        Button(action: toggle){
            HStack{
                Image(systemName: isChecked ? "checkmark.square": "square")
                Text(title)
               }
        
            }
        }
    
    }

#if DEBUG
struct CheckView_Previews: PreviewProvider {
    static var previews: some View {
        CheckView(title: "Title")
    }
}
#endif
