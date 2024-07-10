//
//  TPPDFMarkdownTestApp.swift
//  TPPDFMarkdownTest
//
//  Created by Patrick Langer on 10.07.2024.
//

import TPPDF
import SwiftUI

@main
struct TPPDFMarkdownTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init()
    {
        print("App started")
        let document = TPPDF.PDFDocument(format: .usLetter)
            
        let markdownString = try? NSAttributedString(markdown: "This is a *simple* **test**")
        let textElementObject = PDFAttributedText(text: markdownString!)
        document.add(attributedTextObject: textElementObject)
                           
        let generator = PDFGenerator(document: document)
        let url = try? generator.generateURL(filename: "Example.pdf")
    }
}
