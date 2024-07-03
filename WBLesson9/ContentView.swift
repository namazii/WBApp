//
//  ContentView.swift
//  WBLesson9
//
//  Created by Назар Ткаченко on 01.07.2024.
//

import SwiftUI

struct InfiniteScrollView: View {
    @State private var countOfCell: [Int] = Array(0..<100)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem()
            ], spacing: 10) {
                ForEach(0..<countOfCell.count, id: \.self) { index in
                    Group {
                        switch getRandomBool() {
                        case true:
                            vhLayout
                        case false:
                            hvLayout
                        }
                    }
                    .onAppear {
                        if index == countOfCell.count - 1 {
                            addMoreNumbers()
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    private var vhLayout: some View {
        VStack {
            CellView().frame(height: 150)
            HStack {
                CellView().frame(width: 240, height: 100)
                CellView().frame(width: 150, height: 100)
            }
        }
    }
    
    private var hvLayout: some View {
        HStack {
            VStack {
                CellView()
                CellView()
            }
            CellView().frame(height: 250)
        }
    }
    
    private func getRandomBool() -> Bool {
        Bool.random()
    }
    
    private func addMoreNumbers() {
        let startingPoint = countOfCell.count
        let newNumbers = Array(startingPoint..<(startingPoint + 100))
        countOfCell.append(contentsOf: newNumbers)
    }
}

#Preview {
    InfiniteScrollView()
}
