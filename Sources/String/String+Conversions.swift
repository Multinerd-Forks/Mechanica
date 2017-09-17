//
// Mechanica
//
// Copyright © 2016-2017 Tinrobots.
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

import Foundation

extension String {

  /// **Mechanica**
  ///
  /// Return a Bool value by parsing `self`.
  public var toBool: Bool? {
    switch self.trimmed().lowercased() {
    case "1", "true", "t", "yes", "y", "👍", "👍🏻", "👍🏼", "👍🏽", "👍🏾", "👍🏿":
      return true
    case "0", "false", "f", "no", "n", "👎", "👎🏻", "👎🏼", "👎🏽", "👎🏾", "👎🏿":
      return false
    default:
      return nil
    }
  }

  /// **Mechanica**
  ///
  /// Returns a Double value by parsing `self`.
  public var toDouble: Double? {
    return Double(self)
  }

  /// **Mechanica**
  ///
  /// Returns a Float value by parsing `self`.
  public var toFloat: Float? {
    return Float(self)
  }

  /// **Mechanica**
  ///
  /// Returns a Float32 value by parsing `self`.
  public var toFloat32: Float32? {
    return Float32(self)
  }

  /// **Mechanica**
  ///
  /// Returns a Float64 value by parsing `self`.
  public var toFloat64: Float64? {
    return Float64(self)
  }

  /// **Mechanica**
  ///
  /// Returns a Int value by parsing `self`.
  public var toInt: Int? {
    return Int(self)
  }

  /// **Mechanica**
  ///
  /// Returns a Int8 value by parsing `self`.
  public var toInt8: Int8? {
    return Int8(self)
  }

  /// **Mechanica**
  ///
  /// Returns a Int16 value by parsing `self`.
  public var toInt16: Int16? {
    return Int16(self)
  }

  /// **Mechanica**
  ///
  /// Returns a Int32 value by parsing `self`.
  public var toInt32: Int32? {
    return Int32(self)
  }

  /// **Mechanica**
  ///
  /// Returns a Int64 value by parsing `self`.
  public var toInt64: Int64? {
    return Int64(self)
  }

  /// **Mechanica**
  ///
  /// Returns an URL initialized with `self`.
  public var toUrl: URL? {
    return URL(string: self)
  }

  /// **Mechanica**
  ///
  /// Returns a `new` string decoded from base64.
  public var toBase64Decoded: String? {
    guard let decodedData = Data(base64Encoded: self) else {
      return nil
    }
    return String(data: decodedData, encoding: .utf8)
  }

  /// **Mechanica**
  ///
  /// Returns a `new` string encoded in base64.
  public var toBase64Encoded: String? {
    let plainData = self.data(using: .utf8)
    return plainData?.base64EncodedString()
  }

}