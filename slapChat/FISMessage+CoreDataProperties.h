//
//  FISMessage+CoreDataProperties.h
//  slapChat
//
//  Created by Ken M. Haggerty on 2/9/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FISMessage.h"

NS_ASSUME_NONNULL_BEGIN

@interface FISMessage (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *createdAt;
@property (nullable, nonatomic, retain) NSString *content;

@end

NS_ASSUME_NONNULL_END
