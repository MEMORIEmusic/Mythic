//
//  OnboardingViewModel.swift
//  Mythic
//
//  Created by vapidinfinity (esi) on 18/10/2025.
//

// Copyright © 2023-2025 vapidinfinity

import Foundation
import SwiftUI
import OSLog
import Combine

extension OnboardingView {
    @MainActor
    @Observable final class ViewModel: ObservableObject, StagedFlow {
        init(initialStage stage: Stage = .welcome) {
            self.currentStage = stage
        }

        let stages = Stage.allCases
        enum Stage: String, CaseIterable, Equatable, Identifiable, Comparable {
            static func < (lhs: OnboardingView.ViewModel.Stage, rhs: OnboardingView.ViewModel.Stage) -> Bool {
                return allCases.firstIndex(of: lhs)! < allCases.firstIndex(of: rhs)!
            }
            
            var id: Self { self }
            case welcome = "Welcome"
            case signin = "Sign In"
            case greetings = "Greetings"
            case rosetta = "Rosetta Installation"
            case engine = "Mythic Engine Installation"
            case defaultContainerSetup = "Default Container Setup"
            case finished = "Finished"
        }

        var currentStage: Stage
        var proportionCompletion: Double {
            guard !stages.isEmpty else { return 0 }
            return Double(currentStageIndex + 1) / Double(stages.count)
        }
        var currentStageIndex: Int { stages.firstIndex(of: currentStage) ?? 0 }

        func stepStage(by delta: Int = 1) {
            let newIndex = currentStageIndex + delta
            guard stages.indices.contains(newIndex) else { return }
            withAnimation(.bouncy) {
                currentStage = stages[newIndex]
            }
        }

        func reset() {
            withAnimation(.bouncy) {
                currentStage = stages.first ?? .welcome
            }
        }
    }
}

#Preview {
    OnboardingView()
        .environmentObject(NetworkMonitor.shared)
}
