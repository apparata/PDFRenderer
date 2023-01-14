import Foundation
import CoreGraphics

/// Represents a paper size in points.
public struct PaperSize {
    
    /// Width of the paper in points.
    public let width: CGFloat
    
    /// Height of the paper in points.
    public let height: CGFloat
    
    /// Size of the paper in points.
    public var size: CGSize {
        CGSize(width: width, height: height)
    }
    
    /// Creates a paper size instance.
    ///
    /// - Parameters:
    ///   - width: Width of the paper in points.
    ///   - height: Height of the paper in points
    public init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
}

public extension PaperSize {
    
    /// Returns a custom paper size of the specified width and height.
    static func custom(width: CGFloat, height: CGFloat) -> PaperSize {
        return PaperSize(width: width, height: height)
    }
    /// Represents the size of a sheet of standard A0 paper.
    static let a0 = PaperSize(width: 2384, height: 3370)

    /// Represents the size of a sheet of standard A1 paper.
    static let a1 = PaperSize(width: 1684, height: 2384)

    /// Represents the size of a sheet of standard A2 paper.
    static let a2 = PaperSize(width: 1190, height: 1684)

    /// Represents the size of a sheet of standard A3 paper.
    static let a3 = PaperSize(width: 842, height: 1190)

    /// Represents the size of a sheet of standard A4 paper.
    static let a4 = PaperSize(width: 595, height: 842)

    /// Represents the size of a sheet of standard A5 paper.
    static let a5 = PaperSize(width: 420, height: 595)

    /// Represents the size of a sheet of standard A6 paper.
    static let a6 = PaperSize(width: 298, height: 420)

    /// Represents the size of a sheet of standard A7 paper.
    static let a7 = PaperSize(width: 210, height: 298)

    /// Represents the size of a sheet of standard A8 paper.
    static let a8 = PaperSize(width: 148, height: 210)

    /// Represents the size of a sheet of standard letter paper.
    static let letter = PaperSize(width: 612, height: 792)

    /// Represents the size of a sheet of standard legal paper.
    static let legal = PaperSize(width: 612, height: 1008)

    /// Represents the size of a sheet of standard ledger paper.
    static let ledger = PaperSize(width: 792, height: 1224)

    /// Represents the size of a sheet of standard tabloid paper.
    static let tabloid = PaperSize(width: 1224, height: 792)

    /// Represents the size of a sheet of standard executive paper.
    static let executive = PaperSize(width: 522, height: 756)
}
