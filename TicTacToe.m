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

-(void) printBoard {
    NSLog(@"\n______\n|%@|%@|%@|\n______\n|%@|%@|%@|\n______\n|%@|%@|%@|\n______\n", [self.board objectAtIndex:0], [self.board objectAtIndex:1], [self.board objectAtIndex:2], [self.board objectAtIndex:3], [self.board objectAtIndex:4], [self.board objectAtIndex:5], [self.board objectAtIndex:6], [self.board objectAtIndex:7], [self.board objectAtIndex:8]);
}

-(void) changeTurn {
    if ([self.turn isEqual: @"O"]) {
        self.turn = @"X";
    } else {
        self.turn = @"O";
    }
}

-(BOOL) tileChecker:(NSString *)userInput {
    int tileIndex = [userInput intValue] - 1;
    if (![self.board containsObject:userInput] || [self.board[tileIndex] isEqual: @"X"] || [self.board[tileIndex] isEqual: @"O"]) {
        return NO;
    } else {
        [self.board replaceObjectAtIndex:tileIndex withObject:self.turn];
        return YES;
    }
    
    
}


-(void) makeMove {
    NSLog(@"%@'s turn, what tile would you like to take (1-9)?", self.turn);
    char choice[1];
    scanf("%s", choice);
    NSString *userInput = [NSString stringWithFormat:@"%s" , choice];
    
    if (![self tileChecker:userInput]) {
        NSLog(@"Sorry, invalid tile.");
        [self makeMove];
    }
}

-(void) play {
    while (YES) {
        [self printBoard];
        [self changeTurn];
        [self makeMove];
    }
}

@end
