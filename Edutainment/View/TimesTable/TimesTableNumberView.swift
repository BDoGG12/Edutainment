//
//  TimesTableNumberView.swift
//  Edutainment
//
//  Created by Ben Do on 12/6/25.
//

import SwiftUI

struct TimesTableNumberView: View {
    var label: String?
    @Binding var selectedNumber: Int
    
    var body: some View {
        // Label for the Times Table Selection
        Text(label ?? "Label")
            .font(.headline.weight(.bold))
            .padding()
        Picker("Times Table Selection", selection: $selectedNumber) {
            ForEach(2...12, id: \.self) { number in
                Text("\(number)")
            }
        }
    }
}

#Preview {
    TimesTableNumberView(selectedNumber: Binding.constant(2))
}
