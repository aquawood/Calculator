//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Gong heng on 12-9-14.
//  Copyright (c) 2012年 Gong heng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface CalculatorViewController : UIViewController

@property (strong,nonatomic)IBOutlet UILabel *display;

-(void)processDigit:(int)digit;
-(void)processOp:(char)theOp;
-(void)storeFracPart;

//Numeric keys

-(IBAction)clickDigit:(id)sender;

//Arithmetic Operation Keys

-(IBAction)clickPlus:(id)sender;
-(IBAction)clickMinus:(id)sender;
-(IBAction)clickMultiply:(id)sender;
-(IBAction)clickDivide:(id)sender;

//Misc. Keys

-(IBAction)clickOver:(id)sender;
-(IBAction)clickClear:(id)sender;
-(IBAction)clickEquals:(id)sender;
-(IBAction)clickConvert:(id)sender;
-(IBAction)clickNegative:(id)sender;


@end
