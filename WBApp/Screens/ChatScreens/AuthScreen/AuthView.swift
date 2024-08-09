//
//  AuthView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 01.08.2024.
//

import SwiftUI
import UISystem

struct AuthView: View {
    
    @StateObject var viewModel = AuthViewModel()
    
    @State var name: String = .init("")
    @State var lastName: String = .init("")
    @State var avatar: Media?
    @State var avatarURL: URL?
    @State var showTextFieldWarning: Bool = .init(false)
    
    var body: some View {
        ZStack {
            content
            
            if viewModel.showActivityIndicator {
                ActivityIndicator()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .background(Color(.customBackGround))
    }
}

//MARK: - Private ViewProperties
private extension AuthView {
    private var content: some View {
        VStack(spacing: 0) {
            pickAvatarView
                .padding(.top, 46)
            
            CustomTextField(placeholder: LocalizedStringKey("Имя(обязательно)").stringValue(), text: $name, error: $showTextFieldWarning)
                .padding(.top, 31)
            CustomTextField(placeholder: LocalizedStringKey("Фамилия(опционально)").stringValue(), text: $lastName, error: .constant(false))
                .padding(.top, 12)
            
            createButton
                .padding(.top, 16)
            
            Spacer()
        }
        .padding(12)
        .padding(.top, 46)
    }
    
    private var pickAvatarView: some View {
        ZStack(alignment: .bottomTrailing) {
            AsyncImage(url: avatarURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ZStack {
                    Color.searchBackGroundCollor
                    Image(.avatarPlaceholder)
                        .resizable()
                        .frame(width: 56, height: 56)
                }
            }
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            Image(.plusIcon)
                .resizable()
                .frame(width: 24, height: 24)
        }
    }
    
    private var createButton: some View {
        Button(action: {
            viewModel.auth(nickname: lastName != "" ? name + "" + lastName : name, avatar: avatar)
        }, label: {
            Text(LocalizedStringKey("Сохранить"))
        })
        .buttonStyle(CustomButtonStyle())
        .disabled(name.isEmpty)
    }
}
