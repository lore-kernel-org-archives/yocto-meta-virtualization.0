Return-Path: <vomegaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84489E00CDC; Wed, 25 May 2016 01:32:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACB8DE00CD0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 May 2016 01:32:48 -0700 (PDT)
Received: by mail-wm0-f66.google.com with SMTP id 67so13106691wmg.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 May 2016 01:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=M2wVAACvMVExiNSUs3xC/Pf0wmjyRdmI2+mjt6aj2aE=;
	b=IJPJfr/U1bEa9UpFLPgJQRcXPnwMyHMuInvBOaHCc68S6I/qn0DPGYHJK7BfXkEoh7
	wZZvgVVObMqGslW7v4v8ATIo1cd1tfAPEILgXcDasscVslnfwrcd4hKnpfJ82ST3ZoWy
	teZUjU3amQaf7Mtt8bLhjljgUeOBAiPcEauPo0WHzYse2uBzHeHIKF23e7sVfwQDwFPY
	gQnZZpjp+1W4nMC9rpFNkcIdwW+qDaN89wqD4jwXlMFtK4SCtOhVrv5zHgJ6PfQHTrc+
	SjhP8FcPHi9HoM/7a2KGJr7uT+63MFRitwjNQKJeV122rLOtykBs+Gj9yPtyurONTzUU
	61mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=M2wVAACvMVExiNSUs3xC/Pf0wmjyRdmI2+mjt6aj2aE=;
	b=hG9mEzbS08rrQH8JYUp29Wbmay8YoziUcoMQbuKVi8P2BWGPoYTpN6ShT8mtnhaqF0
	1LcKVieTtA233LMiccdtZhd3phQf6q1u/TyHVs31WEDRjXylmeA8FikkUOhlWG99o6hY
	Kmjur2oqND0sP5JsPlo52hcFqaIJqoEE8nYRDenvA9s3aoC4Nqel/ED5xjjVCnO9wz0k
	b5gydXBDEZszHzHW22ivELd37BFbqvbqIuC7rSSJ1vl2G+weputHKAVBMj/7PaEKnQ5I
	VTv9Xd4vPFqxCaoIakUuLqhmKlmwWR0WZVUxGIIjU4qGycncuZ/TEPLPQwODXk+SL3ui
	POqQ==
X-Gm-Message-State: ALyK8tLhNXqrXCnZ4z1OVJh7OTeOToXOfBmQXxhjdPPfxxldJ2g5t/MHA3iBycYyJpU5Jg==
X-Received: by 10.28.175.143 with SMTP id y137mr2001342wme.21.1464165167907;
	Wed, 25 May 2016 01:32:47 -0700 (PDT)
Received: from sgxcmp131.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id
	x124sm7896765wmg.24.2016.05.25.01.32.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 May 2016 01:32:46 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: meta-virtualization@yoctoproject.org
Date: Wed, 25 May 2016 10:32:44 +0200
Message-Id: <1464165164-27601-1-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] Use bb.utils.contains instead of base_contains because it is deprecated
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
X-List-Received-Date: Wed, 25 May 2016 08:32:49 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 recipes-containers/containerd/containerd_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 46b9dc1..1a2c445 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -59,8 +59,8 @@ do_compile() {
 
 # Note: disabled for now, since docker is launching containerd
 # inherit systemd
-# SYSTEMD_PACKAGES = "${@base_contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
-# SYSTEMD_SERVICE_${PN} = "${@base_contains('DISTRO_FEATURES','systemd','containerd.service','',d)}"
+# SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
+# SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','containerd.service','',d)}"
 
 do_install() {
 	mkdir -p ${D}/${bindir}
@@ -73,7 +73,7 @@ do_install() {
 	ln -sf containerd-shim ${D}/${bindir}/docker-containerd-shim
 	ln -sf containerd-ctr ${D}/${bindir}/docker-containerd-ctr
 
-	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -d ${D}${systemd_unitdir}/system
 		install -m 644 ${S}/hack/containerd.service ${D}/${systemd_unitdir}/system
 	        # adjust from /usr/local/bin to /usr/bin/
-- 
2.1.4


