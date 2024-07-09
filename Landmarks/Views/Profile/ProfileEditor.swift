//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Назар Ткаченко on 03.07.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile

    var body: some View {
        List {
            HStack {
                Text("Name")
                
                Spacer()
                
                TextField("username", text: $profile.username)
                    .multilineTextAlignment(.trailing)
                    .foregroundStyle(.secondary)
            }
            
            DatePicker(
                selection: $profile.goalDate,
                displayedComponents: .date
            ) {
                Text("Goal Date")
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Notifications")
            }
            
            Picker("Seasonal photo ", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            } 
            .pickerStyle(.wheel)
        }
        .navigationBarBackButtonHidden()

    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
