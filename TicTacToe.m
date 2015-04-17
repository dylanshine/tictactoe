//
//  TicTacToe.m
//  TicTacToe
//
//  Created by Dylan Shine on 4/17/15.
//  Copyright (c) 2015 Dylan Shine. All rights reserved.
//

#import "TicTacToe.h"
@interface TicTacToe ()

@property NSMutableArray *board;
@property NSString *turn;

@end

@implementation TicTacToe

- (instancetype)init
{
    self = [super init];
    if (self) {
        _board = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
        _turn = @"";
    }
    return self;
}

@end
