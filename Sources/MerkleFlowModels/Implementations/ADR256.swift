import Foundation
import CryptoStarterPack

public struct ADR256 {
    public typealias HashDelegate = BaseCrypto
    public typealias Digest = UInt256
    private let _agent: Digest!
    private let _deployer: Digest!
    private let _root: Digest!
}

extension ADR256: AgentDeployerRoot {
    public var agent: UInt256! { return _agent }
    public var deployer: UInt256! { return _deployer }
    public var root: UInt256! { return _root }
    
    public init(agent: UInt256, deployer: UInt256, root: UInt256) {
        self._agent = agent
        self._deployer = deployer
        self._root = root
    }
}
