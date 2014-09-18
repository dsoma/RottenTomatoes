//
//  RTErrorView.m
//  RottenTomatoes
//
//  Created by Deepak Somashekhara on 9/17/14.
//  Copyright (c) 2014 Deepak Somashekhara. All rights reserved.
//

#import "RTErrorView.h"

@interface RTErrorView ()

@property (strong, nonatomic) UILabel* label;

@end

@implementation RTErrorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UIView *rect = [[UIView alloc] init];
        rect.frame = frame;
        rect.backgroundColor = [UIColor blackColor];
        
        self.userInteractionEnabled = NO;
        self.alpha = 1;
        
        [self addSubview:rect];
        
        self.label = [[UILabel alloc] initWithFrame:frame];
        self.label.text = @"Network Error";
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont fontWithName:@"Helvetica Bold" size:15];
        self.label.textColor = [UIColor whiteColor];
        
        [self addSubview:self.label];
    }
    
    return self;
}


-(void) setErrorText:(NSString*)errorText
{
    self.label.text = errorText;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
}
*/

@end
