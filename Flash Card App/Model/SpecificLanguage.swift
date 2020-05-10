//
//  SpecificLanguage.swift
//  Flash Card App
//
//  Created by Pham Tu on 5/9/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import Foundation
import UIKit

class KoreanTextField: UITextField {
    override open var textInputMode: UITextInputMode? {
        return UITextInputMode.activeInputModes.filter { $0.primaryLanguage == "ko-KR" }.first ?? super.textInputMode
    }
}

class JapaneseTextField: UITextField {
    override open var textInputMode: UITextInputMode? {
        return UITextInputMode.activeInputModes.filter { $0.primaryLanguage == "ja-JP" }.first ?? super.textInputMode
    }
}

class EnglishTextField: UITextField {
    override open var textInputMode: UITextInputMode? {
        return UITextInputMode.activeInputModes.filter { $0.primaryLanguage == "en-GB" }.first ?? super.textInputMode
    }
}

class VietnameseTextField: UITextField {
    override open var textInputMode: UITextInputMode? {
        return UITextInputMode.activeInputModes.filter { $0.primaryLanguage == "vi-VN" }.first ?? super.textInputMode
    }
}
