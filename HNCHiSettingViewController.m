//
//  HNCHiSettingViewController.m
//  HiOne
//
//  Created by Seiei Higa on 2014/07/26.
//  Copyright (c) 2014年 Seiei Higa. All rights reserved.
//

#import "HNCHiSettingViewController.h"
#import "Pods/UICKeyChainStore/Lib/UICKeyChainStore.h"

@interface HNCHiSettingViewController ()

@end

@implementation HNCHiSettingViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"viewDidLoad, %@", [UICKeyChainStore stringForKey:@"email" service:@"in.hanach.HiOne"]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)done:(id)sender
{
    NSLog(@"Done, email is: %@ and password is: %@", self.email.text, self.password.text);
    [UICKeyChainStore setString:self.email.text forKey:@"email" service:@"in.hanach.HiOne"];
    [UICKeyChainStore setString:self.password.text forKey:@"password" service:@"in.hanach.HiOne"];
    NSLog(@"%@", [UICKeyChainStore stringForKey:@"email" service:@"in.hanach.HiOne"]);
    [self performSegueWithIdentifier:@"setting done" sender:self];
}

@end
