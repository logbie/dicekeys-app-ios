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
        case savedDerivationRecipes
    }

    @UserDefault(Fields.savedDerivationRecipes.rawValue, "") private var savedDerivationRecipesJson: String

    var savedDerivationRecipes: [DerivationRecipe] {
        get {
            return savedDerivationRecipesJson == "" ? [] :
                (try? DerivationRecipe.listFromJson(savedDerivationRecipesJson)) ?? []
        } set {
            if let derivablesJson = try? DerivationRecipe.listToJson(newValue) {
                self.savedDerivationRecipesJson = derivablesJson
                self.objectWillChange.send()
            }
        }
    }

    func saveRecipe(_ recipeToSave: DerivationRecipe?) {
        guard let recipe = recipeToSave else { return }
        if savedDerivationRecipes.allSatisfy({ $0.id != recipe.id }) {
            self.savedDerivationRecipes = (
                self.savedDerivationRecipes + [recipe]
            )
            .sorted(by: { a, b in a.id < b.id })
            self.objectWillChange.send()
        }
    }

    func removeRecipe(_ recipeId: String) {
        self.savedDerivationRecipes = savedDerivationRecipes.filter { $0.id != recipeId }
    }
    func removeRecipe(_ recipe: DerivationRecipe?) {
        if let recipeId = recipe?.id {
            removeRecipe(recipeId)
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