//
//  RecognitionViewController.m
//  ClarifaiApiDemo
//

#import "RecognitionViewController.h"
#import "ClarifaiApp.h"
#import "Archigram-Swift.h"

/**
 * This view controller performs recognition using the Clarifai API.
 * See the README for instructions on running the demo.
 */
@interface RecognitionViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIButton *cameraButton;
@property (strong, nonatomic) ClarifaiApp *app;
@property UIImage *image;
@property NSMutableArray *tags;
@end


@implementation RecognitionViewController


- (IBAction)cameraButtonPressed:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.allowsEditing = NO;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)buttonPressed:(id)sender {
    // Show a UIImagePickerController to let the user pick an image from their library.
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = NO;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.image = info[UIImagePickerControllerOriginalImage];
    if (self.image) {
        // The user picked an image. Send it to Clarifai for recognition.
        self.imageView.image = self.image;
        self.textView.text = @"Recognizing...";
        self.button.enabled = NO;
        [self recognizeImage:self.image];
    }
}

- (void)recognizeImage:(UIImage *)image {

    // Initialize the Clarifai app with your app's ID and Secret.
    ClarifaiApp *app = [[ClarifaiApp alloc] initWithAppID:@"S-kCOgG9TOuyJTa8V5r2-CSu_vXLhJZtLrLuUZDk"
                                                appSecret:@"Q9B-oWmr0yqabyGEBPUnl3eZntS4ZjxoSZxKB9Se"];
  
    // Fetch Clarifai's general model.
    [app getModelByName:@"general-v1.3" completion:^(ClarifaiModel *model, NSError *error) {
        // Create a Clarifai image from a uiimage.
        ClarifaiImage *clarifaiImage = [[ClarifaiImage alloc] initWithImage:image];
        
        // Use Clarifai's general model to pedict tags for the given image.
        [model predictOnImages:@[clarifaiImage] completion:^(NSArray<ClarifaiOutput *> *outputs, NSError *error) {
            if (!error) {
                ClarifaiOutput *output = outputs[0];
                
                // Loop through predicted concepts (tags), and display them on the screen.
                self.tags = [NSMutableArray array];
                for (ClarifaiConcept *concept in output.concepts) {
                    [self.tags addObject:concept.conceptName];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.textView.text = [NSString stringWithFormat:@"Tags:\n%@", [self.tags componentsJoinedByString:@", "]];
                });
            }
          
          dispatch_async(dispatch_get_main_queue(), ^{
            self.button.enabled = YES;
          });

        }];
    }];

}
- (IBAction)folder:(id)sender {
    [self performSegueWithIdentifier: @"cameraToSaved" sender: self];
}
- (IBAction)question:(id)sender {
    [self performSegueWithIdentifier: @"cameraToHelp" sender: self];
}

- (IBAction)folderTap:(id)sender {
    [self performSegueWithIdentifier: @"cameraToSaved" sender: self];
}

- (IBAction)houseTap:(id)sender {
    //[self performSegueWithIdentifier: @"styleToSaved" sender: self];
}

- (IBAction)questionTap:(id)sender {
    [self performSegueWithIdentifier: @"cameraToHelp" sender: self];
}

- (IBAction)findStyle:(id)sender {
    [self performSegueWithIdentifier: @"chosePicture" sender: self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    printf("prep for segue");
    //printf([segue indentifier]);
    if ([[segue identifier] isEqualToString:@"chosePicture"]) {
        printf("prep for segue2");
        // Get reference to the destination view controller
        StyleViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        
        vc.tagText = @"description goes here";
        vc.arrayOfTags = self.tags;
        vc.imageToAnalyze = self.image;
    }
}



@end
