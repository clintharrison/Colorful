//
//  Greetings, stranger.
//  Before we begin, a quick historical explanation: there was a simpler time,
//  before preference panes and complication, from which the name "HexUI" comes.
//  You shall henceforth encounter this name in great quantity.
//  May the manipulatory appendage of the WorldGod be with you.
//
//  Copyright (c) 2013 Clint Harrison.
//

#import "TPI_Colorful.h"

@implementation TPI_Colorful {
    IBOutlet NSView *_prefView;
    IBOutlet ColorfulPreferencesController *_viewController;
}

void swapMethods(Class class, SEL original, SEL replacement)
{
    method_exchangeImplementations(class_getInstanceMethod(class, original), class_getInstanceMethod(class, replacement));
}

- (void)pluginLoadedIntoMemory:(IRCWorld *)world
{
    [self initializePreferences];
    [TPI_Colorful swapServerListMethods];
    [TPI_Colorful swapMemberListMethods];
    [TPI_Colorful swapSplitViewMethods];
    
    [TPI_Colorful forceControlsToRedraw];
}

- (void)pluginUnloadedFromMemory
{
    // we want to swap back to the original implementations
    // obviously exchanging these methods is only smart if we're currently swapped
    if ([RZUserDefaults() boolForKey:@"HexUIEnabled"]) {
        [TPI_Colorful swapServerListMethods];
        [TPI_Colorful swapMemberListMethods];
        [TPI_Colorful swapSplitViewMethods];
        
        [TPI_Colorful forceControlsToRedraw];
    }
}

- (NSView *)preferencesView
{
    if (_prefView == nil) {
        [[NSBundle bundleForClass:[self class]] loadNibNamed:@"Preferences" owner:self topLevelObjects:nil];
    }
    return _prefView;
}

- (NSString *)preferencesMenuItemName {
    return @"Colorful";
}

- (IBAction)onChangedEnabledState:(NSButton *)sender
{
    BOOL enabled = (sender.state == NSOnState);
    [RZUserDefaults() setBool:enabled forKey:@"HexUIEnabled"];
    // toggle whether we have swizzled the drawing methods
    [TPI_Colorful swapMemberListMethods];
    [TPI_Colorful swapServerListMethods];
    [TPI_Colorful swapSplitViewMethods];
    
    [TPI_Colorful forceControlsToRedraw];
}

- (void)initializePreferences
{
    TVCServerList *sl = self.masterController.serverList;
    TVCMemberList *ml = self.masterController.memberList;
    NSDictionary *d = @{
       @"HexUIEnabled": @YES,

       @"HexUIActiveWindowListBackgroundColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(activeWindowListBackgroundColor)]],
       @"HexUIInactiveWindowListBackgroundColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(inactiveWindowListBackgroundColor)]],

       @"HexUIBadgeBackgroundColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(messageCountBadgeAquaBackgroundColor)]],
       @"HexUIBadgeHighlightBackgroundColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(messageCountBadgeHighlightBackgroundColor)]],
       @"HexUIBadgeNormalTextColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(messageCountBadgeNormalTextColor)]],
       @"HexUIBadgeSelectedBackgroundColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(messageCountBadgeSelectedBackgroundColor)]],
       @"HexUIBadgeSelectedTextColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(messageCountBadgeSelectedTextColor)]],
       @"HexUIBadgeTextShadowColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(messageCountBadgeShadowColor)]],

       @"HexUIServerCellDisabledTextColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(serverCellDisabledTextColor)]],
       @"HexUIServerCellNormalTextColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(serverCellNormalTextColor)]],
       @"HexUIServerNormalShadowColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(serverCellNormalTextShadowColorForActiveWindow)]],
       @"HexUIServerSelectedTextColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(serverCellSelectedTextColorForActiveWindow)]],
       @"HexUIServerSelectedShadowColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(serverCellSelectedTextShadowColorForActiveWindow)]],
       
       @"HexUIChannelNormalTextColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(channelCellNormalTextColor)]],
       @"HexUIChannelNormalShadowColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(channelCellNormalTextShadowColor)]],
       @"HexUIChannelDisabledTextColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(channelCellDisabledItemTextColor)]],
       @"HexUIChannelSelectedTextColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(channelCellSelectedTextColorForActiveWindow)]],
       @"HexUIChannelSelectedShadowColor": [NSArchiver archivedDataWithRootObject:[sl performSelector:@selector(channelCellSelectedTextShadowColorForActiveWindow)]],
       
       @"HexUIActiveMemberListBackgroundColor": [NSArchiver archivedDataWithRootObject:[ml performSelector:@selector(activeWindowListBackgroundColor)]],
       @"HexUIInactiveMemberListBackgroundColor": [NSArchiver archivedDataWithRootObject:[ml performSelector:@selector(inactiveWindowListBackgroundColor)]],
       @"HexUINormalCellTextColor": [NSArchiver archivedDataWithRootObject:[ml performSelector:@selector(normalCellTextColor)]],
       @"HexUIAwayUserCellTextColor": [NSArchiver archivedDataWithRootObject:[ml performSelector:@selector(awayUserCellTextColor)]],
       @"HexUISelectedCellTextColor": [NSArchiver archivedDataWithRootObject:[ml performSelector:@selector(selectedCellTextColor)]],
       @"HexUINormalCellTextShadowColor": [NSArchiver archivedDataWithRootObject:[ml performSelector:@selector(normalCellTextShadowColor)]],
       @"HexUISelectedCellShadowColor": [NSArchiver archivedDataWithRootObject:[ml performSelector:@selector(normalSelectedCellTextShadowColorForActiveWindow)]],
       
       @"HexUISplitterColor": [NSArchiver archivedDataWithRootObject:[NSColor colorWithCalibratedWhite:0.65 alpha:1.0]]
    };
    
    [RZUserDefaults() registerDefaults:d];
}

+ (void)forceControlsToRedraw
{
    [self.masterController.memberList updateBackgroundColor];
    [self.masterController.serverList updateBackgroundColor];
    [self.masterController.memberList setNeedsDisplay:YES];
    [self.masterController.serverList setNeedsDisplay:YES];
    [self.masterController.memberSplitView setNeedsDisplay:YES];
    [self.masterController.serverSplitView setNeedsDisplay:YES];
}

+ (void)swapServerListMethods
{
    Class class = [TVCServerList class];

    swapMethods(class, @selector(updateBackgroundColor), @selector(HexUIUpdateBackgroundColor));

    swapMethods(class, @selector(activeWindowListBackgroundColor), @selector(HexUIActiveWindowListBackgroundColor));
    swapMethods(class, @selector(inactiveWindowListBackgroundColor), @selector(HexUIInactiveWindowListBackgroundColor));
    
    swapMethods(class, @selector(messageCountBadgeAquaBackgroundColor), @selector(HexUIMessageCountBadgeAquaBackgroundColor));
    swapMethods(class, @selector(messageCountBadgeGraphtieBackgroundColor), @selector(HexUIMessageCountBadgeGraphtieBackgroundColor));
    swapMethods(class, @selector(messageCountBadgeHighlightBackgroundColor), @selector(HexUIMessageCountBadgeHighlightBackgroundColor));
    swapMethods(class, @selector(messageCountBadgeNormalTextColor), @selector(HexUIMessageCountBadgeNormalTextColor));
    swapMethods(class, @selector(messageCountBadgeSelectedBackgroundColor), @selector(HexUIMessageCountBadgeSelectedBackgroundColor));
    swapMethods(class, @selector(messageCountBadgeSelectedTextColor), @selector(HexUIMessageCountBadgeSelectedTextColor));
    swapMethods(class, @selector(messageCountBadgeShadowColor), @selector(HexUIMessageCountBadgeShadowColor));

    swapMethods(class, @selector(serverCellDisabledTextColor), @selector(HexUIServerCellDisabledTextColor));
    swapMethods(class, @selector(serverCellNormalTextColor), @selector(HexUIServerCellNormalTextColor));
    swapMethods(class, @selector(serverCellNormalTextShadowColorForActiveWindow), @selector(HexUIServerCellNormalTextShadowColorForActiveWindow));
    swapMethods(class, @selector(serverCellNormalTextShadowColorForInactiveWindow), @selector(HexUIServerCellNormalTextShadowColorForInactiveWindow));
    swapMethods(class, @selector(serverCellSelectedTextColorForActiveWindow), @selector(HexUIServerCellSelectedTextColorForActiveWindow));
    swapMethods(class, @selector(serverCellSelectedTextColorForInactiveWindow), @selector(HexUIServerCellSelectedTextColorForInactiveWindow));
    swapMethods(class, @selector(serverCellSelectedTextShadowColorForActiveWindow), @selector(HexUIServerCellSelectedTextShadowColorForActiveWindow));
    swapMethods(class, @selector(serverCellSelectedTextShadowColorForInactiveWindow), @selector(HexUIServerCellSelectedTextShadowColorForInactiveWindow));
    
    swapMethods(class, @selector(channelCellNormalTextColor), @selector(HexUIChannelCellNormalTextColor));
    swapMethods(class, @selector(channelCellNormalTextShadowColor), @selector(HexUIChannelCellNormalTextShadowColor));
    swapMethods(class, @selector(channelCellDisabledItemTextColor), @selector(HexUIChannelCellDisabledItemTextColor));
    swapMethods(class, @selector(channelCellSelectedTextColorForActiveWindow), @selector(HexUIChannelCellSelectedTextColorForActiveWindow));
    swapMethods(class, @selector(channelCellSelectedTextColorForInactiveWindow), @selector(HexUIChannelCellSelectedTextColorForInactiveWindow));
    swapMethods(class, @selector(channelCellSelectedTextShadowColorForActiveWindow), @selector(HexUIChannelCellSelectedTextShadowColorForActiveWindow));
    swapMethods(class, @selector(channelCellSelectedTextShadowColorForInactiveWindow), @selector(HexUIChannelCellSelectedTextShadowColorForInactiveWindow));
    
    swapMethods(class, @selector(graphiteTextSelectionShadowColor), @selector(HexUIGraphiteTextSelectionShadowColor));
}

+ (void)swapMemberListMethods
{
    Class class = [TVCMemberList class];
    
    swapMethods(class, @selector(updateBackgroundColor), @selector(HexUIUpdateBackgroundColor));
    
    swapMethods(class, @selector(activeWindowListBackgroundColor), @selector(HexUIActiveMemberListBackgroundColor));
    swapMethods(class, @selector(inactiveWindowListBackgroundColor), @selector(HexUIInactiveMemberListBackgroundColor));
    swapMethods(class, @selector(normalCellTextColor), @selector(HexUINormalCellTextColor));
    swapMethods(class, @selector(awayUserCellTextColor), @selector(HexUIAwayUserCellTextColor));
    swapMethods(class, @selector(selectedCellTextColor), @selector(HexUISelectedCellTextColor));
    swapMethods(class, @selector(normalCellTextShadowColor), @selector(HexUINormalCellTextShadowColor));
    swapMethods(class, @selector(normalSelectedCellTextShadowColorForActiveWindow), @selector(HexUINormalSelectedCellTextShadowColorForActiveWindow));
    swapMethods(class, @selector(normalSelectedCellTextShadowColorForInactiveWindow), @selector(HexUINormalSelectedCellTextShadowColorForInactiveWindow));
    swapMethods(class, @selector(graphiteSelectedCellTextShadowColorForActiveWindow), @selector(HexUIGraphiteSelectedCellTextShadowColorForActiveWindow));
}

+ (void)swapSplitViewMethods
{
    Class splitClass = [TVCThinSplitView class];

    swapMethods(splitClass, @selector(drawDividerInRect:), @selector(HexUIDrawDividerInRect:));
}

@end
