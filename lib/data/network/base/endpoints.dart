class User {
  final String userLogin = 'UserLogin';
  final String termsandconditions = 'GetTermsAndConditions';
  final String signup = 'signup';
  final String lastbids = 'User/GetLast5bids';
  final String lastpurchases = 'User/GetLast5purchases';
  final String liveauctionreview = 'User/getliveactionreview';
  final String auctiongallery = 'User/myauctiongallary';
  final String dashboardoverview = 'User/DashboardOverview';
  final String auctioncalender = 'User/DashboardAuctionCalendar';
  final String highlights = 'User/highlights';
  final String mypurchses = 'User/mypurchases';
  final String dashboardchart = 'User/dashboardchart';
  final String savesetting = 'User/savesettings';
  final String getsetting = 'User/getsettings';
  final String deleteaccount = 'User/deleteMyAccount';
  final String verifyEmail = 'verifyEmail';
  final String verifyMobile = 'verifyMobile';
  final String getLast5Bids = 'User/getLast5Bids';
  final String insertreg = 'InsertReg';
}

class Auction {
  final String analysis = 'Auction/analysis';
  final String upcommingAuction = 'UpcomingAuction';
  final String upcommingAuctionLots = 'UpcomingLots';
  final String singleAuctionLots = 'UpcomingAuctionInformation';
  final String bidHistory = 'GetBidHistory';
  final String getLotById = 'Lot/GetByLotId';
  final String myAuctionGallery = 'User/myauctiongallary';
  final String getReviewauctions = 'live/reviewlots';
  final String sortReviewauctions = 'live/reviewlots';
  final String ShowInterestInAuction = 'ShowInterestInAuction';
}

class Search {
  final String global = 'Search/Global';
}

class LiveAuction {
  final String liveaction = 'Live/getliveauctions';
  final String reviewLots = 'Live/reviewlots';
  final String closing = 'Live/closing';
  final String acutionAnalysis = 'Auction/analysis';
}

class Lots {
  final String highlightsPDP = 'Lot/highlightsPDP';

  // final String lotbyid = 'Lot/getbyLotId';
  final String proxyBidAmount = 'GetProxyBidAmount';
  final String additionalcharges = 'AdditionalCharges';
  final String addremoveToWishlist = 'AddRemoveLotToWishList';
  final String placeBid = 'InsertProxyBidAmount';
  final String getMyPurchases = 'User/mypurchases';
}

class MyCollection {
  final String create = 'MyCollection/Create';
  final String createart = 'MyCollection/CreateArt';
  final String getcollection = 'MyCollection/Get';
  final String getarts = 'MyCollection/GetArts';
  final String assign = 'MyCollection/Assign';
}

class Notification {
  final String send = 'Notification/send/';
  final String profileupdate = 'Notification/profileupdate/';
  final String paymentnotification = 'Notification/paymentNotification';
  final String proxymail = 'Notification/sendproxyARemail/';
  final String sendemail = 'Notification/sendwonemail/';
  final String sendperforma = 'Notification/sendperforma/';
}

class Payment {
  final String payment = 'Notification/send/';
  final String success = 'Notification/profileupdate/';
  final String failure = 'Notification/paymentNotification';
  final String cancel = 'Notification/sendproxyARemail/';
}

class Upload {
  final String upload = 'Upload/';
}

class WebApiModel {
  final String get = 'Get';
  final String verifymobile = 'verifyMobile';
  final String verifyemail = 'verifyEmail';
  final String forgetpassword = 'ForgotPassword';
  final String insertreg = 'InsertReg';
  final String updateregpersonaldetails = 'UpdateRegPersonalDetails';
  final String updateregmyaddress = 'UpdateRegMyAddress';
  final String updateregbankingdetails = 'UpdateRegBankingDetails';
  final String reginfo = 'RegInfo';
  final String getcity = 'GetCity';
  final String userlogout = 'UserLogout';
  final String userlogin = 'UserLogin';
  final String userloginotp = 'UserLoginOTPConfirm';
  final String insertsubscribeForm = 'InsertsubscribeForm';
  final String prechecklogin = 'PreCheckLogin';
  final String updateprofiledetails = 'UpdateProfilePersonalDetails';
  final String updatemyaddress = 'UpdateMyAddress';
  final String deletemyaddress = 'deleteMyAddress';
  final String setdefaultmyaddress = 'setDefaultMyAddress';
  final String updatebankingdetails = 'UpdateBankingDetails';
  final String getuserdetails = 'GetUserAllDetails';
  final String changepassword = 'ChangePassword';
  final String forgettochangepassword = 'ForgetToChangePassword';
  final String upcomingauction = 'UpcomingAuction';
  final String addremovetowishlist = 'AddRemoveLotToWishList';
  final String showintrestinauction = 'ShowInterestInAuction';
  final String auctionclosingschedule = 'AuctionClosingSchedule';
  final String upcomingauctioninfo = 'UpcomingAuctionInformation';
  final String upcominglots = 'UpcomingLots';
  final String getproxybidamount = 'GetProxyBidAmount';
  final String insertproxybidamount = 'InsertProxyBidAmount';
  final String getlotdetails = 'GetLotDetails';
  final String additionalcharges = 'AdditionalCharges';
  final String insertreachusform = 'InsertReachUsForm';
  final String insertcareerform = 'InsertCareerForm';
  final String getbidhistory = 'GetBidHistory';
  final String insertgetestimateform = 'InsertGetEstimateForm';
  final String insertsubscribeform = 'InsertsubscribeForm';
  final String gethashstr = 'getHashStr';
  final String getpaymentgrid = 'GetPaymentGrid';
  final String artistdata = 'artistdata';
}

class WebCMSApiModel {
  final String get = 'InsertsubscribeForm';
  final String getbuydetails = 'getHashStr';
  final String GetBuyDetails = 'GetBuyDetails';
  final String getselldetails = 'GetPaymentGrid';
  final String GetSellDetails = 'GetSellDetails';
  final String GetOurCollections = 'GetOurCollections';
  final String getprivateselldetails = 'artistdata';
  final String getservisedetails = 'InsertsubscribeForm';
  final String getfaqdetails = 'getHashStr';
  final String gettermsandconditions = 'GetPaymentGrid';
  final String getreachus = 'artistdata';
  final String getwhoweare = 'GetWhoWeAre';
  final String getnews = 'GetPress';
  final String getblogs = 'GetBlogs';
  final String getpress = 'getHashStr';
  final String getpressdetails = 'GetPaymentGrid';
  final String getcommoninfo = 'artistdata';
  final String getcareers = 'GetCareers';

  // final String getblogs = 'getHashStr';
  final String getblogdetails = 'GetPaymentGrid';
  final String getourcollections = 'artistdata';
  final String getartmovement = 'InsertsubscribeForm';
  final String GetArtMovement = 'GetArtMovement';
  final String getauctionguide = 'getHashStr';
  final String getnewsvideos = 'HomeNewsVideosBlogs';
  final String getartistlisting = 'artistdata';
  final String getartistlistingpage = 'InsertsubscribeForm';
  final String getartistprofile = 'getHashStr';
  final String getnewsdetails = 'GetPaymentGrid';
  final String getfooterpage = 'artistdata';
  final String homebanner = 'HomeBanner';
  final String homeupcomingauction = 'HomeUpcomingAuctions';
  final String homerecentauction = 'GetPaymentGrid';
  final String homeourservice = 'artistdata';
  final String homeartistofmonth = 'InsertsubscribeForm';
  final String homecategoryofthemonth = 'getHashStr';
  final String homeourcollecters = 'GetPaymentGrid';
  final String homenewsvideoblog = 'artistdata';
  final String homehighlightlot = 'artistdata';
  final String homerecordpricelot = 'HomeRecordPriceLots';
  final String recordpricelots = 'RecordPriceLots';
  final String HomeHighlightsLots = 'HomeHighlightsLots';
  final String getdepartments = 'GetPaymentGrid';
  final String GetDepartments = 'GetDepartments';
  final String getdepartmentdetails = 'artistdata';
  final String getpurchasefaq = 'InsertsubscribeForm';
  final String getusernotification = 'getHashStr';
  final String getauctionpage = 'GetPaymentGrid';
  final String loadtest = 'artistdata';
}

class Profile {
  final String getUserAllDetails = 'GetUserAllDetails';
  final String getDashboardOverview = 'DashboardOverview';
}

class Service {
  final String getServiceDetails = 'GetServicesDetails';
  final String getDashboardOverview = 'DashboardOverview';
}

class KYC {
  final String UpdateRegPersonalDetails = 'UpdateRegPersonalDetails';
  final String UpdateRegMyAddress = 'UpdateRegMyAddress';
  final String UpdateRegBankingDetails = 'UpdateRegBankingDetails';
}
