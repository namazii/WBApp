//
//  PopOverCountryPicker.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.07.2024.
//

import SwiftUI

struct PopOverCountryPicker: View {
    
    @Binding var selectedRegion: Region
    var countries: [Region]
    
    var body: some View {
        Menu {
            ForEach(countries) { country in
                Button(action: {
                    selectedRegion = country
                }) {
                    HStack {
                        Image(country.image)
                        Text(country.regionyCode)
                            .textStyle(with: .bodyText1)
                            .foregroundColor(.textFields)
                    }
                }
            }
        } label: {
            HStack {
                Image(selectedRegion.image)
                    .resizable()
                    .frame(width: 16, height: 16)
                Text(selectedRegion.regionyCode)
                    .textStyle(with: .bodyText1)
                    .foregroundColor(.textFields)
            }
            .frame(width: 65, height: 36)
            .background(.searchBackGroundCollor)
            .cornerRadius(4)
        }
    }
}
