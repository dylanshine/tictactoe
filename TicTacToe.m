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
@property int numOfTurns;

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
    NSLog(@"\n%@'s turn, what tile would you like to take (1-9)?", self.turn);
    char choice[1];
    scanf("%s", choice);
    NSString *userInput = [NSString stringWithFormat:@"%s" , choice];
    if([[userInput lowercaseString]  isEqual: @"q"]) {
        exit(0);
    } else if (![self tileChecker:userInput]) {
        NSLog(@"\nSorry, invalid tile.");
        [self makeMove];
    }
}


-(BOOL) horitzonalWin {
    for (int i = 0; i < 9; i += 3) {
        if ([self.board[i] isEqual: self.turn] && [self.board[i + 1] isEqual: self.turn] && [self.board[i+2] isEqual: self.turn]) {
            return YES;
        }
    }
    return NO;
}

-(BOOL) verticalWin {
    for (int i = 0; i < 3; i++) {
        if ([self.board[i] isEqual: self.turn] && [self.board[i+3] isEqual: self.turn] && [self.board[i+6] isEqual: self.turn]) {
            return YES;
        }
    }
    return NO;
}

-(BOOL) diagonalWin {
    if (([self.board[0] isEqual: self.turn] && [self.board[4] isEqual: self.turn] && [self.board[8] isEqual: self.turn]) || ([self.board[2] isEqual: self.turn] && [self.board[4] isEqual: self.turn] && [self.board[6] isEqual: self.turn])) {
        return YES;
    } else {
        return NO;
    }
}

-(void) playAgain {
    char choice[1];
    scanf("%s", choice);
    NSString *userInput = [NSString stringWithFormat:@"%s" , choice];
    
    if ([[userInput lowercaseString]  isEqual: @"y"]) {
        self.board = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
        self.numOfTurns = 0;
    } else if ([[userInput lowercaseString]  isEqual: @"n"]) {
        exit(0);
    } else {
        NSLog(@"\nInvalid input, please try again.");
        [self playAgain];
    }
}


-(void) checkWinner {
    if ([self horitzonalWin] || [self verticalWin] || [self diagonalWin]) {
        NSLog(@"\n%@ wins!", self.turn);
        NSLog(@"\nWould you like to play again? (y/n)");
        [self playAgain];
    }
}

-(void) checkBoardFilled{
    if (self.numOfTurns == 9) {
        NSLog(@"\nIt's a tie!");
        NSLog(@"\nWould you like to play again? (y/n)");
        [self playAgain];
    } else {
        self.numOfTurns += 1;
    }
}

-(void) play {
    while (YES) {
        [self printBoard];
        [self changeTurn];
        [self makeMove];
        [self checkWinner];
        [self checkBoardFilled];
    }
}

@end
