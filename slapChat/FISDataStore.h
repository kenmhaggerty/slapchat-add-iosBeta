//
//  FISDataStore.h
//  playingWithCoreData
//
//  Created by Joe Burgess on 6/27/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISMessage.h"

@interface FISDataStore : NSObject
@property (nonatomic, strong) NSArray <FISMessage *> *messages;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

+ (instancetype) sharedDataStore;
- (void) saveContext;
- (void) fetchData;

@end
