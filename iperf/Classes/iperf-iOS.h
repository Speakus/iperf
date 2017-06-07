#ifndef IPERF_IOS_H
#define IPERF_IOS_H

#ifdef __OBJC__

#ifdef __cplusplus
extern "C" {
#endif //__cplusplus

typedef void (^IperfTestDoneCallback)(NSString * _Nullable jsonResult, NSString * _Nullable error);

void runIperfTest(NSString * _Nonnull server, int testSeconds,
                  _Nonnull IperfTestDoneCallback callback);

#ifdef __cplusplus
}
#endif //__cplusplus

#endif // __OBJC__

#endif /* !IPERF_IOS_H */
