//
//  MyLabel.m
//  Calculator
//
//  Created by Tony on 8/12/16.
//  Copyright © 2016 Anthony Cavallo. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

@end
