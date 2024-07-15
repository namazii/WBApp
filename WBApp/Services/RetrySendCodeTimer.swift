//
//  RetrySendCodeTimer.swift
//  WBApp
//
//  Created by Назар Ткаченко on 12.07.2024.
//

import Foundation

final class RetrySendCodeTimer: ObservableObject {
    
    @Published var remainingTime: TimeInterval = 0
    private var timer: Timer?
    var formattedTime: String {
        let minutes = Int(remainingTime) / 60
        let seconds = Int(remainingTime) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func start(with initialTime: TimeInterval) {
        remainingTime = initialTime
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            
            guard let self = self else { return }
            
            if remainingTime > 0 {
                DispatchQueue.main.async {
                    self.remainingTime -= 1
                }
            } else {
                timer?.invalidate()
                timer = nil
            }
        }
    }
    
    deinit {
        timer?.invalidate()
    }
}
