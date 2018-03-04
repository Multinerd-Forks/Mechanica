// 
// Mechanica
//
// Copyright © 2016-2018 Tinrobots.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)

  import CoreGraphics.CGGeometry

  public extension CGPoint {

    /// **Mechanica**
    ///
    /// Returns the distance between two points.
    /// - Parameters:
    ///   - point1: The first point.
    ///   - point2: The second point.
    /// - Returns: the distance between between two points.
    static func distance(from point1: CGPoint, to point2: CGPoint) -> CGFloat {
      return sqrt(pow(point2.x-point1.x,2)+pow(point2.y-point1.y,2))
    }

    /// **Mechanica**
    ///
    /// Returns the distance between `self` and another `point`..
    /// - Parameter point: The point to which to calculate the distance.
    /// - Returns: the distance between `self` and `point`.
    public func distance(to point: CGPoint) -> CGFloat {
      return CGPoint.distance(from: self, to: point)
    }

    /// **Mechanica**
    ///
    /// Checks if a point is on a straight line.
    /// - Parameters:
    ///   - firstPoint: The first point that defines a straight line.
    ///   - secondPoint: The second point that defines a straight line.
    /// - Returns: *true* if `self` lies on the straigth lined defined by `firstPoint` and `secondPoint`.
    public func isOnStraightLine(passingThrough firstPoint: CGPoint, and secondPoint: CGPoint) -> Bool {
      let v1 =  (firstPoint.y - self.y) * (firstPoint.x - secondPoint.x)
      let v2 = (firstPoint.y - secondPoint.y) * (firstPoint.x - self.x)
      return v1 == v2
    }
  }

#endif
