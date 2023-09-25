import UIKit
import Flutter
import PayUCheckoutProKit
import PayUCheckoutProBaseKit
import PayUParamsKit
import PayUBizCoreKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate,PayUCheckoutProDelegate {
//@objc class AppDelegate: FlutterAppDelegate{
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
          let paymentChannel = FlutterMethodChannel(name: "paymentsChannel",
                                                    binaryMessenger: controller.binaryMessenger)

      paymentChannel.setMethodCallHandler({
           (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
           // This method is invoked on the UI thread.
           // Handle battery messages.
          guard call.method == "makePayment" else {
             result(FlutterMethodNotImplemented)
             return
           }


          self.makePayment(arguments:call.arguments)
         })
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }


    let indexKeySalt = 0

        let keySalt = [["Rklz3O", "SMznAbdBnkDIVXqWUb9MvFcOv5bzB9bD", Environment.production],
                       ["3RozPA", "g4RzXdFq6SskDEOF8xdpmcutWzE8GxCU", Environment.test]]

    var hashstr : String = ""

    private func makePayment(arguments:Any?) {

        let payUConfig = PayUCheckoutProConfig()
        PayUCheckoutPro.open(on: window.rootViewController!, paymentParam: self.getPaymentParam(arguments:arguments), config: payUConfig, delegate: self)

    }
//

    private func getPaymentParam(arguments:Any?) -> PayUPaymentParam{

          //  let hashes = PayUModelHashes()
        let argsMap = arguments as! NSDictionary;
        let amount = argsMap.value(forKey: "amount") as! String
        let key = argsMap.value(forKey: "key") as! String
        let salt = argsMap.value(forKey: "salt") as! String
        let product = argsMap.value(forKey: "product") as! String
        let phone = argsMap.value(forKey: "phone") as! String
        let transactionId = argsMap.value(forKey: "transactionId") as! String
        let firstname = argsMap.value(forKey: "firstname") as! String
        let email = argsMap.value(forKey: "email") as! String
        let surl = argsMap.value(forKey: "surl") as! String
        let furl = argsMap.value(forKey: "furl") as! String
        let udf1 = argsMap.value(forKey: "udf1") as! String
        let udf2 = argsMap.value(forKey: "udf2") as! String
        let udf5 = argsMap.value(forKey: "udf5") as! String
//        let isproduction = argsMap.value(forKey: "isproduction") as! Bool
        let hash = argsMap.value(forKey: "hash") as! String

        print("keySalt[indexKeySalt][2] = \(keySalt[indexKeySalt])")
                print("keySalt[indexKeySalt][2] = \(keySalt[indexKeySalt][1])")
                print("keySalt[indexKeySalt][0] = \(keySalt[indexKeySalt][0])")

            let paymentParam = PayUPaymentParam(key: key,
                                                transactionId:transactionId,
                                                amount: amount,
                                                productInfo: product,
                                                firstName: firstname,
                                                email: email,
                                                phone: phone,
                                                surl: surl,
                                                furl: furl,
                                                environment:Environment.test)
            paymentParam.additionalParam[PaymentParamConstant.udf1] = udf1
            paymentParam.additionalParam[PaymentParamConstant.udf2] = udf2
          //  paymentParam.additionalParam["Static hashes"] = "Payment"
    //        paymentParam.additionalParam[PaymentParamConstant.udf4] = ""
            paymentParam.additionalParam[PaymentParamConstant.udf5] = udf5
            paymentParam.additionalParam[HashConstant.payment] = self.hashstr
           // paymentParam.hashes = hashes
    //        paymentParam.additionalParam[PaymentParamConstant.merchantAccessKey] = merchantAccessKeyTextField.text ?? ""
    //        paymentParam.userToken = userTokenTextField.text

    //        paymentParam.additionalParam[PaymentParamConstant.sourceId] = sodexoCardSourceIdTextField.text

            return paymentParam
        }

//
//
//
//
    func onError(_ error: Error?) {
        // handle error scenario
//        self.dismiss(animated: true, completion: nil)
//        navigationController?.popToViewController(self, animated: true)
//        showAlert(title: "Error", message: "Payment is Faild")
        print("Payment Error",error)
    }

    func onPaymentSuccess(response: Any?) {
        // handle success scenario
//        self.dismiss(animated: true, completion: nil)
//        navigationController?.popToViewController(self, animated: true)
//       showAlert(title: "Success", message: "Payment is Successful!")
        print("response\n",response ?? "")

    }

    func onPaymentFailure(response: Any?) {
        // handle failure scenario
//        self.dismiss(animated: true, completion: nil)
//        self.navigationController?.popToViewController(self, animated: true)
      //  self.dismiss(animated: true)
//       showAlert(title: "Failure", message: "Payment is Faild")
        print("response\n",response ?? "")
    }

    func onPaymentCancel(isTxnInitiated: Bool) {
        // handle txn cancelled scenario
        // isTxnInitiated == YES, means user cancelled the txn when on reaching bankPage
        // isTxnInitiated == NO, means user cancelled the txn before reaching the bankPage
//        self.dismiss(animated: true, completion: nil)
//        self.navigationController?.popToViewController(self, animated: true)
//
//        let completeResponse = "isTxnInitiated = \(isTxnInitiated)"
//        showAlert(title: "Cancelled", message: "Payment is Faild")
        print("Payment Failed")
    }


    func generateHash(for param: DictOfString, onCompletion: @escaping PayUHashGenerationCompletion) {

        let commandName = (param[HashConstant.hashName] ?? "")
        let hashStringWithoutSalt = (param[HashConstant.hashString] ?? "")
        let postSalt = param[HashConstant.postSalt]
        // get hash for "commandName" from server
        // get hash for "hashStringWithoutSalt" from server



        // After fetching hash set its value in below variable "hashValue"
        var hashValue = ""

        if let hashType = param[HashConstant.hashType], hashType == "V2" {

            hashValue = "<hmacSHA256 hash for hashStringWithoutSalt with salt>"

            let strvalue = hashStringWithoutSalt + postSalt!

            print("hashStringWithoutSalt with salt =\(strvalue)")
            Hashvalue(strvalue) { value in
                hashValue = value

                onCompletion([commandName : hashValue])

            }
        }
        else if commandName == HashConstant.mcpLookup {
            hashValue = "<hmacsha1 hash for hashStringWithoutSalt and secret>"
            onCompletion([commandName : hashValue])


        } else if let postSalt = postSalt {

            let hashString = hashStringWithoutSalt + (keySalt[indexKeySalt][1] as? String ?? "") + postSalt

            hashValue = "<hmacsha1 hash for hashStringWithoutSalt and secret>"
            onCompletion([commandName : hashValue])

        } else {

            let hashString = hashStringWithoutSalt + (keySalt[indexKeySalt][1] as? String ?? "")
            print("hashStringWithoutSalt with salt =\(hashString)")
            Hashvalue(hashString) { value in
                hashValue = value
                onCompletion([commandName : hashValue])
            }
//            hashValue = "<hmacsha512 hash for hashStringWithoutSalt and salt>"
        }
    }

    func Hashvalue(_ strhashData:String, completion:@escaping (String) -> Void)
    {

        let Url = String(format: "https://api-uat.aws.giftex.in/WebApiModel/getHashStr")
            guard let serviceUrl = URL(string: Url) else { return }

                let parameters: [String: Any] = [
                    "userid": "4657",
                    "authkey_mobile": "",
                    "authkey_web":"0",
                    "CRMClientID":"74041e7d-73b4-4bde-9e00-cff33c12aab1",
                    "HashData":strhashData
                ]

            var request = URLRequest(url: serviceUrl)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                return
            }
            request.httpBody = httpBody
            request.timeoutInterval = 20
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let response = response {
                    print(response)
                }
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                                    if let responseJSON = json as? [String: String] {
                                        print(responseJSON)

                                        let hasstr = responseJSON["HashStr"]! as String
                                        completion(hasstr)

                                    }

                    } catch {
                        print(error)
                    }
                }
            }.resume()

    }


//    func generateHash(for param: DictOfString, onCompletion: @escaping PayUHashGenerationCompletion) {
//        // Send this string to your backend and append the salt at the end and send the sha512 back to us, do not calculate the hash at your client side, for security is reasons, hash has to be calculated at the server side
//        let hashStringWithoutSalt = param[HashConstant.hashString] ?? ""
//        // Or you can send below string hashName to your backend and send the sha512 back to us, do not calculate the hash at your client side, for security is reasons, hash has to be calculated at the server side
//        let hashName = param[HashConstant.hashName] ?? ""
//
//        // Set the hash in below string which is fetched from your server
//        let hashFetchedFromServer = "33a52e6ffec9721cab28533de2ea7f5129ae6724e4897ead39e3f93480efde489a053e09984f4c3b00f3a8a4486bb63f00a396f41a4af01c2ab0b1e97b387062"

//        onCompletion([hashName : hashFetchedFromServer])
//    }
//
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(okAction)
//        self.present(alert, animated: true, completion: nil)
    }
}


