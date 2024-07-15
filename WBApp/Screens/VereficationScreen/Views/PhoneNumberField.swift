//
//  PhoneNumberField.swift
//  WBApp
//
//  Created by Назар Ткаченко on 08.07.2024.
//

import SwiftUI


struct PhoneNumberField: View {
    
    @Binding var selectedCountry: Region
    @Binding var phoneNumber: String
    @Binding var isTextFieldDisabled: Bool
    @Binding var isButtonEnable: Bool
    
    var body: some View {
        HStack {
            PopOverCountryPicker(selectedRegion: $selectedCountry, countries: Region.countries)
                .padding(.trailing)
            
            TextField("000 000-00-00", text: $phoneNumber)
                .keyboardType(.phonePad)
                .frame(width: 262, height: 36)
                .background(.searchBackGroundCollor)
                .cornerRadius(4)
                .foregroundColor(.textFields)
                .textStyle(with: .bodyText1)
                .onChange(of: phoneNumber) { _, newValue in
                    let rawNumber = newValue.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
                    if rawNumber.count > selectedCountry.phonePrefix {
                        let trimmedNumber = String(rawNumber.prefix(selectedCountry.phonePrefix))
                        phoneNumber = formatPhoneNumber(trimmedNumber)
                    } else {
                        phoneNumber = formatPhoneNumber(rawNumber)
                    }
                    if rawNumber.count == selectedCountry.phonePrefix {
                        isButtonEnable = true
                    } else {
                        isButtonEnable = false
                    }
                }
                .disabled(isTextFieldDisabled)
                .onTapGesture {
                    phoneNumber = ""
                    isButtonEnable = false
                }
        }
    }
}

// MARK: - Private Methods
private extension PhoneNumberField {
    func formatPhoneNumber(_ number: String) -> String {
        var result = ""
        let startIndex = number.startIndex
        
        for i in 0..<number.count {
            let index = number.index(startIndex, offsetBy: i)
            if i == 3 {
                result.append(" ")
            }
            if i == 6 || (i > 6 && (i - 6) % 2 == 0) {
                result.append("-")
            }
            result.append(number[index])
        }
        if result.hasSuffix("-") {
            result.removeLast()
        }
        return result
    }
}
