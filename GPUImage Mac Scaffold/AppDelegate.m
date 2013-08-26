#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    windowController = [[MyWindowController alloc] initWithWindowNibName:@"MyWindowController"];
    [windowController showWindow:self];
}

@end
