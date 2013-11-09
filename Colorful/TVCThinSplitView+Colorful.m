//
//  TVCThinSplitView+Colorful.m
//  Colorful
//
//  Created by Clint Harrison on 09/11/2013.
//  Copyright (c) 2013 Clint Harrison. All rights reserved.
//

#import "TVCThinSplitView+Colorful.h"

@implementation TVCThinSplitView (Colorful)

- (void)HexUIDrawDividerInRect:(NSRect)rect
{
    [[RZUserDefaults() colorForKey:@"HexUISplitterColor"] set];
    NSRectFill(rect);
}

@end
