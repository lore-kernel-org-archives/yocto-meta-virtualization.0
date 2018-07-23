Return-Path: <koen@dominion.thruhere.net>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E92ADE00CA9; Mon, 23 Jul 2018 07:49:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.208.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F30D1E00C58
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 07:49:00 -0700 (PDT)
Received: by mail-ed1-f65.google.com with SMTP id s16-v6so1191544edq.12
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 07:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=v8gG48nmnRvAjB0Hii2LddnzwtSjbrPshpbeT+pJtnc=;
	b=sCFoHQ65ksQf/inAECwScWiJbKNRWuy03WjVs7VXBwqTYE85Ax0oGRllBaXn5mpWZp
	2PZEo/NkvIDyjAnbGUzFuSU0yshjG5z/b66dJ7rtNH90FY/Uo60VcaFtILpncVfMiAHQ
	K3Fdeb4zKcjysFjbMuB4y7r3x6TNHMdhQ9Z2lTpdq5xZMnOtPVp12x2OaODAXM8vATmD
	NfcQSqNqe0xLudg5hNGq0JIsj+FqhRQuWkhoFEGlrfulbtE/Kw90RuKbflFV05o8zj4+
	sauP0duCl75rAcuEtRNblGTdH1xnLq+/stSDP5UofCpMpXITJmcaxIWzLgwwQNuAkWWB
	Z50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=v8gG48nmnRvAjB0Hii2LddnzwtSjbrPshpbeT+pJtnc=;
	b=G+ST2BzNGB8J4Sl61zZ31bAyVZ+1omy9oFZyIfUtWtD5vEomFsq46X4jS/q8S2EmCB
	XTKJHV135s8JEPVpZtrqYcHlQsZtHCSI8thMcx35pdXnAITxrxBhi6xjR+pFgpFTHnle
	wRFNoGFkyNxdj/6qYlbwnRrP1g3xwvihHA3a9ZrrIwSVU8koq2Cd50RXR455XWMcs71/
	J+KiZgn7P9k/gFDob7VxAWPi+Vlypepw2KNrxhMLJkEiP5plQVQnIu2g3cZfTM8MTMly
	rLQzTbPKrQD+6Ij1lvRB/j+GaTCpiOkoIhRwsucQfWORLTg99n9IVbgAjR5wEvKK4Ayn
	+ckw==
X-Gm-Message-State: AOUpUlEy693EGc2qpK01icXHL2GEaW54gahBFb/s64xoz0xnxpv8ja0E
	BFAWt76JWFE/92p45eElZJl89/iEDDk=
X-Google-Smtp-Source: AAOMgpfFF0+kq5uhZCcdWFvQZ1r0cT2f5jXf1t/dGhzaBEKc/tT3h2ix2TtN1WqofKUtJrnMb16eHg==
X-Received: by 2002:a50:8978:: with SMTP id
	f53-v6mr14364699edf.166.1532357340002; 
	Mon, 23 Jul 2018 07:49:00 -0700 (PDT)
Received: from localhost.localdomain ([82.163.40.65])
	by smtp.gmail.com with ESMTPSA id
	w26-v6sm4479189eds.7.2018.07.23.07.48.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 07:48:58 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: meta-virtualization@yoctoproject.org
Date: Mon, 23 Jul 2018 16:48:50 +0200
Message-Id: <20180723144850.17279-4-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20180723144850.17279-1-koen.kooi@linaro.org>
References: <20180723144850.17279-1-koen.kooi@linaro.org>
Cc: Raymond Danks <ray.danks@se-eng.com>, Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 4/4] kubernetes: OE styleguide fixes
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
X-List-Received-Date: Mon, 23 Jul 2018 14:49:02 -0000

* Keep variables close to the function they are used in, so R(untime)DEPENDS goes below do_install, PV next to SRCREV, etc.
* Don't use =+ as multiline seperator, it's a *very* heavy bitbake operation.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 51 +++++++++++--------------
 1 file changed, 23 insertions(+), 28 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index bb80c3f..4dbd080 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -5,7 +5,11 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
 maintenance, and scaling of applications. \
 "
 
+# Note: 1.11+ requires go 1.10.2+, so the following must be set
+#       in your configuration: GOVERSION = "1.10%"
+PV = "1.11.0+git${SRCREV_kubernetes}"
 SRCREV_kubernetes = "210c9cd7e1782e9fe46938fe0368556f2166a528"
+
 SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.11;name=kubernetes \
            file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
           "
@@ -14,34 +18,11 @@ DEPENDS += "rsync-native \
             coreutils-native \
            "
 
-PACKAGES =+ "${PN}-misc"
-PACKAGES =+ "kubeadm"
-PACKAGES =+ "kubectl"
-PACKAGES =+ "kubelet"
-PACKAGES =+ "kube-proxy"
-
-ALLOW_EMPTY_${PN} = "1"
-
-# Note: we are explicitly *not* adding docker to the rdepends, since we allow
-#       backends like cri-o to be used.
-RDEPENDS_${PN} += "kubeadm \
-                   kubectl \
-                   kubelet \
-                   cni"
-
-RDEPENDS_kubeadm = "kubelet kubectl"
-RDEPENDS_kubelet = "iptables socat util-linux ethtool iproute2 ebtables iproute2-tc"
-
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 GO_IMPORT = "import"
 
-
-# Note: 1.11+ requires go 1.10.2+, so the following must be set
-#       in your configuration: GOVERSION = "1.10%"
-PV = "1.11.0+git${SRCREV_kubernetes}"
-
 inherit systemd
 inherit go
 inherit goarch
@@ -97,18 +78,32 @@ do_install() {
     install -m 0644 ${S}/src/import/build/debs/10-kubeadm.conf  ${D}${systemd_unitdir}/system/kubelet.service.d/
 }
 
+PACKAGES =+ "kubeadm kubectl kubelet kube-proxy ${PN}-misc"
+
+ALLOW_EMPTY_${PN} = "1"
+INSANE_SKIP_${PN} += "ldflags already-stripped"
+
+# Note: we are explicitly *not* adding docker to the rdepends, since we allow
+#       backends like cri-o to be used.
+RDEPENDS_${PN} += "kubeadm \
+                   kubectl \
+                   kubelet \
+                   cni"
+
+RDEPENDS_kubeadm = "kubelet kubectl"
+FILES_kubeadm = "${bindir}/kubeadm ${systemd_unitdir}/system/kubelet.service.d/*"
+
+RDEPENDS_kubelet = "iptables socat util-linux ethtool iproute2 ebtables iproute2-tc"
+FILES_kubelet = "${bindir}/kubelet ${systemd_unitdir}/system/kubelet.service ${sysconfdir}/kubernetes/manifests/"
+
 SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','kubelet','',d)}"
 SYSTEMD_SERVICE_kubelet = "${@bb.utils.contains('DISTRO_FEATURES','systemd','kubelet.service','',d)}"
 SYSTEMD_AUTO_ENABLE_kubelet = "enable"
 
-FILES_${PN}-misc = "${bindir}"
-FILES_kubeadm = "${bindir}/kubeadm ${systemd_unitdir}/system/kubelet.service.d/*"
 FILES_kubectl = "${bindir}/kubectl"
 FILES_kube-proxy = "${bindir}/kube-proxy"
-FILES_kubelet = "${bindir}/kubelet ${systemd_unitdir}/system/kubelet.service ${sysconfdir}/kubernetes/manifests/"
-
+FILES_${PN}-misc = "${bindir}"
 
 INHIBIT_PACKAGE_STRIP = "1"
-INSANE_SKIP_${PN} += "ldflags already-stripped"
 
 deltask compile_ptest_base
-- 
2.9.5


