//
//  ViewController.h
//  Macys
//
//  Created by llel on 1/28/14.
//  Copyright (c) 2014 DhivyaAshok. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// Controls used in the view
//Imageviews used
@property (nonatomic, strong) IBOutlet UIImageView *imgHeader;
@property (nonatomic, strong) IBOutlet UIImageView *imgTopShopNow;
@property (nonatomic, strong) IBOutlet UIImageView *imgBGSearch;
@property (nonatomic, strong) IBOutlet UIImageView *searchImg;
@property (nonatomic, strong) IBOutlet UIImageView *imgBottomShopNow;
@property (nonatomic, strong) IBOutlet UIImageView *imgBottom;
//Buttons used
@property (nonatomic, strong) IBOutlet UIButton *btnBottomShopNow;
@property (nonatomic, strong) IBOutlet UIButton *btnTopShopNow;
@property (nonatomic, strong) IBOutlet UIButton *btnScan;

@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;


//variables used 
@property (nonatomic, strong) NSArray*  macyImages;



//-(void) SizeValidation;
//-(void) ObjIntialization;

@end
