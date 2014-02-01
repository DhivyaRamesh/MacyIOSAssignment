//
//  MacysTests.m
//  MacysTests
//
//  Created by llel on 1/28/14.
//  Copyright (c) 2014 Ananda babu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "DetailViewController.h"

@interface MacysTests : XCTestCase
@property (strong,nonatomic) ViewController *testViewController;
@property (strong, nonatomic) DetailViewController *testDetailViewcontroller;
@property (strong, nonatomic) UICollectionView *testCollectionView;
@property (strong, nonatomic)  NSArray* imgArray;

@end

@implementation MacysTests

//@synthesize testDetailViewcontroller,testViewController;

- (void)setUp
{
    [super setUp];
    
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
       //Testing the storyboard
   UIStoryboard *storyboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.testViewController =[storyboard instantiateViewControllerWithIdentifier:@"NavControllerId"];
    
    XCTAssertNotNil(self.testViewController.presentedViewController, @"Failed to show testViewController modal view");
    
    
    }





- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView1 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [self.testCollectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:6];
    recipeImageView.image = [UIImage imageNamed:[self.imgArray objectAtIndex:indexPath.row]];
    
             return cell;
}



-(void) testleftImgepressed:(UITapGestureRecognizer*) gestureRecognizer
{
    [self.testViewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES ];
    

    
    UIImageView *tableGridImage = (UIImageView*)gestureRecognizer.view;
    NSLog(@"\n\n tableGridImage : %ld",(long)tableGridImage.tag);
     UIStoryboard *storyboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.testDetailViewcontroller =[storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    [self.testDetailViewcontroller performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES ];
    
    
}
/*
- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}
*/
@end
