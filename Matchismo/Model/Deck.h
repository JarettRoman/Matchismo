//
//  Deck.h
//  Matchismo
//
//  Created by Uboa on 7/18/13.
//  Copyright (c) 2013 Uboa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard : (Card *)card atTop : (BOOL) atTop;

- (Card *)drawRandomCard;

@end
