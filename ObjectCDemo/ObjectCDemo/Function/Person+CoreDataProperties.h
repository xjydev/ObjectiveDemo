//
//  Person+CoreDataProperties.h
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 8/8/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) Car *car;

@end

NS_ASSUME_NONNULL_END
