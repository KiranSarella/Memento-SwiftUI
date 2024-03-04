//
//  DocView.swift
//  Memento-Snapshots
//
//  Created by kiran  on 04/03/24.
//

import SwiftUI

struct DocView: View {
    @Binding var state: DocEditorState
    
    var body: some View {
        TextEditor(text: $state.content)
            .padding()
            .font(.system(size: 20))
            .fontWeight(.bold)
    }
}
