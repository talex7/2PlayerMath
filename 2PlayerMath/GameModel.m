//
//  GameModel.m
//  2PlayerMath
//
//  Created by Thomas Alexanian on 2016-11-07.
//  Copyright © 2016 Thomas Alexanian. All rights reserved.
//

#import "GameModel.h"
#import "Player.h"

@interface GameModel()

@property (nonatomic) Player *player1;
@property (nonatomic) Player *player2;
@property (nonatomic) NSString *player1Question;
@property (nonatomic) NSString *player2Question;
@property (nonatomic) BOOL isPlayer1Turn;
@property (nonatomic) NSInteger answer;
@property (nonatomic) NSInteger player1Score;
@property (nonatomic) NSInteger player2Score;
@property (nonatomic) NSInteger player1Lives;
@property (nonatomic) NSInteger player2Lives;


@end

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        Player *player1 = [Player new];
        Player *player2 = [Player new];
        _isPlayer1Turn = YES;
        _player1Score = 0;
        _player2Score = 0;
        _player1Lives = 3;
        _player2Lives = 3;
    }
    return self;
}

-(void)generateQuestionfor:(BOOL)isPlayer1Turn {
    int x = arc4random_uniform(11) + 1;
    int y = arc4random_uniform(11) + 1;
    self.answer = x + y;
    if (self.isPlayer1Turn) {
        self.player1Question = [NSString stringWithFormat:@"Player 1:   %d + %d", x, y];
        
    } else {
        self.player2Question = [NSString stringWithFormat:@"Player 2:   %d + %d", x, y];
        
    }
}

-(NSString*)getPlayer1Question {
    return self.player1Question;
}

-(NSString*)getPlayer2Question {
    return self.player2Question;
}

-(BOOL)getPlayerTurn {
    return self.isPlayer1Turn;
}

-(NSInteger)getPlayer1Score {
    return self.player1Score;
}

-(NSInteger)getPlayer2Score {
    return self.player2Score;
}

-(NSInteger)getPlayer1Lives {
    return self.player1Lives;
}

-(NSInteger)getPlayer2Lives {
    return self.player2Lives;
}


-(void)changeTurn {
    self.isPlayer1Turn = !self.isPlayer1Turn;
}

-(void)checkAnswer:(NSInteger)answer {
    if (self.isPlayer1Turn) {
        if (self.answer == answer) {
            self.player1Score ++;
        } else {
            self.player1Lives --;
        }
    } else if (self.answer == answer) {
        self.player2Score ++;
    } else {
        self.player2Lives --;
    }
}


@end
