//
//  EditorBusiness.swift
//  Memento-Snapshots
//
//  Created by kiran  on 03/03/24.
//

import Foundation

struct DocCurrentState: Hashable {
    var content: String
}

class DocBusiness {
    let mementoCreator = SnapshotOriginator()
    
    func prepareSnapshot(for content: String) -> Snapshot {
        let state = DocCurrentState(content: content)
        return mementoCreator.createSnapshot(for: state)
    }
    
    func restore(snapshot: Snapshot) -> String? {
        mementoCreator.getDocState(for: snapshot)?.content
    }
    
}



