//
//  Copyright © 2023 Apparata AB. All rights reserved.
//

import SwiftUI

/// Represents a PDF document.
///
/// Example:
/// ```
/// let document = PDFDocument {
///     PDFPage(.a4) { size in
///         VStack {
///             Text("This is the first page.")
///         }.frame(width: size.width, height: size.height)
///     }
///     PDFPage(.custom(width: 800, height: 600)) { size in
///         VStack {
///             Text("This is the second page.")
///         }.frame(width: size.width, height: size.height)
///     }
/// }
///
/// // PDF document creation requires @MainActor
/// Task {
///     // Render the PDF document and write it to a file.
///     try await document.render(to: URL(filePath: "/some/path/filename.pdf"))
///
///     // Render the PDF document in memory as a Data instance.
///     let pdfInMemory = try await document.renderInMemory()
/// }
/// ```
public struct PDFDocument {
    
    private let content: () -> [any PDFPageSpecification]
    
    /// Creates a PDF document with a builder that will generate the pages.
    ///
    /// - Parameter content: A ``PDFBuilder`` that will supply the pages and their content.
    public init(@PDFBuilder content: @escaping () -> [any PDFPageSpecification]) {
        self.content = content
    }
    
    /// Renders a PDF document file in memory.
    ///
    /// - Returns: The rendered PDF document file as a  `Data` instance.
    @MainActor public func renderInMemory() throws -> Data {
        let mutableData = NSMutableData()
        guard let consumer = CGDataConsumer(data: mutableData as CFMutableData) else {
            throw PDFDocumentError.failedToCreateDocumentAsData
        }
        guard let context = CGContext(consumer: consumer, mediaBox: nil, nil) else {
            throw PDFDocumentError.failedToCreateDocumentAsData
        }
        render(in: context)
        context.closePDF()
        return mutableData as Data
    }
    
    /// Renders a PDF document file at the given file URL.
    ///
    /// - Parameter url: File URL to write the generated PDF file to.
    @MainActor public func render(to url: URL) throws {
        guard let consumer = CGDataConsumer(url: url as CFURL) else {
            throw PDFDocumentError.failedToCreateDocumentAtURL(url)
        }
        guard let context = CGContext(consumer: consumer, mediaBox: nil, nil) else {
            throw PDFDocumentError.failedToCreateDocumentAtURL(url)
        }
        render(in: context)
        context.closePDF()
    }
    
    /// Renders the page SwiftUI views as PDF pages to the given `CGContext`.
    ///
    /// - Parameter context: The `CGContext` to render the PDF pages to.
    @MainActor private func render(in context: CGContext) {
        let pages = content()
        
        for page in pages {
            
            let size = CGSize(width: page.size.width, height: page.size.height)
            
            var mediaBox = CGRect(origin: .zero, size: size)
            let mediaBoxByteCount = MemoryLayout.size(ofValue: mediaBox)
            let mediaBoxData = NSData(bytes: &mediaBox, length: mediaBoxByteCount)
            let pageInfo: [String: Any] = [
                kCGPDFContextMediaBox as String: mediaBoxData
            ]
            
            let content = page.body
                .frame(width: size.width, height: size.height)
            
            ImageRenderer(content: AnyView(content)).render { size, renderer in
                context.beginPDFPage(pageInfo as CFDictionary)
                renderer(context)
                context.endPage()
            }
        }
    }
}
