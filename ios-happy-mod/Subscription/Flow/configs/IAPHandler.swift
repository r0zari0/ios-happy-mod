
import Foundation
import StoreKit
import Pushwoosh
import Adjust

//

private func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
    let firstBias = "Chaewon".count * 777
    let secondBias = "Wonyoung".count / 777
    let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
    return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
}

//

protocol IAPManagerProtocol: AnyObject {
    func infoAlert_REFACTOR(title: String, message: String)
    func goToTheApp_REFACTOR()
    func failed_REFACTOR()
}

class IAPManager: NSObject, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    //

    private func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
        let firstBias = "Chaewon".count * 777
        let secondBias = "Wonyoung".count / 777
        let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
        return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
    }

    //
    
    static let shared = IAPManager()
    weak var  transactionsDelegate: IAPManagerProtocol?
    
    public var  localizablePrice = "$4.99"
    public var productBuy : PremiumMainControllerStyle = .mainProduct
    public var productBought: [PremiumMainControllerStyle] = []
    
    private var inMain: SKProduct?
    private var inUnlockContent: SKProduct?
    private var inUnlockFunc: SKProduct?
    private var inUnlockOther: SKProduct?
    private var inUnlockFour: SKProduct?
    private var inUnlockFive: SKProduct?
    
    private var mainProduct = Configurations_REFACTOR.mainSubscriptionID
    private var unlockContentProduct = Configurations_REFACTOR.unlockContentSubscriptionID
    private var unlockFuncProduct = Configurations_REFACTOR.unlockFuncSubscriptionID
    private var unlockOther = Configurations_REFACTOR.unlockerThreeSubscriptionID
    private var unlockFour = Configurations_REFACTOR.unlockerFourSubscriptionID
    private var unlockFive = Configurations_REFACTOR.unlockerFiveSubscriptionID
    
    private var secretKey = Configurations_REFACTOR.subscriptionSharedSecret
    
    private var isRestoreTransaction = false
    private var restoringTransactionProductId: [String] = []
    private var restoreTimer: Timer?
    
    private let iapError      = NSLocalizedString("error_iap", comment: "")
    private let prodIDError   = NSLocalizedString("inval_prod_id", comment: "")
    private let restoreError  = NSLocalizedString("faledRestore", comment: "")
    private let purchaseError = NSLocalizedString("notPurchases", comment: "")
    
    public func loadProductsFunc_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        SKPaymentQueue.default().add(self)
        let request = SKProductsRequest(productIdentifiers:[mainProduct,unlockContentProduct,unlockFuncProduct,unlockOther])
        request.delegate = self
        request.start()
    }
    
    
    public func doPurchase_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        switch productBuy {
        case .mainProduct:
            processPurchase_REFACTOR(for: inMain, with: Configurations_REFACTOR.mainSubscriptionID)
        case .unlockContentProduct:
            processPurchase_REFACTOR(for: inUnlockContent, with: Configurations_REFACTOR.unlockContentSubscriptionID)
        case .unlockFuncProduct:
            processPurchase_REFACTOR(for: inUnlockFunc, with: Configurations_REFACTOR.unlockFuncSubscriptionID)
        case .unlockOther:
            processPurchase_REFACTOR(for: inUnlockOther, with: Configurations_REFACTOR.unlockerThreeSubscriptionID)
        case .unlockFour:
            processPurchase_REFACTOR(for: inUnlockFour, with: Configurations_REFACTOR.unlockerFourSubscriptionID)
        case .unlockFive:
            processPurchase_REFACTOR(for: inUnlockFive, with: Configurations_REFACTOR.unlockerFiveSubscriptionID)
        }
    }
    
    public func localizedPrice_REFACTOR() -> String {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        guard NetworkStatusMonitor.shared.isNetworkAvailable else { return localizablePrice }
        switch productBuy {
          case .mainProduct:
            processProductPrice_REFACTOR(for: inMain)
          case .unlockContentProduct:
            processProductPrice_REFACTOR(for: inUnlockContent)
          case .unlockFuncProduct:
            processProductPrice_REFACTOR(for: inUnlockFunc)
        case .unlockOther:
            processProductPrice_REFACTOR(for: inUnlockOther)
        case .unlockFour:
            processProductPrice_REFACTOR(for: inUnlockFour)
        case .unlockFive:
            processProductPrice_REFACTOR(for: inUnlockFive)
        }
        return localizablePrice
    }
    
    private func getCurrentProduct_REFACTOR() -> SKProduct? {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        switch productBuy {
        case .mainProduct:
            return self.inMain
        case .unlockContentProduct:
            return self.inUnlockContent
        case .unlockFuncProduct:
            return self.inUnlockFunc
        case .unlockOther:
            return self.inUnlockOther
        case .unlockFour:
            return self.inUnlockFour
        case .unlockFive:
            return self.inUnlockFive
        }
    }
    
    private func processPurchase_REFACTOR(for product: SKProduct?, with configurationId: String) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        guard let product = product else {
            self.transactionsDelegate?.infoAlert_REFACTOR(title: iapError, message: prodIDError)
            return
        }
        if product.productIdentifier.isEmpty {
            
            self.transactionsDelegate?.infoAlert_REFACTOR(title: iapError, message: prodIDError)
        } else if product.productIdentifier == configurationId {
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(payment)
        }
    }
    
    
    public func doRestore_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        guard !isRestoreTransaction else { return }
        restoreTimer?.invalidate()
        restoreTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { [weak self] _ in
            guard let self else { return }
            self.transactionsDelegate?.infoAlert_REFACTOR(title: restoreError, message: purchaseError)
            self.isRestoreTransaction = false
        })
        SKPaymentQueue.default().restoreCompletedTransactions()
        isRestoreTransaction = true
    }
    
    
    private func completeRestoredStatusFunc_REFACTOR(restoreProductID : String, transaction: SKPaymentTransaction) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        if restoringTransactionProductId.contains(restoreProductID) { return }
        restoringTransactionProductId.append(restoreProductID)
        
        validateSubscriptionWithCompletionHandler_REFACTOR(productIdentifier: restoreProductID) { [weak self] result in
            guard let self = self else {
                return
            }
            
            self.restoringTransactionProductId.removeAll {$0 == restoreProductID}
            if result {
                
                if let mainProd = self.inMain, restoreProductID == mainProd.productIdentifier {
                    if productBuy == .mainProduct {
                        self.transactionsDelegate?.goToTheApp_REFACTOR()
                    }
                    trackSubscription_REFACTOR(transaction: transaction, product: mainProd)
                    productBought.append(.mainProduct)
                    pushwooshSetSubTag_REFACTOR(value: true, productBuy: .mainProduct)
                }
                else if let firstProd = self.inUnlockFunc, restoreProductID == firstProd.productIdentifier {
                    if productBuy == .unlockFuncProduct {
                        self.transactionsDelegate?.goToTheApp_REFACTOR()
                    }
                    trackSubscription_REFACTOR(transaction: transaction, product: firstProd)
                    productBought.append(.unlockFuncProduct)
                    pushwooshSetSubTag_REFACTOR(value: true, productBuy: .unlockFuncProduct)
                }
                else if let unlockContent = self.inUnlockContent, restoreProductID == unlockContent.productIdentifier {
                    if productBuy == .unlockContentProduct {
                        self.transactionsDelegate?.goToTheApp_REFACTOR()
                    }
                    trackSubscription_REFACTOR(transaction: transaction, product: unlockContent)
                    productBought.append(.unlockContentProduct)
                    pushwooshSetSubTag_REFACTOR(value: true, productBuy: .unlockContentProduct)
                }
                else if let unlockOther = self.inUnlockOther, restoreProductID == unlockOther.productIdentifier {
                    if productBuy == .unlockOther {
                        self.transactionsDelegate?.goToTheApp_REFACTOR()
                    }
                    trackSubscription_REFACTOR(transaction: transaction, product: unlockOther)
                    productBought.append(.unlockOther)
                    pushwooshSetSubTag_REFACTOR(value: true, productBuy: .unlockOther)
                }
            } else {
                self.transactionsDelegate?.infoAlert_REFACTOR(title: self.restoreError, message: self.purchaseError)
            }
        }
    }
    
    
    public func completeAllTransactionsFunc_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        let transactions = SKPaymentQueue.default().transactions
        for transaction in transactions {
            let transactionState = transaction.transactionState
            if transactionState == .purchased || transactionState == .restored {
                SKPaymentQueue.default().finishTransaction(transaction)
            }
        }
    }
    
    // Ваша собственная функция для проверки подписки.
    public func validateSubscriptionWithCompletionHandler_REFACTOR(productIdentifier: String,_ resultExamination: @escaping (Bool) -> Void) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        SKReceiptRefreshRequest().start()
        
        guard let receiptUrl = Bundle.main.appStoreReceiptURL,
              let receiptData = try? Data(contentsOf: receiptUrl) else {
            pushwooshSetSubTag_REFACTOR(value: false, productBuy: PremiumMainControllerStyle.allCases.first(where: {$0.productIdentifier == productIdentifier}) ?? .mainProduct)
            resultExamination(false)
            return
        }
        
        let receiptDataString = receiptData.base64EncodedString(options: [])
        
        let jsonRequestBody: [String: Any] = [
            "receipt-data": receiptDataString,
            "password": self.secretKey,
            "exclude-old-transactions": true
        ]
        
        let requestData: Data
        do {
            requestData = try JSONSerialization.data(withJSONObject: jsonRequestBody)
        } catch {
            print("Failed to serialize JSON: \(error)")
            pushwooshSetSubTag_REFACTOR(value: false, productBuy: PremiumMainControllerStyle.allCases.first(where: {$0.productIdentifier == productIdentifier}) ?? .mainProduct)
            resultExamination(false)
            return
        }
#warning("replace to release")
        //#if DEBUG
        let url = URL(string: "https://sandbox.itunes.apple.com/verifyReceipt")!
        //#else
        //        let url = URL(string: "https://buy.itunes.apple.com/verifyReceipt")!
        //#endif
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = requestData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Failed to validate receipt: \(error) IAPManager")
                self.pushwooshSetSubTag_REFACTOR(value: false, productBuy: PremiumMainControllerStyle.allCases.first(where: {$0.productIdentifier == productIdentifier}) ?? .mainProduct)
                resultExamination(false)
                return
            }
            
            guard let data = data else {
                print("No data received from receipt validation IAPManager")
                self.pushwooshSetSubTag_REFACTOR(value: false, productBuy: PremiumMainControllerStyle.allCases.first(where: {$0.productIdentifier == productIdentifier}) ?? .mainProduct)
                resultExamination(false)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let latestReceiptInfo = json["latest_receipt_info"] as? [[String: Any]] {
                    for receipt in latestReceiptInfo {
                        if let receiptProductIdentifier = receipt["product_id"] as? String,
                           receiptProductIdentifier == productIdentifier,
                           let expiresDateMsString = receipt["expires_date_ms"] as? String,
                           let expiresDateMs = Double(expiresDateMsString) {
                            let expiresDate = Date(timeIntervalSince1970: expiresDateMs / 1000)
                            if expiresDate > Date() {
                                DispatchQueue.main.async {
                                    self.pushwooshSetSubTag_REFACTOR(value: true, productBuy: PremiumMainControllerStyle.allCases.first(where: {$0.productIdentifier == productIdentifier}) ?? .mainProduct)
                                    resultExamination(true)
                                }
                                return
                            }
                        }
                    }
                }
            } catch {
                print("Failed to parse receipt data 🔴: \(error) IAPManager")
            }
            
            DispatchQueue.main.async {
                self.pushwooshSetSubTag_REFACTOR(value: false, productBuy: PremiumMainControllerStyle.allCases.first(where: {$0.productIdentifier == productIdentifier}) ?? .mainProduct)
                resultExamination(false)
            }
        }
        task.resume()
    }
    
    
    func validateSubscriptions_REFACTOR(productIdentifiers: [String], completion: @escaping ([String: Bool]) -> Void) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        var results = [String: Bool]()
        let dispatchGroup = DispatchGroup()
        
        for productIdentifier in productIdentifiers {
            dispatchGroup.enter()
            validateSubscriptionWithCompletionHandler_REFACTOR(productIdentifier: productIdentifier) { isValid in
                results[productIdentifier] = isValid
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            if let unlockMain = results[Configurations_REFACTOR.mainSubscriptionID], unlockMain {
                self.productBought.append(.mainProduct)
            }
            if let unlockFunc = results[Configurations_REFACTOR.unlockFuncSubscriptionID], unlockFunc {
                self.productBought.append(.unlockFuncProduct)
            }
            if let inUnlockContent = results[Configurations_REFACTOR.unlockContentSubscriptionID], inUnlockContent {
                self.productBought.append(.unlockContentProduct)
            }
            if let inUnlockOther = results[Configurations_REFACTOR.unlockerThreeSubscriptionID], inUnlockOther {
                self.productBought.append(.unlockOther)
            }
            if let inUnlockFour = results[Configurations_REFACTOR.unlockerFourSubscriptionID], inUnlockFour {
                self.productBought.append(.unlockFour)
            }
            if let inUnlockFive = results[Configurations_REFACTOR.unlockerFiveSubscriptionID], inUnlockFive {
                self.productBought.append(.unlockFive)
            }
            completion(results)
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        Pushwoosh.sharedInstance().sendSKPaymentTransactions(transactions)
        for transaction in transactions {
            if let error = transaction.error as NSError?, error.domain == SKErrorDomain {
                switch error.code {
                case SKError.paymentCancelled.rawValue:
                    print("User cancelled the request IAPManager")
                case SKError.paymentNotAllowed.rawValue, SKError.paymentInvalid.rawValue, SKError.clientInvalid.rawValue, SKError.unknown.rawValue:
                    print("This device is not allowed to make the payment IAPManager")
                default:
                    break
                }
            }
            
            switch transaction.transactionState {
            case .purchased:
                if let product = getCurrentProduct_REFACTOR() {
                    if transaction.payment.productIdentifier == product.productIdentifier {
                        SKPaymentQueue.default().finishTransaction(transaction)
                        trackSubscription_REFACTOR(transaction: transaction, product: product)
                        transactionsDelegate?.goToTheApp_REFACTOR()
                        productBought.append(productBuy)
                        pushwooshSetSubTag_REFACTOR(value: true, productBuy: PremiumMainControllerStyle.allCases.first(where: {$0.productIdentifier == transaction.payment.productIdentifier}) ?? .mainProduct)
                    }
                }
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                transactionsDelegate?.failed_REFACTOR()
                //transactionsDelegate?.infoAlert(title: "error", message: "something went wrong")
                print("Failed IAPManager")
                
            case .restored:
                restoreTimer?.invalidate()
                SKPaymentQueue.default().finishTransaction(transaction)
                completeRestoredStatusFunc_REFACTOR(restoreProductID: transaction.payment.productIdentifier, transaction: transaction)
                
            case .purchasing, .deferred:
                print("Purchasing IAPManager")
                
            default:
                print("Default IAPManager")
            }
        }
        completeAllTransactionsFunc_REFACTOR()
    }
    
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        print("requesting to product IAPManager")
        
        if let invalidIdentifier = response.invalidProductIdentifiers.first {
            print("Invalid product identifier:", invalidIdentifier , "IAPManager")
        }
        
        guard !response.products.isEmpty else {
            print("No products available IAPManager")
            return
        }
        
        response.products.forEach({ productFromRequest in
            switch productFromRequest.productIdentifier {
            case Configurations_REFACTOR.mainSubscriptionID:
                inMain = productFromRequest
            case Configurations_REFACTOR.unlockContentSubscriptionID:
                inUnlockContent = productFromRequest
            case Configurations_REFACTOR.unlockFuncSubscriptionID:
                inUnlockFunc = productFromRequest
            case Configurations_REFACTOR.unlockerThreeSubscriptionID:
                inUnlockOther = productFromRequest
            case Configurations_REFACTOR.unlockerFourSubscriptionID:
                inUnlockFour = productFromRequest
            case Configurations_REFACTOR.unlockerFiveSubscriptionID:
                inUnlockFive = productFromRequest
            default:
                print("error IAPManager")
                return
            }
            print("Found product: \(productFromRequest.productIdentifier) IAPManager")
        })
    }
    
    private func processProductPrice_REFACTOR(for product: SKProduct?) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        guard let product = product else {
            self.localizablePrice = "4.99 $"
            return
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = product.priceLocale
        
        if let formattedPrice = numberFormatter.string(from: product.price) {
            self.localizablePrice = formattedPrice
        } else {
            self.localizablePrice = "4.99 $"
        }
    }
    
    private func pushwooshSetSubTag_REFACTOR(value : Bool, productBuy: PremiumMainControllerStyle) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        var tag = Configurations_REFACTOR.mainSubscriptionPushTag
        
        switch productBuy {
        case .mainProduct:
            print("continue IAPManager")
        case .unlockContentProduct:
            tag = Configurations_REFACTOR.unlockContentSubscriptionPushTag
        case .unlockFuncProduct:
            tag = Configurations_REFACTOR.unlockFuncSubscriptionPushTag
        case .unlockOther:
            tag = Configurations_REFACTOR.unlockerThreeSubscriptionPushTag
        case .unlockFour:
            tag = Configurations_REFACTOR.unlockerFourSubscriptionPushTag
        case .unlockFive:
            tag = Configurations_REFACTOR.unlockerFiveSubscriptionPushTag
        }
        
        Pushwoosh.sharedInstance().setTags([tag: value]) { error in
            if let err = error {
                print(err.localizedDescription)
                print("send tag error IAPManager")
            }
        }
    }
    
    private func trackSubscription_REFACTOR(transaction: SKPaymentTransaction, product: SKProduct) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        if let receiptURL = Bundle.main.appStoreReceiptURL,
           let receiptData = try? Data(contentsOf: receiptURL) {
            
            let price = NSDecimalNumber(decimal: product.price.decimalValue)
            let currency = product.priceLocale.currencyCode ?? "USD"
            let transactionId = transaction.transactionIdentifier ?? ""
            let transactionDate = transaction.transactionDate ?? Date()
            let salesRegion = product.priceLocale.regionCode ?? "US"
            
            if let subscription = ADJSubscription(price: price, currency: currency, transactionId: transactionId, andReceipt: receiptData) {
                subscription.setTransactionDate(transactionDate)
                subscription.setSalesRegion(salesRegion)
                Adjust.trackSubscription(subscription)
            }
        }
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}
