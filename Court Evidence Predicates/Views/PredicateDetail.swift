//
//  PredicateDetail.swift
//  Court Evidence Predicates
//
//  Created by Anthony Shorter on 5/20/20.
//  Copyright © 2020 Anthony Shorter. All rights reserved.
//

import SwiftUI

struct SheetView: View {
    @Binding var showSheetView: Bool
    
    var body: some View {
        NavigationView {
            Text("Sheet View content")
            .navigationBarTitle(Text("Sheet View"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showSheetView = false
                }) {
                    Text("Done").bold()
                })
        }
    }
}


struct CheckListView: View {
    
    @State var isChecked:Bool = false
    var title:String
    var checklist:String
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
    
struct PredicateDetail: View {
    
    @State private var isShareSheetShowing = false

    var predicates: Predicate
    
    var note: String
    
    @State private var message = ""
    @State private var textStyle = UIFont.TextStyle.body
    
    @State var showSheetView = false
    @State var showSheetView2 = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ScrollView {
            VStack{
                Button(action: shareButton) {
                                Image(systemName: "square.and.arrow.up")
                                .font(.body)
                                .padding(.leading, 340)
                    // moves image to right
                    Spacer(minLength: 0)
                    .padding()
            }
            }
        VStack{
            
            Text(predicates.name)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
            Text(predicates.text)
                .padding()
                .font(.body)
                .foregroundColor(.white)
                .font(Font.body)
                .fixedSize(horizontal: false, vertical: true)
               Spacer()
            }.background(Color.gray)
            .padding()
            HStack {
            Button(action: {
                self.showSheetView2.toggle()
            })
            {
                Text("⬅️ Commentary")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .padding()
            }.sheet(isPresented: self.$showSheetView2) {
            Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    self.showSheetView2 = false
                }) {
                    Text("🔙")
                        .foregroundColor(.secondary)
                        // Adds padding to all sides
                        .padding()
                       //Moves back arrow to the left
                       Spacer(minLength: 0)
                }
                Group{
                Text(self.predicates.name)
                .font(.headline)
                Text(self.predicates.explanation!)
                    .padding()
                    // adjusts height for text in landcape view
                    .fixedSize(horizontal: false, vertical: true)
                    // Moves text to top
                    Spacer(minLength: 0)
                }
            }.padding()
                Button(action: {
                        self.showSheetView.toggle()
            
                    }) {
                Text("Check List ➡️")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .padding()
                                  }.sheet(isPresented: $showSheetView) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    self.showSheetView = false
                                      }) {
                Text("🔙")
                    .foregroundColor(.secondary)
                    // Adds padding to all sides
                    .padding()
                    //Moves back arrow to the left
                    Spacer(minLength: 0)
                                      }
                                    VStack {
                                    NavigationLink(destination: PredicateCheckList(predicates: self.predicates)){
                                        Text(self.predicates.name)
                                        .font(.headline)
                                        }
                                            HStack{
                                                VStack(alignment: .center, spacing: 05){
                                        ForEach(self.predicates.checklist.indices) { i in
                                            HStack{
                                                CheckView( title: "").padding(.leading)
                                                Text("\(i+1). \(self.predicates.checklist[i])").padding(.trailing, 10)
                                               
                                                // adjusts height for text in landcape view
                                                .fixedSize(horizontal: false, vertical: true)
                                                // Moves text to top
                                                Spacer(minLength: 0)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
    
    func shareButton() {
        let items = [predicates.text]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController?
        .present(ac, animated: true, completion: nil)
    }
}
struct PredicateDetail_Previews: PreviewProvider {
    static var previews: some View {
         Text("Sheet View content")    }
}

