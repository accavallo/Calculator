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
    // Do any additional setup after loading the view, typically from a nib.
    [self performInitialSetup];
    displayString = [NSMutableString stringWithCapacity:40];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

    switch (sender.tag) {
        case 0:
            NSLog(@"0 pressed");
            break;
        case 1:
            NSLog(@"1 pressed");
            break;
        case 2:
            NSLog(@"2 pressed");
            break;
        case 3:
            NSLog(@"3 pressed");
            break;
        case 4:
            NSLog(@"4 pressed");
            break;
        case 5:
            NSLog(@"5 pressed");
            break;
        case 6:
            NSLog(@"6 pressed");
            break;
        case 7:
            NSLog(@"7 pressed");
            break;
        case 8:
            NSLog(@"8 pressed");
            break;
        case 9:
            NSLog(@"9 pressed");
            break;
        default:
            break;
    }
}

-(void) processDigit:(long)digit {
    if (!decimalSet) {
        currentNumber = currentNumber * 10 + digit;
    } else {
        currentNumber = currentNumber / 10 + digit;
    }
    
    
    [displayString appendString:[NSString stringWithFormat:@"%ld", digit]];
    outputLabel.text = displayString;
}


- (IBAction)equalsPressed:(UIButton *)sender {
    int operand;
    if ([operandLabel.text isEqualToString:@"+"]) {
        operand = 0;
    } else if([operandLabel.text isEqualToString:@"-"]) {
        operand = 1;
    } else if ([operandLabel.text isEqualToString:@"/"]) {
        operand = 2;
    } else if ([operandLabel.text isEqualToString:@"*"]) {
        operand = 3;
    }
    
    switch (operand) {
        case 0:
            NSLog(@"Add that shit up");
            break;
        case 1:
            NSLog(@"Gimme that shit boi!");
            break;
        case 2:
            NSLog(@"Dividing like fission");
            break;
        case 3:
            NSLog(@"Multiplying like rabbits");
            break;
        default:
            break;
    }
    NSLog(@"Performing calculations");
}

- (IBAction)decimalPressed:(UIButton *)sender {
    NSLog(@"Now adding a decimal point");
    if(!decimalSet)
        [displayString appendString:@"."];
    outputLabel.text = displayString;
    decimalSet = true;
}

-(void) performInitialSetup {
    CGFloat width = [UIScreen mainScreen].bounds.size.width * 0.9;
    CGFloat midX = CGRectGetMidX([UIScreen mainScreen].bounds);
    CGFloat midY = CGRectGetMidY([UIScreen mainScreen].bounds);
    
    CGRect frame = CGRectMake(midX * 0.1, midY * 0.25, width, 35);
    
    outputLabel = [[MyLabel alloc] initWithFrame: frame];
    [outputLabel setBackgroundColor:[UIColor whiteColor]];
    [outputLabel setTextColor:[UIColor blackColor]];
    [outputLabel setTextAlignment:NSTextAlignmentRight];
    [outputLabel.layer setCornerRadius:10.0];
    [outputLabel.layer setBorderColor:[UIColor blackColor].CGColor];
    [outputLabel setClipsToBounds:YES];
    [self.view addSubview:outputLabel];
    
    operandLabel = [[UILabel alloc] initWithFrame:CGRectMake(midX * 1.75, midY * 0.15, 20, 20)];
    [operandLabel setTextColor:[UIColor grayColor]];
    [operandLabel setTextAlignment:NSTextAlignmentCenter];
    [operandLabel setFont:[UIFont systemFontOfSize:25]];
    [self.view addSubview:operandLabel];
    
    //Set the bottom row (row 1) buttons
    decimal = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.4, midY * 1.26, 50, 50)];
    [decimal setTitle:@"." forState:UIControlStateNormal];
    [decimal setBackgroundColor:[UIColor lightGrayColor]];
    [decimal setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [decimal addTarget:self action:@selector(decimalPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:decimal];
    
    zero = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.7, midY * 1.26, 50, 50)];
    [zero setTitle:@"0" forState:UIControlStateNormal];
    [zero setBackgroundColor:[UIColor lightGrayColor]];
    [zero setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [zero addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    zero.tag = 0;
    [self.view addSubview:zero];
    
    equals = [[UIButton alloc] initWithFrame:CGRectMake(midX, midY * 1.26, 50, 50)];
    [equals setTitle:@"=" forState:UIControlStateNormal];
    [equals setBackgroundColor:[UIColor lightGrayColor]];
    [equals setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [equals addTarget:self action:@selector(equalsPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:equals];
    
    multiply = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.3, midY * 1.26, 50, 50)];
    [multiply setTitle:@"*" forState:UIControlStateNormal];
    [multiply setBackgroundColor:[UIColor lightGrayColor]];
    [multiply setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [multiply addTarget:self action:@selector(binaryOperatorClicked:) forControlEvents:UIControlEventTouchUpInside];
    multiply.tag = 3;
    [self.view addSubview:multiply];
    
    //Set row 2 buttons
    one = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.4, midY * 1.09, 50, 50)];
    [one setTitle:@"1" forState:UIControlStateNormal];
    [one setBackgroundColor:[UIColor lightGrayColor]];
    [one setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [one addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    one.tag = 1;
    [self.view addSubview:one];
    
    two = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.7, midY * 1.09, 50, 50)];
    [two setTitle:@"2" forState:UIControlStateNormal];
    [two setBackgroundColor:[UIColor lightGrayColor]];
    [two setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [two addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    two.tag = 2;
    [self.view addSubview:two];
    
    three = [[UIButton alloc] initWithFrame:CGRectMake(midX, midY * 1.09, 50, 50)];
    [three setTitle:@"3" forState:UIControlStateNormal];
    [three setBackgroundColor:[UIColor lightGrayColor]];
    [three setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [three addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    three.tag = 3;
    [self.view addSubview:three];
    
    divide = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.3, midY * 1.09, 50, 50)];
    [divide setTitle:@"/" forState:UIControlStateNormal];
    [divide setBackgroundColor:[UIColor lightGrayColor]];
    [divide setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [divide addTarget:self action:@selector(binaryOperatorClicked:) forControlEvents:UIControlEventTouchUpInside];
    divide.tag = 2;
    [self.view addSubview:divide];
    
    //Set row 3 buttons
    four = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.4, midY * 0.92, 50, 50)];
    [four setTitle:@"4" forState:UIControlStateNormal];
    [four setBackgroundColor:[UIColor lightGrayColor]];
    [four setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [four addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    four.tag = 4;
    [self.view addSubview:four];
    
    five = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.7, midY * 0.92, 50, 50)];
    [five setTitle:@"5" forState:UIControlStateNormal];
    [five setBackgroundColor:[UIColor lightGrayColor]];
    [five setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [five addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    five.tag = 5;
    [self.view addSubview:five];
    
    six = [[UIButton alloc] initWithFrame:CGRectMake(midX, midY * 0.92, 50, 50)];
    [six setTitle:@"6" forState:UIControlStateNormal];
    [six setBackgroundColor:[UIColor lightGrayColor]];
    [six setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [six addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    six.tag = 6;
    [self.view addSubview:six];
    
    minus = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.3, midY * 0.92, 50, 50)];
    [minus setTitle:@"-" forState:UIControlStateNormal];
    [minus setBackgroundColor:[UIColor lightGrayColor]];
    [minus setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [minus addTarget:self action:@selector(binaryOperatorClicked:) forControlEvents:UIControlEventTouchUpInside];
    minus.tag = 1;
    [self.view addSubview:minus];
    
    //Set row 4 (top row) buttons
    seven = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.4, midY * 0.75, 50, 50)];
    [seven setTitle:@"7" forState:UIControlStateNormal];
    [seven setBackgroundColor:[UIColor lightGrayColor]];
    [seven setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [seven addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    seven.tag = 7;
    [self.view addSubview:seven];
    
    eight = [[UIButton alloc] initWithFrame:CGRectMake(midX * 0.7, midY * 0.75, 50, 50)];
    [eight setTitle:@"8" forState:UIControlStateNormal];
    [eight setBackgroundColor:[UIColor lightGrayColor]];
    [eight setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [eight addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    eight.tag = 8;
    [self.view addSubview:eight];
    
    nine = [[UIButton alloc] initWithFrame:CGRectMake(midX, midY * 0.75, 50, 50)];
    [nine setTitle:@"9" forState:UIControlStateNormal];
    [nine setBackgroundColor:[UIColor lightGrayColor]];
    [nine setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nine addTarget:self action:@selector(digitClicked:) forControlEvents:UIControlEventTouchUpInside];
    nine.tag = 9;
    [self.view addSubview:nine];
    
    plus = [[UIButton alloc] initWithFrame:CGRectMake(midX * 1.3, midY * 0.75, 50, 50)];
    [plus setTitle:@"+" forState:UIControlStateNormal];
    [plus setBackgroundColor:[UIColor lightGrayColor]];
    [plus setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [plus addTarget:self action:@selector(binaryOperatorClicked:) forControlEvents:UIControlEventTouchUpInside];
    plus.tag = 0;
    [self.view addSubview:plus];
}

@end
