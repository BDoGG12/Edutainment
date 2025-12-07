//
//  QuestionsView.swift
//  Edutainment
//
//  Created by Ben Do on 12/6/25.
//

import SwiftUI

struct QuestionsView: View {
    var player: Player?
    @State private var answer = ""
    @State private var score = 0
    @State private var questionNumber = 1
    @State private var isCorrect: Bool = false
    @State private var nextPressed: Bool = false
    @State private var gameOver: Bool = false
    
    var body: some View {
        VStack {
            // Label for Questions View
            Text("\(player?.selectedNumber ?? 2) x \(questionNumber) = ?")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Enter your answer here...", text: $answer)
                .textFieldStyle(.roundedBorder)
                .padding()
                .keyboardType(.numberPad)
            // Submit to go to the next question until the last question
            Button("Next") {
                print(answer)
                checkAnswer()
                
            }
            .disabled(answer.isEmpty)
            .alert(isPresented: $nextPressed) {
                if isCorrect {
                    return Alert(title: Text("Correct!"), message: Text("Keep going!"))
                } else {
                    return Alert(title: Text("Oops!"), message: Text("Try again!"))
                }
            }
        }
    }
    
    func incrementQuestionNumber() {
        if (questionNumber <= player?.numOfQuestions ?? 0) {
            gameOver = true
        } else {
            questionNumber += 1
            gameOver = false
        }
    }
    
    func checkAnswer() {
        let correctAnswer = (player?.selectedNumber ?? 2) * questionNumber
        let playerAnswer = Int(answer) ?? 0
        if playerAnswer == correctAnswer {
            score += 1
            isCorrect = true
        } else {
            isCorrect = false
        }
        nextPressed = true
    }
}

#Preview {
    QuestionsView()
}
