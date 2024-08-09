//
//  ConstantsChat.swift
//  WBApp
//
//  Created by Назар Ткаченко on 01.08.2024.
//

import SwiftUI
import ExyteChat
import ExyteMediaPicker

struct Collection {
    static let users = "users"
    static let conversations = "conversations"
    static let messages = "messages"
}

#if swift(<5.9)
extension Color {
    static var exampleBlue = Color("exampleBlue")
    static var exampleDarkGray = Color("exampleDarkGray")
    static var exampleFieldBorder = Color("exampleFieldBorder")
    static var exampleLightGray = Color("exampleLightGray")
    static var exampleMidGray = Color("exampleMidGray")
    static var examplePickerBg = Color("examplePickerBg")
    static var exampleSearchField = Color("exampleSearchField")
    static var exampleSecondaryText = Color("exampleSecondaryText")
    static var exampleTertiaryText = Color("exampleTertiaryText")
}
}
#endif

extension String {
    static var avatarPlaceholder = "personUser"
    static var placeholderAvatar = "personUser"
    static var bob = "bob"
    static var checkSelected = "checkSelected"
    static var checkUnselected = "checkUnselected"
    static var groupChat = "userGroup"
    static var imagePlaceholder = "imagePlaceholder"
//    static var logo = "logo"
    static var navigateBack = "backChevron"
    static var newChat = "square.and.pencil"
    static var plusIcon = "plus"
    static var searchCancel = "searchCancel"
    static var searchIcon = "magnifierImage"
    static var steve = "steve"
    static var tim = "tim"
}

var dataStorage = DataStorageManager.shared

public typealias User = ExyteChat.User
public typealias Message = ExyteChat.Message
public typealias Recording = ExyteChat.Recording
public typealias Media = ExyteMediaPicker.Media
