//
//  DetailViewController.h
//  Talk2Me
//
//  Created by Ian Renfro on 10/18/15.
//  Copyright © 2015 SoloMin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *gender;
@property (nonatomic, strong) NSDictionary *display;

@end
