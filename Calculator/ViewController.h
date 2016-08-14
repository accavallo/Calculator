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
    
    UIButton *zero, *one, *two, *three, *four, *five, *six, *seven, *eight, *nine;
    UIButton *plus, *minus, *divide, *multiply, *decimal, *equals;
    UIButton *clear, *pi, *sin, *cos, *tan, *fraction;
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

