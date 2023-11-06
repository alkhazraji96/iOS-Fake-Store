//
//  SwiftMessages.swift
//  FakeStore
//
//  Created by Ameer Alkhazraji on 11/6/23.
//

import Foundation
import SwiftMessages
import UIKit

struct SwiftMessageConfig {
    let title: String
    let body: String
    let theme: Theme
}

extension UIViewController {
    func showSwiftMessage(config: SwiftMessageConfig) {
        var swiftMessagesConfig = SwiftMessages.Config()
        let swiftMessageView = MessageView.viewFromNib(layout: .messageView)
        switch config.theme {
        case .success:
            swiftMessageView.configureTheme(.success)
        case .warning:
            swiftMessageView.configureTheme(.warning)
        case .error:
            swiftMessageView.configureTheme(.error)
        case .info:
            swiftMessageView.configureTheme(.info)
        }

        // swiftMessageView
        swiftMessageView.configureDropShadow()
        swiftMessageView.configureContent(title: config.title, body: config.body)
        swiftMessageView.button?.isHidden = true
        swiftMessageView.layoutMarginAdditions = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

        // config
        swiftMessagesConfig.presentationStyle = .top
        swiftMessagesConfig.presentationContext = .automatic
        swiftMessagesConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        swiftMessagesConfig.preferredStatusBarStyle = .lightContent

        SwiftMessages.show(config: swiftMessagesConfig, view: swiftMessageView)
    }
}
