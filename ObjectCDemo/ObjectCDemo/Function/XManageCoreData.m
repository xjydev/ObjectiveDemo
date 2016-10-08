//
//  XManageCoreData.m
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 8/8/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

#import "XManageCoreData.h"
static XManageCoreData *_manageCoredata = nil;

@implementation XManageCoreData
+ (id)manageCoreData {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manageCoredata = [[XManageCoreData alloc]init];
    });
    return _manageCoredata;
}
- (NSManagedObjectModel *)manageObjectModel {
    if (_manageObjectModel != nil) {
        return _manageObjectModel;
    }
    //应用程序中加载模型文件
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"Model" withExtension:@"momd"];
    _manageObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:url];
//     _manageObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return _manageObjectModel;
}
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    //根据模型对象初始化NSPersistentStoreCoordinator
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:self.manageObjectModel];
    NSURL *storeUrl = [[self applicationDocumentsDirectory]URLByAppendingPathComponent:@"model.sqlite"];
    NSError *error = nil;
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:
         &error]) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedFailureReasonErrorKey] = @"coredata 初始化失败";
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        abort();
    }
    return _persistentStoreCoordinator;
}
- (NSManagedObjectContext *)manageObjectContext
{
    if (_manageObjectContext != nil) {
        return _manageObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _manageObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_manageObjectContext setPersistentStoreCoordinator:coordinator];
    return _manageObjectContext;
}
- (NSURL *)applicationDocumentsDirectory {
    
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.manageObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges]&&! [managedObjectContext save:&error] ) {
            NSLog(@"unresolved error  %@, %@",error,[error userInfo]);
            abort();
        }
    }
}
- (void)saveObjectsDict:(NSDictionary *)dict forEntityName:(NSString *)name
{
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:self.manageObjectContext];
    for (NSString * key in dict.allKeys) {
        [object setValue:dict[key] forKey:key];
    }
    NSError *error = nil;
    BOOL success = [self.manageObjectContext save:&error];
    if (!success) {
        [NSException raise:@"访问数据库错误" format:@"%@",[error localizedDescription]];
    }
    
    
}
- (NSArray *)searchSortDescriptors:(NSDictionary *)descriptiors forEntityName:(NSString *)name searchContext:(NSString *)searchContext
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    request.entity = [NSEntityDescription entityForName:name inManagedObjectContext:self.manageObjectContext];
    NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:descriptiors.allKeys.count];
    for (NSString *key in descriptiors.allKeys) {
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:key ascending:[descriptiors[key] boolValue]];
        [muArray addObject:sort];
    }
    request.sortDescriptors = muArray;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name like %@",@"*1*"];
    request.predicate = predicate;
    NSError *error = nil;
    NSArray *objets = [self.manageObjectContext executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@",[error localizedDescription]];
    }
    return objets;
    
}
@end
