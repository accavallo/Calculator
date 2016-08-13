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

@interface ViewController : UIViewController{

    double currentNumber;
    Boolean decimalSet;
    NSMutableString *displayString;
    MyLabel *outputLabel;
    UILabel *operandLabel;
    UIButton *zero;
    UIButton *one;
    UIButton *two;
    UIButton *three;
    UIButton *four;
    UIButton *five;
    UIButton *six;
    UIButton *seven;
    UIButton *eight;
    UIButton *nine;
    UIButton *plus;
    UIButton *minus;
    UIButton *divide;
    UIButton *multiply;
    UIButton *decimal;
    UIButton *equals;
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

