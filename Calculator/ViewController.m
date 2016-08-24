//
//  ViewController.m
//  Calculator
//
//  Created by Tony on 8/12/16.
//  Copyright © 2016 Anthony Cavallo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performInitialSetup];
    
    displayString = [NSMutableString stringWithCapacity:50], equationString = [NSMutableString stringWithCapacity:500];
    
    numbersArray = [NSMutableArray arrayWithCapacity:200], operatorsArray = [NSMutableArray arrayWithCapacity:100];
    
    decimalFormatter = [[NSNumberFormatter alloc] init];
    [decimalFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [decimalFormatter setMinimumFractionDigits:0];
    [decimalFormatter setMaximumFractionDigits:10];
//    decimalFormatter.usesSignificantDigits = YES;
//    decimalFormatter.maximumSignificantDigits = 10;
    
    count = 1;
    currentFraction = 0;
    operandNeedSet = false;
//    NSLog(@"%.0f", currentFraction);
    outputLabel.text = @"0";
    
}

//MARK: Row 1 Functions
-(IBAction)trigonometricButtons:(UIButton *)sender {
    sender.alpha = 1.0;
    if ([sender.titleLabel.text isEqualToString:@"Sin"]) {
        NSLog(@"Sine pressed");
    } else if ([sender.titleLabel.text isEqualToString:@"Cos"]) {
        NSLog(@"Cosine pressed");
    } else if ([sender.titleLabel.text isEqualToString:@"Tan"]) {
        NSLog(@"Tangent pressed");
    }
    
    //Leave these blocked for now until I get functionality with operator precedence.
//    [equationString appendString:[NSString stringWithFormat:@"%@(", sender.titleLabel.text]];
//    [displayString appendString:[NSString stringWithFormat:@"%@(", sender.titleLabel.text]];
//    equationLabel.text = equationString;
}

//Fraction button pressed
-(IBAction)fractionButton:(UIButton *)sender {
    sender.alpha = 1.0;
    NSLog(@"Fraction pressed");
}

-(IBAction)clearButtonPressed:(UIButton *)sender {
    sender.alpha = 1.0;
    outputLabel.text = @"0";
    currentNumber = 0;
    currentFraction = 0;
    equationLabel.text = @"";
    [equationString replaceCharactersInRange:NSMakeRange(0, [equationString length]) withString:@""];
    [displayString replaceCharactersInRange:NSMakeRange(0, [displayString length]) withString:@""];
    count = 1;
    decimalSet = false;
    NSLog(@"Clearing output");
}

-(IBAction)eraseEverything:(UIButton *)sender {
    sender.alpha = 1.0;
    NSLog(@"Erasing everything. And I do mean everything");
    outputLabel.text = @"0";
    [equationString replaceCharactersInRange:NSMakeRange(0, [equationString length]) withString:@""];
    [displayString replaceCharactersInRange:NSMakeRange(0, [displayString length]) withString:@""];
    currentNumber = 0;
    currentFraction = 0;
    equationLabel.text = @"";
    count = 1;
    decimalSet = false;
 
    [operatorsArray removeAllObjects];
    [numbersArray removeAllObjects];
}

//MARK: Row 2 Functions
-(IBAction)piPressed:(UIButton *)sender {
    sender.alpha = 1.0;
    outputLabel.text = [NSString stringWithFormat:@"%f", M_PI];
}

//MARK: Row 3 Functions

//MARK: Numberpad Functions
- (IBAction)digitClicked:(UIButton *)sender {
    sender.alpha = 1.0;
//    NSString *temp = sender.titleLabel.text;
//    NSInteger num = [temp integerValue];
//    
//    NSLog(@"%li pressed", (long)num);
    
    [equationString appendString:sender.titleLabel.text];
    equationLabel.text = equationString;
    
    [displayString appendString:sender.titleLabel.text];
    outputLabel.text = displayString;
    
    operandNeedSet = true;
}

- (IBAction)binaryOperatorClicked:(UIButton *)sender {
    sender.alpha = 1.0;
    NSUInteger lastIndex;
    NSString *lastChar;
    NSRange range;
    if ([equationString length] > 0) {
        lastIndex = [equationString length]-1;
        lastChar = [equationString substringFromIndex:lastIndex];
        range = NSMakeRange(lastIndex, 1);
    }
    
    if (operandNeedSet) {
        [equationString appendString:sender.titleLabel.text];
        [operatorsArray addObject:sender.titleLabel.text];
        [numbersArray addObject:outputLabel.text];
        equationLabel.text = equationString;
    } else if (([lastChar isEqualToString:@"+"] || [lastChar isEqualToString:@"-"] ||
               [lastChar isEqualToString:@"*"] || [lastChar isEqualToString:@"÷"]) && lastIndex > 0) {
        [equationString replaceCharactersInRange:range withString:sender.titleLabel.text];
        [operatorsArray replaceObjectAtIndex:([operatorsArray count]-1) withObject:sender.titleLabel.text];
    } else {
        [equationString appendString:@"0"];
        [operatorsArray addObject:sender.titleLabel.text];
        [numbersArray addObject:outputLabel.text];
        [equationString appendString:sender.titleLabel.text];
    }
    equationLabel.text = equationString;
//    NSLog(@"%@", [equationString substringFromIndex:lastIndex]);
//    [numbersArray addObject:displayString];
    
    [displayString replaceCharactersInRange:NSMakeRange(0, [displayString length]) withString:@""];
    
    outputLabel.text = @"0";
    
    operandNeedSet = false;
}

//
- (IBAction)equalsPressed:(UIButton *)sender {
    sender.alpha = 1.0;
    [numbersArray addObject:outputLabel.text];
    //TODO: Equals Sign
    //Go through the entire equation string and separate the operands from the operators into the numbersArray and operatorsArray
    
    NSLog(@"Performing calculations");
    NSLog(@"The operands");
    for (NSString *ind in numbersArray) {
        NSLog(@"%@", ind);
    }
    
    NSLog(@"The operators");
    for (NSString *ind in operatorsArray) {
        NSLog(@"%@", ind);
    }
//    int ind = 0;
    Calculator *myCalc = [[Calculator alloc] init];
    //Go through the entire operands array and perform multiplication and division first.
    for (int k = (int)([operatorsArray count]-1); k >= 0; k--) {
        if ([operatorsArray[k] isEqualToString:@"*"] || [operatorsArray[k] isEqualToString:@"÷"]) {
            [myCalc setOperand1: [numbersArray[k] doubleValue]];
            [myCalc setOperand2: [numbersArray[k+1] doubleValue]];
            
            NSString *result = [myCalc performOperation:operatorsArray[k]];
            
            if ([result isEqualToString:@"Error"])
                break;
            
            [numbersArray removeObjectAtIndex:k];
            [numbersArray replaceObjectAtIndex:k withObject:result];
            
            [operatorsArray removeObjectAtIndex:k];
        }
    }
    
    //Perform the remaining addition and subtraction.
    for (int k = 0; k < [operatorsArray count]; k++) {
        if ([numbersArray[k] isEqualToString:@"Error"])
            break;
        
        [myCalc setOperand1: [numbersArray[k] doubleValue]];
        [myCalc setOperand2: [numbersArray[k+1] doubleValue]];
        
        NSString *result = [myCalc performOperation:operatorsArray[k]];
        
        [numbersArray removeObjectAtIndex:k];
        [numbersArray replaceObjectAtIndex:k withObject:result];
        
        [operatorsArray removeObjectAtIndex:k];
    }
    
    [displayString replaceCharactersInRange:NSMakeRange(0, [displayString length]) withString:@""];
    [equationString replaceCharactersInRange:NSMakeRange(0, [equationString length]) withString:@""];
    
    NSNumber *num = [decimalFormatter numberFromString:numbersArray[0]];
    outputLabel.text = [NSString stringWithFormat:@"%@", num];
    
    [numbersArray removeAllObjects];
    [operatorsArray removeAllObjects];
}

- (IBAction)decimalPressed:(UIButton *)sender {
    sender.alpha = 1.0;
    NSLog(@"Now adding a decimal point");
    if (!decimalSet) {
        if([displayString length] == 0){
            [equationString appendString:@"0"];
            [displayString appendString:@"0"];
        }
        [equationString appendString:@"."];
        equationLabel.text = equationString;
        
        [displayString appendString:@"."];
        outputLabel.text = displayString;
    }
    
    decimalSet = true;
}

-(IBAction)touchDown:(UIButton *)sender {
    sender.alpha = 0.25;
}

//All the buttons and labels will be created here, programmatically. I really, really, really, hate working with constraints, as they always seem to get one over on me. Therefore, I'm saying to hell with constraints, and creating everything this way. Constraints can't bother me, and I don't have to spend countless hours messing with them just to have them laugh in my face as they repeatedly don't work. Apple really needs to do something better with their constraints, or they'd probably just tell me to "git gud".
-(void) performInitialSetup {
    //These three variables will be used repeatedly in pretty much everything.
    CGFloat width = [UIScreen mainScreen].bounds.size.width * 0.9;
    CGFloat midX = CGRectGetMidX([UIScreen mainScreen].bounds);
    CGFloat midY = CGRectGetMidY([UIScreen mainScreen].bounds);
    //This will keep the buttons the same relative size compared to the width of the screen.
    CGFloat buttonSize = [UIScreen mainScreen].bounds.size.width * 0.1333333;
//    NSLog(@"screen width = %.0f\nscreen height = %.0f", [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    CGRect frame = CGRectMake(midX * 0.1, midY * 0.25, width, 35);
    
    outputLabel = [[MyLabel alloc] initWithFrame: frame];
    [outputLabel setBackgroundColor:[UIColor whiteColor]];
    [outputLabel setTextColor:[UIColor blackColor]];
    [outputLabel setTextAlignment:NSTextAlignmentRight];
    [outputLabel.layer setCornerRadius:10.0];
    [outputLabel setClipsToBounds:YES];
    [outputLabel.layer setBorderColor:[UIColor blackColor].CGColor];
    
    [self.view addSubview:outputLabel];
    
    equationLabel = [[MyLabel alloc] initWithFrame:CGRectMake(midX * 0.1, midY * 0.18, width, 20)];
//    [equationLabel setBackgroundColor:[UIColor lightGrayColor]];
    [equationLabel setTextColor:[UIColor darkGrayColor]];
    [equationLabel setTextAlignment:NSTextAlignmentRight];
    [equationLabel setFont:[UIFont systemFontOfSize:([UIScreen mainScreen].bounds.size.width / 15)]];
    [equationLabel.layer setCornerRadius:7.5];
    [equationLabel setClipsToBounds:YES];
    [self.view addSubview:equationLabel];
    
    for (int i = 0; i < 7; i++) {
        for (int j = 0; j < 6; j++) {
            //button's x value goes from 0.1 to 1.9 by 0.3 every column and the y value goes from 0.58 to 1.6 by 0.17 every row
            UIButton *temp = [[UIButton alloc] initWithFrame:CGRectMake(midX * (0.1 + 0.3 * j), midY * (0.58 + 0.17 * i), buttonSize, buttonSize)];
            temp.titleLabel.font = [UIFont systemFontOfSize:(buttonSize * 0.35)];
            
            [temp setTitle:[NSString stringWithFormat:@"R%i B%i", i+1, j+1] forState:UIControlStateNormal];
            [temp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [temp setBackgroundColor:[UIColor blackColor]];
            [temp addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
            [temp.layer setCornerRadius: buttonSize * 0.2];
            
            //We run another set of nest if statements to set the button colors for 16 buttons, between the buttons for rows 3 and 4, to gray, along with adding targets to 13 of them
            if (j >= 2 && j < 6 && i > 2) {
                //All of these buttons will be gray, and their font needs to be just a bit bigger.
                [temp setBackgroundColor:[UIColor grayColor]];
                temp.titleLabel.font = [UIFont systemFontOfSize:(buttonSize * 0.5)];
                if (i < 6 && j < 5)
                    [temp addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
                if (j == 5) {   //All of these buttons will be using the binaryOperatorClicked method
                    [temp addTarget:self action:@selector(binaryOperatorClicked:) forControlEvents:UIControlEventTouchUpInside];
                }
            }
            buttonArray[i][j] = temp;
        }
    }
    
    //    √ aⁿ
    
    //Row 1 (top row): Sin, Cos, Tan Fraction, Clear, All Clear
    for (int i = 0; i < 6; i++) {
        [buttonArray[0][i] setBackgroundColor:[UIColor blueColor]];
    }
    
    //MARK: Row 1 Buttons
    //Sin Cos Tan Fraction Clear ClearAll
    [buttonArray[0][0] setTitle:@"Sin" forState:UIControlStateNormal];
    [buttonArray[0][0] addTarget:self action:@selector(trigonometricButtons:) forControlEvents:UIControlEventTouchUpInside];

    [buttonArray[0][1] setTitle:@"Cos" forState:UIControlStateNormal];
    [buttonArray[0][1] addTarget:self action:@selector(trigonometricButtons:) forControlEvents:UIControlEventTouchUpInside];

    [buttonArray[0][2] setTitle:@"Tan" forState:UIControlStateNormal];
    [buttonArray[0][2] addTarget:self action:@selector(trigonometricButtons:) forControlEvents:UIControlEventTouchUpInside];

    [buttonArray[0][3] setTitle:@"A b/c" forState:UIControlStateNormal];
    [buttonArray[0][3] addTarget:self action:@selector(fractionButton:) forControlEvents:UIControlEventTouchUpInside];

    [buttonArray[0][4] setTitle:@"Clear" forState:UIControlStateNormal];
    [buttonArray[0][4] addTarget:self action:@selector(clearButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    [buttonArray[0][5] setTitle:@"Clr All" forState:UIControlStateNormal];
    [buttonArray[0][5] addTarget:self action:@selector(eraseEverything:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //MARK: Row 2 Buttons:
    //Pi Blank Blank Blank Blank Blank
    [buttonArray[1][0] setTitle:@"π" forState:UIControlStateNormal];
    [buttonArray[1][0] setBackgroundColor:[UIColor blueColor]];
    [buttonArray[1][0] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonArray[1][0] addTarget:self action:@selector(piPressed:) forControlEvents:UIControlEventTouchUpInside];
    
//    [buttonArray[1][1] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[1][2] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[1][3] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[1][4] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[1][5] setTitle:@"" forState:UIControlStateNormal];
    
    //MARK: Row 3 Buttons:
    //Blank Blank Blank Blank Blank Blank
//    [buttonArray[2][0] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[2][1] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[2][2] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[2][3] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[2][4] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[2][5] setTitle:@"" forState:UIControlStateNormal];
    
    //MARK: Row 4 Buttons:
    //Blank Blank 7 8 9 +
//    [buttonArray[3][0] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[3][1] setTitle:@"" forState:UIControlStateNormal];
    [buttonArray[3][2] setTitle:@"7" forState:UIControlStateNormal];
    [buttonArray[3][3] setTitle:@"8" forState:UIControlStateNormal];
    [buttonArray[3][4] setTitle:@"9" forState:UIControlStateNormal];
    [buttonArray[3][5] setTitle:@"+" forState:UIControlStateNormal];
    
    //MARK: Row 5 Buttons:
    //Blank Blank 4 5 6 -
//    [buttonArray[4][0] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[4][1] setTitle:@"" forState:UIControlStateNormal];
    [buttonArray[4][2] setTitle:@"4" forState:UIControlStateNormal];
    [buttonArray[4][3] setTitle:@"5" forState:UIControlStateNormal];
    [buttonArray[4][4] setTitle:@"6" forState:UIControlStateNormal];
    [buttonArray[4][5] setTitle:@"-" forState:UIControlStateNormal];
    
    //MARK: Row 6 Buttons:
    //Blank Blank 1 2 3 ÷
//    [buttonArray[5][0] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[5][1] setTitle:@"" forState:UIControlStateNormal];
    [buttonArray[5][2] setTitle:@"1" forState:UIControlStateNormal];
    [buttonArray[5][3] setTitle:@"2" forState:UIControlStateNormal];
    [buttonArray[5][4] setTitle:@"3" forState:UIControlStateNormal];
    [buttonArray[5][5] setTitle:@"÷" forState:UIControlStateNormal];
    
    //MARK: Row 7 Buttons:
    //Blank Blank 0 . = *
//    [buttonArray[6][0] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[6][1] setTitle:@"" forState:UIControlStateNormal];
    
    [buttonArray[6][2] setTitle:@"0" forState:UIControlStateNormal];
    [buttonArray[6][2] addTarget:(self) action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonArray[6][3] setTitle:@"." forState:UIControlStateNormal];
    [buttonArray[6][3] addTarget:(self) action:@selector(decimalPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonArray[6][4] setTitle:@"=" forState:UIControlStateNormal];
    [buttonArray[6][4] addTarget:(self) action:@selector(equalsPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonArray[6][5] setTitle:@"*" forState:UIControlStateNormal];
    
    
    //Do ALL additional button setup between the first for loop and this one. This double loop adds all the buttons to the view at one time.
    for (int i = 0; i < 7; i++) {
        for (int j = 0; j < 6; j++) {
            [self.view addSubview:buttonArray[i][j]];
        }
    }
}
@end
