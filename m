Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BA11BE00BF3; Sun, 23 Jul 2017 20:36:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95ED4E00BE8
	for <meta-virtualization@yoctoproject.org>;
	Sun, 23 Jul 2017 20:36:19 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6O3aHRY016994
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 23 Jul 2017 20:36:17 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 23 Jul 2017 20:36:16 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 24 Jul 2017 11:27:17 +0800
Message-ID: <1500866837-1666-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] spice: Fix build failures
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jul 2017 03:36:20 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Backport 3cb746329ea4846bd9c65e0198e69423379b6f62 "Use PRI macros in printf to
keep compatibility between 32/64bit system" from upstream to fix the following
errors:

server/jpeg_encoder.c:639:17: error: format '%lu' expects argument of type 'long
unsigned int', but argument 12 has type 'uint64_t {aka long long unsigned int}'
[-Werror=format=]

server/mjpeg_encoder.c:639:17: error: format '%lu' expects argument of type
'long unsigned int', but argument 13 has type 'uint64_t {aka long long unsigned
int}' [-Werror=format=]

server/mjpeg_encoder.c:706:21: error: format '%lu' expects argument of type
'long unsigned int', but argument 6 has type 'uint64_t {aka long long unsigned
int}' [-Werror=format=]

server/mjpeg_encoder.c:706:21: error: format '%lu' expects argument of type
'long unsigned int', but argument 7 has type 'uint64_t {aka long long unsigned
int}' [-Werror=format=]

server/mjpeg_encoder.c:936:75: error: integer overflow in expression
[-Werror=overflow]

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...ros-in-printf-to-keep-compatibility-betwe.patch | 72 ++++++++++++++++++++++
 recipes-support/spice/spice_git.bb                 |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 recipes-support/spice/files/0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch

diff --git a/recipes-support/spice/files/0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch b/recipes-support/spice/files/0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch
new file mode 100644
index 0000000..18fa8fa
--- /dev/null
+++ b/recipes-support/spice/files/0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch
@@ -0,0 +1,72 @@
+From 3cb746329ea4846bd9c65e0198e69423379b6f62 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=EC=86=8C=EB=B3=91=EC=B2=A0?= <byungchul.so@samsung.com>
+Date: Thu, 24 Apr 2014 12:26:32 +0000
+Subject: [PATCH] Use PRI macros in printf to keep compatibility between
+ 32/64bit system
+
+gcc's some integer type definitions are different between 32/64bit system.
+This causes platform dependency problem with printf function. However,
+we can avoid this problem by using PRI macros that supports platform
+independent printf.
+---
+ server/mjpeg_encoder.c | 7 ++++---
+ server/red_worker.c    | 4 ++--
+ 2 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/server/mjpeg_encoder.c b/server/mjpeg_encoder.c
+index aea4964..f465d88 100644
+--- a/server/mjpeg_encoder.c
++++ b/server/mjpeg_encoder.c
+@@ -23,6 +23,7 @@
+ #include "mjpeg_encoder.h"
+ #include <jerror.h>
+ #include <jpeglib.h>
++#include <inttypes.h>
+ 
+ #define MJPEG_MAX_FPS 25
+ #define MJPEG_MIN_FPS 1
+@@ -66,7 +67,7 @@ static const int mjpeg_quality_samples[MJPEG_QUALITY_SAMPLE_NUM] = {20, 30, 40,
+  * are not necessarily related to mis-estimation of the bit rate, and we would
+  * like to wait till the stream stabilizes.
+  */
+-#define MJPEG_WARMUP_TIME 3000L // 3 sec
++#define MJPEG_WARMUP_TIME 3000LL // 3 sec
+ 
+ enum {
+     MJPEG_QUALITY_EVAL_TYPE_SET,
+@@ -638,7 +639,7 @@ static void mjpeg_encoder_adjust_params_to_bit_rate(MJpegEncoder *encoder)
+ 
+     spice_debug("cur-fps=%u new-fps=%u (new/old=%.2f) |"
+                 "bit-rate=%.2f (Mbps) latency=%u (ms) quality=%d |"
+-                " new-size-avg %lu , base-size %lu, (new/old=%.2f) ",
++                " new-size-avg %"PRIu64" , base-size %"PRIu64", (new/old=%.2f) ",
+                 rate_control->fps, new_fps, ((double)new_fps)/rate_control->fps,
+                 ((double)rate_control->byte_rate*8)/1024/1024,
+                 latency,
+@@ -703,7 +704,7 @@ static void mjpeg_encoder_adjust_fps(MJpegEncoder *encoder, uint64_t now)
+ 
+         avg_fps = ((double)rate_control->adjusted_fps_num_frames*1000) /
+                   adjusted_fps_time_passed;
+-        spice_debug("#frames-adjust=%lu #adjust-time=%lu avg-fps=%.2f",
++        spice_debug("#frames-adjust=%"PRIu64" #adjust-time=%"PRIu64" avg-fps=%.2f",
+                     rate_control->adjusted_fps_num_frames, adjusted_fps_time_passed, avg_fps);
+         spice_debug("defined=%u old-adjusted=%.2f", rate_control->fps, rate_control->adjusted_fps);
+         fps_ratio = avg_fps / rate_control->fps;
+diff --git a/server/red_worker.c b/server/red_worker.c
+index 619f7bc..1871e13 100644
+--- a/server/red_worker.c
++++ b/server/red_worker.c
+@@ -2594,8 +2594,8 @@ static void red_print_stream_stats(DisplayChannelClient *dcc, StreamAgent *agent
+         mjpeg_encoder_get_stats(agent->mjpeg_encoder, &encoder_stats);
+     }
+ 
+-    spice_debug("stream=%ld dim=(%dx%d) #in-frames=%lu #in-avg-fps=%.2f #out-frames=%lu "
+-                "out/in=%.2f #drops=%lu (#pipe=%lu #fps=%lu) out-avg-fps=%.2f "
++    spice_debug("stream=%"PRIdPTR" dim=(%dx%d) #in-frames=%"PRIu64" #in-avg-fps=%.2f #out-frames=%"PRIu64" "
++                "out/in=%.2f #drops=%"PRIu64" (#pipe=%"PRIu64" #fps=%"PRIu64") out-avg-fps=%.2f "
+                 "passed-mm-time(sec)=%.2f size-total(MB)=%.2f size-per-sec(Mbps)=%.2f "
+                 "size-per-frame(KBpf)=%.2f avg-quality=%.2f "
+                 "start-bit-rate(Mbps)=%.2f end-bit-rate(Mbps)=%.2f",
+-- 
+2.10.2
+
diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/spice_git.bb
index 6f1be3a..cf5c569 100644
--- a/recipes-support/spice/spice_git.bb
+++ b/recipes-support/spice/spice_git.bb
@@ -36,6 +36,7 @@ SRC_URI += " \
         file://configure.ac-add-subdir-objects-to-AM_INIT_AUTOMAKE.patch \
         file://build-allow-separated-src-and-build-dirs.patch \
         file://0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch \
+        file://0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch \
         "
 
 S = "${WORKDIR}/git"
-- 
2.8.1


