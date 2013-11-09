#import "TVCMemberList.h"
#import "TPI_Colorful.h"

@interface TVCMemberList (Colorful)

- (void)HexUIUpdateBackgroundColor;

- (NSColor *)HexUIActiveMemberListBackgroundColor;
- (NSColor *)HexUIInactiveMemberListBackgroundColor;
- (NSColor *)HexUINormalCellTextColor;
- (NSColor *)HexUIAwayUserCellTextColor;
- (NSColor *)HexUISelectedCellTextColor;
- (NSColor *)HexUINormalCellTextShadowColor;
- (NSColor *)HexUINormalSelectedCellTextShadowColorForActiveWindow;
- (NSColor *)HexUINormalSelectedCellTextShadowColorForInactiveWindow;
- (NSColor *)HexUIGraphiteSelectedCellTextShadowColorForActiveWindow;

@end
