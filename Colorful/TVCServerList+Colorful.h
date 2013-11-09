#import "TVCServerList.h"
#import "TPI_Colorful.h"

@interface TVCServerList (Colorful)

- (void)HexUIUpdateBackgroundColor;

- (NSColor *)HexUIActiveWindowListBackgroundColor;
- (NSColor *)HexUIInactiveWindowListBackgroundColor;

- (NSColor *)HexUIMessageCountBadgeAquaBackgroundColor;
- (NSColor *)HexUIMessageCountBadgeGraphtieBackgroundColor;
- (NSColor *)HexUIMessageCountBadgeHighlightBackgroundColor;
- (NSColor *)HexUIMessageCountBadgeNormalTextColor;
- (NSColor *)HexUIMessageCountBadgeSelectedBackgroundColor;
- (NSColor *)HexUIMessageCountBadgeSelectedTextColor;
- (NSColor *)HexUIMessageCountBadgeShadowColor;

- (NSColor *)HexUIServerCellDisabledTextColor;
- (NSColor *)HexUIServerCellNormalTextColor;
- (NSColor *)HexUIServerCellNormalTextShadowColorForActiveWindow;
- (NSColor *)HexUIServerCellNormalTextShadowColorForInactiveWindow;
- (NSColor *)HexUIServerCellSelectedTextColorForActiveWindow;
- (NSColor *)HexUIServerCellSelectedTextColorForInactiveWindow;
- (NSColor *)HexUIServerCellSelectedTextShadowColorForActiveWindow;
- (NSColor *)HexUIServerCellSelectedTextShadowColorForInactiveWindow;

- (NSColor *)HexUIChannelCellNormalTextColor;
- (NSColor *)HexUIChannelCellNormalTextShadowColor;
- (NSColor *)HexUIChannelCellDisabledItemTextColor;
- (NSColor *)HexUIChannelCellSelectedTextColorForActiveWindow;
- (NSColor *)HexUIChannelCellSelectedTextColorForInactiveWindow;
- (NSColor *)HexUIChannelCellSelectedTextShadowColorForActiveWindow;
- (NSColor *)HexUIChannelCellSelectedTextShadowColorForInactiveWindow;

- (NSColor *)HexUIGraphiteTextSelectionShadowColor;

@end
