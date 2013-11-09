#import "TVCMemberList+Colorful.h"

@implementation TVCMemberList (Colorful)

- (void)HexUIUpdateBackgroundColor
{
    NSScrollView *scrollView = (id)self.superview.superview;
    [self setBackgroundColor:[NSColor clearColor]];

	if (self.masterController.mainWindowIsActive) {
		[scrollView setBackgroundColor:[self performSelector:@selector(activeWindowListBackgroundColor)]];
	} else {
		[scrollView setBackgroundColor:[self performSelector:@selector(inactiveWindowListBackgroundColor)]];
	}
	[self setNeedsDisplay:YES];
    [scrollView setNeedsDisplay:YES];
}

- (NSColor *)HexUIActiveMemberListBackgroundColor
{
    return [RZUserDefaults() colorForKey:@"HexUIActiveMemberListBackgroundColor"];
}

- (NSColor *)HexUIInactiveMemberListBackgroundColor
{
    return [RZUserDefaults() colorForKey:@"HexUIInactiveMemberListBackgroundColor"];
}

- (NSColor *)HexUINormalCellTextColor
{
    return [RZUserDefaults() colorForKey:@"HexUINormalCellTextColor"];
}

- (NSColor *)HexUIAwayUserCellTextColor
{
    return [RZUserDefaults() colorForKey:@"HexUIAwayUserCellTextColor"];
}

- (NSColor *)HexUISelectedCellTextColor
{
    return [RZUserDefaults() colorForKey:@"HexUISelectedCellTextColor"];
}

- (NSColor *)HexUINormalCellTextShadowColor
{
    return [RZUserDefaults() colorForKey:@"HexUINormalCellTextShadowColor"];
}

- (NSColor *)HexUINormalSelectedCellTextShadowColorForActiveWindow
{
    return [RZUserDefaults() colorForKey:@"HexUISelectedCellShadowColor"];
}

- (NSColor *)HexUINormalSelectedCellTextShadowColorForInactiveWindow
{
    return [RZUserDefaults() colorForKey:@"HexUISelectedCellShadowColor"];
}

- (NSColor *)HexUIGraphiteSelectedCellTextShadowColorForActiveWindow
{
    return [RZUserDefaults() colorForKey:@"HexUISelectedCellShadowColor"];
}

@end