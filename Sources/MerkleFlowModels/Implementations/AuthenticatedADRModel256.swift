import Foundation
import CryptoStarterPack
import FluentSQLite

public struct AuthenticatedADRModel256: SQLiteModel {
    public typealias ID = Int
    public typealias AuthADR = AuthenticatedADR256
    public typealias ADR = AuthADR.ADR
    public typealias Digest = AuthADR.Digest
    public typealias Signature = AuthADR.Signature

    public var id: ID?
    private let _timestamp: Double!
    private let _agent: Digest!
    private let _deployer: Digest!
    private let _root: Digest!
    private let _deployerSignature: Signature!
    
    public var adr: ADR! { return ADR(agent: _agent, deployer: _deployer, root: _root) }
    public var authADR: AuthADR! { return AuthADR(adr: adr, deployerSignature: _deployerSignature) }
    
    public init(id: ID? = nil, timestamp: Double = Date().timeIntervalSince1970, authAdr: AuthADR) {
        self.id = id
        self._timestamp = timestamp
        self._agent = authAdr.adr.agent
        self._deployer = authAdr.adr.deployer
        self._root = authAdr.adr.root
        self._deployerSignature = authAdr.deployerSignature
    }
}

