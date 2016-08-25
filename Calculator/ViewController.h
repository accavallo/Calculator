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

    long double currentNumber;
    long double currentFraction;
    long double arr[100];
    int count;
    
    NSNumberFormatter *decimalFormatter;
    
    NSString *operand;
    
    Boolean decimalSet, operandNeedSet, equalsWasPressed, piWasPressed;
    
    NSMutableString *displayString;
    NSMutableString *equationString;
    
    NSMutableArray *numbersArray;
    NSMutableArray *operatorsArray;
    
    MyLabel *outputLabel;
    MyLabel *equationLabel;
    
    id buttonArray[7][6];
}
//@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
- (IBAction)binaryOperatorClicked:(UIButton *)sender;
- (IBAction)digitClicked:(UIButton *)sender;
- (IBAction)equalsPressed:(UIButton *)sender;
- (IBAction)decimalPressed:(UIButton *)sender;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButtonsOutlet;
//@property (weak, nonatomic) IBOutlet UILabel *operandLabel;

//-(void) fixEquationString;
//-(void) processDigit: (long) digit;
-(void) performParenthesisCalculations;
-(void) performExponentialCalculations;
-(void) performMultiplicationAndDivision;
-(void) performAdditionAndSubtraction;
-(void) performInitialSetup;

@end

