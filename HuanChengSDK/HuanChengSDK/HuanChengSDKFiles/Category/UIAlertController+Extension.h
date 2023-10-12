//
//  UIAlertController+Extension.h
//  Gamfun
//
//  Created by 杨鹏 on 2022/7/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^UIAlertControllerCompletionBlock) (UIAlertAction *action, NSInteger buttonIndex);

extern NSInteger const UIAlertControllerBlocksCancelButtonIndex;
extern NSInteger const UIAlertControllerBlocksDestructiveButtonIndex;
extern NSInteger const UIAlertControllerBlocksFirstOtherButtonIndex;

@interface UIAlertController (Extension)

+ (instancetype)showInViewController:(UIViewController *_Nullable)viewController
                           withTitle:(NSString *_Nullable)title
                             message:(NSString *_Nullable)message
                      preferredStyle:(UIAlertControllerStyle)preferredStyle
                   cancelButtonTitle:(NSString *_Nullable)cancelButtonTitle
              destructiveButtonTitle:(NSString *_Nullable)destructiveButtonTitle
                   otherButtonTitles:(NSArray *)otherButtonTitles
                            tapBlock:(UIAlertControllerCompletionBlock)tapBlock;

+ (instancetype)showAlertInViewController:(UIViewController *_Nullable)viewController
                                withTitle:(NSString *_Nullable)title
                                  message:(NSString *_Nullable)message
                        cancelButtonTitle:(NSString *_Nullable)cancelButtonTitle
                   destructiveButtonTitle:(NSString *_Nullable)destructiveButtonTitle
                        otherButtonTitles:(NSArray *)otherButtonTitles
                                 tapBlock:(UIAlertControllerCompletionBlock)tapBlock;


+ (instancetype)showActionSheetInViewController:(UIViewController *_Nullable)viewController
                                      withTitle:(NSString *_Nullable)title
                                        message:(NSString *_Nullable)message
                              cancelButtonTitle:(NSString *_Nullable)cancelButtonTitle
                         destructiveButtonTitle:(NSString *_Nullable)destructiveButtonTitle
                              otherButtonTitles:(NSArray *)otherButtonTitles
                                       tapBlock:(UIAlertControllerCompletionBlock)tapBlock;

@end

NS_ASSUME_NONNULL_END
