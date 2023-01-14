# ``PDFRenderer``

Render PDF documents using SwiftUI to file or memory.

## Overview

`PDFRenderer` is a convenience package for creating PDF documents using SwiftUI.

To create a PDF document, you start by creating a document and then declare the pages with view builders. Finally, you render the document either to file or in memory as a `Data` instance.

```swift
let document = PDFDocument {
    PDFPage(.a4) { size in
        VStack {
            Text("This is the first page.")
        }.frame(width: size.width, height: size.height)
    }
    PDFPage(.custom(width: 800, height: 600)) { size in
        VStack {
            Text("This is the second page.")
        }.frame(width: size.width, height: size.height)
    }
}

// PDF document creation requires @MainActor
Task {
    // Render the PDF document and write it to a file.
    try await document.render(to: URL(filePath: "/some/path/filename.pdf"))
    
    // Render the PDF document in memory as a Data instance.
    let pdfInMemory = try await document.renderInMemory()
}
```

## Topics

### Document and Contents

- ``PDFDocument``
- ``PDFPage``

### Building Documents

- ``PDFBuilder``
- ``PDFPageSpecification``
- ``PaperSize``

### Errors

- ``PDFDocumentError``
