//
//  TextView2.swift
//  Court Evidence Predicates
//
//  Created by Anthony Shorter on 5/29/20.
//  Copyright © 2020 Anthony Shorter. All rights reserved.
//

import SwiftUI
import UIKit

struct TextView2: UIViewRepresentable {
    
@Binding var document: Document

var note: String
    
func makeUIView(context: Context) -> UITextView {
    let view = UITextView()
    view.isScrollEnabled = true
    view.isEditable = true
    view.isUserInteractionEnabled = true
    view.contentInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 5)
    view.delegate = context.coordinator
    return view
}

func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.text = document.text
}

func makeCoordinator() -> TextView2.Coordinator {
    Coordinator(self)
}

class Coordinator: NSObject, UITextViewDelegate {
    var control: TextView2
    
    init(_ control: TextView2) {
        self.control = control
    }
    
    func textViewDidChange(_ textView: UITextView) {
        control.document.text = textView.text
        control.document.updateChangeCount(.done)
    }
}
}

