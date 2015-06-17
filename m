Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19199E009DF; Wed, 17 Jun 2015 07:37:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B504FE00992
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Jun 2015 07:37:38 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5HEbbb2004220
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Jun 2015 07:37:38 -0700 (PDT)
Received: from ord-lpggp3.wrs.com (128.224.149.46) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 17 Jun 2015 07:37:38 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 17 Jun 2015 09:37:07 -0500
Message-ID: <1434551827-7833-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] python-gevent: Fix cross compile for ARM
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
X-List-Received-Date: Wed, 17 Jun 2015 14:37:44 -0000
Content-Type: text/plain

The lack of a proper ability to regenerate configure causes the cross
compile detect logic to fail (shown below).  It is easiest to just
force the cross compile option at configure time.

| configure: error: in `/opt/buildtmp/work/cortexa7t2hf-vfp-neon-wrs-linux-gnueabi/python-gevent/1.0.1-r0/gevent-1.0.1/build/temp.linux-x86_64-2.7/libev':
| configure: error: cannot run C compiled programs.
| If you meant to cross compile, use `--host'.
| See `config.log' for more details
| Running '/bin/sh /opt/buildtmp/work/cortexa7t2hf-vfp-neon-wrs-linux-gnueabi/python-gevent/1.0.1-r0/gevent-1.0.1/libev/configure > configure-output.txt' in /opt/buildtmp/work/cortexa7t2hf-vfp-neon-wrs-linux-gnueabi/python-gevent/1.0.1-r0/gevent-1.0.1/build/temp.linux-x86_64-2.7/libev
| building 'gevent.core' extension
| creating build/temp.linux-x86_64-2.7/gevent
| ccache arm-wrs-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=hard -mfpu=neon -marm -mthumb-interwork -mtune=cortex-a7 --sysroot=/opt/buildtmp/sysroots/fsl-ls10xx -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fPIC -DLIBEV_EMBED=1 -DEV_COMMON= -DEV_CLEANUP_ENABLE=0 -DEV_EMBED_ENABLE=0 -DEV_PERIODIC_ENABLE=0 -Ibuild/temp.linux-x86_64-2.7/libev -Ilibev -I/opt/buildtmp/sysroots/fsl-ls10xx/usr/include/python2.7 -c gevent/gevent.core.c -o build/temp.linux-x86_64-2.7/gevent/gevent.core.o
| In file included from gevent/libev.h:2:0,
|                  from gevent/gevent.core.c:313:
| libev/ev.c:45:22: fatal error: config.h: No such file or directory
|  #  include "config.h"
|                       ^
| compilation terminated.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 recipes-devtools/python/python-gevent_1.0.1.bb |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-devtools/python/python-gevent_1.0.1.bb b/recipes-devtools/python/python-gevent_1.0.1.bb
index 44f9518..47f1267 100644
--- a/recipes-devtools/python/python-gevent_1.0.1.bb
+++ b/recipes-devtools/python/python-gevent_1.0.1.bb
@@ -24,3 +24,10 @@ inherit setuptools
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI += "file://libev-conf.patch"
 SRC_URI += "file://gevent-allow-ssl-v2-or-v3-certificates.patch"
+
+# The python-gevent has no autoreconf ability
+# and the logic for detecting a cross compile is flawed
+# so always force a cross compile
+do_configure_append() {
+	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/libev/configure
+}
\ No newline at end of file
-- 
1.7.9.5


