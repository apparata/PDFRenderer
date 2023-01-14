# PDFRenderer

Render PDFs using SwiftUI.

## Example

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
