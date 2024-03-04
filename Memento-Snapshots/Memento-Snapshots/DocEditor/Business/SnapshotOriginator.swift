//
//  Originator.swift
//  Memento-Snapshots
//
//  Created by kiran  on 03/03/24.
//

import Foundation

// public
/// used Boxed instead of Opaque type to give required name for each one.
protocol Snapshot {
    var id: UUID { get }
    var name: String { set get }
}

private protocol DocSnapshot {
    var state: DocCurrentState { set get }
}

private struct Memento: Snapshot, DocSnapshot {
    var id: UUID
    var name: String = ""
    var state: DocCurrentState
}

extension Memento: Hashable {
    
}

class SnapshotOriginator {
    
    func createSnapshot(for state: DocCurrentState) -> Snapshot {
        Memento(id: UUID(), state: state)
    }
   
    func getDocState(for anyMemento: Snapshot) -> DocCurrentState? {
        guard let memento = anyMemento as? DocSnapshot  else { return nil }
        return memento.state
    }
}
