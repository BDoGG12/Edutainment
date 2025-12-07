//
//  TimesTableSelectView.swift
//  Edutainment
//
//  Created by Ben Do on 12/6/25.
//

import SwiftUI

struct TimesTableSelectView: View {
    @State private var selectedNumber: Int = 2
    @State private var numOfQuestions: Int = 5
    @State private var player = Player(selectedNumber: 2, numOfQuestions: 5, playerScore: 0)
    
    var body: some View {
        NavigationStack {
            // Label for the View
            VStack {
                // Times Table Selection
                HStack {
                    TimesTableNumberView(label: "Select a Times Table Number", selectedNumber: $selectedNumber)
                    .onChange(of: selectedNumber) { newValue in
                        print(newValue)
                        self.player.selectedNumber = newValue
                    }
                }
                .padding()
                
                // Number of Questions Section
                HStack {
                    NumOfQuestionsView(label: "Select Number of Questions", numOfQuestions: $numOfQuestions)
                    .onChange(of: numOfQuestions) { newValue in
                        self.player.numOfQuestions = newValue
                    }
                }
                NavigationLink("Begin", destination: QuestionsView(player: player))
            }
            .navigationTitle(Text("Times Table Select"))
        }
        
    }
}

#Preview {
    TimesTableSelectView()
}
