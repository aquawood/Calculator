//
//  Fraction.h
//  Calculator
//
//  Created by Gong heng on 12-9-15.
//  Copyright (c) 2012年 Gong heng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Fraction : NSObject<NSCopying>
@property (nonatomic)int numerator,denominator;

-(void)print;
-(void)setTo:(int)n over:(int)d;
-(Fraction *)add:(Fraction *)f;
-(Fraction *)subtract:(Fraction *)f;
-(Fraction *)multiply:(Fraction *)f;
-(Fraction *)divide:(Fraction *)f;

-(void)reduce;
-(double)convertToNum;
-(NSString *)convertToString;

@end
