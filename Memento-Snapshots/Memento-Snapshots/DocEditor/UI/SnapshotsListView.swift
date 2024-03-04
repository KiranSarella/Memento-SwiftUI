//
//  SnapshotsList.swift
//  Memento-Snapshots
//
//  Created by kiran  on 04/03/24.
//

import SwiftUI

struct SnapshotsListView: View {
    @Binding var state: DocEditorState
    @Binding var selection: SnapshotUI?
    
    var body: some View {
        List(state.snapshots,id: \.self, selection: $selection) { snapshot in
            Text(snapshot.data.name)
        }
    }
}
