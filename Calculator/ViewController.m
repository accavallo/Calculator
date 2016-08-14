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
    switch (sender.tag) {
        case 0:
            NSLog(@"+ clicked");
            operandLabel.text = @"+";
            break;
        case 1:
            NSLog(@"- clicked");
            operandLabel.text = @"-";
            break;
        case 2:
            NSLog(@"/ clicked");
            operandLabel.text = @"/";
            break;
        case 3:
            NSLog(@"* clicked");
            operandLabel.text = @"*";
            break;
        default:
            break;
    }
}

- (IBAction)digitClicked:(UIButton *)sender {
    [self processDigit:sender.tag];

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
    outputLabel.text = @"0";
    currentNumber = 0;
    currentFraction = 0;
    operandLabel.text = @"";
    count = 1;
    decimalSet = false;
    NSLog(@"Clearing everything");
}

-(IBAction)trigonometricButtons:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            NSLog(@"Sine pressed");
            break;
        case 1:
            NSLog(@"Cosine pressed");
            break;
        case 2:
            NSLog(@"Tangent pressed");
            break;
        default:
            break;
    }
}

//Fraction button pressed
-(IBAction)fractionButton:(UIButton *)sender {
    NSLog(@"Fraction pressed");
}

//
- (IBAction)equalsPressed:(UIButton *)sender {

    if ([operandLabel.text isEqualToString:@"+"]) {
        NSLog(@"Performing addition");
    } else if([operandLabel.text isEqualToString:@"-"]) {
        NSLog(@"Performing subtraction");
    } else if ([operandLabel.text isEqualToString:@"/"]) {
        NSLog(@"Performing subtraction");
    } else if ([operandLabel.text isEqualToString:@"*"]) {
        NSLog(@"Performing multiplication");
    }
    
    NSLog(@"Performing calculations");
}

- (IBAction)decimalPressed:(UIButton *)sender {
    NSLog(@"Now adding a decimal point");
//    if(!decimalSet)
//        [displayString appendString:@"."];
//    outputLabel.text = displayString;
    decimalSet = true;
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
    [outputLabel.layer setBorderColor:[UIColor blackColor].CGColor];
    [outputLabel setClipsToBounds:YES];
    [self.view addSubview:outputLabel];
    
    operandLabel = [[UILabel alloc] initWithFrame:CGRectMake(midX * 1.75, midY * 0.15, buttonSize * 0.4, buttonSize * 0.4)];
    [operandLabel setTextColor:[UIColor grayColor]];
    [operandLabel setTextAlignment:NSTextAlignmentCenter];
    [operandLabel setFont:[UIFont systemFontOfSize:([UIScreen mainScreen].bounds.size.width / 15)]];
    [self.view addSubview:operandLabel];
    
    //MARK: Other buttons
    clear = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.6, midY * 0.58, buttonSize, buttonSize)];
    [clear setTitle:@"Clear" forState:UIControlStateNormal];
    [clear setBackgroundColor:[UIColor blueColor]];
    [clear setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [clear addTarget:self action:@selector(clearButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clear];
    
    sin = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.4, midY * 0.58, buttonSize, buttonSize)];
    [sin setTitle:@"Sin" forState:UIControlStateNormal];
    [sin setBackgroundColor:[UIColor blueColor]];
    [sin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sin addTarget:self action:@selector(trigonometricButtons:) forControlEvents:UIControlEventTouchUpInside];
    sin.tag = 0;
    [self.view addSubview:sin];
    
    cos = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.7, midY * 0.58, buttonSize, buttonSize)];
    [cos setTitle:@"Cos" forState:UIControlStateNormal];
    [cos setBackgroundColor:[UIColor blueColor]];
    [cos setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cos addTarget:self action:@selector(trigonometricButtons:) forControlEvents:UIControlEventTouchUpInside];
    cos.tag = 1;
    [self.view addSubview:cos];
    
    tan = [[UIButton alloc] initWithFrame:CGRectMake(midX, midY * 0.58, buttonSize, buttonSize)];
    [tan setTitle:@"Tan" forState:UIControlStateNormal];
    [tan setBackgroundColor:[UIColor blueColor]];
    [tan setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tan addTarget:self action:@selector(trigonometricButtons:) forControlEvents:UIControlEventTouchUpInside];
    tan.tag = 2;
    [self.view addSubview:tan];
    
    fraction = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.3, midY * 0.58, buttonSize, buttonSize)];
    [fraction setTitle:@"A b/c" forState:UIControlStateNormal];
    [fraction setBackgroundColor:[UIColor blueColor]];
    [fraction setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [fraction addTarget:self action:@selector(fractionButton:) forControlEvents:UIControlEventTouchUpInside];
    fraction.tag = 0;
    [self.view addSubview:fraction];
    
    pi = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.3, midY * 0.58, buttonSize, buttonSize)];
    [pi setTitle:@"π" forState:UIControlStateNormal];
    [pi setBackgroundColor:[UIColor blueColor]];
    [pi setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [pi addTarget:self action:@selector(fractionButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pi];
    
//    √ aⁿ
    //MARK: Row 1 buttons (bottom row)
    decimal = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.4, midY * 1.26, buttonSize, buttonSize)];
    [decimal setTitle:@"." forState:UIControlStateNormal];
    [decimal setBackgroundColor:[UIColor lightGrayColor]];
    [decimal setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [decimal addTarget:self action:@selector(decimalPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:decimal];
    
    zero = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.7, midY * 1.26, buttonSize, buttonSize)];
    [zero setTitle:@"0" forState:UIControlStateNormal];
    [zero setBackgroundColor:[UIColor lightGrayColor]];
    [zero setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [zero addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    zero.tag = 0;
    [self.view addSubview:zero];
    
    equals = [[UIButton alloc] initWithFrame:CGRectMake(midX, midY * 1.26, buttonSize, buttonSize)];
    [equals setTitle:@"=" forState:UIControlStateNormal];
    [equals setBackgroundColor:[UIColor lightGrayColor]];
    [equals setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [equals addTarget:self action:@selector(equalsPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:equals];
    
    multiply = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.3, midY * 1.26, buttonSize, buttonSize)];
    [multiply setTitle:@"*" forState:UIControlStateNormal];
    [multiply setBackgroundColor:[UIColor lightGrayColor]];
    [multiply setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [multiply addTarget:self action:@selector(binaryOperatorClicked:) forControlEvents:UIControlEventTouchUpInside];
    multiply.tag = 3;
    [self.view addSubview:multiply];
    
    //MARK: Row 2 buttons
    one = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.4, midY * 1.09, buttonSize, buttonSize)];
    [one setTitle:@"1" forState:UIControlStateNormal];
    [one setBackgroundColor:[UIColor lightGrayColor]];
    [one setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [one addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    one.tag = 1;
    [self.view addSubview:one];
    
    two = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.7, midY * 1.09, buttonSize, buttonSize)];
    [two setTitle:@"2" forState:UIControlStateNormal];
    [two setBackgroundColor:[UIColor lightGrayColor]];
    [two setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [two addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    two.tag = 2;
    [self.view addSubview:two];
    
    three = [[UIButton alloc] initWithFrame:CGRectMake(midX, midY * 1.09, buttonSize, buttonSize)];
    [three setTitle:@"3" forState:UIControlStateNormal];
    [three setBackgroundColor:[UIColor lightGrayColor]];
    [three setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [three addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    three.tag = 3;
    [self.view addSubview:three];
    
    divide = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.3, midY * 1.09, buttonSize, buttonSize)];
    [divide setTitle:@"/" forState:UIControlStateNormal];
    [divide setBackgroundColor:[UIColor lightGrayColor]];
    [divide setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [divide addTarget:self action:@selector(binaryOperatorClicked:) forControlEvents:UIControlEventTouchUpInside];
    divide.tag = 2;
    [self.view addSubview:divide];
    
    //MARK: Row 3 buttons
    four = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.4, midY * 0.92, buttonSize, buttonSize)];
    [four setTitle:@"4" forState:UIControlStateNormal];
    [four setBackgroundColor:[UIColor lightGrayColor]];
    [four setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [four addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    four.tag = 4;
    [self.view addSubview:four];
    
    five = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.7, midY * 0.92, buttonSize, buttonSize)];
    [five setTitle:@"5" forState:UIControlStateNormal];
    [five setBackgroundColor:[UIColor lightGrayColor]];
    [five setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [five addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    five.tag = 5;
    [self.view addSubview:five];
    
    six = [[UIButton alloc] initWithFrame:CGRectMake(midX, midY * 0.92, buttonSize, buttonSize)];
    [six setTitle:@"6" forState:UIControlStateNormal];
    [six setBackgroundColor:[UIColor lightGrayColor]];
    [six setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [six addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    six.tag = 6;
    [self.view addSubview:six];
    
    minus = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.3, midY * 0.92, buttonSize, buttonSize)];
    [minus setTitle:@"-" forState:UIControlStateNormal];
    [minus setBackgroundColor:[UIColor lightGrayColor]];
    [minus setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [minus addTarget:self action:@selector(binaryOperatorClicked:) forControlEvents:UIControlEventTouchUpInside];
    minus.tag = 1;
    [self.view addSubview:minus];
    
    //MARK: Row 4 buttons (top row)
    seven = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.4, midY * 0.75, buttonSize, buttonSize)];
    [seven setTitle:@"7" forState:UIControlStateNormal];
    [seven setBackgroundColor:[UIColor lightGrayColor]];
    [seven setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [seven addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    seven.tag = 7;
    [self.view addSubview:seven];
    
    eight = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.7, midY * 0.75, buttonSize, buttonSize)];
    [eight setTitle:@"8" forState:UIControlStateNormal];
    [eight setBackgroundColor:[UIColor lightGrayColor]];
    [eight setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [eight addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    eight.tag = 8;
    [self.view addSubview:eight];
    
    nine = [[UIButton alloc] initWithFrame:CGRectMake(midX, midY * 0.75, buttonSize, buttonSize)];
    [nine setTitle:@"9" forState:UIControlStateNormal];
    [nine setBackgroundColor:[UIColor lightGrayColor]];
    [nine setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nine addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    nine.tag = 9;
    [self.view addSubview:nine];
    
    plus = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.3, midY * 0.75, buttonSize, buttonSize)];
    [plus setTitle:@"+" forState:UIControlStateNormal];
    [plus setBackgroundColor:[UIColor lightGrayColor]];
    [plus setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [plus addTarget:self action:@selector(binaryOperatorClicked:) forControlEvents:UIControlEventTouchUpInside];
    plus.tag = 0;
    [self.view addSubview:plus];
}

@end
