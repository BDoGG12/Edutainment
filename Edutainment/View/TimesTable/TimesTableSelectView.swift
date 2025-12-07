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
    @State private var player = Player(selectedNumber: 1, numOfQuestions: 5, playerScore: 0)
    
    var body: some View {
        NavigationStack {
            // Label for the View
            VStack {
                // Times Table Selection
                HStack {
                    // Label for the Times Table Selection
                    Text("Select a Times Table Number")
                        .font(.headline.weight(.bold))
                        .padding()
                    Picker("Times Table Selection", selection: $selectedNumber) {
                        ForEach(2...12, id: \.self) { number in
                            Text("\(number)")
                        }
                    }
                    .onChange(of: selectedNumber) { newValue in
                        print(newValue)
                        self.player.selectedNumber = newValue
                    }
                }
                .padding()
                
                // Number of Questions Section
                HStack {
                    Text("Select Number of Questions")
                        .font(.headline.weight(.bold))
                        .padding()
                    Picker("Number of Questions", selection: $numOfQuestions) {
                        Text("5").tag(5)
                        Text("10").tag(10)
                        Text("20").tag(20)
                    }
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
