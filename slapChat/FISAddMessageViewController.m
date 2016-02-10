//
//  FISAddMessageViewController.m
//  slapChat
//
//  Created by Ken M. Haggerty on 2/9/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddMessageViewController.h"
#import "FISDataStore.h"

@interface FISAddMessageViewController ()
@property (nonatomic, strong) IBOutlet UITextField *textField;
- (IBAction)save:(id)sender;
@end

@implementation FISAddMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(id)sender {
    
    FISDataStore *store = [FISDataStore sharedDataStore];
    FISMessage *message = [NSEntityDescription insertNewObjectForEntityForName:@"FISMessage" inManagedObjectContext:store.managedObjectContext];
    [message setContent:self.textField.text];
    [message setCreatedAt:[NSDate date]];
    [store saveContext];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
