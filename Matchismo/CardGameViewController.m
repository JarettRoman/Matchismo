//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Uboa on 7/18/13.
//  Copyright (c) 2013 Uboa. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;
@property (nonatomic) int flipCount;
//@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation CardGameViewController

/*-(Deck *) deck {
    if (!_deck)_deck = [[PlayingCardDeck alloc] init];
    return _deck;
}*/

-(CardMatchingGame *) game {
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                         usingDeck:[[PlayingCardDeck alloc] init]];
    return _game;
}


-(void)setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;
    /*for (UIButton *cardButton in cardButtons) {
        Card *card = [self.deck drawRandomCard];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
    }*/
    [self updateUI];
}

-(void) updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected | UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.unplayable ? 0.3 : 1.0;
        /*if (cardButton.selected) {
            self.resultsLabel.text = [NSString stringWithFormat:@"%@", [cardButton currentTitle]];
        }*/
        //self.resultsLabel.text = [NSString stringWithFormat:@"%@", [cardButton currentTitle]];
        //self.resultsLabel.text = cardButton.selected ? card.contents : @"None selected";
        //self.resultsLabel.text = [NSString stringWithFormat:@"%@",];
        
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    //self.resultsLabel.text = [NSString stringWithFormat:@""];
}




- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"Flips updated to %d", self.flipCount);
}

- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    //sender.selected = !sender.isSelected;
    if ([self.game cardAtIndex:[self.cardButtons indexOfObject:sender]].isFaceUp) {
        self.resultsLabel.text = [NSString stringWithFormat: @"Flipped %@!", [self.game cardAtIndex:[self.cardButtons indexOfObject:sender]].contents];
    }
    
    
    self.flipCount++;
    [self updateUI];
    //[sender setTitle:[[self.deck drawRandomCard] contents] forState:UIControlStateSelected];
}


@end
