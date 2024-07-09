//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Mac on 6/29/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    
    @State private var draftProfile = Profile.default
    @Environment(ModelData.self) private var modelData
    @Environment (\.dismiss) private var dismiss
    @Environment (\.editMode) private var editMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                Button("Back", role: .cancel) {
                    switch editMode?.wrappedValue {
                    case .some(.active):
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    default:
                        dismiss()
                    }
                }
                Spacer()
                EditButton()
            }
            
            switch editMode?.wrappedValue {
            case .some(.inactive):
                ProfileSummary(profile: modelData.profile)
            default:
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
            
        }
        .padding()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
