//
//  Copyright © 2023 Apparata AB. All rights reserved.
//

import SwiftUI

/// Represents a page in a PDF document.
public struct PDFPage<Content: View>: PDFPageSpecification {

    /// The size of the page as a paper size in points.
    public let size: PaperSize
    
    /// A view builder that constructs the content of the page.
    public var body: some View {
        content(size)
    }

    /// A view builder that constructs the content of the page given a page size.
    private let content: (PaperSize) -> Content
    
    /// Creates a PDF page given the size of the page and a view builder to construct the page content.
    ///
    /// - Parameters:
    ///   - size: The size of the page as a paper size in points.
    ///   - content: A view builder that constructs the content of the page given a page size.
    public init(_ size: PaperSize, @ViewBuilder content: @escaping (PaperSize) -> Content) {
        self.size = size
        self.content = content
    }
}
