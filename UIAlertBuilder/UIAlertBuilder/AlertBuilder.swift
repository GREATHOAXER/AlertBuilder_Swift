//
//  AlertBuilder.swift
//  UIAlertBuilder
//
//  Created by Hyung Seo Han on 2024/01/15.
//

import UIKit



class AlertBuilder: NSObject {

    private var titleText: String? = nil
    private var messageText: String? = nil
    private var preferredStyle: UIAlertController.Style = .alert
    private var proceedAction: UIAlertAction? = nil
    private var cancelAction: UIAlertAction? = nil
    private var actionSheetActions: [UIAlertAction]? = nil
    
    override init() {}
    
    func setTitle(_ title: String) -> AlertBuilder {
        self.titleText = title
        return self
    }
    
    func setMessage(_ message: String) -> AlertBuilder {
        self.messageText = message
        return self
    }
    
    func setPreferredStyle(_ style: UIAlertController.Style) -> AlertBuilder {
        self.preferredStyle = style
        return self
    }
    
    func setProceedAction(_ title: String, _ style: UIAlertAction.Style, _ handler: ((UIAlertAction) -> Void)? = nil) -> AlertBuilder {
        self.proceedAction = UIAlertAction(title: title, style: style, handler: handler)
        return self
    }
    
    func setCancelAction(_ title: String, _ style: UIAlertAction.Style, _ handler: ((UIAlertAction) -> Void)? = nil) -> AlertBuilder{
        self.cancelAction = UIAlertAction(title: title, style: style, handler: handler)
        return self
    }
    
    func addAction(_ title: String, _ style: UIAlertAction.Style, _ handler: ((UIAlertAction) -> Void)? = nil) -> AlertBuilder {
        if (actionSheetActions == nil) {
            actionSheetActions = []
        }
        self.actionSheetActions?.append(UIAlertAction(title: title, style: style, handler: handler))
        return self
    }
    
    func build() -> UIAlertController {
        let alertController = UIAlertController(title: self.titleText,
                                                message: self.messageText,
                                                preferredStyle: self.preferredStyle)
        switch self.preferredStyle {
        case .actionSheet:
            if let actions = self.actionSheetActions {
                for action in actions {
                    alertController.addAction(action)
                }
            } else {
                alertController.addAction(UIAlertAction(title: "취소", style: .cancel))
            }
        case .alert:
            if let proceed = self.proceedAction, let cancel = self.cancelAction {
                alertController.addAction(cancel)
                alertController.addAction(proceed)
            } else {
                alertController.addAction(UIAlertAction(title: "확인", style: .default))
            }
        @unknown default:
            fatalError("Cannot Build AlertBuilder")
        }
        
        return alertController
    }
}
