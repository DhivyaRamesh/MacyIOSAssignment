//
//  ViewController.m
//  Macys
//
//  Created by llel on 1/28/14.
//  Copyright (c) 2014 DhivyaAshok. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imgBGSearch, imgBottom, imgBottomShopNow,imgHeader,imgTopShopNow,searchImg;
@synthesize btnBottomShopNow,btnTopShopNow,btnScan;
@synthesize collectionView;
@synthesize searchBar;
@synthesize macyImages;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    [self SizeValidation];
    [self ObjIntialization];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**** 
 Function is used to check whether the device is ios6
 setting up the frame of controls to match ios6*
 ****/

-(void) SizeValidation{
    
    if (IOS_6) {
        
        imgHeader.frame   = CGRectMake(0, 0, 320, 44);
        imgBGSearch.frame = CGRectMake(0, 44, 320, 44);
        searchBar.frame   = CGRectMake(0, 44, 220, 44);
        searchImg.frame   = CGRectMake(220, 44, 100, 44);
        imgTopShopNow.frame    = CGRectMake(0, 88, 320, 100);
        btnTopShopNow.frame    = CGRectMake(35, 150, 100, 30);
        collectionView.frame   = CGRectMake(0, 188, 320, 216);
        imgBottomShopNow.frame = CGRectMake(0, 404, 320, 100);
        btnBottomShopNow.frame = CGRectMake(35, 466, 100, 30);
        imgBottom.frame        = CGRectMake(0, 504, 320, 44);
    }
    
}
/***** 
 Function is used to do the variable intialization 
*****/

-(void) ObjIntialization{
    
    // Initialize  image array
    macyImages = [NSArray arrayWithObjects:@"shop.png", @"registry.png", @"stores.png", @"bag.png", @"offers.png", @"account.png", nil];
    
}


/******
 Implementationof collection view its a dynamic grid layout 
 so based on the requirement the grid count can be increased
 
 UICollectionViewDataSource protocol two mandatory functions
 
 collectionView:numberOfItemsInSection: method returns the number of  images
 cellForItemAtIndexPath: method provides the data for the collection view cells
 
 ******/
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return macyImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView1 cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";

    //setting up image in each cell based on the array count
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.macyImage.image = [UIImage imageNamed:[macyImages objectAtIndex:indexPath.row]];
  
    cell.macyImage.tag = indexPath.row+1;
    cell.macyImage.userInteractionEnabled = YES;
    
    // to provide interaction for the images loaded in each cell
    UITapGestureRecognizer *ImgTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ImagePress:)];
    [ImgTap setNumberOfTouchesRequired:1];
    [cell.macyImage addGestureRecognizer:ImgTap];
    
    return cell;
}


/***
 Function to perform when image is pressed in cell layout 
 getting their image id and passing the value to detailviewcontroller
 ***/

-(void) ImagePress:(UITapGestureRecognizer *)gestureRecognizer{
    
    DebugLog(@"Func ImagePress called");
    
    //Get the View
    UIImageView *tableGridImage = (UIImageView*)gestureRecognizer.view;
    DebugLog("\n\n tableGridImage : %ld",(long)tableGridImage.tag);
    [self pushViewController:tableGridImage.tag];
    
    DebugLog(@"Func btnPressed Exited");
}

/***
 Function to navigate to Detailviewcontroller when image cell is pressed each time
 Passing the image index to next view
 ***/
- (void)pushViewController:(NSInteger)indexValue {
    
    DebugLog(@"Func pushViewController called");
    
    [searchBar resignFirstResponder];
    
    //storyboard instaniation and perform navigation
    UIStoryboard *story   = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *detailPageVC =(DetailViewController *)[story instantiateViewControllerWithIdentifier:@"DetailVC"];
    detailPageVC.lblIndex = indexValue;
   
    [self.navigationController pushViewController:detailPageVC animated:YES];
    
     DebugLog(@"Func pushViewController Exited");
}
/***
 Function to peform button action
 when shopnow or Scan button is clicked
 ***/

-(IBAction)btnPressed:(id)sender{
    
    
   DebugLog(@"Func btnPressed called");
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Macys"
                                                      message:@"Exciting offers coming soon."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
    
    DebugLog(@"Func btnPressed Exited");
    
}




/***
 UISearchBarDelegateProtocol
 Function to not to show the cancel button and resigning the  keypad
 ***/
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBarWebId {
    [self.searchBar setShowsCancelButton:NO animated:YES];
    [searchBarWebId resignFirstResponder];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBarWebId;
{
    
    [searchBarWebId resignFirstResponder];
}


/***
UISearchBarDelegateProtocol
 Function to show cancel button and editing text
 ***/
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                                                  [UIColor whiteColor],
                                                                                                  UITextAttributeTextColor,
                                                                                                  [UIColor whiteColor],
                                                                                                  UITextAttributeTextShadowColor,
                                                                                                  [NSValue valueWithUIOffset:UIOffsetMake(0, 1)],
                                                                                                  UITextAttributeTextShadowOffset,
                                                                                                  nil]
                                                                                        forState:UIControlStateNormal];
    [self.searchBar setShowsCancelButton:YES animated:YES];
}

@end
