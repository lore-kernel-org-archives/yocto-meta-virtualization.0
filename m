Return-Path: <paul.betafive@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F330E00736; Sun, 19 Jun 2016 01:48:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [74.125.82.65 listed in list.dnswl.org]
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCFF8E006D2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 19 Jun 2016 01:48:23 -0700 (PDT)
Received: by mail-wm0-f65.google.com with SMTP id c82so4159655wme.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 19 Jun 2016 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=ulTf/+aKTtI+DO3248sIqITeh5cZYr+mQTy9LVSFs28=;
	b=xnzJY+oT+Ogsd87UW8LGdp4r3ayPagNfUl00zn4PajX7BK9e1X8XOZZepZHB8a+hMk
	gX/nkmhMawqdoeK2iTHYiKjm373kfKnyb3EFggIQHNAX/33LlUJDSGNuzmG+CAcTWFLY
	1NpfziMaieTt73XBlcDEpBCJ4KrbxKKifIaCBBhRmaPaqFXdP/ZmuSvmkdcv3yx/zEHK
	GC7zw4ozCQVKG4Lb8ROg8J50Y9a1+uVGZDDccW/Saju5yESzVrloM46Z0R/XQNNzszmX
	NiHN+i8lhPR8FXLjUOjDOF7kKqoWzobATVHZ6Qx8ZR+BBlssdLCcIcFwcmRia1yxzhxt
	l9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=ulTf/+aKTtI+DO3248sIqITeh5cZYr+mQTy9LVSFs28=;
	b=NFJkppQ2j1iZYWOdL9JBZ5DKcs3mlUZURgpRL92ENdMEDlSYoOZfKN9MWCPa80OLEf
	h91m669qb/QsZ23+oRpZIbJVvB7VeRMXyxNemtxeP5fp7/IH83D/5z8NLHAjNPsy47TX
	1CP3spKf0ueMEv2bsNhOEkxKVY4uV0YlY76I2E2YfrYTois9FJDZ0dgLs653xWKMLrGb
	Uwn0RqsqCvH7R7x16Iy+Khmv3Vrg4w1p77Tz9AyrzR6DQBIRVDbbtplawJAjt/rWWUID
	EToUy5eFlIqzf8QotAI2c0c/NSTUW/OWDKR9x8qLmDqk2NKOsBSTO+1wl6NfMx+QCA5q
	beOw==
X-Gm-Message-State: ALyK8tJ70f+KQxwdcXJveeF3vyNQuBaBi15PrTCm22w9JNlObd4DFmGvbjRTWJxewY9E1w==
X-Received: by 10.28.66.148 with SMTP id k20mr6390317wmi.55.1466326102469;
	Sun, 19 Jun 2016 01:48:22 -0700 (PDT)
Received: from dev-jessie.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net. [86.27.96.131])
	by smtp.gmail.com with ESMTPSA id
	f196sm2206605wmg.15.2016.06.19.01.48.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Jun 2016 01:48:21 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: meta-virtualization@yoctoproject.org
Date: Sun, 19 Jun 2016 09:48:46 +0100
Message-Id: <1466326126-21949-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] netns: New recipe
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
X-List-Received-Date: Sun, 19 Jun 2016 08:48:27 -0000

netns is a runc hook for setting up simple bridge networking within containers.

See README.md (or https://github.com/jfrazelle/netns/blob/master/README.md) for
instructions on how to use netns.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 recipes-networking/netns/netns_git.bb | 44 +++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 recipes-networking/netns/netns_git.bb

diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
new file mode 100644
index 0000000..073022e
--- /dev/null
+++ b/recipes-networking/netns/netns_git.bb
@@ -0,0 +1,44 @@
+HOMEPAGE = "https://github.com/jfrazelle/netns"
+SUMMARY = "Runc hook for setting up default bridge networking."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
+DEPENDS = "go-cross"
+
+SRC_URI = "git://github.com/jfrazelle/netns;branch=master"
+SRCREV = "2804050eeab661bfa75c3aa06bdcf60273b02ca7"
+PV = "0.1.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+inherit go-osarchmap
+
+do_compile() {
+	export GOARCH="${TARGET_GOARCH}"
+
+	# Setup vendor directory so that it can be used in GOPATH.
+	#
+	# Go looks in a src directory under any directory in GOPATH but netns
+	# uses 'vendor' instead of 'vendor/src'. We can fix this with a symlink.
+	#
+	# We also need to link in the ipallocator directory as that is not under
+	# a src directory.
+	ln -sfn . "${S}/vendor/src"
+	mkdir -p "${S}/vendor/src/github.com/jfrazelle/netns"
+	ln -sfn "${S}/ipallocator" "${S}/vendor/src/github.com/jfrazelle/netns/ipallocator"
+	export GOPATH="${S}/vendor"
+
+	# Pass the needed cflags/ldflags so that cgo
+	# can find the needed headers files and libraries
+	export CGO_ENABLED="1"
+	export CFLAGS=""
+	export LDFLAGS=""
+	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+
+	oe_runmake static
+}
+
+do_install() {
+	install -d ${D}/${sbindir}
+	install ${S}/netns ${D}/${sbindir}/netns
+}
-- 
2.1.4


