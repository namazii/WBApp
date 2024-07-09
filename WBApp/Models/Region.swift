//
//  Region.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.07.2024.
//

import Foundation

struct Region: Identifiable {
    let id = UUID()
    let regionyCode: String
    let phonePrefix: Int
    let image: String
    
    static let countries = [
            Region(regionyCode: "+374", phonePrefix: 8, image: "armeniaFlag"),
            Region(regionyCode: "+994", phonePrefix: 8, image: "azerbaijanFlag"),
            Region(regionyCode: "+375", phonePrefix: 8, image: "belarusFlag"),
            Region(regionyCode: "+86", phonePrefix: 10, image: "chinaFlag"),
            Region(regionyCode: "+44", phonePrefix: 10, image: "englandFlag"),
            Region(regionyCode: "+996", phonePrefix: 9, image: "kyrgyzstanFlag"),
            Region(regionyCode: "+7", phonePrefix: 10, image: "kazakhstanFlag"),
            Region(regionyCode: "+7", phonePrefix: 10, image: "russsiaFlag"),
            Region(regionyCode: "+1", phonePrefix: 10, image: "usaFlag"),
            Region(regionyCode: "+7", phonePrefix: 10, image: "uzbekistanFlag"),
            Region(regionyCode: "+90", phonePrefix: 10, image: "turkeyFlag"),
            Region(regionyCode: "+995", phonePrefix: 8, image: "georgiaFlag"),
            Region(regionyCode: "+82", phonePrefix: 8, image: "koreaFlag"),
            Region(regionyCode: "+971", phonePrefix: 10, image: "uaeFlag")
            ]
}
