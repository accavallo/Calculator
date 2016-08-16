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

@implementation ViewController {
}

//@synthesize outputLabel, allButtonsOutlet, operandLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performInitialSetup];
    displayString = [NSMutableString stringWithCapacity:40];
    count = 1;
    currentFraction = 0;
    NSLog(@"%.0f", currentFraction);
    outputLabel.text = @"0";
}


- (IBAction)binaryOperatorClicked:(UIButton *)sender {
    sender.alpha = 1.0;
    if ([sender.titleLabel.text isEqualToString:@"+"]) {
        NSLog(@"Performing addition");
        operandLabel.text = @"+";
    } else if([sender.titleLabel.text isEqualToString:@"-"]) {
        NSLog(@"Performing subtraction");
        operandLabel.text = @"-";
    } else if ([sender.titleLabel.text isEqualToString:@"÷"]) {
        NSLog(@"Performing division");
        operandLabel.text = @"÷";
    } else if ([sender.titleLabel.text isEqualToString:@"*"]) {
        NSLog(@"Performing multiplication");
        operandLabel.text = @"*";
    }
//    switch (sender.tag) {
//        case 0:
//            NSLog(@"+ clicked");
//
//            break;
//        case 1:
//            NSLog(@"- clicked");
//
//            break;
//        case 2:
//            NSLog(@"/ clicked");
//
//            break;
//        case 3:
//            NSLog(@"* clicked");
//
//            break;
//        default:
//            break;
//    }
}

- (IBAction)digitClicked:(UIButton *)sender {
    sender.alpha = 1.0;
    
    if ([sender.titleLabel.text isEqualToString:@"1"]) {
        NSLog(@"1 pressed");
        [self processDigit:1];
    } else if ([sender.titleLabel.text isEqualToString:@"2"]) {
        NSLog(@"2 pressed");
        [self processDigit:2];
    } else if ([sender.titleLabel.text isEqualToString:@"3"]) {
        NSLog(@"3 pressed");
        [self processDigit:3];
    } else if ([sender.titleLabel.text isEqualToString:@"4"]) {
        NSLog(@"4 pressed");
        [self processDigit:4];
    } else if ([sender.titleLabel.text isEqualToString:@"5"]) {
        NSLog(@"5 pressed");
        [self processDigit:5];
    } else if ([sender.titleLabel.text isEqualToString:@"6"]) {
        NSLog(@"6 pressed");
        [self processDigit:6];
    } else if ([sender.titleLabel.text isEqualToString:@"7"]) {
        NSLog(@"7 pressed");
        [self processDigit:7];
    } else if ([sender.titleLabel.text isEqualToString:@"8"]) {
        NSLog(@"8 pressed");
        [self processDigit:8];
    } else if ([sender.titleLabel.text isEqualToString:@"9"]) {
        NSLog(@"9 pressed");
        [self processDigit:9];
    } else if ([sender.titleLabel.text isEqualToString:@"0"]) {
        NSLog(@"0 pressed");
        [self processDigit:0];
    }
//    [self processDigit:sender.tag];

//    switch (sender.tag) {
//        case 0:
//            NSLog(@"0 pressed");
//            break;
//        case 1:
//            NSLog(@"1 pressed");
//            break;
//        case 2:
//            NSLog(@"2 pressed");
//            break;
//        case 3:
//            NSLog(@"3 pressed");
//            break;
//        case 4:
//            NSLog(@"4 pressed");
//            break;
//        case 5:
//            NSLog(@"5 pressed");
//            break;
//        case 6:
//            NSLog(@"6 pressed");
//            break;
//        case 7:
//            NSLog(@"7 pressed");
//            break;
//        case 8:
//            NSLog(@"8 pressed");
//            break;
//        case 9:
//            NSLog(@"9 pressed");
//            break;
//        default:
//            break;
//    }
}

-(void) processDigit:(long)digit {
    if (!decimalSet) {
        currentNumber = currentNumber * 10 + digit;
        outputLabel.text = [NSString stringWithFormat:@"%.0f", currentNumber];
    } else {
        currentFraction = currentFraction * 10 + digit; //THIS WON'T WORK. I NEED TO KEEP TRACK OF THE DECIMAL SEPARATELY
        count++;
        outputLabel.text = [NSString stringWithFormat:@"%.0f.%.0f", currentNumber, currentFraction];
    }
    NSLog(@"%.0f %.0f", currentNumber, currentFraction);
//    currentNumber += fract / (count * 10);
}

-(IBAction)clearButtonPressed:(UIButton *)sender {
    sender.alpha = 1.0;
    outputLabel.text = @"0";
    currentNumber = 0;
    currentFraction = 0;
    operandLabel.text = @"";
    count = 1;
    decimalSet = false;
    NSLog(@"Clearing output");
}

-(IBAction)trigonometricButtons:(UIButton *)sender {
    sender.alpha = 1.0;
    if ([sender.titleLabel.text isEqualToString:@"Sin"]) {
        NSLog(@"Sine pressed");
    } else if ([sender.titleLabel.text isEqualToString:@"Cos"]) {
        NSLog(@"Cosine pressed");
    } else if ([sender.titleLabel.text isEqualToString:@"Tan"]) {
        NSLog(@"Tangent pressed");
    }
//    switch (sender.tag) {
//        case 0:
//            NSLog(@"Sine pressed");
//            break;
//        case 1:
//            NSLog(@"Cosine pressed");
//            break;
//        case 2:
//            NSLog(@"Tangent pressed");
//            break;
//        default:
//            break;
//    }
}

//Fraction button pressed
-(IBAction)fractionButton:(UIButton *)sender {
    sender.alpha = 1.0;
    NSLog(@"Fraction pressed");
}

//
- (IBAction)equalsPressed:(UIButton *)sender {
    sender.alpha = 1.0;
    
    
    NSLog(@"Performing calculations");
}

- (IBAction)decimalPressed:(UIButton *)sender {
    sender.alpha = 1.0;
    NSLog(@"Now adding a decimal point");
//    if(!decimalSet)
//        [displayString appendString:@"."];
//    outputLabel.text = displayString;
    decimalSet = true;
}

-(IBAction)piPressed:(UIButton *)sender {
    sender.alpha = 1.0;
    outputLabel.text = [NSString stringWithFormat:@"%f", M_PI];
}

-(IBAction)eraseEverything:(UIButton *)sender {
    sender.alpha = 1.0;
    NSLog(@"Erasing everything. And I do mean everything");
    outputLabel.text = @"0";
    //TODO: Clear all the arrays once I get them going.
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
    
    operandLabel = [[UILabel alloc] initWithFrame:CGRectMake(midX * 1.75, midY * 0.15, buttonSize * 0.4, buttonSize * 0.4)];
    [operandLabel setTextColor:[UIColor grayColor]];
    [operandLabel setTextAlignment:NSTextAlignmentCenter];
    [operandLabel setFont:[UIFont systemFontOfSize:([UIScreen mainScreen].bounds.size.width / 15)]];
    [self.view addSubview:operandLabel];
    
    for (int i = 0; i < 7; i++) {
        for (int j = 0; j < 6; j++) {
            //button's x value goes from 0.1 to 1.9 by 0.3 every column and the y value goes from 0.58 to 1.6 by 0.17 every row
            UIButton *temp = [[UIButton alloc] initWithFrame:CGRectMake(midX * (0.1 + 0.3 * j), midY * (0.58 + 0.17 * i), buttonSize, buttonSize)];
//            buttonArray[i][j] = [[UIButton alloc] initWithFrame:CGRectMake(midX * (0.1 + 0.3 * j), midY * (0.58 + 0.17 * i), buttonSize, buttonSize)];
//            NSLog(@"%f\t%f\t%i", buttonSize, [UIScreen mainScreen].bounds.size.width / 15, (int)(buttonSize * 0.35));
            temp.titleLabel.font = [UIFont systemFontOfSize:(buttonSize * 0.35)];
            
            [temp setTitle:[NSString stringWithFormat:@"R%i B%i", i+1, j+1] forState:UIControlStateNormal];
            [temp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [temp setBackgroundColor:[UIColor blackColor]];
            [temp addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
            [temp.layer setCornerRadius: buttonSize * 0.2];
            
            //We run another set of nest if statements to set the button colors for 16 buttons, between the buttons for rows 3 and 4, to gray, along with adding targets to 13 of them
            if (j >= 2 && j < 6 && i > 2) {
                [temp setBackgroundColor:[UIColor grayColor]];
                temp.titleLabel.font = [UIFont systemFontOfSize:(buttonSize * 0.6)];
                if (i < 6 && j < 5)
                    [temp addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
                if (j == 5) {   //All of these buttons will be using the binaryOperatorClicked method
                    [temp addTarget:self action:@selector(binaryOperatorClicked:) forControlEvents:UIControlEventTouchUpInside];
                }
            }
            buttonArray[i][j] = temp;
        }
    }
    
    //Row 1 (top row): Sin, Cos, Tan Fraction, Clear, All Clear
    for (int i = 0; i < 6; i++) {
        [buttonArray[0][i] setBackgroundColor:[UIColor blueColor]];
    }
    
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
    
    
    //Row 2: Pi Blank Blank Blank Blank Blank
    [buttonArray[1][0] setTitle:@"π" forState:UIControlStateNormal];
    [buttonArray[1][0] setBackgroundColor:[UIColor blueColor]];
    [buttonArray[1][0] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonArray[1][0] addTarget:self action:@selector(piPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [buttonArray[1][1] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[1][2] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[1][3] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[1][4] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[1][5] setTitle:@"" forState:UIControlStateNormal];
    
    //Row 3: Blank Blank Blank Blank Blank Blank
//    [buttonArray[2][0] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[2][1] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[2][2] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[2][3] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[2][4] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[2][5] setTitle:@"" forState:UIControlStateNormal];
    
    //Row 4: Blank Blank 7 8 9 +
//    [buttonArray[3][0] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[3][1] setTitle:@"" forState:UIControlStateNormal];
    [buttonArray[3][2] setTitle:@"7" forState:UIControlStateNormal];
    [buttonArray[3][3] setTitle:@"8" forState:UIControlStateNormal];
    [buttonArray[3][4] setTitle:@"9" forState:UIControlStateNormal];
    [buttonArray[3][5] setTitle:@"+" forState:UIControlStateNormal];
    
    //Row 5: Blank Blank 4 5 6 -
//    [buttonArray[4][0] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[4][1] setTitle:@"" forState:UIControlStateNormal];
    [buttonArray[4][2] setTitle:@"4" forState:UIControlStateNormal];
    [buttonArray[4][3] setTitle:@"5" forState:UIControlStateNormal];
    [buttonArray[4][4] setTitle:@"6" forState:UIControlStateNormal];
    [buttonArray[4][5] setTitle:@"-" forState:UIControlStateNormal];
    
    //Row 6: Blank Blank 1 2 3 ÷
//    [buttonArray[5][0] setTitle:@"" forState:UIControlStateNormal];
//    [buttonArray[5][1] setTitle:@"" forState:UIControlStateNormal];
    [buttonArray[5][2] setTitle:@"1" forState:UIControlStateNormal];
    [buttonArray[5][3] setTitle:@"2" forState:UIControlStateNormal];
    [buttonArray[5][4] setTitle:@"3" forState:UIControlStateNormal];
    [buttonArray[5][5] setTitle:@"÷" forState:UIControlStateNormal];
    
    //Row 7: Blank Blank 0 . = *
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
    
//    √ aⁿ
    
    /*
    // Row 2 buttons
    one = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.7, midY * 1.43, buttonSize, buttonSize)];
    [one setTitle:@"1" forState:UIControlStateNormal];
    [one setBackgroundColor:[UIColor lightGrayColor]];
    [one setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [one addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [one addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    one.tag = 1;
    [self.view addSubview:one];
    
    two = [[UIButton alloc] initWithFrame:CGRectMake(midX, midY * 1.43, buttonSize, buttonSize)];
    [two setTitle:@"2" forState:UIControlStateNormal];
    [two setBackgroundColor:[UIColor lightGrayColor]];
    [two setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [two addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [two addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    two.tag = 2;
    [self.view addSubview:two];
    
    three = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.3, midY * 1.43, buttonSize, buttonSize)];
    [three setTitle:@"3" forState:UIControlStateNormal];
    [three setBackgroundColor:[UIColor lightGrayColor]];
    [three setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [three addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [three addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    three.tag = 3;
    [self.view addSubview:three];
    
    divide = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.6, midY * 1.43, buttonSize, buttonSize)];
    [divide setTitle:@"/" forState:UIControlStateNormal];
    [divide setBackgroundColor:[UIColor lightGrayColor]];
    [divide setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [divide addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [divide addTarget:self action:@selector(binaryOperatorClicked:) forControlEvents:UIControlEventTouchUpInside];
    divide.tag = 2;
    [self.view addSubview:divide];
    
    //MARK: Row 3 buttons
    four = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.7, midY * 1.26, buttonSize, buttonSize)];
    [four setTitle:@"4" forState:UIControlStateNormal];
    [four setBackgroundColor:[UIColor lightGrayColor]];
    [four setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [four addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [four addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    four.tag = 4;
    [self.view addSubview:four];
    
    five = [[UIButton alloc] initWithFrame:CGRectMake(midX, midY * 1.26, buttonSize, buttonSize)];
    [five setTitle:@"5" forState:UIControlStateNormal];
    [five setBackgroundColor:[UIColor lightGrayColor]];
    [five setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [five addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [five addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    five.tag = 5;
    [self.view addSubview:five];
    
    six = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.3, midY * 1.26, buttonSize, buttonSize)];
    [six setTitle:@"6" forState:UIControlStateNormal];
    [six setBackgroundColor:[UIColor lightGrayColor]];
    [six setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [six addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [six addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    six.tag = 6;
    [self.view addSubview:six];
    
    minus = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.6, midY * 1.26, buttonSize, buttonSize)];
    [minus setTitle:@"-" forState:UIControlStateNormal];
    [minus setBackgroundColor:[UIColor lightGrayColor]];
    [minus setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [minus addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [minus addTarget:self action:@selector(binaryOperatorClicked:) forControlEvents:UIControlEventTouchUpInside];
    minus.tag = 1;
    [self.view addSubview:minus];
    
    //MARK: Row 4 buttons
    seven = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.7, midY * 1.09, buttonSize, buttonSize)];
    [seven setTitle:@"7" forState:UIControlStateNormal];
    [seven setBackgroundColor:[UIColor lightGrayColor]];
    [seven setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [seven addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [seven addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    seven.tag = 7;
    [self.view addSubview:seven];
    
    eight = [[UIButton alloc] initWithFrame:CGRectMake(midX, midY * 1.09, buttonSize, buttonSize)];
    [eight setTitle:@"8" forState:UIControlStateNormal];
    [eight setBackgroundColor:[UIColor lightGrayColor]];
    [eight setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [eight addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [eight addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    eight.tag = 8;
    [self.view addSubview:eight];
    
    nine = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.3, midY * 1.09, buttonSize, buttonSize)];
    [nine setTitle:@"9" forState:UIControlStateNormal];
    [nine setBackgroundColor:[UIColor lightGrayColor]];
    [nine setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nine addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [nine addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    nine.tag = 9;
    [self.view addSubview:nine];
    
    plus = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.6, midY * 1.09, buttonSize, buttonSize)];
    [plus setTitle:@"+" forState:UIControlStateNormal];
    [plus setBackgroundColor:[UIColor lightGrayColor]];
    [plus setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [plus addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [plus addTarget:self action:@selector(binaryOperatorClicked:) forControlEvents:UIControlEventTouchUpInside];
    plus.tag = 0;
    [self.view addSubview:plus];
    
    //MARK: Row 3 buttons
    r3B1 = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.4, midY * 0.75, buttonSize, buttonSize)];
    [r3B1 setTitle:@"R3 B2" forState:UIControlStateNormal];
    [r3B1 setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:r3B1];
    
    r3B2 = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.7, midY * 0.75, buttonSize, buttonSize)];
    [r3B2 setTitle:@"R3 B3" forState:UIControlStateNormal];
    [r3B2 setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:r3B2];
    
    r3B3 = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.1, midY * 1.6, buttonSize, buttonSize)];
    r3B4 = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.1, midY * 1.6, buttonSize, buttonSize)];
    r3B5 = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.1, midY * 1.6, buttonSize, buttonSize)];
    r3B6 = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.1, midY * 1.6, buttonSize, buttonSize)];

    
    
    //MARK: Row 7 buttons (bottom row)
    r7B1 = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.1, midY * 1.6, buttonSize, buttonSize)];
    [r7B1 setTitle:@"R7 B1" forState:UIControlStateNormal];
    [r7B1 setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:r7B1];
    
    r7B2 = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.4, midY * 1.6, buttonSize, buttonSize)];
    [r7B2 setTitle:@"R7 B1" forState:UIControlStateNormal];
    [r7B2 setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:r7B2];
    
    zero = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.7, midY * 1.6, buttonSize, buttonSize)];
    [zero setTitle:@"0" forState:UIControlStateNormal];
    [zero setBackgroundColor:[UIColor lightGrayColor]];
    [zero setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [zero addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [zero addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    zero.tag = 0;
    [self.view addSubview:zero];
    
    decimal = [[UIButton alloc] initWithFrame:CGRectMake(midX, midY * 1.6, buttonSize, buttonSize)];
    [decimal setTitle:@"." forState:UIControlStateNormal];
    [decimal setBackgroundColor:[UIColor lightGrayColor]];
    [decimal setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [decimal addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [decimal addTarget:self action:@selector(decimalPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:decimal];
    
    equals = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.3, midY * 1.6, buttonSize, buttonSize)];
    [equals setTitle:@"=" forState:UIControlStateNormal];
    [equals setBackgroundColor:[UIColor lightGrayColor]];
    [equals setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [equals addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [equals addTarget:self action:@selector(equalsPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:equals];
    
    multiply = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.6, midY * 1.6, buttonSize, buttonSize)];
    [multiply setTitle:@"*" forState:UIControlStateNormal];
    [multiply setBackgroundColor:[UIColor lightGrayColor]];
    [multiply setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [multiply addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [multiply addTarget:self action:@selector(binaryOperatorClicked:) forControlEvents:UIControlEventTouchUpInside];
    multiply.tag = 3;
    [self.view addSubview:multiply];
     
     */
}

@end
