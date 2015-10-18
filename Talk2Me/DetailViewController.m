//
//  DetailViewController.m
//  Talk2Me
//
//  Created by Ian Renfro on 10/18/15.
//  Copyright © 2015 SoloMin. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (IBAction)cancel:(id)sender;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name.text = self.display[@"name"];
    self.gender.text = self.display[@"gender"];
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

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
