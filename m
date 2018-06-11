Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDE53E01F86; Mon, 11 Jun 2018 07:24:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 470BEE01F86
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jun 2018 07:24:39 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5BEOcuR015248
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jun 2018 07:24:38 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 11 Jun 2018 07:24:38 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 11 Jun 2018 10:24:31 -0400
Message-ID: <1528727071-19039-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] housekeeping: patch refresh
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
X-List-Received-Date: Mon, 11 Jun 2018 14:24:41 -0000
Content-Type: text/plain

Bitbake now prints warnings when a patch is successfully applied but
there is fuzz or an offset. The following refreshes patches for
several packages which report warnings when openstack-image-controller
is built.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...ican-fix-path-to-find-configuration-files.patch | 12 +++++------
 ...ncrease-buffer-size-to-support-PKI-tokens.patch | 23 +++++++++++-----------
 .../fix_ceilometer_memory_leak.patch               | 18 +++++++++++------
 .../python/python-horizon/fix_bindir_path.patch    | 21 ++++++++++++++------
 ...use-full-package-path-to-test-directories.patch | 10 ++++------
 ...-path-of-header-files-check-in-Yocto-buil.patch | 14 ++++++-------
 .../tgt/files/0001-usr-Makefile-WARNING-fix.patch  |  8 +++-----
 7 files changed, 57 insertions(+), 49 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-barbican/barbican-fix-path-to-find-configuration-files.patch b/meta-openstack/recipes-devtools/python/python-barbican/barbican-fix-path-to-find-configuration-files.patch
index 8fd1010..b7e74cd 100644
--- a/meta-openstack/recipes-devtools/python/python-barbican/barbican-fix-path-to-find-configuration-files.patch
+++ b/meta-openstack/recipes-devtools/python/python-barbican/barbican-fix-path-to-find-configuration-files.patch
@@ -1,4 +1,4 @@
-From 30a57a0b4f2dcaff76821f21f4a545ecb9ddf194 Mon Sep 17 00:00:00 2001
+From 3364915002aa2deaf63841e338375648e5dc8f24 Mon Sep 17 00:00:00 2001
 From: Keith Holman <Keith.Holman@windriver.com>
 Date: Fri, 13 Jun 2014 13:46:04 -0400
 Subject: [PATCH] barbican: fix path to find configuration files
@@ -10,15 +10,16 @@ recipe.  This fix updates the location for the configuration files
 with an identifier that is replaced during deployment.
 
 Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
+
 ---
  barbican/tests/api/test_resources_policy.py | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/barbican/tests/api/test_resources_policy.py b/barbican/tests/api/test_resources_policy.py
-index 7d995c6..28b7599 100644
+index 5c75bc3..f2332f6 100644
 --- a/barbican/tests/api/test_resources_policy.py
 +++ b/barbican/tests/api/test_resources_policy.py
-@@ -35,8 +35,7 @@ from barbican.openstack.common import policy
+@@ -37,8 +37,7 @@ from barbican.tests import utils
  CONF = cfg.CONF
  
  # Point to the policy.json file located in source control.
@@ -26,8 +27,5 @@ index 7d995c6..28b7599 100644
 -                                            '../../../etc', 'barbican'))
 +TEST_VAR_DIR = "%BARBICAN_CONF_DIR%"
  
- ENFORCER = policy.Enforcer()
+ ENFORCER = policy.Enforcer(CONF)
  
--- 
-1.9.3
-
diff --git a/meta-openstack/recipes-devtools/python/python-barbican/barbican-increase-buffer-size-to-support-PKI-tokens.patch b/meta-openstack/recipes-devtools/python/python-barbican/barbican-increase-buffer-size-to-support-PKI-tokens.patch
index acde89c..c85e473 100644
--- a/meta-openstack/recipes-devtools/python/python-barbican/barbican-increase-buffer-size-to-support-PKI-tokens.patch
+++ b/meta-openstack/recipes-devtools/python/python-barbican/barbican-increase-buffer-size-to-support-PKI-tokens.patch
@@ -1,4 +1,4 @@
-From 8b78d792ca7f7ba4e105225c3917c0a467a2fadb Mon Sep 17 00:00:00 2001
+From 542a384cf1de68dc21ec335ff9518889e342d76e Mon Sep 17 00:00:00 2001
 From: Keith Holman <Keith.Holman@windriver.com>
 Date: Thu, 22 May 2014 12:08:13 -0400
 Subject: [PATCH] barbican: increase buffer-size to support PKI tokens
@@ -10,25 +10,26 @@ buffer size uWSGI uses fixes this problem.  This fix allows the
 packet sized to be specified in the build recipe file.
 
 Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
+
 ---
  etc/barbican/vassals/barbican-admin.ini | 1 +
  etc/barbican/vassals/barbican-api.ini   | 1 +
  2 files changed, 2 insertions(+)
 
-Index: git/etc/barbican/vassals/barbican-admin.ini
-===================================================================
---- git.orig/etc/barbican/vassals/barbican-admin.ini
-+++ git/etc/barbican/vassals/barbican-admin.ini
-@@ -9,3 +9,4 @@
+diff --git a/etc/barbican/vassals/barbican-admin.ini b/etc/barbican/vassals/barbican-admin.ini
+index cd8bc49..562b6e7 100644
+--- a/etc/barbican/vassals/barbican-admin.ini
++++ b/etc/barbican/vassals/barbican-admin.ini
+@@ -9,3 +9,4 @@ memory-report = true
  plugins = python
  paste = config:/etc/barbican/barbican-admin-paste.ini
  add-header = Connection: close
 +buffer-size = %BARBICAN_MAX_PACKET_SIZE%
-Index: git/etc/barbican/vassals/barbican-api.ini
-===================================================================
---- git.orig/etc/barbican/vassals/barbican-api.ini
-+++ git/etc/barbican/vassals/barbican-api.ini
-@@ -9,3 +9,4 @@
+diff --git a/etc/barbican/vassals/barbican-api.ini b/etc/barbican/vassals/barbican-api.ini
+index a4f0bee..fa476b6 100644
+--- a/etc/barbican/vassals/barbican-api.ini
++++ b/etc/barbican/vassals/barbican-api.ini
+@@ -9,3 +9,4 @@ memory-report = true
  plugins = python
  paste = config:/etc/barbican/barbican-api-paste.ini
  add-header = Connection: close
diff --git a/meta-openstack/recipes-devtools/python/python-ceilometer/fix_ceilometer_memory_leak.patch b/meta-openstack/recipes-devtools/python/python-ceilometer/fix_ceilometer_memory_leak.patch
index bdc1bf7..9581e90 100644
--- a/meta-openstack/recipes-devtools/python/python-ceilometer/fix_ceilometer_memory_leak.patch
+++ b/meta-openstack/recipes-devtools/python/python-ceilometer/fix_ceilometer_memory_leak.patch
@@ -1,10 +1,16 @@
+From fd4b8446cf3cf01a21f4b4a43897fe2603be5aba Mon Sep 17 00:00:00 2001
+From: Amy Fong <amy.fong@windriver.com>
+Date: Fri, 28 Mar 2014 15:58:45 -0400
+
 ---
- ceilometer/nova_client.py |    7 +++++++
+ ceilometer/nova_client.py | 7 +++++++
  1 file changed, 7 insertions(+)
 
+diff --git a/ceilometer/nova_client.py b/ceilometer/nova_client.py
+index 084c4ea..0219d00 100644
 --- a/ceilometer/nova_client.py
 +++ b/ceilometer/nova_client.py
-@@ -26,6 +26,12 @@
+@@ -38,6 +38,12 @@ cfg.CONF.import_group('service_credentials', 'ceilometer.service')
  
  LOG = log.getLogger(__name__)
  
@@ -17,11 +23,11 @@
  
  def logged(func):
  
-@@ -56,6 +62,7 @@
-             endpoint_type=conf.os_endpoint_type,
-             cacert=conf.os_cacert,
+@@ -75,6 +81,7 @@ class Client(object):
+             timeout=cfg.CONF.http_timeout,
+             http_log_debug=cfg.CONF.nova_http_log_debug,
              no_cache=True)
 +        self.nova_client.set_timings_max_len(cfg.CONF.nova_client.max_timing_buffer)
  
      def _with_flavor_and_image(self, instances):
-         for instance in instances:
+         flavor_cache = {}
diff --git a/meta-openstack/recipes-devtools/python/python-horizon/fix_bindir_path.patch b/meta-openstack/recipes-devtools/python/python-horizon/fix_bindir_path.patch
index c9d0b1a..d390ae1 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon/fix_bindir_path.patch
+++ b/meta-openstack/recipes-devtools/python/python-horizon/fix_bindir_path.patch
@@ -1,11 +1,20 @@
+From e56f1df2d7567ed428888429f51a6f4a0864a414 Mon Sep 17 00:00:00 2001
+From: Mihai Prica <prica.mihai@gmail.com>
+Date: Tue, 23 Jul 2013 10:56:00 +0300
+Subject: [PATCH] python-horizon: Fix bindir search path
+
 Upstream-Status: Inappropriate [configuration]
 
-Index: horizon-2013.1.2/openstack_dashboard/settings.py
-===================================================================
---- horizon-2013.1.2.orig/openstack_dashboard/settings.py
-+++ horizon-2013.1.2/openstack_dashboard/settings.py
-@@ -29,7 +29,7 @@ warnings.formatwarning = lambda message,
-                                 '%s: %s' % (category.__name__, message)
+---
+ openstack_dashboard/settings.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/openstack_dashboard/settings.py b/openstack_dashboard/settings.py
+index 51db4ca..a1f1d32 100644
+--- a/openstack_dashboard/settings.py
++++ b/openstack_dashboard/settings.py
+@@ -38,7 +38,7 @@ warnings.formatwarning = lambda message, category, *args, **kwargs: \
+     '%s: %s' % (category.__name__, message)
  
  ROOT_PATH = os.path.dirname(os.path.abspath(__file__))
 -BIN_DIR = os.path.abspath(os.path.join(ROOT_PATH, '..', 'bin'))
diff --git a/meta-openstack/recipes-devtools/python/python-horizon/horizon-use-full-package-path-to-test-directories.patch b/meta-openstack/recipes-devtools/python/python-horizon/horizon-use-full-package-path-to-test-directories.patch
index e5e1966..ea29a16 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon/horizon-use-full-package-path-to-test-directories.patch
+++ b/meta-openstack/recipes-devtools/python/python-horizon/horizon-use-full-package-path-to-test-directories.patch
@@ -1,4 +1,4 @@
-From 89aa2a575687013f4b4f4d4353c50af1de4c26ba Mon Sep 17 00:00:00 2001
+From 16f66dec1dc9e7c98cc5d6d0099a7865bf5b8e71 Mon Sep 17 00:00:00 2001
 From: Keith Holman <Keith.Holman@windriver.com>
 Date: Fri, 30 May 2014 11:58:33 -0400
 Subject: [PATCH] horizon: use full package path to test directories
@@ -15,15 +15,16 @@ within the build recipe with the full path to the python site
 packages.
 
 Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
+
 ---
  horizon/test/settings.py | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/horizon/test/settings.py b/horizon/test/settings.py
-index f5ea700..10318eb 100644
+index fde7c12..3df65af 100644
 --- a/horizon/test/settings.py
 +++ b/horizon/test/settings.py
-@@ -95,8 +95,8 @@ SITE_BRANDING = 'Horizon'
+@@ -109,8 +109,8 @@ SITE_BRANDING = 'Horizon'
  TEST_RUNNER = 'django_nose.NoseTestSuiteRunner'
  NOSE_ARGS = ['--nocapture',
               '--nologcapture',
@@ -34,6 +35,3 @@ index f5ea700..10318eb 100644
               '--cover-package=horizon',
               '--cover-inclusive',
               '--all-modules']
--- 
-1.9.3
-
diff --git a/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch b/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
index 6630163..173ecb6 100644
--- a/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
+++ b/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
@@ -1,4 +1,4 @@
-From 5f6a261e44fec387e66d8b89d69f9602de5d5c53 Mon Sep 17 00:00:00 2001
+From 93fea40915d01be6d02587a0b8be85a642e6a8d5 Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@freescale.com>
 Date: Thu, 10 Apr 2014 11:26:39 +0800
 Subject: [PATCH] Correct the path of header files check in Yocto build env
@@ -13,18 +13,19 @@ error appears. Change the path of header check.
 | compilation terminated.
 
 Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
 ---
  usr/Makefile | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/usr/Makefile b/usr/Makefile
-index 453eb1a..191503d 100644
+index decf13c..9ff8f15 100644
 --- a/usr/Makefile
 +++ b/usr/Makefile
 @@ -1,11 +1,11 @@
  sbindir ?= $(PREFIX)/sbin
  libdir ?= $(PREFIX)/lib/tgt
-
+ 
 -ifneq ($(shell test -e /usr/include/linux/signalfd.h && echo 1),)
 +ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/signalfd.h && echo 1),)
  CFLAGS += -DUSE_SIGNALFD
@@ -35,8 +36,8 @@ index 453eb1a..191503d 100644
  CFLAGS += -DUSE_TIMERFD
  endif
  
-@@ -25,7 +25,7 @@ TGTD_OBJS += bs_rbd.o
- CFLAGS += -DUSE_TIMERFD
+@@ -25,7 +25,7 @@ ifneq ($(SD_NOTIFY),)
+ CFLAGS += -DUSE_SYSTEMD
  endif
  
 -ifneq ($(shell test -e /usr/include/sys/eventfd.h && test -e /usr/include/libaio.h && echo 1),)
@@ -44,6 +45,3 @@ index 453eb1a..191503d 100644
  CFLAGS += -DUSE_EVENTFD
  TGTD_OBJS += bs_aio.o
  LIBS += -laio
--- 
-1.9.1
-
diff --git a/meta-openstack/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch b/meta-openstack/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
index f749101..078ba9e 100644
--- a/meta-openstack/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
+++ b/meta-openstack/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
@@ -1,4 +1,4 @@
-From 2a336ec5bf939d86425570617471df60140d839e Mon Sep 17 00:00:00 2001
+From 6f4e3b11c7dccf83e2d18635c84837b212dfcc1c Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Sun, 26 Jul 2015 04:23:51 +0900
 Subject: [PATCH] usr/Makefile: WARNING fix WARNING: QA Issue: tgt:
@@ -9,12 +9,13 @@ Subject: [PATCH] usr/Makefile: WARNING fix WARNING: QA Issue: tgt:
 Upstream-Status: pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+
 ---
  usr/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/usr/Makefile b/usr/Makefile
-index 1fae7e7..2db109c 100644
+index 9ff8f15..cc8df11 100644
 --- a/usr/Makefile
 +++ b/usr/Makefile
 @@ -63,7 +63,7 @@ TGTD_OBJS += tgtd.o mgmt.o target.o scsi.o log.o driver.o util.o work.o \
@@ -26,6 +27,3 @@ index 1fae7e7..2db109c 100644
  
  .PHONY:all
  all: $(PROGRAMS) $(MODULES)
--- 
-1.8.4.2
-
-- 
2.7.4


