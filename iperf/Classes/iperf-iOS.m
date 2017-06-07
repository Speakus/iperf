#import "iperf-iOS.h"

#include "iperf_config.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include <errno.h>
#include <signal.h>
#include <unistd.h>
#ifdef HAVE_STDINT_H
#include <stdint.h>
#endif
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <netinet/tcp.h>

#include "iperf.h"
#include "iperf_api.h"
#include "units.h"
#include "iperf_locale.h"
#include "net.h"

void runIperfTest(nonnull NSString * server, IperfTestDoneCallback callback) {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"iperf3.XXXXXX"];
        char buf[PATH_MAX];
        [path getCString:buf maxLength:PATH_MAX encoding:NSUTF8StringEncoding];

        struct iperf_test *test = iperf_new_test();
        char *error = NULL;
        if (!test) {
            error = iperf_strerror(i_errno);
            iperf_err(NULL, "create new test error - %s", error);
        }

        iperf_defaults(test);
        iperf_set_verbose(test, 1);
        iperf_set_test_role(test, 'c');
        iperf_set_test_server_hostname(test, [server UTF8String]);
        iperf_set_test_server_port(test, 5201);
        iperf_set_test_template(test, buf);
//        iperf_set_test_authentication(test, "authentication");
        // Comment out this line to see to realtime log
        iperf_set_test_json_output(test, 1);

        if (iperf_run_client(test) < 0) {
            error = iperf_strerror(i_errno);
            iperf_err(test, "error - %s", error);
        }

        NSString *output = nil;
        if (iperf_get_test_json_output_string(test)) {
            output = @(iperf_get_test_json_output_string(test));
        }
        callback(output);
        iperf_free_test(test);
    });
}
