//
//  DispPicViewController.m
//  Talk2Me
//
//  Created by Ian Renfro on 10/17/15.
//  Copyright © 2015 SoloMin. All rights reserved.
//

#import "DispPicViewController.h"
#import "ViewController.h"

@interface DispPicViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageVIew;

@end

@implementation DispPicViewController
//@synthesize imageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageVIew.image = self.image;
    self.name.text = self.fbProperties[@"name"];
    NSString *temp = self.fbProperties[@"gender"];
    NSRange range = NSMakeRange(0,1);
    NSString * newString = [temp substringWithRange:NSMakeRange(0, 1)];
    NSString *newText;
    if ([newString isEqualToString:@"m"]) {
        newText = [temp stringByReplacingCharactersInRange:range withString:@"M"];
    } else {
        newText = [temp stringByReplacingCharactersInRange:range withString:@"F"];
    }
    self.Gender.text = newText;
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

@end
