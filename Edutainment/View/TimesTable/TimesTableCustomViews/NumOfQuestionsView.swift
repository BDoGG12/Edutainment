//
//  NumOfQuestionsView.swift
//  Edutainment
//
//  Created by Ben Do on 12/6/25.
//

import SwiftUI

struct NumOfQuestionsView: View {
    var label: String?
    @Binding var numOfQuestions: Int
    
    var body: some View {
        // Label for the Times Table Selection
        Text(label ?? "Label")
            .font(.headline.weight(.bold))
            .padding()
        Picker("Times Table Selection", selection: $numOfQuestions) {
            Text("5").tag(5)
            Text("10").tag(10)
            Text("20").tag(20)
        }
    }
}

#Preview {
    NumOfQuestionsView(numOfQuestions: Binding.constant(5))
}
