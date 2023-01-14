# PDFRenderer

[![License: Unlicense](https://img.shields.io/badge/License-Unlicense-blue.svg)](http://unlicense.org/)

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

## Unlicense

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.

In jurisdictions that recognize copyright laws, the author or authors of this software dedicate any and all copyright interest in the software to the public domain. We make this dedication for the benefit of the public at large and to the detriment of our heirs and successors. We intend this dedication to be an overt act of relinquishment in perpetuity of all present and future rights to this software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <https://unlicense.org>
