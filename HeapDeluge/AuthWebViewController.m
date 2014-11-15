//
//  AuthWebViewController.m
//  HeapDeluge
//
//  Created by William Richman on 11/11/14.
//  Copyright (c) 2014 Will Richman. All rights reserved.
//

#import "AuthWebViewController.h"
#import "WebKit/webkit.h"
#import "NetworkController.h"

@interface AuthWebViewController ()

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) NSString *publicKey;
@property (nonatomic, strong) NSString *oAuthDomain;
@property (nonatomic, strong) NSString *clientID;
@property (nonatomic, strong) NSString *oAuthURL;

@end

@implementation AuthWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc] init];
    self.webView.navigationDelegate = self;
    self.publicKey = @"yK9v)QQXN4qVqTec1LztTg((";
    self.oAuthDomain = @"https://stackexchange.com/oauth/login_success";
    self.clientID = @"3841";
    self.oAuthURL = @"https://stackexchange.com/oauth/dialog";
    
    
    CGPoint newOrigin = CGPointMake(self.view.frame.origin.x, 20);
    CGSize newSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - 64);
    self.webView.frame = CGRectMake(newOrigin.x, newOrigin.y, newSize.width, newSize.height);
    [self.view addSubview: self.webView];
    
    NSString *loginURLString = [NSString stringWithFormat: @"%@?client_id=%@&redirect_uri=%@&scope=read_inbox", self.oAuthURL, self.clientID, self.oAuthDomain];
    NSLog(@"%@", loginURLString);
    NSURL *loginURL = [[NSURL alloc] initWithString:loginURLString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: loginURL];
    [self.webView loadRequest: request];
}

-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSURL *requestURL = self.webView.URL;
    NSString *requestString = [requestURL absoluteString];
    NSLog(@"%@", requestString);
    if ([requestString containsString: @"access_token"]) {
        NSLog(@"Success!");
        NSArray *components = [requestString componentsSeparatedByString:@"="];
        NSArray *tokenComponents = [components[1] componentsSeparatedByString:@"&"];
        NSLog(@"%@", tokenComponents[0]);
        NetworkController *sharedNetworkController = [NetworkController controller];
        NSString *token = tokenComponents[0];
        sharedNetworkController.token = token;
        [[NSUserDefaults standardUserDefaults] setObject: token forKey: @"token"];
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    } else {
        NSLog(@"Fail!");
    }

}
- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

@end
