#ifndef IPERF_IOS_H
#define IPERF_IOS_H

#ifdef __cplusplus
extern "C" {
#endif //__cplusplus

typedef void (*IperfTestDoneCallback)(nullable NSString * jsonResult);

void runIperfTest(nonnull NSString * server, IperfTestDoneCallback callback);

#ifdef __cplusplus
}
#endif //__cplusplus

#endif /* !IPERF_IOS_H */
