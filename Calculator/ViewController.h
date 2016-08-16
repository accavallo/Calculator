//
//  ViewController.h
//  Calculator
//
//  Created by Tony on 8/12/16.
//  Copyright © 2016 Anthony Cavallo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"
#import "MyLabel.h"
#import "Fraction.h"

@interface ViewController : UIViewController{

    double currentNumber;
    double currentFraction;
    int count;
    
    Boolean decimalSet;
    
    NSString *displayString;
    
    MyLabel *outputLabel;
    UILabel *operandLabel;
    
    id buttonArray[7][6];
    
    UIButton *zero, *one, *two, *three, *four, *five, *six, *seven, *eight, *nine;
    UIButton *plus, *minus, *divide, *multiply, *decimal, *equals;
    UIButton *clear, *clearAll, *pi, *sin, *cos, *tan, *fraction;
    
    UIButton *r2B2, *r2B3, *r2B4, *r2B5, *r2B6;
    UIButton *r3B1, *r3B2, *r3B3, *r3B4, *r3B5, *r3B6;
    UIButton *r4B1, *r4B2;
    UIButton *r5B1, *r5B2;
    UIButton *r6B1, *r6B2;
    UIButton *r7B1, *r7B2;
}
//@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
- (IBAction)binaryOperatorClicked:(UIButton *)sender;
- (IBAction)digitClicked:(UIButton *)sender;
- (IBAction)equalsPressed:(UIButton *)sender;
- (IBAction)decimalPressed:(UIButton *)sender;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButtonsOutlet;
//@property (weak, nonatomic) IBOutlet UILabel *operandLabel;


-(void) processDigit: (long) digit;
-(void) performInitialSetup;

@end

