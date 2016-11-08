//
//  GameModel.h
//  2PlayerMath
//
//  Created by Thomas Alexanian on 2016-11-07.
//  Copyright © 2016 Thomas Alexanian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Player;

@interface GameModel : NSObject

-(void)generateQuestionfor:(BOOL)isPlayer1Turn;

-(NSString*)getPlayer1Question;

-(NSString*)getPlayer2Question;

-(BOOL)getPlayerTurn;

-(NSInteger)getPlayer1Score;

-(NSInteger)getPlayer2Score;

-(NSInteger)getPlayer1Lives;

-(NSInteger)getPlayer2Lives;

-(void)changeTurn;

-(void)checkAnswer:(NSInteger)answer;

@end
