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

  public extension CGSize {

    /// **Mechanica**
    ///
    ///  Returns the scale to fit `self` into a different `size`.
    ///
    /// - Parameter size: The size to fit into.
    /// - Returns: The scale to fit into the given size.
    public func scaleToFit(boundingSize size: CGSize) -> CGFloat {
      return fmin(size.width / width, size.height / height)
    }

    /// **Mechanica**
    ///
    /// Returns a `CGSize` to fit `self` into the `size` by maintaining the aspect ratio.
    ///
    /// - Parameter size: The size to fit into.
    /// - Returns: Returns a `CGSize` to fit `self` into the `size` by maintaining the aspect ratio.
    ///
    /// Example:
    ///
    ///     CGSize(width: 100, height: 50).aspectFit(boundingSize: CGSize(width: 70, height: 30)) -> CGSize(width: 60, height: 30)
    ///
    public func aspectFit(boundingSize size: CGSize) -> CGSize {
      let minRatio = scaleToFit(boundingSize: size)

      return CGSize(width: width * minRatio, height: height * minRatio)
    }

  }

#endif
