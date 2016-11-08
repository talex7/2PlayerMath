//
//  Player.m
//  2PlayerMath
//
//  Created by Thomas Alexanian on 2016-11-07.
//  Copyright © 2016 Thomas Alexanian. All rights reserved.
//

#import "Player.h"

@interface Player ()

@property (nonatomic) NSInteger score;
@property (nonatomic) NSInteger lives;

@end

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lives = 3;
        _score = 0;
    }
    return self;
}

-(void)loseLife{
    self.lives -= 1;
}

-(NSInteger)getLives {
    return self.lives;
}

-(NSInteger)getScore {
    return self.score;
}

@end
