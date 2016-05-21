//
//  ThriftManger.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 5/11/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "ThriftManger.h"
#import "TBinaryProtocol.h"
#import "TFramedTransport.h"
#import "TMemoryBuffer.h"
#import "TSocketClient.h"

NSString *const ServerName = @"122.144.133.170";
UInt32 const ServerPort = 9091;

@implementation ThriftManger

- (IpadPSRClient *)setupApiClient {
    TSocketClient *transport = [[TSocketClient alloc] initWithHostname:ServerName port:ServerPort];
    TFramedTransport *ftransport = [[TFramedTransport alloc] initWithTransport:transport];
    TBinaryProtocol *protocol = [[TBinaryProtocol alloc] initWithTransport:ftransport];
    return [[IpadPSRClient alloc] initWithProtocol:protocol];
    
}
- (void)sendVerification
{
    NSLog(@"==%@",[[self setupApiClient]getVerificationWithCode:nil mobile:nil]);
}
@end
