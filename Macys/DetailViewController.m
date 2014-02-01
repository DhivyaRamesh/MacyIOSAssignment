//
//  DetailViewController.m
//  Macys
//
//  Created by llel on 1/28/14.
//  Copyright (c) 2014 DhivyaAshok. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize lblTapIndex;
@synthesize lblIndex;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
	// Do any additional setup after loading the view.
    
    DebugLog(@"Value of Tap Id#%ld", (long)lblIndex);
    lblTapIndex.text = [NSString stringWithFormat:@"Tap #%ld " ,(long)lblIndex];
}
/**
 Function to traverse to the 
 **/
-(IBAction)btnBackPress:(id)sender {
    
    DebugLog(@"Func btnBackPress called");
    
    [self.navigationController popViewControllerAnimated:YES];
    
    DebugLog(@"Func btnBackPress Exited");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
