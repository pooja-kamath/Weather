//
//  TodayViewController.m
//  Weather
//
//  Created by Pooja Kamath on 09/07/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;

@end

@implementation TodayViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize updatedSize = [self preferredContentSize];
    updatedSize.height =40.0;
    [self setPreferredContentSize:updatedSize];
    
    
    // Do any additional setup after loading the view from its nib.
    NSString *path=@"/Users/poojakamath/Desktop/WeatherApplication/Weather/Weather.txt";
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        //File exists/Users/poojakamath/Desktop/CurrentTime copy 2/newWeather/weather.txt
        NSData *file1 = [[NSData alloc] initWithContentsOfFile:path];
        NSString *myString = [[NSString alloc] initWithData:file1 encoding:NSUTF8StringEncoding];
        if (file1)
        {
            self.weatherLabel.text=myString;
            
            
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encoutered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
