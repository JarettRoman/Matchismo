//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Uboa on 7/21/13.
//  Copyright (c) 2013 Uboa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(id)initWithCardCount:(NSUInteger) cardCount
             usingDeck: (Deck *) deck;

-(void)flipCardAtIndex:(NSUInteger) index;

-(Card *)cardAtIndex:(NSUInteger) index;

@property(readonly, nonatomic) int score;

@end
