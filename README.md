diff btn segue and embedding
 CLOSED issues: 30
OPEN issues: 30
*** Assertion failure in -[UIStoryboardShowSegueTemplate segueWithDestinationViewController:], UIStoryboardSegueTemplate.m:104
*** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Could not create a segue of class '(null)''
*** First throw call stack:
(
    0   CoreFoundation                      0x00000001804b910c __exceptionPreprocess + 172
    1   libobjc.A.dylib                     0x0000000180092da8 objc_exception_throw + 72
    2   Foundation                          0x0000000180e67c70 _userInfoForFileAndLine + 0
    3   UIKitCore                           0x0000000185cdff9c -[UIStoryboardSegueTemplate segueWithDestinationViewController:] + 112
    4   UIKitCore                           0x0000000185ce00e8 -[UIStoryboardSegueTemplate _performWithDestinationViewController:sender:] + 52
    5   UIKitCore                           0x0000000185ce0090 -[UIStoryboardSegueTemplate _perform:] + 64
    6   UIKitCore                           0x0000000185ce0234 -[UIStoryboardSegueTemplate perform:] + 108
    7   UIKitCore                           0x0000000185d72688 -[UITableView _selectRowAtIndexPath:animated:scrollPosition:notifyDelegate:isCellMultiSelect:deselectPrevious:performCustomSelectionAction:] + 1128
    8   UIKitCore                           0x0000000185d729f4 -[UITableView _userSelectRowAtPendingSelectionIndexPath:animatedSelection:] + 264
    9   UIKitCore                           0x0000000185d72acc -[UITableView _userSelectRowAtPendingSelectionIndexPath:] + 192
    10  UIKitCore                           0x0000000186047ee4 -[_UIAfterCACommitBlock run] + 64
    11  UIKitCore                           0x00000001860482f4 -[_UIAfterCACommitQueue flush] + 160
    12  UIKitCore                           0x0000000185b3e5fc _runAfterCACommitDeferredBlocks + 256
    13  UIKitCore                           0x0000000185b30248 _cleanUpAfterCAFlushAndRunDeferredBlocks + 76
    14  UIKitCore                           0x0000000185b30310 _UIApplicationFlushCATransaction + 68
    15  UIKitCore                           0x0000000185a60eb4 __setupUpdateSequence_block_invoke_2 + 352
    16  UIKitCore                           0x00000001850a5cec _UIUpdateSequenceRun + 76
    17  UIKitCore                           0x0000000185a60858 schedulerStepScheduledMainSection + 168
    18  UIKitCore                           0x0000000185a5fc90 runloopSourceCallback + 80
    19  CoreFoundation                      0x000000018041d294 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 24
    20  CoreFoundation                      0x000000018041d1dc __CFRunLoopDoSource0 + 172
    21  CoreFoundation                      0x000000018041c940 __CFRunLoopDoSources0 + 232
    22  CoreFoundation                      0x0000000180416e84 __CFRunLoopRun + 788
    23  CoreFoundation                      0x00000001804166f4 CFRunLoopRunSpecific + 552
    24  GraphicsServices                    0x00000001905e5b10 GSEventRunModal + 160
    25  UIKitCore                           0x0000000185b319dc -[UIApplication _run] + 796
    26  UIKitCore                           0x0000000185b35bd4 UIApplicationMain + 124
    27  UIKitCore                           0x0000000184f0a334 block_destroy_helper.22 + 9660
    28  You've Got Issues!.debug.dylib      0x0000000100828ab8 $sSo21UIApplicationDelegateP5UIKitE4mainyyFZ + 120
    29  You've Got Issues!.debug.dylib      0x0000000100828a30 $s18You_ve_Got_Issues_11AppDelegateC5$mainyyFZ + 44
    30  You've Got Issues!.debug.dylib      0x0000000100828b34 __debug_main_executable_dylib_entry_point + 28
    31  dyld                                0x0000000100895410 start_sim + 20
    32  ???                                 0x0000000100aa2154 0x0 + 4306116948
    33  ???                                 0x703b800000000000 0x0 + 8087198293362212864
)
libc++abi: terminating due to uncaught exception of type NSException





Exception    NSException *    "Could not create a segue of class '(null)'"    0x0000600000c943c0
name    __NSCFConstantString *    "NSInternalInconsistencyException"    0x00000001e3cfb140
reason    __NSCFString *    "Could not create a segue of class '(null)'"    0x000060000178ce00
userInfo    __NSDictionaryM *    2 key/value pairs    0x0000600000294e60
reserved    __NSDictionaryM *    2 key/value pairs    0x0000600000295b00
