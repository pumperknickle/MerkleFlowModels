import Foundation
import CryptoStarterPack

public protocol AgentDeployerRoot: CryptoHashable, Codable {
    associatedtype HashDelegate: CryptoDelegate // must output boolean array compatible with digest
    var agent: Digest! { get }
    var deployer: Digest! { get }
    var root: Digest! { get }
    init(agent: Digest, deployer: Digest, root: Digest)
}

public extension AgentDeployerRoot {
    func hash() -> Digest? {
        guard let objectData = try? JSONEncoder().encode(self) else { return nil }
        guard let hashOutput = HashDelegate.hash(objectData) else { return nil }
        return Digest(raw: hashOutput)
    }
}
