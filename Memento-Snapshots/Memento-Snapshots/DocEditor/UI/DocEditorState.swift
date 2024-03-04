//
//  MementoState.swift
//  Memento-Snapshots
//
//  Created by kiran  on 03/03/24.
//

import Foundation

struct SnapshotUI: Identifiable, Hashable {
    let id: UUID
    let data: Snapshot
    
    static func == (lhs: SnapshotUI, rhs: SnapshotUI) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into myhasher: inout Hasher) {
       // Using id to uniquely identify each person.
        myhasher.combine(id)
    }
    
}


@Observable
class DocEditorState {
    var content: String = "# Memento"
    var snapshots = [SnapshotUI]()
    let business = DocEditorBusiness()
    
    func createSnapshot() {
        let snapshot = business.saveDocCurrentState(for: content)
        snapshots.append(SnapshotUI(id: snapshot.id, data: snapshot))
    }
    
    func restore(snapshot: Snapshot) {
        if let content = business.restoreDocToOldState(snapshot: snapshot) {
            self.content = content
        }
    }
    
}

