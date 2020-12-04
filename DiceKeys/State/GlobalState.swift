//
//  DefaultsStore.swift
//  DiceKeys
//
//  Created by Stuart Schechter on 2020/11/30.
//

import Foundation
import Combine
import SwiftUI

struct KnownDiceKeyIdentifiable: Identifiable {
    let id: String
}

final class GlobalState: ObservableObjectUpdatingOnAllChangesToUserDefaults {
    static private(set) var instance = GlobalState()

    enum Fields: String {
        case knownDiceKeys
        case neverAskUserToSave
        case derivablesJson
    }

    @UserDefault(Fields.derivablesJson.rawValue, "") private var derivablesJson: String

    var derivables: [Derivable] {
        get {
            return derivablesJson == "" ? PasswordDerivable :
                (try? Derivable.listFromJson(derivablesJson)) ?? PasswordDerivable
        } set {
            if let derivablesJson = try? Derivable.listToJson(newValue) {
                self.derivablesJson = derivablesJson
            }
        }
    }

    @UserDefault(Fields.knownDiceKeys.rawValue, []) private(set) var knownDiceKeys: [String]

    func addKnownDiceKey(keyId: String) {
        if !knownDiceKeys.contains(keyId) {
            self.knownDiceKeys = knownDiceKeys + [keyId]
        }
    }
    func removeKnownDiceKey(keyId: String) {
        self.knownDiceKeys = knownDiceKeys.filter { $0 != keyId }
    }

    var knownDiceKeysIdentifiable: [KnownDiceKeyIdentifiable] {
        knownDiceKeys.map { KnownDiceKeyIdentifiable(id: $0) }
    }

    @UserDefault(Fields.neverAskUserToSave.rawValue, false) var neverAskUserToSave: Bool
}
