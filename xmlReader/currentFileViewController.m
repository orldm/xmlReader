//
//  currentFileViewController.m
//  xmlReader
//
//  Created by John Smith on 6/24/13.
//  Copyright (c) 2013 bullet. All rights reserved.
//

#import "currentFileViewController.h"

@interface currentFileViewController ()

@property (nonatomic) NSString *currentElement;

@end

@implementation currentFileViewController

@synthesize fileInfo = _fileInfo;
@synthesize fileName = _fileName;
@synthesize currentElement = _currentElement;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //BOOL success;
    //NSURL *xmlURL = [NSURL fileURLWithPath:self.fileName];
    
    NSData *fileContent = [NSData dataWithContentsOfFile:self.fileName];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:fileContent];
    xmlParser.delegate = self;
    xmlParser.shouldResolveExternalEntities = YES;
    [xmlParser parse];
    //NSLog(@"%@", success);
    //self.fileInfo.text = self.fileName;
	// Do any additional setup after loading the view.
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    self.currentElement = elementName;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([self.currentElement isEqualToString:@"root-step"] || [self.currentElement isEqualToString:@"kind"]) {
        self.fileInfo.text = [self.fileInfo.text stringByAppendingString:string];
        
    }
}

- (void)viewDidUnload
{
    [self setFileInfo:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
