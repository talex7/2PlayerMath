//
//  ViewController.m
//  2PlayerMath
//
//  Created by Thomas Alexanian on 2016-11-07.
//  Copyright © 2016 Thomas Alexanian. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"

@interface ViewController ()

@property GameModel* gameModel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *player1ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerField;
@property (weak, nonatomic) IBOutlet UILabel *player1LivesLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2LivesLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameModel = [GameModel new];
    [self.gameModel generateQuestionfor:[self.gameModel getPlayerTurn]];
    _questionLabel.text = [self.gameModel getPlayer1Question];
    [self.questionLabel sizeToFit];
}

- (IBAction)buttonTapped:(UIButton *)sender {
    self.answerField.text = [self.answerField.text stringByAppendingString:[sender titleForState: UIControlStateNormal]];
}

- (IBAction)enterTapped:(UIButton *)sender {
    [self.gameModel checkAnswer:[self.answerField.text integerValue]];
    self.player1ScoreLabel.text = [NSString stringWithFormat:@"Player 1 Score:   %ld", (long)[self.gameModel getPlayer1Score]];
    self.player2ScoreLabel.text = [NSString stringWithFormat:@"Player 2 Score:   %ld", (long)[self.gameModel getPlayer2Score]];
    self.player1LivesLabel.text = [NSString stringWithFormat:@"Lives:   %ld", (long)[self.gameModel getPlayer1Lives]];
    self.player2LivesLabel.text = [NSString stringWithFormat:@"Lives:   %ld", (long)[self.gameModel getPlayer2Lives]];
    [self.gameModel changeTurn];
    [self.gameModel generateQuestionfor:[self.gameModel getPlayerTurn]];
    if ([self.gameModel getPlayerTurn]) {
        _questionLabel.text = [self.gameModel getPlayer1Question];
    } else {
        _questionLabel.text = [self.gameModel getPlayer2Question];
    }
    [self.questionLabel sizeToFit];
    self.answerField.text = @" ";
    
}

@end
