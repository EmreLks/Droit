//
//  ViewController.m
//  Dropit
//
//  Created by GBGYP-10 on 3.03.2016.
//  Copyright © 2016 emrelks. All rights reserved.
//

#import "ViewController.h"
#import "DropitBehavior.h"

@interface ViewController ()
@property (strong,nonatomic) UIDynamicAnimator *animator;
@property (strong,nonatomic) DropitBehavior *dropItBehivor;
@end

@implementation ViewController

CGSize dropSize;
- (IBAction)gesture:(UITapGestureRecognizer *)sender {
    [self drop];
}

-(UIDynamicAnimator *) animator{
    if(!_animator)
    {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

-(DropitBehavior * ) dropItBehivor{
    if(!_dropItBehivor)
    {
        
        _dropItBehivor = [[DropitBehavior alloc] init];
        [self.animator addBehavior:_dropItBehivor];
    }
    return _dropItBehivor;
}
-(UIColor *) randomColor{
    
    NSMutableArray *colors =[[NSMutableArray alloc] init];
    
    float INCREMENT = 0.05;
    for (float hue=0.0; hue<1.0; hue+=INCREMENT) {
        
        UIColor *color =[UIColor colorWithHue:hue saturation:0.5 brightness:0.8 alpha:1.0];
        
        [colors addObject:color];
    }
    int randomColorIndex = rand() % [colors count];
    
    
    return [colors objectAtIndex:randomColorIndex];
}
-(void) drop{
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = dropSize;
    int x= (arc4random() % (int) self.view.bounds.size.width) /dropSize.width;
    frame.origin.x = x*dropSize.width;
    
    UIView *dropView =[[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor=[self randomColor];
    
    [self.view addSubview:dropView];
    [self.dropItBehivor addItem:dropView];
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    dropSize=CGSizeMake(self.view.bounds.size.width/8, self.view.bounds.size.width/8);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
