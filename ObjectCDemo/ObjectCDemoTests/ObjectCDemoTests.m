//
//  ObjectCDemoTests.m
//  ObjectCDemoTests
//
//  Created by XiaoJingYuan on 3/24/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FirstViewController.h"
@interface ObjectCDemoTests : XCTestCase

@end

@implementation ObjectCDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    FirstViewController *first = [[FirstViewController alloc]init];
    NSString *exp = @"test";
    NSString * s = [first getUnitTestString:@"test"];
    XCTAssertEqualObjects(exp, s,@"pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
