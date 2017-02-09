//
//  StatusBarMenu.m
//  Yamaha RX-Controller for MAC
//
//  Created by Sven Schiffer on 08/02/2017.
//  Copyright © 2017 Sven Schiffer. All rights reserved.
//

#import "StatusBarMenu.h"
#import "CommunicationController.h"

@implementation StatusBarMenu

- (void)awakeFromNib {
    self.comctrl = [[CommunicationController alloc] init];
}

- (void)menuWillOpen:(NSMenu *)menu {
    [self.comctrl getBasicStatus];
}

/*- (void)menuWillOpenCompletionHandler:(NSDictionary *)dict {
    
}*/

- (void)menuDidClose:(NSMenu *)menu {
    
}


- (IBAction)onVolumeHasChanged:(id)sender {
    int dbValue = 70 - [sender intValue];
    
    [self.comctrl sendCommand: [NSString stringWithFormat: @"<YAMAHA_AV cmd=\"PUT\"><Main_Zone><Volume><Lvl><Val>-%d0</Val><Exp>1</Exp><Unit>dB</Unit></Lvl></Volume></Main_Zone></YAMAHA_AV>", dbValue]];
}

- (IBAction)onToggleMuteClicked:(id)sender {
    [self.comctrl sendCommand:@"<YAMAHA_AV cmd=\"PUT\"><Main_Zone><Volume><Mute>On/Off</Mute></Volume></Main_Zone></YAMAHA_AV>"];
}

- (IBAction)onPreferencesClicked:(id)sender {
 
}

- (IBAction)onQuitPressed:(id)sender {
     [NSApp performSelector:@selector(terminate:) withObject:nil afterDelay:0.0];
}

@end
