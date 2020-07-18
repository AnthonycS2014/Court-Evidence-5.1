//
//  DocumentView.swift
//  Court Evidence Predicates
//
//  Created by Anthony Shorter on 5/29/20.
//  Copyright © 2020 Anthony Shorter. All rights reserved.
//

import SwiftUI

struct DocumentView: View {
    @State var document: Document
    var dismiss: () -> Void

    var body: some View {
        VStack {
            HStack {
                Text("File Name")
                    .foregroundColor(.secondary)
                Text(document.fileURL.lastPathComponent)
            }
            TextView2(document: $document, note: "")
            Button("Done", action: dismiss)
        }
    }
}

