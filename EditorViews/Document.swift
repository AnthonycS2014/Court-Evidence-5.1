//
//  Document.swift
//  Court Evidence Predicates
//
//  Created by Anthony Shorter on 5/29/20.
//  Copyright © 2020 Anthony Shorter. All rights reserved.
//

import UIKit

class Document: UIDocument {
    var text = ""
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return try NSKeyedArchiver.archivedData(withRootObject: text, requiringSecureCoding: true)
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
        guard let data = contents as? Data else { return }
        guard let fileContents = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? String else { return }
        text = fileContents
    }
}
