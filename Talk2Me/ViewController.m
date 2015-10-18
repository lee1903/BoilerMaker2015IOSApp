//
//  ViewController.m
//  Talk2Me
//
//  Created by Ian Renfro on 10/17/15.
//  Copyright © 2015 SoloMin. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import "DispPicViewController.h"


@interface ViewController ()

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) NSDictionary *fbProperties;

@end
@implementation ViewController

struct Person p;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Add a custom login button to your app
    UIButton *myLoginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    myLoginButton.backgroundColor=[UIColor blueColor];
    myLoginButton.frame=CGRectMake(0,0,180,40);
    myLoginButton.center = self.view.center;
    [myLoginButton setTitle: @"Facebook Login" forState: UIControlStateNormal];
    
    // Handle clicks on the button
    [myLoginButton
     addTarget:self
     action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    // Add the button to the view
    [self.view addSubview:myLoginButton];
}

// Once the button is clicked, show the login dialog
-(void)loginButtonClicked
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
             __block NSString *facebookId = nil;
             NSDictionary* params = [NSDictionary dictionaryWithObject:@"id,gender,name" forKey:@"fields"];
             [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters: params]
              startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                  if (!error) {
                      
                      self.fbProperties = result;
                      
                      NSLog(@"fetched user:%@", result);
                      
                      facebookId = result[@"id"];
                      
                      NSLog(@"VCname: %@", self.name.text);
                      
                      NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookId]];
                      NSData *imageData = [NSData dataWithContentsOfURL:pictureURL];
                      UIImage *fbImage = [UIImage imageWithData:imageData];
                      if(fbImage == nil) {
                          printf("fb is null");
                      } else {
                          printf("is good");
                      }
                      self.image = fbImage;
                                 
                      [self performSegueWithIdentifier:@"DispPic" sender:self];

                  }
              }];
         }
     }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"DispPic"]) {
        UINavigationController *nav = segue.destinationViewController;
        DispPicViewController *temp = nav.viewControllers[0];
        temp.image = self.image;
        temp.fbProperties = self.fbProperties;
    }
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

/*
 if (FBSession.activeSession.isOpen) {
 
 [[FBRequest requestForMe] startWithCompletionHandler:
 ^(FBRequestConnection *connection,
 NSDictionary<FBGraphUser> *user,
 NSError *error) {
 if (!error) {
 NSString *firstName = user.first_name;
 NSString *lastName = user.last_name;
 NSString *facebookId = user.id;
 NSString *email = [user objectForKey:@"email"];
 NSString *imageUrl = [[NSString alloc] initWithFormat: @"http://graph.facebook.com/%@/picture?type=large", facebookId];
 }
 }];
 }

 
 [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
 startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
 if (!error) {
 NSLog(@"fetched user:%@  and Email : %@", result,result[@"email"]);
 }
 }];
 
 */

@end
