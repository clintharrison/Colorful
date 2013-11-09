#import <Foundation/Foundation.h>
#import "ColorfulPreferencesController.h"
#import "TVCServerList+Colorful.h"
#import "TVCMemberList+Colorful.h"

@interface TPI_Colorful : NSObject <THOPluginProtocol>

- (void)pluginLoadedIntoMemory:(IRCWorld *)world;

- (NSView *)preferencesView;
- (NSString *)preferencesMenuItemName;

+ (void)forceControlsToRedraw;

@end
