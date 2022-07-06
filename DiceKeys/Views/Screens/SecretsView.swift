//
//  SecretsView.swift
//  DiceKeys
//
//  Created by Angelos Veglektsis on 7/6/22.
//

import SwiftUI

struct SecretsView: View {
    @EnvironmentObject var derivationRecipeStore: DerivationRecipeStore
    
    let navigateTo: (DiceKeyPresentPageContent) -> Void
    
    var body: some View {
        
        List{
            if(derivationRecipeStore.savedDerivationRecipes.count > 0){
                Section(header: Text("Saved Recipes")) {
                    ForEach(derivationRecipeStore.savedDerivationRecipes) { recipe in
                        HStack{
                            Text(recipe.name)
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture(perform: {
                            navigateTo(.Derive(DerivationRecipeBuilderType.recipe(recipe)))
                        })
                    }
                }
            }

            Section(header: Text("Built-in Recipes")) {
                ForEach(derivablePasswordTemplates) { template in
                    HStack{
                        Text(template.name)
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture(perform: {
                        navigateTo(.Derive(DerivationRecipeBuilderType.template(template)))
                    })
                }
            }
            
            Section(header: Text("Custom Recipe")) {
                HStack{
                    Text("Password")
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture(perform: {
                    navigateTo(.Derive(DerivationRecipeBuilderType.customFromUrl(.Password)))
                })
            }
        }
    }
}

struct SecretsView_Previews: PreviewProvider {
    
    static var previews: some View {
        SecretsView(navigateTo: { _ in
            
        })
        .environmentObject(DerivationRecipeStore())
    }
}
