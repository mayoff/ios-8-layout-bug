//
//  ViewController.m
//  constraint
//
//  Created by Rob Mayoff on 9/26/14.
//  Copyright (c) 2014 Rob Mayoff. All rights reserved.
//

#import "ViewController.h"
@import CoreMedia;

@interface ViewController ()

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *constraint;
@property (strong, nonatomic) IBOutlet UIView *container;

@end

@implementation ViewController {
    BOOL enableWorkaround : 1;
}

- (IBAction)panRecognizerDidFire:(UIPanGestureRecognizer *)panner {
    CGFloat offset = self.constraint.constant + [panner translationInView:self.view].y;
    offset = MAX(0, MIN(offset, self.view.bounds.size.height));
    self.constraint.constant = offset;
    [panner setTranslation:CGPointZero inView:self.view];

    if (enableWorkaround) {
        [self.container setNeedsLayout];
    }
}

- (IBAction)viewWasTapped:(id)sender {
    enableWorkaround = !enableWorkaround;
}

@end
