//
//  BackupBackupStorage.swift
//  Memento-Snapshots
//
//  Created by kiran  on 03/03/24.
//

import Foundation

class CloudStorage {
    
    private var someCloudStorage = [Snapshot]()
    
    func saveSnapshot(_ data: Snapshot) {
        someCloudStorage.append(data)
    }
    
    func getAllSnanshots() -> [Snapshot] {
        someCloudStorage
    }
    
    func getSnapshotsCount() -> Int {
        someCloudStorage.count
    }
}
