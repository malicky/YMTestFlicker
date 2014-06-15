#import "YMAppDelegate.h"
#import "YMFeedViewController.h"
#import "Reachability.h"
#import "YMPersistence.h"
#import "YMWebservice.h"
#import "YMImporter.h"


const float kAlertDismissDelay = 3.;

@interface YMAppDelegate ()
@property (nonatomic, strong) YMWebservice *webservice;
@property (nonatomic, strong) YMImporter *importer;
@end

@implementation YMAppDelegate

- (void)autoDismissAndKill:(UIAlertView *)alert {
    [alert dismissWithClickedButtonIndex:-1 animated:YES];
    exit (1);
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // test internet reacheability
    if ([[Reachability reachabilityForInternetConnection]currentReachabilityStatus] == NotReachable)
    {
        dispatch_async(dispatch_get_main_queue(),  ^(void) {
            // ICR-2681: print a message when the day was opened automatically
            NSString *message = NSLocalizedString(@"Internet connection not available.\n"
                                                  "Quitting after %is." , nil);
            message = [NSString stringWithFormat:message, (long)kAlertDismissDelay];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"No internet connection", nil)
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                                  otherButtonTitles:nil];
            [alert show];
            [self performSelector:@selector(autoDismissAndKill:) withObject:alert afterDelay:kAlertDismissDelay];
        });
    }
    
    // Set up the Persistence stack as a singleton
    YMPersistence *stack = [[YMPersistence sharedInstance] initWithStoreURL:self.storeURL
                                                                   modelURL:self.modelURL];
    // Create Web service End Point
    self.webservice = [[YMWebservice alloc] init];
    
    // Create image importer
    self.importer = [[YMImporter alloc] initWithParentContext:stack.managedObjectContext
                                                   webservice:self.webservice];

    // Start import from iTunes
    [self.importer import];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    YMFeedViewController *rootViewController = [YMFeedViewController new];
    
    UINavigationController* nav =
    [[UINavigationController alloc] initWithRootViewController:rootViewController];
    self.window.rootViewController = nav;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [[YMPersistence sharedInstance] saveContexts];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[YMPersistence sharedInstance] saveContexts];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[YMPersistence sharedInstance] saveContexts];
}

- (NSURL*)storeURL {
    NSURL *documentsDirectory = [self applicationDocumentsDirectory];
    return [documentsDirectory URLByAppendingPathComponent:@"db.sqlite"];
}

- (NSURL*)modelURL {
    return [[NSBundle mainBundle] URLForResource:@"YMTestFlicker" withExtension:@"momd"];
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
