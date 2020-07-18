//
//  Predicate.swift
//  Court Evidence Predicates
//
//  Created by Anthony Shorter on 5/20/20.
//  Copyright © 2020 Anthony Shorter. All rights reserved.
//

import SwiftUI

struct Predicate: Identifiable,Codable,Hashable {
    var id: Int
    var name: String
    var text: String
    var explanation: String?
    var checklist: [String]
    // TODO: find way to add explanation string
}
