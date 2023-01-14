import Foundation

/// Errors associated with creating PDF documents.
public enum PDFDocumentError: Swift.Error {
    
    /// The PDF document could not be created at the specified URL.
    case failedToCreateDocumentAtURL(URL)
    
    /// The PDF document could not be created as an instance of Data.
    case failedToCreateDocumentAsData
}
