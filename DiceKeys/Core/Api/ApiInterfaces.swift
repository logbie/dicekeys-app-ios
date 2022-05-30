// Auto-generated by dicekeys-api-js/cross-compiling/generate-swift.ts
// Generated on Mon, 15 Feb 2021 08:28:25 GMT
import Foundation

enum ApiCommand: String, Codable, CaseIterable  {
    case generateSignature
    case getPassword
    case getSealingKey
    case getSecret
    case getSigningKey
    case getSignatureVerificationKey
    case getSymmetricKey
    case getUnsealingKey
    case sealWithSymmetricKey
    case unsealWithSymmetricKey
    case unsealWithUnsealingKey
}

enum ApiMetaCommand: String, Codable, CaseIterable {
    case getAuthToken
}

enum Request {
    case generateSignature(message: Data, recipe: String)
    case getPassword(recipe: String, recipeMayBeModified: String)
    case getSealingKey(recipe: String, recipeMayBeModified: String)
    case getSecret(recipe: String, recipeMayBeModified: String)
    case getSigningKey(recipe: String, recipeMayBeModified: String)
    case getSignatureVerificationKey(recipe: String, recipeMayBeModified: String)
    case getSymmetricKey(recipe: String, recipeMayBeModified: String)
    case getUnsealingKey(recipe: String, recipeMayBeModified: String)
    case sealWithSymmetricKey(plaintext: Data, recipe: String, recipeMayBeModified: String, unsealingInstructions: Data)
    case unsealWithSymmetricKey(packagedSealedMessageJson: String)
    case unsealWithUnsealingKey(packagedSealedMessageJson: String)
}

enum MetaInputs: String, Codable, CaseIterable {
    case command
    case requestId
}

enum UrlMetaInputs: String, Codable {
    case authToken
    case respondTo
}

enum SuccessResponse {
    case generateSignature(signature: Data, signatureVerificationKeyJson: String)
    case getPassword(passwordJson: String)
    case getSealingKey(sealingKeyJson: String)
    case getSecret(secretJson: String)
    case getSigningKey(signingKeyJson: String)
    case getSignatureVerificationKey(signatureVerificationKeyJson: String)
    case getSymmetricKey(symmetricKeyJson: String)
    case getUnsealingKey(unsealingKeyJson: String)
    case sealWithSymmetricKey(packagedSealedMessageJson: String)
    case unsealWithSymmetricKey(plaintext: Data)
    case unsealWithUnsealingKey(plaintext: Data)
}

enum MetaOutput: String, Codable, CaseIterable {
    case requestId
    case centerLetterAndDigit
}

enum ExceptionMetaOutput: String, Codable, CaseIterable {
    case exception
    case message
    case stack
}
