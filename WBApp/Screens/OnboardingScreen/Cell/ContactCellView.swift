//
//  ContactCellView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 10.06.2024.
//

import SwiftUI

struct ContantCellView: View {

    // MARK: - Constants
    private enum Constants {
        static let hstackSpace: CGFloat = .init(12)
        static let topPadding: CGFloat = .init(16)
        static let bottomPadding: CGFloat = .init(12)
    }
    
    //MARK: - Properties
    var contact: UserContact
    @StateObject private var imageLoader = ImageLoader()
    
    //MARK: - LifeCycle
    var body: some View {
        HStack(alignment: .top, spacing: Constants.hstackSpace) {
            if let _ = contact.avatar {
                if let image = imageLoader.image {
                    createImageWithBorder(image: Image(uiImage: image).resizable().aspectRatio(contentMode: .fill))
                } else {
                    createImageWithBorder(image: AvatarStub(firstName: contact.firstName, lastName: contact.lastName))
                }
            } else {
                createImageWithBorder(image: AvatarStub(firstName: contact.firstName, lastName: contact.lastName))
            }
            ContactInfoView(contact: contact)
        }
        .padding(.top, Constants.topPadding)
        .padding(.bottom, Constants.bottomPadding)
        .background(Color(.customBackGround))
        .onAppear {
            imageLoader.loadImage(from: contact.avatar)
        }
    }
}

//MARK: - Private Methods
extension ContantCellView {
    @ViewBuilder
    private func createImageWithBorder<Content: View>(image: Content) -> some View {
        let initialImg = image
            .frame(width: 48, height: 48)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(4)
        
        let borderedImage = initialImg
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [.borderStubOne, .borderStubTwo]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2
                    )
            )
        
        let result = contact.isNews ? AnyView(borderedImage) : AnyView(initialImg)
        
        if contact.isOnline {
            result
                .overlay(
                    Circle()
                        .fill(.green)
                        .frame(width: 14, height: 14)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .offset(x: 0, y: -42),
                    alignment: .bottomTrailing
                )
        } else {
            result
        }
    }
}




#Preview {
    ContantCellView(contact: UserContact(
        id: 1,
        firstName: "Aboba",
        lastName: "Abobus",
        lastVisit: Date(),
        avatar: "https://www.proficinema.com/upload/iblock/568/568ae99c2c880ceca949a77310b01d2d.jpg",
        isOnline: true,
        isNews: true
    )
    )
}

