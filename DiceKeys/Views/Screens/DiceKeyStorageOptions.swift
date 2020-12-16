//
//  DiceKeyStorageOptions.swift
//  DiceKeys
//
//  Created by Stuart Schechter on 2020/11/28.
//

import SwiftUI

struct DiceKeyStorageOptions: View {
    let diceKey: DiceKey
    @ObservedObject var diceKeyState: UnlockedDiceKeyState
    let done: (() -> Void)?

    init(diceKey: DiceKey, done: (() -> Void)? = nil) {
        self.diceKey = diceKey
        self.done = done
        self._diceKeyState = ObservedObject(initialValue: UnlockedDiceKeyState.forDiceKey(diceKey))
    }

    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
            Spacer()
            VStack {
                Spacer()
                Toggle(isOn: diceKeyState.isDiceKeyStoredBinding ) {
                    HStack {
                        Spacer()
                        VStack {
                            ZStack {
                                Image("Phonelet").resizable().aspectRatio(contentMode: .fit)
                                //.frame(width: geometry.size.shorterSide / 2.5)
                                .background(
                                    DiceKeyView(diceKey: diceKey, diceBoxColor: Color.alexandrasBlue, diePenColor: Color.alexandrasBlue).scaleEffect(0.8)
                                )
                            }
                            Text("Store the DiceKey").font(.title).bold().padding(.top, 3)
                            VStack(alignment: .leading) {
                                Text("The center die will appear in the home screen.").font(.title2)
                                Text("The other 24 dice will be encrypted, and your TouchID, FaceID, or PIN will unlock them.").font(.title2)
                                    .padding(.top, 5)
                            }.padding(.vertical, 5)
                        }.padding(.vertical, 10)
                        Spacer()
                    }
                }
                Spacer()
            }
            Spacer()
        }
        Button(action: { done?() }, label: { Text("Done") }).padding(.bottom, 20)
    }
}

struct DiceKeyStorageOptions_Previews: PreviewProvider {
    static let diceKey = DiceKey.createFromRandom()
    @StateObject static var diceKeyState = UnlockedDiceKeyState.forDiceKey(diceKey)

    static var previews: some View {
        DiceKeyStorageOptions(diceKey: diceKey)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
    }
}
