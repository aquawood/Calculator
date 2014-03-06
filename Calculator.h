//
//  Calculator.h
//  Calculator
//
//  Created by Gong heng on 12-9-14.
//  Copyright (c) 2012年 Gong heng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fraction.h"

@interface Calculator : NSObject

@property Fraction *operand1,*operand2,*accumulator;

-(Fraction *)performOperation:(char)op;
-(void)clear;


@end
