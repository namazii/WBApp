//
//  VereficationView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.07.2024.
//
//

import SwiftUI

struct VereficationView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isTextFieldDisabled = false
    @State private var isButtonEnable = false
    @State private var isAnimation = false
    @State private var isPresented = false
    @State private var phoneNumber: String = "000 000-00-00"
    @State private var selectedCountry: Region = Region.countries.first(where: { $0.image == FlagNames.russsia })!
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                if !isAnimation {
                    VereficationTitleView()
                        .transition(.opacity.animation(.easeIn))
                        .padding(.bottom, 49)
                } else {
                    ProgressView("Loading...")
                        .offset(CGSize(width: 0, height: -100))
                }
                
                PhoneNumberField(selectedCountry: $selectedCountry, phoneNumber: $phoneNumber, isTextFieldDisabled: $isTextFieldDisabled, isButtonEnable: $isButtonEnable)
                
                Spacer()
                
                switch isButtonEnable {
                case true:
                    Button(LocalizedStringKey("Продолжить")) {
                        isAnimation = true
                        startTimer()
                    }
                    .buttonStyle(CustomFillButtonStyle())
                    .padding()
                case false:
                    Button(LocalizedStringKey("Продолжить")) {
                    }
                    .buttonStyle(CustomFillButtonStyle())
                    .disabled(true)
                    .padding()
                }
            }
            .background(.customBackGround)
            .navigationBarBackButtonHidden()
            .onTapGesture {
                UIApplication.shared.editingMode(true)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(.backChevron)
                    }
                }
            }
            .navigationDestination(isPresented: $isPresented) {
                ModalView()
            }
        }
    }
    private func startTimer() {
        UIApplication.shared.editingMode(true)
        isButtonEnable = false
        isTextFieldDisabled = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            isPresented.toggle()
        }
    }
}

#Preview {
    VereficationView()
}
