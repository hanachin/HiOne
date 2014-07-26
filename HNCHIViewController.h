//
//  HNCHIViewController.h
//  HiOne
//
//  Created by Seiei Higa on 2014/07/26.
//  Copyright (c) 2014年 Seiei Higa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HNCCredential.h"

@interface HNCHIViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (atomic) int count;

- (IBAction)hi:(id)sender;

@end
