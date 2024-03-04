//
//  DocEditorBusiness.swift
//  Memento-Snapshots
//
//  Created by kiran  on 04/03/24.
//

import Foundation

class DocEditorBusiness {
    
    let docBusiness = DocBusiness()
    let storage = CloudStorage()
    
    var snapshotCount: Int {
        storage.getSnapshotsCount()
    }
    
    func saveDocCurrentState(for content: String) -> Snapshot {
        let name = "Snapshot \(snapshotCount + 1)"
        var snapshot = docBusiness.prepareSnapshot(for: content)
        snapshot.name = name
        storage.saveSnapshot(snapshot)
        return snapshot
    }
    
    func restoreDocToOldState(snapshot: Snapshot) -> String? {
        docBusiness.restore(snapshot: snapshot)
    }
    
    func getAllSnapshots() -> [Snapshot] {
        storage.getAllSnanshots()
    }
    
}
