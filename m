Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2B89E00D64; Tue, 17 Oct 2017 07:44:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 697ACE00D35
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 07:44:06 -0700 (PDT)
Received: by mail-qt0-f194.google.com with SMTP id f15so4007483qtf.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 07:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QK17C072DtMW2SEuQFbF8n8Y3J7+WyF6rRHYioPseR0=;
	b=VGI75PgkMQj8mZGxHVNZVpsG0a+8weM3b4G+7KxoJ9XnE+8L0nRpTyx1CpbgD4F6SQ
	GPG+1h9Wd1fTvleuw+yooHmzWGUL6OuPQLd0h4waZRAHVJlp9YzZeLvTxYO1vxD7FVmN
	6ivmXGHQDVvdzm0VMPSxTFf/I4wd5HTm8eXVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QK17C072DtMW2SEuQFbF8n8Y3J7+WyF6rRHYioPseR0=;
	b=NZj1mrL9mvP31w9lLh9GTY496ricNDYyQ+9h+chcwtGYBr1oIkx6ufcID1fW/+olwk
	8VbhONJgFpecNq9gujNdFwHBeT+pj2rHy6+2OuCynDVVmOHWmv1Mzlbhw1m/qfXVM1UA
	3pBtepImOkyvlTVEyAx9kchS6OAbmosjQm7SrQNysS7NiM+99OspxxjswzijltfcJl7b
	KlJbSOy9tvbJKDbL8LG+t9oCmLQE8mEueIwXBtFQFLeBnS0Kiv4jB0aU4D4TH7J5FSok
	1AWAbZdAdvm04U9et9NwhjTZ2k5ghGivhe+pZ+L8WUQFr9PUGaiTpottDu9/6ktu46+q
	/Nkg==
X-Gm-Message-State: AMCzsaWFWxC1MWB90TFrv46IuzUN1qYYgu0naCtJh6T/e56UnsXFetM8
	F9WqP2DjBqJ2kuD9g/hDWxV8AmN58+U=
X-Google-Smtp-Source: AOwi7QAc5JdTBNPtv+cHbet2lw9f2aDyQRuaCwJWmfZRM9cJBL9OBLQxjVOefVVeJWRY9Mmp2hjsCg==
X-Received: by 10.200.3.31 with SMTP id q31mr19029512qtg.284.1508251445592;
	Tue, 17 Oct 2017 07:44:05 -0700 (PDT)
Received: from swanson.localdomain
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	a190sm6116473qkg.15.2017.10.17.07.44.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Oct 2017 07:44:04 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 17 Oct 2017 09:43:39 -0500
Message-Id: <20171017144340.15635-5-cardoe@cardoe.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171017144340.15635-1-cardoe@cardoe.com>
References: <20171017144340.15635-1-cardoe@cardoe.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH 4/5] xen: Add menuconfig task and enable menuconfig from devshell
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
X-List-Received-Date: Tue, 17 Oct 2017 14:44:08 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Xen supports Kconfig for configuring optional build settings.
This commit adds the menuconfig task to simplify interactive use:

    bitbake xen -c menuconfig

and also ensures that menuconfig works when using the devshell.
This change adds ncurses-native as a build dependency.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
(cherry picked from commit 1d9e1bd99db93c1394f51f59dd3e2a3dec15c04d)
---
 recipes-extended/xen/xen.inc | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index cda737c..4333905 100644
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
@@ -1003,3 +1004,37 @@ do_deploy() {
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
2.13.5


