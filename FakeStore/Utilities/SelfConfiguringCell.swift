//
//  SelfConfiguringCell.swift
//  FakeStore
//
//  Created by Ameer Alkhazraji on 11/6/23.
//

import Foundation

protocol SelfConfiguringCell {
    static var reusableIdentifier: String { get }
    func configure(with data: T)

    associatedtype T
}
