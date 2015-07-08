//
//  ViewController.m
//  TestScrolling
//
//  Created by Vijay Sharma on 7/6/15.
//  Copyright (c) 2015 Vijay Sharma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

-(void)viewDidLoad {
    self.view.backgroundColor = [UIColor grayColor];
    UIImage *image = [UIImage imageNamed:@"photo1.jpeg"];
    
    _imageView.image = image;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.translatesAutoresizingMaskIntoConstraints = YES;
    
    _scrollView.contentOffset = CGPointZero;
    _scrollView.contentSize = _imageView.image.size;
    _scrollView.zoomScale = 1;
    _scrollView.backgroundColor = [UIColor redColor];
    
    [ViewController dumpScrollViewInfo:_scrollView];
    [ViewController dumpImageViewInfo:_imageView];
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView {
//    NSLog(@"They see me zoomin..");
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"They see me scrollin..");
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}  
    
+(void) dumpScrollViewInfo:(UIScrollView *)scrollView {
    NSLog(@"content offset: %@", NSStringFromCGPoint(scrollView.contentOffset));
    NSLog(@"content size: %@", NSStringFromCGSize(scrollView.contentSize));
    NSLog(@"content bounds: %@", NSStringFromCGRect(scrollView.bounds));
    NSLog(@"content frame: %@", NSStringFromCGRect(scrollView.frame));
    NSLog(@"zoom scale: %.2f", scrollView.zoomScale);
    NSLog(@"minimum: %.2f", scrollView.minimumZoomScale);
    NSLog(@"maximum: %.2f", scrollView.maximumZoomScale);
}

+(void) dumpImageViewInfo:(UIImageView *)imageView {
    NSLog(@"image size: %@", NSStringFromCGSize(imageView.image.size));
    NSLog(@"imageview frame: %@", NSStringFromCGRect(imageView.frame));
    NSLog(@"imageview bound: %@", NSStringFromCGRect(imageView.bounds));
}
@end
