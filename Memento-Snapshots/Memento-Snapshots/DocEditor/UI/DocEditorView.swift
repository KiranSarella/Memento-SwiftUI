//
//  ContentView.swift
//  Memento-Snapshots
//
//  Created by kiran  on 03/03/24.
//

import SwiftUI

struct DocEditorView: View {
    @State var state = DocEditorState()
    @State var selection: SnapshotUI?
    
    var body: some View {
        NavigationStack {
            GeometryReader { g in
                VStack {
                    HStack {
                        DocView(state: $state)
                            .frame(width: g.size.width * 0.6)
                        SnapshotsListView(state: $state, selection: $selection)
                    }
                }
                .navigationTitle("Memento Editor")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Create Snapshot", systemImage: "camera") {
                            state.createSnapshot()
                        }
                    }
                })
                .onChange(of: selection) { oldValue, newValue in
                    if let newValue = newValue {
                        state.restore(snapshot: newValue.data)
                    }
                }
                .onAppear {
                    if state.snapshots.count == 0 {
                        state.createSnapshot()
                    }
                }
            }
        }
        
        
    }
}

#Preview {
    DocEditorView()
}
