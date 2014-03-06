//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Gong heng on 12-9-14.
//  Copyright (c) 2012年 Gong heng. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

{
    char op,prevOp;
    int currentNumber;
    int isNegative;
    BOOL firstOperand,isNumerator,isChain;
    Calculator *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;

-(void)viewDidLoad
{
    firstOperand=YES;
    isNumerator=YES;
    isChain=NO;
    isNegative=1;
    myCalculator=[[Calculator alloc]init];
    displayString=[NSMutableString stringWithCapacity:40];
}

-(void)processDigit:(int)digit
{
    currentNumber=currentNumber*10+digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%i",digit]];
    
    display.text=displayString;
    NSLog(@"%i",currentNumber);
}

-(IBAction)clickDigit:(UIButton *)sender
{
    int digit=sender.tag;
    
    [self processDigit:digit];
}

-(void)processOp:(char)theOp
{
    NSString *opStr;
    op=theOp;
    switch (op) {
        case '+':
            opStr=@"+";
            break;
            
        case '-':
            opStr=@"-";
            break;
            
        case '*':
            opStr=@"*";
            break;
            
        case '/':
            opStr=@"/";
            break;
            
    }
    if (isChain==NO) {
        [self storeFracPart];
        isNumerator=YES;
        firstOperand=NO;
        isChain=YES;
        [displayString appendString:opStr];
        display.text=displayString;
        prevOp=op;
        
    }
        
    
    else
    {
        
        [self storeFracPart];
        [myCalculator performOperation:prevOp];
        NSLog(@"%c",prevOp);
        
        int n=myCalculator.accumulator.numerator;
        int d=myCalculator.accumulator.denominator;
        myCalculator.operand1.numerator=n;
        myCalculator.operand1.denominator=d;
        NSLog(@"operand2:%i/%i",myCalculator.operand2.numerator,myCalculator.operand2.denominator);
        NSLog(@"accu:%i/%i",myCalculator.accumulator.numerator,myCalculator.accumulator.denominator);
        NSLog(@"operand1:%i/%i",myCalculator.operand1.numerator,myCalculator.operand1.denominator);
        [displayString appendString:opStr];
        display.text=displayString;
        prevOp=op;
        currentNumber=0;
        isNumerator=YES;
    }
     
}

-(void)storeFracPart
{
    if (firstOperand) {
        if(isNumerator)
        {
            myCalculator.operand1.numerator=currentNumber*isNegative;
            myCalculator.operand1.denominator=1;//e.g. 3*4/5
        }
        else
        {
            myCalculator.operand1.denominator=currentNumber*isNegative;
        }
    }
    
    else if (isNumerator)
    {
        myCalculator.operand2.numerator=currentNumber*isNegative;
        myCalculator.operand2.denominator=1;
        NSLog(@"this");
    }
    
    else
    {
        myCalculator.operand2.denominator=currentNumber*isNegative;
        //firstOperand=YES;
    }

    currentNumber=0;
    isNegative=1;
}

-(IBAction)clickPlus:(id)sender
{
        [self processOp:'+'];
}

-(IBAction)clickMinus:(id)sender
{
        [self processOp:'-'];
}

-(IBAction)clickMultiply:(id)sender
{
        [self processOp:'*'];
}

-(IBAction)clickDivide:(id)sender
{
        [self processOp:'/'];
}

-(IBAction)clickOver:(id)sender
{
    [self storeFracPart];
    [displayString appendString:@"/"];
    display.text=displayString;
    isNumerator=NO;
}

-(IBAction)clickClear:(id)sender
{
    currentNumber=0;
    isNumerator=YES;
    firstOperand=YES;
    isChain=NO;
    [displayString setString:@""];
    display.text=displayString;
    [myCalculator clear];
}

-(IBAction)clickEquals:(id)sender
{
    [self storeFracPart];
    
    if (myCalculator.operand1.denominator==0||myCalculator.operand2.denominator==0) {
        NSLog(@"d for op1:%i,d for op2:%i",myCalculator.operand1.denominator,myCalculator.operand2.numerator);
        [self performSelector:@selector(clickClear:)];
        [displayString setString:@"Error"];
        display.text=displayString;
    }
    else if (firstOperand==NO) {
        [displayString appendString:@"="];
        
        [myCalculator performOperation:op];
        
        [displayString appendString:[myCalculator.accumulator convertToString]];
       
        display.text=displayString;
        
        isNumerator=YES;
        firstOperand=YES;
        isChain=NO;
        currentNumber=0;
        
        [displayString setString:@""];
    }
        
}

-(IBAction)clickConvert:(id)sender
{
    [displayString setString:[NSString stringWithFormat:@"%g",[myCalculator.accumulator convertToNum] ]];
    NSLog(@"accumulator=%g",[myCalculator.accumulator convertToNum]);
    display.text=displayString;
    [displayString setString:@""];
}

-(IBAction)clickNegative:(id)sender
{
    isNegative=-1;
    [displayString appendString:@"-"];
    display.text=displayString;
}

@end
