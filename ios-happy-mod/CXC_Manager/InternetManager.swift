
import SystemConfiguration

final class InternetManager {
    
    static let shared = InternetManager()
    
    private init() {}
    
    func checkInternetConnectivity() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability_KLNM = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability_KLNM, &flags) {
            return false
        }
        
        let isReachable_KLNM = flags.contains(.reachable)
        let needsConnection_KLNM = flags.contains(.connectionRequired)
        
        if isReachable_KLNM && !needsConnection_KLNM {
            // Connected to the internet
            // Do your network-related tasks here
            return true
        } else {
            // Not connected to the internet
            return false
        }
    }
}
