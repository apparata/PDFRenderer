//
//  Copyright © 2023 Apparata AB. All rights reserved.
//

import SwiftUI

/// Builds an array of PDF page specifications.
@resultBuilder
public struct PDFBuilder {
    
    public static func buildExpression(_ page: any PDFPageSpecification) -> [any PDFPageSpecification] {
        [page]
    }
    
    public static func buildBlock() -> [any PDFPageSpecification] {
        []
    }
    
    public static func buildBlock(_ component: [any PDFPageSpecification]...) -> [any PDFPageSpecification] {
        component.flatMap { $0 }
    }
    
    public static func buildOptional(_ component: [any PDFPageSpecification]?) -> [any PDFPageSpecification] {
        component ?? []
    }

    public static func buildIf(_ component: [any PDFPageSpecification]?) -> [any PDFPageSpecification] {
        component ?? []
    }
    
    public static func buildEither(first component: [any PDFPageSpecification]) -> [any PDFPageSpecification] {
        component
    }

    public static func buildEither(second component: [any PDFPageSpecification]) -> [any PDFPageSpecification] {
        component
    }
    
    /// Needed for `for` loop support.
    public static func buildArray(_ components: [[any PDFPageSpecification]]) -> [any PDFPageSpecification] {
        return components.flatMap { $0 }
    }
    
    public static func buildFinalResult(_ component: [any PDFPageSpecification]) -> [any PDFPageSpecification] {
        return component
    }
}
