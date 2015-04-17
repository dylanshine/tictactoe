//
//  TicTacToe.h
//  TicTacToe
//
//  Created by Dylan Shine on 4/17/15.
//  Copyright (c) 2015 Dylan Shine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TicTacToe : NSObject

@property (readonly) NSMutableArray *board;
@property (readonly) NSString *turn;

-(void) play;
@end
