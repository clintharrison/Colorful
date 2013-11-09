#import "TVCServerList+Colorful.h"

@implementation TVCServerList (Colorful)

- (void)HexUIUpdateBackgroundColor
{
    NSScrollView *scrollView = (id)self.superview.superview;
    [self setBackgroundColor:[NSColor clearColor]];

    if (self.masterController.mainWindowIsActive) {
        [scrollView setBackgroundColor:[self activeWindowListBackgroundColor]];
    } else {
        [scrollView setBackgroundColor:[self inactiveWindowListBackgroundColor]];
    }
    [self setNeedsDisplay:YES];
    [scrollView setNeedsDisplay:YES];
}

#pragma mark Background Colors
- (NSColor *)HexUIActiveWindowListBackgroundColor {
    NSColor *ret = [RZUserDefaults() colorForKey:@"HexUIActiveWindowListBackgroundColor"];
    return ret;
}

- (NSColor *)HexUIInactiveWindowListBackgroundColor {
    return [RZUserDefaults() colorForKey:@"HexUIInactiveWindowListBackgroundColor"];
}

#pragma mark -
#pragma mark Badge Colors
- (NSColor *)HexUIMessageCountBadgeAquaBackgroundColor {
    return [RZUserDefaults() colorForKey:@"HexUIBadgeBackgroundColor"];
}

- (NSColor *)HexUIMessageCountBadgeGraphtieBackgroundColor {
    return [RZUserDefaults() colorForKey:@"HexUIBadgeBackgroundColor"];
}

- (NSColor *)HexUIMessageCountBadgeHighlightBackgroundColor {
    return [RZUserDefaults() colorForKey:@"HexUIBadgeHighlightBackgroundColor"];
}

- (NSColor *)HexUIMessageCountBadgeNormalTextColor {
    return [RZUserDefaults() colorForKey:@"HexUIBadgeNormalTextColor"];
}

- (NSColor *)HexUIMessageCountBadgeSelectedBackgroundColor {
    return [RZUserDefaults() colorForKey:@"HexUIBadgeSelectedBackgroundColor"];
}

- (NSColor *)HexUIMessageCountBadgeSelectedTextColor {
    return [RZUserDefaults() colorForKey:@"HexUIBadgeSelectedTextColor"];
}

- (NSColor *)HexUIMessageCountBadgeShadowColor {
    return [RZUserDefaults() colorForKey:@"HexUIBadgeTextShadowColor"];
}

#pragma mark -
#pragma mark Server Cell Colors
- (NSColor *)HexUIServerCellDisabledTextColor {
    return [RZUserDefaults() colorForKey:@"HexUIServerCellDisabledTextColor"];
}

- (NSColor *)HexUIServerCellNormalTextColor {
    return [RZUserDefaults() colorForKey:@"HexUIServerCellNormalTextColor"];
}

- (NSColor *)HexUIServerCellNormalTextShadowColorForActiveWindow {
    return [RZUserDefaults() colorForKey:@"HexUIServerNormalShadowColor"];
}

- (NSColor *)HexUIServerCellNormalTextShadowColorForInactiveWindow {
    return [RZUserDefaults() colorForKey:@"HexUIServerNormalShadowColor"];
}

- (NSColor *)HexUIServerCellSelectedTextColorForActiveWindow {
    return [RZUserDefaults() colorForKey:@"HexUIServerSelectedTextColor"];
}

- (NSColor *)HexUIServerCellSelectedTextColorForInactiveWindow {
    return [RZUserDefaults() colorForKey:@"HexUIServerSelectedTextColor"];
}

- (NSColor *)HexUIServerCellSelectedTextShadowColorForActiveWindow {
    return [RZUserDefaults() colorForKey:@"HexUIServerSelectedShadowColor"];
}

- (NSColor *)HexUIServerCellSelectedTextShadowColorForInactiveWindow {
    return [RZUserDefaults() colorForKey:@"HexUIServerSelectedShadowColor"];
}

#pragma mark -
#pragma mark Channel Cell Colors
- (NSColor *)HexUIChannelCellNormalTextColor {
    return [RZUserDefaults() colorForKey:@"HexUIChannelNormalTextColor"];
}

- (NSColor *)HexUIChannelCellNormalTextShadowColor {
    return [RZUserDefaults() colorForKey:@"HexUIChannelNormalShadowColor"];
}

- (NSColor *)HexUIChannelCellDisabledItemTextColor {
    return [RZUserDefaults() colorForKey:@"HexUIChannelDisabledTextColor"];
}

- (NSColor *)HexUIChannelCellSelectedTextColorForActiveWindow {
    return [RZUserDefaults() colorForKey:@"HexUIChannelSelectedTextColor"];
}

- (NSColor *)HexUIChannelCellSelectedTextColorForInactiveWindow {
    return [RZUserDefaults() colorForKey:@"HexUIChannelSelectedTextColor"];
}

- (NSColor *)HexUIChannelCellSelectedTextShadowColorForActiveWindow {
    return [RZUserDefaults() colorForKey:@"HexUIChannelSelectedShadowColor"];
}

- (NSColor *)HexUIChannelCellSelectedTextShadowColorForInactiveWindow {
    return [RZUserDefaults() colorForKey:@"HexUIChannelSelectedShadowColor"];
}

#pragma mark -
#pragma mark Graphite Color
- (NSColor *)HexUIGraphiteTextSelectionShadowColor {
    // Not really sure what this is...?
    return [NSColor internalCalibratedRed:17 green:73 blue:126 alpha:1.00];
}

@end
