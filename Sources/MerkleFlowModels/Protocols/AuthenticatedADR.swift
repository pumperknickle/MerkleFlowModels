import Foundation
import CryptoStarterPack

public protocol AuthenticatedADR: CryptoHashable, Codable {
    associatedtype ADR: AgentDeployerRoot
    associatedtype Asymmetric: AsymmetricDelegate
    typealias HashDelegate = ADR.HashDelegate
    typealias PrivateKey = Asymmetric.PrivateKey
    typealias Signature = Asymmetric.Signature
    
    var adr: ADR! { get }
    var deployerSignature: Signature! { get }
    
    init(adr: ADR, deployerSignature: Signature)
}

public extension AuthenticatedADR {
    init?(adr: ADR, deployerPrivateKey: PrivateKey) {
        guard let adrData = try? JSONEncoder().encode(adr) else { return nil }
        guard let signature = Asymmetric.sign(message: adrData, privateKey: deployerPrivateKey ) else { return nil }
        self.init(adr: adr, deployerSignature: signature)
    }
    
    func hash() -> Digest? {
        guard let objectData = try? JSONEncoder().encode(self) else { return nil }
        guard let hashOutput = HashDelegate.hash(objectData) else { return nil }
        return Digest(raw: hashOutput)
    }
}
