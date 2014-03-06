//
//  Fraction.m
//  Calculator
//
//  Created by Gong heng on 12-9-15.
//  Copyright (c) 2012年 Gong heng. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator,denominator;

-(id)copyWithZone:(NSZone *)zone
{
    Fraction *newFract=[[Fraction allocWithZone:zone]init];
    [newFract setTo:numerator over:denominator];
    return newFract;
}

-(void)print
{
    NSLog(@"%d/%d",numerator,denominator);
}

-(void)setTo:(int)n over:(int)d
{
    numerator=n;
    denominator=d;
}

-(Fraction *)add:(Fraction *)f
{
    Fraction *result=[[Fraction alloc]init];
    result.numerator=f.numerator*denominator+numerator*f.denominator;
    result.denominator=denominator*f.denominator;
    
    [result reduce];
    return result;
}

-(Fraction *)subtract:(Fraction *)f
{
    Fraction *result=[[Fraction alloc]init];
    result.numerator=numerator*f.denominator-f.numerator*denominator;
    result.denominator=denominator*f.denominator;
    
    [result reduce];
    return result;
}

-(Fraction *)multiply:(Fraction *)f
{
    Fraction *result=[[Fraction alloc]init];
    result.numerator=numerator*f.numerator;
    result.denominator=denominator*f.denominator;
    
    [result reduce];
    return result;
}

-(Fraction *)divide:(Fraction *)f
{
    Fraction *result=[[Fraction alloc]init];
    result.numerator=numerator*f.denominator;
    result.denominator=denominator*f.numerator;
    
    [result reduce];
    return result;
}

-(void)reduce
{
    int u=numerator;
    int v=denominator;
    int temp;
    
    if (u==0) {
        return;
    }
    else if (u<0)
    {
        u=-u;
    }
    while(v!=0)
    {
        temp=u%v;
        u=v;
        v=temp;
    }

    numerator/=u;
    denominator/=u;
}

-(double)convertToNum
{
    if (denominator!=0) {
        return (double)numerator/denominator;
    }
    else
        return NAN;
}

-(NSString *)convertToString
{
    if (numerator==0) {
        return @"0";
    }
    else if (denominator==1) {
        return [NSString stringWithFormat:@"%i",numerator];
    }
    else
        return [NSString stringWithFormat:@"%i/%i",numerator,denominator];
}

@end
