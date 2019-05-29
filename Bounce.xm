#import <Headers/Interfaces.h>

%hook UIScrollView
-(void)didMoveToWindow
{
    %orig;
    if ([self isMemberOfClass:[UIScrollView class]] && [[self _viewControllerForAncestor] isKindOfClass:%c(Saily_UI_Manage)] && ![self.superview isKindOfClass:%c(DepictionScreenshotsView)])
    {
        self.alwaysBounceVertical = YES;
    }
}
%end
