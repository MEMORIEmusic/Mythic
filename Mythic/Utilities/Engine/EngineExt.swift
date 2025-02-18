//
//  EngineExt.swift
//  Mythic
//
//  Created by vapidinfinity (esi) on 25/10/2023.
//

// MARK: - Copyright
// Copyright © 2024 vapidinfinity

// This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
// This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
// You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.

// You can fold these comments by pressing [⌃ ⇧ ⌘ ◀︎], unfold with [⌃ ⇧ ⌘ ▶︎]

import Foundation

extension Engine {
    enum Stream: String {
        case stable = "7.7"
        case staging = "staging"
    }

    /// An error indicating that the libraries are already installed.
    struct AlreadyInstalledError: LocalizedError { 
        var errorDescription: String? = "Mythic Engine is already installed."
    }
    
    /// An error indicating that the libraries are not installed.
    struct NotInstalledError: LocalizedError {
        var errorDescription: String? = "Mythic Engine is not installed."
    }
}
