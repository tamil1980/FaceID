//
//  ViewController.m
//  TouchID
//
//  Created by James Harnett on 6/2/14.
//  Copyright (c) 2014 James Harnett. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize mesg;
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)authenticationButton
{
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"Please authenticate with your faceID to continue.";
    
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:myLocalizedReasonString
                            reply:^(BOOL success, NSError *error) {
                                if (success) {
                                   dispatch_async(dispatch_get_main_queue(), ^{                                 self.mesg.text = @"sucess Face ID";
                               });
                                }else {
                                    // User did not authenticate successfully, look at error and take appropriate action
                                }
                            }];
    } else {
        // Could not evaluate policy; look at authError and present an appropriate message to user
    }
}

@end
