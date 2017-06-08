//
//  ValueAssociable.swift
//  Mechanica
//
//  Copyright © 2016-2017 Tinrobots.
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

// MARK: - ValueAssociable Protocol

/// **Mechanica**
///
/// Classes adopting this protocol can associate values to the object itself.
public protocol ValueAssociable {
  /// **Mechanica**
  ///
  /// Sets an associated value using a given key and association policy.
  ///
  /// - Parameters:
  ///   - value: The value to associate with the key key for object. Pass nil to clear an existing association.
  ///   - key: The key for the association.
  ///   - policy: The policy for the association.
  func set<T>(associatedValue value: T?, forKey key: UnsafeRawPointer, andPolicy policy: objc_AssociationPolicy)

  /// **Mechanica**
  ///
  /// Returns the value associated for a given key.
  ///
  /// - Parameter key: The key for the association.
  /// - Returns: the value associated with the key.
  func getAssociatedValue<T>(forKey key: UnsafeRawPointer) -> T?

  /// **Mechanica**
  ///
  /// Removes an associated value using a given key and association policy.
  ///
  /// - Parameters:
  ///   - key: The key for the association.
  ///   - policy: The policy for the association.
  func removeAssociatedValue(forKey key: UnsafeRawPointer, andPolicy policy: objc_AssociationPolicy)
}

extension NSObject: ValueAssociable {}

extension ValueAssociable {

  public final func set<T>(associatedValue value: T?, forKey key: UnsafeRawPointer, andPolicy policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
    setAssociatedValue(value, forObject: self, usingKey: key)
  }

  public final func getAssociatedValue<T>(forKey key: UnsafeRawPointer) -> T? {
    return Mechanica.getAssociatedValue(forObject: self, usingKey: key)
  }

  public final func removeAssociatedValue(forKey key: UnsafeRawPointer, andPolicy policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
    Mechanica.removeAssociatedValue(forObject: self, usingKey: key, andPolicy: policy)
  }

}

// MARK: - Associated Objects

/// **Mechanica**
///
/// Sets an associated value for a given object using a given key and association policy.
///
/// - Parameters:
///   - value: The value to associate with the key key for object. Pass nil to clear an existing association.
///   - object: The source object for the association.
///   - key: The key for the association.
///   - policy: The policy for the association.
public func setAssociatedValue<T>(_ value: T?, forObject object: Any, usingKey key: UnsafeRawPointer, andPolicy policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
  objc_setAssociatedObject(object, key, value, policy)
}

/// **Mechanica**
///
/// Returns the value associated with a given object for a given key.
///
/// - Parameters:
///   - object: The source object for the association.
///   - key: The key for the association.
/// - Returns: the value associated with the key for object.
public func getAssociatedValue<T>(forObject object: Any, usingKey key: UnsafeRawPointer) -> T? {
  return objc_getAssociatedObject(object, key) as? T
}

/// **Mechanica**
///
/// Removes an associated value for a given object using a given key and association policy.
///
/// - Parameters:
///   - object: The source object for the association.
///   - key: The key for the association.
///   - policy: The policy for the association.
public func removeAssociatedValue(forObject object: Any, usingKey key: UnsafeRawPointer, andPolicy policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
  objc_setAssociatedObject(object, key, nil, policy)
}