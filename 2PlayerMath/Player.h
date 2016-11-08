//
//  Player.h
//  2PlayerMath
//
//  Created by Thomas Alexanian on 2016-11-07.
//  Copyright © 2016 Thomas Alexanian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

-(void)loseLife;

-(NSInteger)getLives;
-(NSInteger)getScore;

@end
