//
//  ViewController.m
//  PopAnimation
//
//  Created by fanshen on 15/7/9.
//  Copyright (c) 2015年 fanshen. All rights reserved.
//

#import "FirstViewController.h"
#import "ModalViewController.h"
#import <pop/POP.h>
#import <Masonry.h>
#import "PresentingAnimator.h"
#import "DismissingAnimator.h"

#import "PopButton.h"
@interface FirstViewController ()<UIViewControllerTransitioningDelegate>{
    
}

@property (nonatomic) PopButton *button;
@property (nonatomic) UILabel *errorLabel;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];


    self.button = [PopButton button];
    self.button.backgroundColor = [UIColor blueColor];
    [self.button setTitle:@"表动我" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(touchUpInside) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    
    
    [self addErrorLabel];
    
    [self addPresentButton];

}

-(void)addErrorLabel{
    
    self.errorLabel = [UILabel new];
    self.errorLabel.font = [UIFont fontWithName:@"Avenir-Light" size:14];
    self.errorLabel.textColor = [UIColor redColor];
    self.errorLabel.text = @"乱点什么 ？别动! 烦着呢~";
    self.errorLabel.textAlignment = NSTextAlignmentCenter;
    [self.view insertSubview:self.errorLabel belowSubview:self.button];
    
    [self.errorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.button);
    }];
    
    self.errorLabel.layer.transform = CATransform3DMakeScale(0.1f, 0.1f, 1.f);
    
}


#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return [PresentingAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [DismissingAnimator new];
}



-(void)touchUpInside{
    
    [self hideLabel];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showLabel];
    });
    
    
}

- (void)showLabel
{

    POPSpringAnimation *layerScaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    
    layerScaleAnimation.springBounciness = 18;
    layerScaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    [self.errorLabel.layer pop_addAnimation:layerScaleAnimation forKey:@"labelScaleAnimation"];
    
    
    POPSpringAnimation *layerPositionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    layerPositionAnimation.toValue = @(self.button.layer.position.y -50);
    layerPositionAnimation.springBounciness = 12;
    [self.errorLabel.layer pop_addAnimation:layerPositionAnimation forKey:@"layerPositionAnimation"];
    
}

- (void)hideLabel
{
    POPBasicAnimation *layerScaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    layerScaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.1f, 0.1f)];
    [self.errorLabel.layer pop_addAnimation:layerScaleAnimation forKey:@"layerScaleAnimation"];
    
    POPBasicAnimation *layerPositionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    layerPositionAnimation.toValue = @(self.button.layer.position.y);
    [self.errorLabel.layer pop_addAnimation:layerPositionAnimation forKey:@"layerPositionAnimation"];
}

- (void)addPresentButton
{
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    presentButton.backgroundColor = [UIColor redColor];
    [presentButton setTitle:@"Present Modal View Controller" forState:UIControlStateNormal];
    [presentButton addTarget:self action:@selector(present:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
    
    [presentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view).offset(240);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(240, 40));
        
    }];
}

- (void)present:(id)sender
{
    ModalViewController *modalViewController = [ModalViewController new];
    modalViewController.transitioningDelegate = self;
    modalViewController.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:modalViewController
                       animated:YES
                     completion:NULL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
