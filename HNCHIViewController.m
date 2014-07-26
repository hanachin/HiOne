//
//  HNCHIViewController.m
//  HiOne
//
//  Created by Seiei Higa on 2014/07/26.
//  Copyright (c) 2014年 Seiei Higa. All rights reserved.
//

#import "HNCHIViewController.h"
#import "HNCHiSettingViewController.h"

@interface HNCHIViewController ()

@end

@implementation HNCHIViewController

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

- (HNCCredential *)credential
{
    return [[HNCCredential alloc] init];
}

- (IBAction)hi:(id)sender
{
    self.count += 1;
    self.textView.text = [NSString stringWithFormat:@"%d", self.count];
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    defaultConfigObject.HTTPAdditionalHeaders = @{
                                                  @"Authorization": [NSString stringWithFormat:@"Basic %@", [[self credential] base64]],
                                                  };
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration:
                                         defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    NSURL *url = [NSURL URLWithString:
                  @"https://idobata.io/api/seed"];
    [[delegateFreeSession dataTaskWithURL: url
                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                            NSLog(@"Got response %@ with error %@.\n", response,
                                  error);
                            NSLog(@"DATA:\n%@\nEND DATA\n",
                                  [[NSString alloc] initWithData: data
                                                        encoding: NSUTF8StringEncoding]);
                        }] resume];
}

- (IBAction)unwindToTop:(UIStoryboardSegue *)segue
{
}

- (IBAction)unwindToTopSettingDone:(UIStoryboardSegue *)segue
{
}

@end
