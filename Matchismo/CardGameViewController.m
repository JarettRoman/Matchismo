//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Jarett Roman on 7/18/13.
//  Copyright (c) 2013 Jarett Roman. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (weak, nonatomic) PlayingCardDeck *deck;
@end

@implementation CardGameViewController

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"Flips updated to %d", self.flipCount);
}

- (IBAction)flipCard:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    self.flipCount++;
    if (sender.isSelected) {
        [sender setTitle: @"%d" , [(NSString *) self.deck.drawRandomCard.contents] forState:2];
    }
}


@end
