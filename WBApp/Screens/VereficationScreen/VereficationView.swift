//
//  VereficationView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.07.2024.
//
//

import SwiftUI

struct VereficationView: View {
    
    @State private var isTextFieldDisabled = false
    @State private var isButtonEnable = false
    @State private var isAnimation = false
    @State private var isPresented = false
    @State private var phoneNumber: String = "000 000-00-00"
    @State private var selectedCountry: Region = Region.countries.first(where: { $0.image == FlagNames.russsia })!
    
    @EnvironmentObject var router: Router
    
    var body: some View {
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
                    UIApplication.shared.editingMode(false)
                    isAnimation = true
                    startTimer()
                }
                .buttonStyle(CustomButtonStyle())
                .padding()
            case false:
                Button(LocalizedStringKey("Продолжить")) {
                }
                .buttonStyle(CustomButtonStyle())
                .disabled(true)
                .padding()
            }
        }
        .background(.customBackGround)
        .onTapGesture {
            UIApplication.shared.editingMode(true)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    router.navigateBack()
                } label: {
                    Image(.backChevron)
                }
            }
        }
    }
}

//MARK: - Private Methods
private extension VereficationView {
    func startTimer() {
        UIApplication.shared.editingMode(false)
        
        isButtonEnable = false
        isTextFieldDisabled = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            isTextFieldDisabled = false
            isButtonEnable = false
            isAnimation = false
            isPresented = false
            router.navigate(to: .inputSMSCodeScreen(number: selectedCountry.regionyCode + " " + phoneNumber))
        }
    }
}

#Preview {
    VereficationView()
}
