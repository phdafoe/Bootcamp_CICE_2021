//
//  LocalizedKeys.swift
//  CiceCupon
//
//  Created by Andres Felipe Ocampo Eljaiek on 23/10/21.
//

import Foundation

struct LocalizedKeys {
    
    // General
    struct General {
        static let titleAlertDefault = "title_my_alert".localized
        static let messageAlertDefault = "message_my_alert".localized
        static let primaryButtonAlertDefault = "general_accept".localized
        static let secundaryButtonAlertDefault = "general_cancel".localized
        static let continueButton = "general_continue".localized
    }
    
    // Login
    struct Login {
        static let titleHelloAlert = "title_hello".localized
        static let mesageWarningAlert = "mesage_warning_alert".localized
        static let successLoginTitleAlert = "success_title_alert".localized
        static let successLoginMessageAlter = "success_message_alert".localized
        
    }
    
    // Bill
    
    // Menu
    
}

extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
