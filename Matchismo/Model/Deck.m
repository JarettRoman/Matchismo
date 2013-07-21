//
//  Deck.m
//  Matchismo
//
//  Created by Jarett Roman on 7/18/13.
//  Copyright (c) 2013 Jarett Roman. All rights reserved.
//

#import "Deck.h"

@interface Deck ()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

- (NSMutableArray *) cards {
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void) addCard: (Card *)card atTop: (BOOL) atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (Card *)drawRandomCard {
    Card * randomCard = nil;
    
    if(self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        //[self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

@end
