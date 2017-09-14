Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2072BE00CC4; Wed, 13 Sep 2017 18:16:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.192.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.192.195 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0514E00CAF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Sep 2017 18:16:33 -0700 (PDT)
Received: by mail-pf0-f195.google.com with SMTP id f84so761667pfj.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Sep 2017 18:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6OoFjADGDaFdlR691vBb4ZVZ0zkA37HOBP8S/TulD0s=;
	b=Ze49Epk/nP2qg999UFRYjjKAvKVZiyoYOwYDdU0GQE3+i/UuXUFF0b58hLVdnJSDIW
	U2BsjFiZguloW9jau/oxOIBGWPGbRewgVJ3Ctjb0klQBAr4uxYF2UfS0Ot2XdNx0xpC3
	osbK7VnW0Oh5k2eZp5GzrYOBjQxJalif86tFB6cG+rf4VMFmz1lhBi5gdJsLBlhOOagQ
	ZDY+ZoSh+4+kmOGGSVAB8rQ0tBrdzZBRxFWd8QcaB1MjBzk5+C1jtHyUyB0jCUKLS67z
	4YQmRPHS7vSQGHNcuB875RJNsPHlycZN+fKdoA0MXRp0Gs3Rzz8X4EPsf9drfrwL4WDG
	eLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6OoFjADGDaFdlR691vBb4ZVZ0zkA37HOBP8S/TulD0s=;
	b=uWa+xNQ4GbNF9YCg29i7/xK8goLMg4nWhIzByZUGGrPpBES7vwONMm6j2W7Egd7EIh
	ixJSt2W4YJMHGipTeyoyrF/H+V0d5nvUSPxyiLHF6im3rPuHzLAXa9FtHLaRS/e0NwJ9
	Q3zvytnsbDjR92ocGHzEck49A0WcyNmVfr+5Jn3MqyJlnz1YstJg4N9RHIIGkqAXq4K6
	vtngoauD9F35YNgVFegoNdZdO8aTJzrJErSnuaO/U7GU116ZN/bUob+J5ZQ7rpxguWlI
	2qbMHDXch3/4JIyir4q05ZVpxd9KijW01AltdqVjYvqbQsnLYQ59k5D/gWIOxaGUM/Vx
	MW1Q==
X-Gm-Message-State: AHPjjUjXWHggNoeErB9M28HHrtBFzlAFFxbw2Lr7OYBwNhNFIPtQWnye
	PfJFdce7Xz/F5qebToQ=
X-Google-Smtp-Source: ADKCNb7BYUwm/X1nD0XY4LrKM5cc5lZf4oruWR3lQ8tzjH9m24gPef7ocoEiIpBBaSmjTz8t/QiDVA==
X-Received: by 10.99.6.76 with SMTP id 73mr19950401pgg.105.1505351792446;
	Wed, 13 Sep 2017 18:16:32 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	u66sm1736717pfd.33.2017.09.13.18.16.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Sep 2017 18:16:31 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 13 Sep 2017 18:16:21 -0700
Message-Id: <1505351781-17082-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org
Subject: [PATCH] xen: Add menuconfig task and enable menuconfig from devshell
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
X-List-Received-Date: Thu, 14 Sep 2017 01:16:34 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Xen supports Kconfig for configuring optional build settings.
This commit adds the menuconfig task to simplify interactive use:

    bitbake xen -c menuconfig

and also ensures that menuconfig works when using the devshell.
This change adds ncurses-native as a build dependency.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---

Please use my gmail address for any correspondence.

 recipes-extended/xen/xen.inc | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index ab69987..3ca38fb 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -30,6 +30,7 @@ DEPENDS = " \
     flex-native \
     file-native \
     iasl-native \
+    ncurses-native \
     util-linux-native \
     xz-native \
     bridge-utils \
@@ -1006,3 +1007,37 @@ do_deploy() {
 }
 
 addtask deploy after do_populate_sysroot
+
+# Enable use of menuconfig directly from bitbake and also within the devshell
+OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
+HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
+HOSTLDFLAGS = "${BUILD_LDFLAGS}"
+TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
+do_devshell[depends] += "ncurses-native:do_populate_sysroot"
+
+KCONFIG_CONFIG_COMMAND ??= "menuconfig"
+python do_menuconfig() {
+    import shutil
+
+    try:
+        mtime = os.path.getmtime("xen/.config")
+        shutil.copy("xen/.config", "xen/.config.orig")
+    except OSError:
+        mtime = 0
+
+    oe_terminal("${SHELL} -c \"cd xen; XEN_CONFIG_EXPERT=y make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
+        d.getVar('PN') + ' Configuration', d)
+
+    try:
+        newmtime = os.path.getmtime("xen/.config")
+    except OSError:
+        newmtime = 0
+
+    if newmtime > mtime:
+        bb.note("Configuration changed, recompile will be forced")
+        bb.build.write_taint('do_compile', d)
+}
+do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
+do_menuconfig[nostamp] = "1"
+do_menuconfig[dirs] = "${B}"
+addtask menuconfig after do_configure
-- 
2.7.4


