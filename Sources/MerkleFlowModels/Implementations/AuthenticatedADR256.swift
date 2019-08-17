import Foundation
import CryptoStarterPack

public struct AuthenticatedADR256 {
    private let _adr: ADR!
    private let _deployerSignature: Signature!
}

extension AuthenticatedADR256: AuthenticatedADR {
    public typealias ADR = ADR256
    public typealias Asymmetric = BaseAsymmetric
    public typealias Digest = UInt256
    
    public var adr: ADR256! { return _adr }
    public var deployerSignature: Signature! { return _deployerSignature }
    
    public init(adr: ADR256, deployerSignature: Data) {
        self._adr = adr
        self._deployerSignature = deployerSignature
    }
}
