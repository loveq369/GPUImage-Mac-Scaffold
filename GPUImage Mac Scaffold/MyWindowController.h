#import <Cocoa/Cocoa.h>
#import <GPUImage/GPUImage.h>

@interface MyWindowController : NSWindowController
{
    // our filter
    GPUImageFilter *imageFilter;
    // our camera
    GPUImageAVCamera *videoCamera;
}

// our view
@property(readwrite) IBOutlet GPUImageView *imageView;

@end
