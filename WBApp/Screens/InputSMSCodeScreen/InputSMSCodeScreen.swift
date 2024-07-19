//
//  InputSMSCodeScreen.swift
//  WBApp
//
//  Created by Назар Ткаченко on 10.07.2024.
//

import SwiftUI
import UISystem

struct InputSMSCodeScreen: View {
    
    @State private var number: String
    @State private var isEditingMode: Bool = false
    @State private var generatedCode: String = ""
    @State private var inputCode: String = ""
    @StateObject private var retrySendCodeTimer = RetrySendCodeTimer()
    
    @EnvironmentObject var router: Router
    
    init(number: String) {
        self.number = number
    }
    
    var body: some View {
        ZStack {
            Color.customBackGround.ignoresSafeArea()
            VStack {
                smsCodeTitlesView(number: $number)
                SMSCodeComponentView(input: $inputCode, isEditingMode: $isEditingMode)
                    .padding(.top, 30)
                
                Spacer()
                
                requestCodeText
                    .padding(.bottom, isEditingMode ? Constants.padding : Constants.keyboardPadding)
            }
            .padding(.top, 79)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    UIApplication.shared.editingMode(false)
                    router.navigateBack()
                } label: {
                    Image(.backChevron)
                }
            }
        }
        .onAppear {
            startTimer()
            generateCode()
        }
        .onChange(of: inputCode) { newValue in
            validateCode(inputCode: newValue)
        }
    }
}

// MARK: - Private Constants Views
private extension InputSMSCodeScreen {
    var retryButton: some View {
        Button(action: {
            switch retrySendCodeTimer.remainingTime {
            case 1...:
                break
            default:
                startTimer()
                generateCode()
            }
        }) {
            Text(LocalizedStringKey("Запросить код повторно"))
        }
        .buttonStyle(CustomButtonStyle(styleType: .textOnly))
    }
    
    var validTimer: some View {
        Text("Запросить код повторно через" + ": " + retrySendCodeTimer.formattedTime)
            .foregroundStyle(.metaDataGray)
            .textStyle(with: .metaData2)
    }
    
    var requestCodeText: some View {
        Group {
            switch retrySendCodeTimer.remainingTime {
            case 1...:
                validTimer
            default:
                retryButton
            }
        }
    }
}

// MARK: - Private Methods
private extension InputSMSCodeScreen {
    func startTimer() {
        retrySendCodeTimer.start(with: 30)
    }
    
    func generateCode() {
        var iterator = SMSCodeGenerator(length: 4).makeIterator()
        if let code = iterator.next() {
            generatedCode = code
            print("Generated Code: \(generatedCode)")
        }
    }
    
    func validateCode(inputCode: String) {
        if inputCode ~== generatedCode {
            onSuccess()
        }
    }
    
    func onSuccess() {
        router.navigate(to: .dissmisScreen)
    }
}

#Preview {
    InputSMSCodeScreen(number: "")
}
