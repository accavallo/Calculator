//
//  Calculator.m
//  FractionCalculator
//
//  Created by Tony on 8/6/15.
//  Copyright (c) 2015 Cavallo, Anthony. All rights reserved.
//

#import "Calculator.h"
#import "Fraction.h"

@implementation Calculator
//@synthesize operand1, operand2, accumulator;

-(id) init {
    self = [super init];
    
    if (self) {
        operand1 = 0.0;
        operand2 = 0.0;
//        accumulator = [[Fraction alloc] init];
    }
    
    return self;
}

-(void) setOperand1:(long double)num {
    operand1 = num;
}

-(void) setOperand2:(long double)num {
    operand2 = num;
}

-(void) clear {
    _accumulator.numerator = 0;
    _accumulator.denominator = 0;
}

-(NSString *) performOperation:(NSString *)op {
    long double result;
    
    if ([op isEqualToString:@"+"]) {
        result = operand1 + operand2;
    } else if ([op isEqualToString:@"-"]) {
        result = operand1 - operand2;
    } else if ([op isEqualToString:@"*"]) {
        result = operand1 * operand2;
    } else {
        result = operand1 / operand2;
    }
    
    return [NSString stringWithFormat:@"%.10Lf", result];
}

@end
