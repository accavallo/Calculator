//
//  Calculator.h
//  FractionCalculator
//
//  Created by Tony on 8/6/15.
//  Copyright (c) 2015 Cavallo, Anthony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Calculator : NSObject

@property (strong, nonatomic) Fraction *operand1;
@property (strong, nonatomic) Fraction *operand2;
@property (strong, nonatomic) Fraction *accumulator;

-(Fraction *) performOperatoin: (char) op;
-(void) clear;

@end
