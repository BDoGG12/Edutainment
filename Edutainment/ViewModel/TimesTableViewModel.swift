//
//  TimesTableViewModel.swift
//  Edutainment
//
//  Created by Ben Do on 12/6/25.
//

import Foundation

class TimesTableViewModel: ObservableObject {
    
    var player: Player?
    
    func calculateScore(_ numOfQuestions: Int, _ correctAnswers: Int) -> Double {
        return Double(correctAnswers) / Double(numOfQuestions) * 100
    }
}
