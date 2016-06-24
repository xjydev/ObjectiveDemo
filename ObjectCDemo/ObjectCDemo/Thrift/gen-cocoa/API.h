/**
 * Autogenerated by Thrift Compiler (0.9.3)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

#import <Foundation/Foundation.h>

#import "TProtocol.h"
#import "TApplicationException.h"
#import "TProtocolException.h"
#import "TProtocolUtil.h"
#import "TProcessor.h"
#import "TObjective-C.h"
#import "TBase.h"
#import "TAsyncTransport.h"
#import "TProtocolFactory.h"
#import "TBaseClient.h"


@interface Response : NSObject <TBase, NSCoding> {
  int32_t __errorCode;
  NSString * __msg;
  NSString * __data;

  BOOL __errorCode_isset;
  BOOL __msg_isset;
  BOOL __data_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=errorCode, setter=setErrorCode:) int32_t errorCode;
@property (nonatomic, retain, getter=msg, setter=setMsg:) NSString * msg;
@property (nonatomic, retain, getter=data, setter=setData:) NSString * data;
#endif

- (id) init;
- (id) initWithErrorCode: (int32_t) errorCode msg: (NSString *) msg data: (NSString *) data;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int32_t) errorCode;
- (void) setErrorCode: (int32_t) errorCode;
#endif
- (BOOL) errorCodeIsSet;

#if !__has_feature(objc_arc)
- (NSString *) msg;
- (void) setMsg: (NSString *) msg;
#endif
- (BOOL) msgIsSet;

#if !__has_feature(objc_arc)
- (NSString *) data;
- (void) setData: (NSString *) data;
#endif
- (BOOL) dataIsSet;

@end

@interface AUser : NSObject <TBase, NSCoding> {
  int32_t __uid;
  NSString * __name;

  BOOL __uid_isset;
  BOOL __name_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=uid, setter=setUid:) int32_t uid;
@property (nonatomic, retain, getter=name, setter=setName:) NSString * name;
#endif

- (id) init;
- (id) initWithUid: (int32_t) uid name: (NSString *) name;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int32_t) uid;
- (void) setUid: (int32_t) uid;
#endif
- (BOOL) uidIsSet;

#if !__has_feature(objc_arc)
- (NSString *) name;
- (void) setName: (NSString *) name;
#endif
- (BOOL) nameIsSet;

@end

@interface ResponseUserList : NSObject <TBase, NSCoding> {
  int32_t __errorCode;
  NSString * __msg;
  NSMutableArray * __data;

  BOOL __errorCode_isset;
  BOOL __msg_isset;
  BOOL __data_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=errorCode, setter=setErrorCode:) int32_t errorCode;
@property (nonatomic, retain, getter=msg, setter=setMsg:) NSString * msg;
@property (nonatomic, retain, getter=data, setter=setData:) NSMutableArray * data;
#endif

- (id) init;
- (id) initWithErrorCode: (int32_t) errorCode msg: (NSString *) msg data: (NSMutableArray *) data;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int32_t) errorCode;
- (void) setErrorCode: (int32_t) errorCode;
#endif
- (BOOL) errorCodeIsSet;

#if !__has_feature(objc_arc)
- (NSString *) msg;
- (void) setMsg: (NSString *) msg;
#endif
- (BOOL) msgIsSet;

#if !__has_feature(objc_arc)
- (NSMutableArray *) data;
- (void) setData: (NSMutableArray *) data;
#endif
- (BOOL) dataIsSet;

@end

@interface Auth : NSObject <TBase, NSCoding> {
  NSString * __AppId;
  int64_t __uid;

  BOOL __AppId_isset;
  BOOL __uid_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=appId, setter=setAppId:) NSString * AppId;
@property (nonatomic, getter=uid, setter=setUid:) int64_t uid;
#endif

- (id) init;
- (id) initWithAppId: (NSString *) AppId uid: (int64_t) uid;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (NSString *) appId;
- (void) setAppId: (NSString *) AppId;
#endif
- (BOOL) AppIdIsSet;

#if !__has_feature(objc_arc)
- (int64_t) uid;
- (void) setUid: (int64_t) uid;
#endif
- (BOOL) uidIsSet;

@end

@interface InvalidOperation : NSException <TBase, NSCoding> {
  int32_t __whatOp;
  NSString * __why;

  BOOL __whatOp_isset;
  BOOL __why_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=whatOp, setter=setWhatOp:) int32_t whatOp;
@property (nonatomic, retain, getter=why, setter=setWhy:) NSString * why;
#endif

- (id) init;
- (id) initWithWhatOp: (int32_t) whatOp why: (NSString *) why;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int32_t) whatOp;
- (void) setWhatOp: (int32_t) whatOp;
#endif
- (BOOL) whatOpIsSet;

#if !__has_feature(objc_arc)
- (NSString *) why;
- (void) setWhy: (NSString *) why;
#endif
- (BOOL) whyIsSet;

@end

@protocol IpadPSR <NSObject>
- (Response *) getVerificationWithCode: (Auth *) auth mobile: (NSString *) mobile;  // throws InvalidOperation *, TException
@end

@interface IpadPSRClient : TBaseClient <IpadPSR> - (id) initWithProtocol: (id <TProtocol>) protocol;
- (id) initWithInProtocol: (id <TProtocol>) inProtocol outProtocol: (id <TProtocol>) outProtocol;
@end

@interface IpadPSRProcessor : NSObject <TProcessor> {
  id <IpadPSR> mService;
  NSDictionary * mMethodMap;
}
- (id) initWithIpadPSR: (id <IpadPSR>) service;
- (id<IpadPSR>) service;
@end

@interface APIConstants : NSObject {
}
@end
