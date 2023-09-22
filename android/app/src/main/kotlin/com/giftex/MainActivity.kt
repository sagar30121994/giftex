package com.giftex

import android.text.TextUtils
import android.webkit.WebView
import androidx.annotation.NonNull
import com.payu.base.models.ErrorResponse
import com.payu.base.models.PayUPaymentParams
import com.payu.base.models.PaymentMode
import com.payu.base.models.PaymentType
import com.payu.checkoutpro.PayUCheckoutPro
import com.payu.checkoutpro.models.PayUCheckoutProConfig
import com.payu.checkoutpro.utils.PayUCheckoutProConstants
import com.payu.checkoutpro.utils.PayUCheckoutProConstants.CP_HASH_NAME
import com.payu.checkoutpro.utils.PayUCheckoutProConstants.CP_HASH_STRING
import com.payu.checkoutpro.utils.PayUCheckoutProConstants.CP_HASH_TYPE
import com.payu.checkoutpro.utils.PayUCheckoutProConstants.CP_V2_HASH
import com.payu.ui.model.listeners.PayUCheckoutProListener
import com.payu.ui.model.listeners.PayUHashGenerationListener
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "paymentsChannel"

    var eventChannel: EventChannel? = null

    var eventsinkmain: EventChannel.EventSink? = null


    //Test Key and Salt
    private val testKey = "g4RzXdFq6SskDEOF8xdpmcutWzE8GxCU"
    private val testSalt = "SMznAbdBnkDIVXqWUb9MvFcOv5bzB9bD"

    /**
     * Enter below keys when integrating Multi Currency Payments.
     * To get these credentials, please reach out to your Key Account Manager at PayU
     * */
    private val merchantAccessKey = "g4RzXdFq6SskDEOF8xdpmcutWzE8GxCU"
    private val merchantSecretKey = "<Please_add_your_merchant_secret_key>"


    //Prod Key and Salt
    private val prodKey = "g4RzXdFq6SskDEOF8xdpmcutWzE8GxCU"
    private val prodSalt = "<Please_add_salt_here>"


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)


        startEventChannel(flutterEngine.dartExecutor.binaryMessenger)
        startMethodChannel(flutterEngine)


    }

    fun startEventChannel(messenger: BinaryMessenger) {
        eventChannel = EventChannel(messenger, "paymentStream");
        eventChannel!!.setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, eventSink: EventChannel.EventSink) {
                    eventsinkmain = eventSink;
                }

                override fun onCancel(arguments: Any?) {
                    eventsinkmain?.success("Canceled")
                }
            }
        )
    }


    var hash: String? = null

    fun startMethodChannel(@NonNull flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "makePayment" -> {
                    // some action


                    val amount: String? = call.argument("amount")
                    val key: String? = call.argument("key")
                    val salt: String? = call.argument("salt")
                    val product: String? = call.argument("product")
                    val phone: String? = call.argument("phone")
                    val transactionId: String? = call.argument("transactionId")
                    val firstname: String? = call.argument("firstname")
                    val email: String? = call.argument("email")
                    val surl: String? = call.argument("surl")
                    val furl: String? = call.argument("furl")
                    val udf1: String? = call.argument("udf1")
                    val udf2: String? = call.argument("udf2")
                    val udf5: String? = call.argument("udf5")
                    val isproduction: Boolean? = call.argument("isproduction")
                    hash = call.argument("hash")
//                    val phone: String? = "919834058046"

                    val vasForMobileSdkHash = HashGenerationUtils.generateHashFromSDK(
                        "${testKey}|${PayUCheckoutProConstants.CP_VAS_FOR_MOBILE_SDK}|${PayUCheckoutProConstants.CP_DEFAULT}|",
                        testSalt
                    )
                    val paymenRelatedDetailsHash = HashGenerationUtils.generateHashFromSDK(
                        "$testKey|${PayUCheckoutProConstants.CP_PAYMENT_RELATED_DETAILS_FOR_MOBILE_SDK}|${""}|",
                        testSalt
                    )
                    val additionalParamsMap = HashMap<String, Any?>()
                    additionalParamsMap[PayUCheckoutProConstants.CP_UDF1] = udf1!!
                    additionalParamsMap[PayUCheckoutProConstants.CP_UDF2] = udf2!!
                    additionalParamsMap[PayUCheckoutProConstants.CP_UDF5] = udf5!!
                    additionalParamsMap[PayUCheckoutProConstants.CP_VAS_FOR_MOBILE_SDK] =
                        vasForMobileSdkHash
                    additionalParamsMap[PayUCheckoutProConstants.CP_PAYMENT_RELATED_DETAILS_FOR_MOBILE_SDK] =
                        paymenRelatedDetailsHash

//                    additionalParamsMap[PayUCheckoutProConstants.SODEXO_SOURCE_ID] = "srcid123"

                    val payUPaymentParams = PayUPaymentParams.Builder()
                        .setAmount(amount!!)
                        .setIsProduction(false)
                        .setKey(key)
                        .setProductInfo(product!!)
                        .setPhone(phone!!)
                        .setTransactionId(transactionId)
                        .setFirstName(firstname)
                        .setEmail(email)
                        .setSurl(surl)
                        .setFurl(furl)
                        .setUserCredential("$key:$email")
                        .setAdditionalParams(additionalParamsMap)
                        .build()

                    initUiSdk(payUPaymentParams, salt!!);
                }

                "dropTwilio" -> {
                    // some action


                }
            }

        }
    }

    private fun getCheckoutOrderList(): ArrayList<PaymentMode> {
        val checkoutOrderList = ArrayList<PaymentMode>()
        checkoutOrderList.add(
            PaymentMode(
                PaymentType.UPI,
                PayUCheckoutProConstants.CP_GOOGLE_PAY
            )
        )
        checkoutOrderList.add(
            PaymentMode(
                PaymentType.WALLET,
                PayUCheckoutProConstants.CP_PHONEPE
            )
        )
        checkoutOrderList.add(
            PaymentMode(
                PaymentType.WALLET,
                PayUCheckoutProConstants.CP_PAYTM
            )
        )
        return checkoutOrderList
    }


    private fun getCheckoutProConfig(): PayUCheckoutProConfig {
        val checkoutProConfig = PayUCheckoutProConfig()
        checkoutProConfig.paymentModesOrder = getCheckoutOrderList()
        checkoutProConfig.showCbToolbar = true
        checkoutProConfig.autoSelectOtp = true
        checkoutProConfig.autoApprove = true
        checkoutProConfig.surePayCount = 1
//        checkoutProConfig.cartDetails = reviewOrderAdapter?.getOrderDetailsList()
        checkoutProConfig.showExitConfirmationOnPaymentScreen =
            true
        checkoutProConfig.showExitConfirmationOnCheckoutScreen =
            true
        checkoutProConfig.merchantName = "Giftex"
//        checkoutProConfig.merchantLogo = R.drawable.merchant_logo
        checkoutProConfig.waitingTime = 3000
        checkoutProConfig.merchantResponseTimeout = 3000
//        checkoutProConfig.customNoteDetails = getCustomeNoteDetails()
        // uncomment below code to perform enforcement
//        checkoutProConfig.enforcePaymentList = getEnforcePaymentList()
        return checkoutProConfig
    }


    private fun initUiSdk(payUPaymentParams: PayUPaymentParams, salt: String) {
        PayUCheckoutPro.open(
            this,
            payUPaymentParams,
            getCheckoutProConfig(),
            object : PayUCheckoutProListener {

                override fun onPaymentSuccess(response: Any) {
//                    processResponse(response)
                    eventsinkmain?.success("Success");
                }

                override fun onPaymentFailure(response: Any) {
//                    processResponse(response)
                    eventsinkmain?.success("Failure");
                }

                override fun onPaymentCancel(isTxnInitiated: Boolean) {
//                    showSnackBar(resources.getString(R.string.transaction_cancelled_by_user))
                    eventsinkmain?.success("Cancel");
                }

                override fun onError(errorResponse: ErrorResponse) {

                    eventsinkmain?.success("Error ${errorResponse.errorMessage}");
                }

                override fun generateHash(
                    map: HashMap<String, String?>,
                    hashGenerationListener: PayUHashGenerationListener
                ) {
                    if (map.containsKey(CP_HASH_STRING)
                        && map.containsKey(CP_HASH_STRING) != null
                        && map.containsKey(CP_HASH_NAME)
                        && map.containsKey(CP_HASH_NAME) != null
                    ) {

                        val hashData = map[CP_HASH_STRING]
                        val hashName = map[CP_HASH_NAME]
                        val hashType = map[CP_HASH_TYPE]

                        var salt: String? = null
                        if (map.containsKey(PayUCheckoutProConstants.CP_POST_SALT))
                            salt = salt.plus(map[PayUCheckoutProConstants.CP_POST_SALT])


                        //Below hash should be calculated only when integrating Multi-currency support. If not integrating MCP
                        // then no need to have this if check.
                        if (hashName.equals(
                                PayUCheckoutProConstants.CP_LOOKUP_API_HASH,
                                ignoreCase = true
                            )
                        ) {

                            //Calculate HmacSHA1 hash using the hashData and merchant secret key
                            hash = HashGenerationUtils.generateHashFromSDK(
                                hashData!!,
                                salt,
                                merchantSecretKey
                            )
                        } else if (hashType.equals(CP_V2_HASH)) {
                            hash = HashGenerationUtils.generateV2HashFromSDK(hashData!!, salt)
                        } else {
                            //calculate SDH-512 hash using hashData and salt
                            hash = HashGenerationUtils.generateHashFromSDK(
                                hashData!!,
                                salt
                            )
                        }

                        if (!TextUtils.isEmpty(hash)) {
                            val hashMap: HashMap<String, String?> = HashMap()
                            hashMap[hashName!!] = hash!!
                            hashGenerationListener.onHashGenerated(hashMap)
                        }
                    }
                }

                override fun setWebViewProperties(webView: WebView?, bank: Any?) {
                }
            })
    }


}
