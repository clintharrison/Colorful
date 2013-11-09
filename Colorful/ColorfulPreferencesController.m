#import "ColorfulPreferencesController.h"

@implementation ColorfulPreferencesController {
    NSMutableArray *_tableContents;
    IBOutlet NSTableView *_tableView;
}

- (void)awakeFromNib
{
    if (_tableContents != nil) return;
    
    _tableContents = [NSMutableArray new];
    [_tableContents addObject:@{@"key": @"HexUIActiveWindowListBackgroundColor",
                                @"name":  @"Server list background (focused window)"}];
    [_tableContents addObject:@{@"key": @"HexUIInactiveWindowListBackgroundColor",
                                @"name":  @"Server list inactive background (unfocused window)"}];
    
    [_tableContents addObject:@{@"key": @"HexUIBadgeBackgroundColor",
                                @"name":  @"Badge background"}];
    [_tableContents addObject:@{@"key": @"HexUIBadgeHighlightBackgroundColor",
                                @"name":  @"Badge background (highlight)"}];
    [_tableContents addObject:@{@"key": @"HexUIBadgeNormalTextColor",
                                @"name":  @"Badge number"}];
    [_tableContents addObject:@{@"key": @"HexUIBadgeSelectedBackgroundColor",
                                @"name":  @"Badge background (selected)"}];
    [_tableContents addObject:@{@"key": @"HexUIBadgeSelectedTextColor",
                                @"name":  @"Badge number (selected)"}];
    [_tableContents addObject:@{@"key": @"HexUIBadgeTextShadowColor",
                                @"name":  @"Badge number shadow"}];
    
    [_tableContents addObject:@{@"key": @"HexUIServerCellNormalTextColor",
                                @"name":  @"Server name"}];
    [_tableContents addObject:@{@"key": @"HexUIServerCellDisabledTextColor",
                                @"name":  @"Server name (disabled)"}];
    [_tableContents addObject:@{@"key": @"HexUIServerNormalShadowColor",
                                @"name":  @"Server name shadow"}];
    [_tableContents addObject:@{@"key": @"HexUIServerSelectedTextColor",
                                @"name":  @"Server name (selected)"}];
    [_tableContents addObject:@{@"key": @"HexUIServerSelectedShadowColor",
                                @"name":  @"Server name shadow (selected)"}];
    
    [_tableContents addObject:@{@"key": @"HexUIChannelNormalTextColor",
                                @"name":  @"Channel name"}];
    [_tableContents addObject:@{@"key": @"HexUIChannelNormalShadowColor",
                                @"name":  @"Channel name shadow"}];
    [_tableContents addObject:@{@"key": @"HexUIChannelDisabledTextColor",
                                @"name":  @"Channel name (disabled)"}];
    [_tableContents addObject:@{@"key": @"HexUIChannelSelectedTextColor",
                                @"name":  @"Channel name (selected)"}];
    [_tableContents addObject:@{@"key": @"HexUIChannelSelectedShadowColor",
                                @"name":  @"Channel name shadow (selected)"}];
    
    [_tableContents addObject:@{@"key": @"HexUIActiveMemberListBackgroundColor",
                                @"name": @"Member list background (focused window)"}];
    [_tableContents addObject:@{@"key": @"HexUIInactiveMemberListBackgroundColor",
                                @"name": @"Member list background (unfocused window)"}];
    [_tableContents addObject:@{@"key": @"HexUINormalCellTextColor",
                                @"name": @"Member nickname"}];
    [_tableContents addObject:@{@"key": @"HexUIAwayUserCellTextColor",
                                @"name": @"Member nickname (away)"}];
    [_tableContents addObject:@{@"key": @"HexUISelectedCellTextColor",
                                @"name": @"Member nickname (selected)"}];
    [_tableContents addObject:@{@"key": @"HexUINormalCellTextShadowColor",
                                @"name": @"Member nickname shadow"}];
    [_tableContents addObject:@{@"key": @"HexUISelectedCellShadowColor",
                                @"name": @"Member nickname shadow (selected)"}];
    [_tableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [_tableContents count];
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSDictionary *dictionary = [_tableContents objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
    NSTableCellView *view = nil;
    
    if ([identifier isEqualToString:@"Element Color"])
    {
        view = [tableView makeViewWithIdentifier:@"ColorWellCell" owner:self];
        // set identifier of the color well so we can use it in -onColorChanged:
        [view.subviews[0] setIdentifier:[dictionary stringForKey:@"key"]];
        [view bind:@"objectValue"
          toObject:RZUserDefaultsController()
       withKeyPath:[NSString stringWithFormat:@"values.%@", [dictionary stringForKey:@"key"]]
           options:@{NSValueTransformerNameBindingOption: NSUnarchiveFromDataTransformerName}];
        
    }
    else if ([[tableColumn identifier] isEqualToString:@"Human Readable Name"])
    {
        view = [tableView makeViewWithIdentifier:@"TextCell" owner:self];
        NSString *name = [dictionary stringForKey:@"name"];
        view.objectValue = name;
    }
    else
    {
        NSAssert1(NO, @"Unhandled table column identifier %@", identifier);
    }
    
    return view;
}

- (IBAction)onColorChanged:(id)sender
{
    NSColorWell *well = sender;
    [RZUserDefaults() setColor:well.color forKey:well.identifier];
    
    [TPI_Colorful forceControlsToRedraw];
}

- (IBAction)onResetToDefaults:(id)sender
{
    /* TVCServerList colors */
    [RZUserDefaults() removeObjectForKey:@"HexUIActiveWindowListBackgroundColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIInactiveWindowListBackgroundColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIBadgeBackgroundColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIBadgeHighlightBackgroundColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIBadgeNormalTextColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIBadgeSelectedBackgroundColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIBadgeSelectedTextColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIBadgeTextShadowColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIServerCellDisabledTextColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIServerCellNormalTextColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIServerNormalShadowColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIServerSelectedTextColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIServerSelectedShadowColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIChannelNormalTextColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIChannelNormalShadowColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIChannelDisabledTextColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIChannelSelectedTextColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIChannelSelectedShadowColor"];
    
    [RZUserDefaults() removeObjectForKey:@"HexUIActiveMemberListBackgroundColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIInactiveMemberListBackgroundColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUINormalCellTextColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUIAwayUserCellTextColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUISelectedCellTextColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUINormalCellTextShadowColor"];
    [RZUserDefaults() removeObjectForKey:@"HexUISelectedCellShadowColor"];

    
    [TPI_Colorful forceControlsToRedraw];

    return;
}

@end
