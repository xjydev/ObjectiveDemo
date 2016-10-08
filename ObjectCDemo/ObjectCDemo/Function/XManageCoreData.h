//
//  XManageCoreData.h
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 8/8/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface XManageCoreData : NSObject
@property (nonatomic, strong)NSManagedObjectContext *manageObjectContext;
@property (nonatomic, strong)NSManagedObjectModel *manageObjectModel;
@property (nonatomic, strong)NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (id)manageCoreData;
- (void)saveContext;
- (void)saveObjectsDict:(NSDictionary *)dict forEntityName:(NSString *)name;
- (NSArray *)searchSortDescriptors:(NSDictionary *)descriptiors forEntityName:(NSString *)name searchContext:(NSString *)searchContext;

@end
