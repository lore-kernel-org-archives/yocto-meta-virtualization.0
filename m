Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06F83E00EC3; Wed, 27 Jul 2016 13:30:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9CA6E0083D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Jul 2016 13:30:49 -0700 (PDT)
Received: by mail-qt0-f194.google.com with SMTP id u25so2263800qtb.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Jul 2016 13:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iIKyZ+r+qcMVnyEY1B0ettU2Aj5SQDEO6OKCP/8CKtg=;
	b=WxAQLKmu5OcGHxznr2t5HYFu7MWfuCFvGigajuYtOqp+qpHOfPWtg20UkDiAk/g9PE
	BEx/fSJuVS0zEHyjymyR/g+h6KQcpbD9iYm2Erou7VthwCjV3iOvF7weqIvAdSuf+qTH
	Iyw06mY45CcWJ7o0mKMsOU3TdU7jW5E+u9INkFlDnkS/bcbODCSO6LwTgDmW3ajTJXDT
	NVzfpus17qPAsfuXec6Zk89OM+nWem2r2RpvwSLeiTxQ75TUFnfYXexg3GDx/2O/AZKS
	sn5F7kBCCBNEto1GsWAn3W0/Srt2XU3t8tsPVZDXEr28JEcxi4+UnANib1envFxubr3K
	I16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iIKyZ+r+qcMVnyEY1B0ettU2Aj5SQDEO6OKCP/8CKtg=;
	b=AudcRjjJHu+u8z6TP/Sticw+a6OBa9qjGHT34ippuSTsCnmG4s+hSyeNTAOLXS09kP
	CpBlS4iUoa0Bqw7KPREhSo/vUpV6QWBNwzIHH5qVR3NDzMalx5zv+qr0khEm01PplA5+
	GluItnsvSj7CvYXaBTpvJ+0/6g9MVlwD0s487NGkYYOprvtKl2lNe1sdZQPAjyYnFALU
	8rDz+mGw2Z5pCNtUWFxLWMTq4v6aAbpYc+kYbqQz28GHwwAbBXaYFHy6jBOiEuglytCN
	t7wwRADC1AgH5kN2/i0lCNQCgVwiskVYhKi2VK3HS2vtz4Li3OrjVO5qEilLHsVCCjXc
	smHA==
X-Gm-Message-State: AEkoouttEObzU0fS+2Jj03FsYAA6uerWvHfYKwZL7P55KZUsFUuFzy2Htqfbladb0ou12Q==
X-Received: by 10.237.37.99 with SMTP id w32mr50051170qtc.59.1469651448253;
	Wed, 27 Jul 2016 13:30:48 -0700 (PDT)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	y4sm5256024qtb.33.2016.07.27.13.30.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jul 2016 13:30:47 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 27 Jul 2016 16:30:42 -0400
Message-Id: <1469651442-26772-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [PATCH] xen: uprev to 4.7.0
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
X-List-Received-Date: Wed, 27 Jul 2016 20:30:56 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

- update packages and add additional ones for new binaries
  (cpuid and livepatch)
- update xen_git to point to 4.7, make branch= fully variable,
  and remove assumed .0 from release version
- add patch to fix compilation of xen with gcc 6 on arm/aarch64

Build tested x86_64 and aarch64 targets.

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 ...l-compilation-warning-fix-for-arm-aarch64.patch | 58 ++++++++++++++++++++++
 recipes-extended/xen/xen.inc                       | 19 ++++++-
 recipes-extended/xen/xen_4.6.1.bb                  | 10 ----
 recipes-extended/xen/xen_4.7.0.bb                  | 11 ++++
 recipes-extended/xen/xen_git.bb                    |  9 ++--
 5 files changed, 92 insertions(+), 15 deletions(-)
 create mode 100644 recipes-extended/xen/files/libxl-compilation-warning-fix-for-arm-aarch64.patch
 delete mode 100644 recipes-extended/xen/xen_4.6.1.bb
 create mode 100644 recipes-extended/xen/xen_4.7.0.bb

diff --git a/recipes-extended/xen/files/libxl-compilation-warning-fix-for-arm-aarch64.patch b/recipes-extended/xen/files/libxl-compilation-warning-fix-for-arm-aarch64.patch
new file mode 100644
index 0000000..baab928
--- /dev/null
+++ b/recipes-extended/xen/files/libxl-compilation-warning-fix-for-arm-aarch64.patch
@@ -0,0 +1,58 @@
+Upstream-Status: Submitted
+
+From 3716a7faf98e1e126d47fe1596593917c27ee1bd Mon Sep 17 00:00:00 2001
+From: Chris Patterson <pattersonc@ainfosec.com>
+Date: Tue, 26 Jul 2016 16:01:47 -0400
+Subject: [PATCH] libxl: compilation warning fix for arm & aarch64
+
+GCC 6 will warn on unused static const variables in c modules:
+https://gcc.gnu.org/ml/gcc-patches/2015-09/msg00847.html
+
+When compiling with LIBXL_HAVE_NO_SUSPEND_RESUME set (arm & aarch64),
+the compiler emits the following errors:
+  xl_cmdimpl.c:101:19: error: 'migrate_report'
+      defined but not used [-Werror=unused-const-variable=]
+  xl_cmdimpl.c:99:19: error: 'migrate_permission_to_go'
+      defined but not used [-Werror=unused-const-variable=]
+  xl_cmdimpl.c:97:19: error: 'migrate_receiver_ready'
+      defined but not used [-Werror=unused-const-variable=]
+  xl_cmdimpl.c:95:19: error: 'migrate_receiver_banner'
+      defined but not used [-Werror=unused-const-variable=]
+
+These unused const variables are only used in functions which exist between
+the ifndef block:
+   #ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
+   ...
+   #endif
+
+Wrap the same ifndef around these variables.
+
+Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
+---
+ tools/libxl/xl_cmdimpl.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tools/libxl/xl_cmdimpl.c b/tools/libxl/xl_cmdimpl.c
+index d1fcfa4..ada8178 100644
+--- a/tools/libxl/xl_cmdimpl.c
++++ b/tools/libxl/xl_cmdimpl.c
+@@ -92,6 +92,7 @@ static int fd_lock = -1;
+ static const char savefileheader_magic[32]=
+     "Xen saved domain, xl format\n \0 \r";
+ 
++#ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
+ static const char migrate_receiver_banner[]=
+     "xl migration receiver ready, send binary domain data.\n";
+ static const char migrate_receiver_ready[]=
+@@ -100,6 +101,8 @@ static const char migrate_permission_to_go[]=
+     "domain is yours, you are cleared to unpause";
+ static const char migrate_report[]=
+     "my copy unpause results are as follows";
++#endif
++
+   /* followed by one byte:
+    *     0: everything went well, domain is running
+    *            next thing is we all exit
+-- 
+2.7.4
+
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index de8c168..e911415 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -151,6 +151,7 @@ PACKAGES = "\
     ${PN}-base \
     ${PN}-blktap \
     ${PN}-console \
+    ${PN}-cpuid \
     ${PN}-dbg \
     ${PN}-dev \
     ${PN}-devd \
@@ -196,6 +197,7 @@ PACKAGES = "\
     ${PN}-libxenvchan-dev \
     ${PN}-libxlutil \
     ${PN}-libxlutil-dev \
+    ${PN}-livepatch \
     ${PN}-misc \
     ${PN}-pygrub \
     ${PN}-python \
@@ -369,6 +371,10 @@ FILES_${PN}-console = "\
     ${sbindir}/xenconsoled \
     "
 
+FILES_${PN}-cpuid = "\
+    ${bindir}/xen-cpuid \
+    "
+
 FILES_${PN}-devd = "\
     ${sysconfdir}/init.d/xendriverdomain \
     "
@@ -399,6 +405,10 @@ FILES_${PN}-kdd = "\
     ${sbindir}/kdd \
     "
 
+FILES_${PN}-livepatch += " \
+    ${sbindir}/xen-livepatch \
+    "
+
 FILES_${PN}-misc = "\
     ${bindir}/xencons \
     ${bindir}/xencov_split \
@@ -527,6 +537,7 @@ FILES_${PN}-remus = "\
     "
 
 FILES_${PN}-scripts-network = " \
+    ${sysconfdir}/xen/scripts/colo-proxy-setup \
     ${sysconfdir}/xen/scripts/network-bridge \
     ${sysconfdir}/xen/scripts/network-nat \
     ${sysconfdir}/xen/scripts/network-route \
@@ -544,6 +555,7 @@ FILES_${PN}-scripts-block = " \
     ${sysconfdir}/xen/scripts/blktap \
     ${sysconfdir}/xen/scripts/block \
     ${sysconfdir}/xen/scripts/block-common.sh \
+    ${sysconfdir}/xen/scripts/block-dummy \
     ${sysconfdir}/xen/scripts/block-enbd \
     ${sysconfdir}/xen/scripts/block-iscsi \
     ${sysconfdir}/xen/scripts/block-nbd \
@@ -744,9 +756,11 @@ export XEN_OS = "Linux"
 
 # this is used for the header (#!${bindir}/python) of the install python scripts
 export PYTHONPATH="${bindir}/python"
+export ac_cv_path_PYTHONPATH="${bindir}/python"
 
-# seabios forcefully sets HOSTCC to CC - fixup to allow it to build native conf executable
+# xen and seabios require HOSTCC and HOSTCXX set to cross-compile
 export HOSTCC="${BUILD_CC}"
+export HOSTCXX="${BUILD_CXX}"
 
 # make xen requires CROSS_COMPILE set by hand as it does not abide by ./configure
 export CROSS_COMPILE="${TARGET_PREFIX}"
@@ -837,6 +851,9 @@ do_configure() {
 }
 
 do_compile() {
+    # workaround for build bug when CFLAGS is exported
+    # https://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.html
+    unset CFLAGS
     oe_runmake
 }
 
diff --git a/recipes-extended/xen/xen_4.6.1.bb b/recipes-extended/xen/xen_4.6.1.bb
deleted file mode 100644
index 0adf8ad..0000000
--- a/recipes-extended/xen/xen_4.6.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xen.inc
-
-SRC_URI = " \
-    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
-    "
-
-SRC_URI[md5sum] = "df2d854c3c90ffeefaf71e7f868fb326"
-SRC_URI[sha256sum] = "44cc2fccba1e147ef4c8da0584ce0f24189c8743de0e3e9a9226da88ddb5f589"
-
-S = "${WORKDIR}/xen-${PV}"
diff --git a/recipes-extended/xen/xen_4.7.0.bb b/recipes-extended/xen/xen_4.7.0.bb
new file mode 100644
index 0000000..adb5c36
--- /dev/null
+++ b/recipes-extended/xen/xen_4.7.0.bb
@@ -0,0 +1,11 @@
+require xen.inc
+
+SRC_URI = " \
+    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
+    file://libxl-compilation-warning-fix-for-arm-aarch64.patch \
+    "
+
+SRC_URI[md5sum] = "3aa4e01bf37a3a5bc8572907cb88e649"
+SRC_URI[sha256sum] = "be5876144d49729572ae06142e0bb93f1c1f2695578141eff2931995add24623"
+
+S = "${WORKDIR}/xen-${PV}"
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index a86a501..e10d669 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,15 +1,16 @@
 require xen.inc
 
-SRCREV = "1fd615aa0108490ffc558d27627f509183cbfdaf"
+SRCREV ?= "9a6cc4f5c14b3d7542b7523f88a1b65464733d3a"
 
-XEN_REL="4.6"
+XEN_REL ?= "4.7"
+XEN_BRANCH ?= "staging-${XEN_REL}"
 
-PV = "${XEN_REL}.0+git${SRCPV}"
+PV = "${XEN_REL}+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = " \
-    git://xenbits.xen.org/xen.git;branch=staging-${XEN_REL} \
+    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     "
 
 DEFAULT_PREFERENCE = "-1"
-- 
2.1.4


