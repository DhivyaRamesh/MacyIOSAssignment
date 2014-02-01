//
//  DetailViewController.h
//  Macys
//
//  Created by llel on 1/28/14.
//  Copyright (c) 2014 DhivyaAshok. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *lblTapIndex;
@property (nonatomic) NSInteger lblIndex;


-(IBAction)btnBackPress:(id)sender;
@end
