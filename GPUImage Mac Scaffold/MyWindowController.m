#import "MyWindowController.h"

@implementation MyWindowController

@synthesize imageView = _imageView;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow: window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // set up camera (you can set the preset down to medium or low, for faster processing)
    videoCamera = [[GPUImageAVCamera alloc] initWithSessionPreset:AVCaptureSessionPresetHigh cameraDevice:[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo]];
    
    // set up filter from file
    imageFilter = [[GPUImageFilter alloc] initWithFragmentShaderFromFile:@"FragmentShader"];
    
    // set variable in filter
    GPUVector3 inputColor;
    inputColor.one = 1.0;
    inputColor.two = 1.0;
    inputColor.three = 1.0;
    [imageFilter setFloatVec3:inputColor forUniformName:@"inputColor"];
    
    // set size of progressing
    [imageFilter forceProcessingAtSizeRespectingAspectRatio:self.imageView.sizeInPixels];

    // send video stream to filter
    [videoCamera addTarget:imageFilter];
    // send filter output to view
    [imageFilter addTarget:self.imageView];
    
    // start capturing
    [videoCamera startCameraCapture];
}

@end
