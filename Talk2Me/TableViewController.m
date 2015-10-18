//
//  TableViewController.m
//  Talk2Me
//
//  Created by Ian Renfro on 10/17/15.
//  Copyright © 2015 SoloMin. All rights reserved.
//

#import "TableViewController.h"
@import UIKit;
#import "DetailViewController.h"

@interface TableViewController ()

@property NSIndexPath* index;
@property (nonatomic, strong) NSArray *users;
@property (nonatomic, strong) NSArray *genders;



@end

@implementation TableViewController

NSArray *names;
NSArray *genders;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _users = @[@"Sally", @"Don", @"John", @"Joey", @"Stephanie", @"Alice", @"Noah", @"Liam", @"Emma", @"Olivia", @"Mason", @"Jacob", @"Sophia", @"Isabell", @"William", @"Ethan", @"Ava", @"Mia", @"Michael", @"Alexandar", @"Emily", @"Abigal", @"James", @"Daniel", @"Madison", @"Charlotte"];
    names = @[@"Sally", @"Don", @"John", @"Joey", @"Stephanie", @"Alice", @"Noah", @"Liam", @"Emma", @"Olivia", @"Mason", @"Jacob", @"Sophia", @"Isabell", @"William", @"Ethan", @"Ava", @"Mia", @"Michael", @"Alexandar", @"Emily", @"Abigal", @"James", @"Daniel", @"Madison", @"Charlotte"];
    _genders = @[@"Female", @"Male", @"Male", @"Male", @"Female", @"Female", @"Male", @"Male", @"Female", @"Female", @"Male", @"Male", @"Female", @"Female", @"Male", @"Male", @"Female", @"Female", @"Male", @"Male", @"Female", @"Female", @"Male", @"Male", @"Female", @"Female"];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [names count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListViewCell" forIndexPath:indexPath];
    cell.textLabel.text = names[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.index = indexPath;
    [self performSegueWithIdentifier:@"DetailItem" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"DetailItem"]) {
        UINavigationController *nav = segue.destinationViewController;
        DetailViewController *temp = nav.viewControllers[0];
        NSDictionary *d = @{
                            @"name": self.users[self.index.row],
                            @"gender": self.genders[self.index.row]
                            };
        temp.display = d;
        
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
