//
//  FISTableViewController.m
//  slapChat
//
//  Created by Joe Burgess on 6/27/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISTableViewController.h"
#import "FISDataStore.h"

@interface FISTableViewController ()
@property (nonatomic, strong) NSArray *messages;
@property (nonatomic, strong) FISDataStore *store;
@end

@implementation FISTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setStore:[FISDataStore sharedDataStore]];
    
    do {
        [self.store fetchData];
        [self setMessages:self.store.messages];
        if (!self.messages.count) {
            [self generateTestData];
        }
    } while (!self.messages.count);
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell" forIndexPath:indexPath];

    FISMessage *message = [self.store.messages objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)generateTestData {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond) fromDate:[NSDate date]];
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [calendar dateByAddingComponents:components toDate:[NSDate date] options:0];
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [calendar dateByAddingComponents:components toDate:today options:0];
    
    NSDate *twoDaysAgo = [calendar dateByAddingComponents:components toDate:yesterday options:0];
    
    FISMessage *message1 = [NSEntityDescription insertNewObjectForEntityForName:@"FISMessage" inManagedObjectContext:self.store.managedObjectContext];
    [message1 setContent:@"Hello World!"];
    [message1 setCreatedAt:today];
    
    FISMessage *message2 = [NSEntityDescription insertNewObjectForEntityForName:@"FISMessage" inManagedObjectContext:self.store.managedObjectContext];
    [message1 setContent:@"Goodnight Moon!"];
    [message1 setCreatedAt:yesterday];
    
    FISMessage *message3 = [NSEntityDescription insertNewObjectForEntityForName:@"FISMessage" inManagedObjectContext:self.store.managedObjectContext];
    [message1 setContent:@"Tomorrow the World!"];
    [message1 setCreatedAt:twoDaysAgo];
    
    [self.store saveContext];
    [self.store fetchData];
    
}

@end
