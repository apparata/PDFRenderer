//
//  Copyright © 2023 Apparata AB. All rights reserved.
//

import SwiftUI

/// Type erasing protocol to enable page view building.
public protocol PDFPageSpecification {
    
    associatedtype Content: View
    
    /// The size of the page as a paper size in points.
    var size: PaperSize { get }
    
    /// A view builder that constructs the content of the page.
    @ViewBuilder var body: Self.Content { get }
}
