Return-Path: <asselsm@gmail.com>
Received: from mail-qe0-f41.google.com (mail-qe0-f41.google.com
	[209.85.128.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 716B2E00744
	for <meta-virtualization@yoctoproject.org>;
	Sat, 23 Nov 2013 20:24:42 -0800 (PST)
Received: by mail-qe0-f41.google.com with SMTP id x7so2547183qeu.14
	for <meta-virtualization@yoctoproject.org>;
	Sat, 23 Nov 2013 20:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=E1nUrxdgz7dGslRLr15vP9ZjREjOKhRtAJwmexf3G08=;
	b=kd08SrLCSLAnLFqU+4sdWu8bINNEFr9K656gJAOm2vtKVWEEofANyqbzV7jfPUtwhR
	bEdRxdPV94+h+NZt4ISPu31a/aTIE2mM8m16saGc7FKqS12OziyeHYTKZgBPxb+RC7/Y
	3q54qdaeJ/WDv6MzsL3/kYDLVujZiBaW34s0jvG5YoE/SNC4p4Z0KPWHHBX1qBOXQWxr
	5vHAJwbJHf+tGyXK58zil/7NZDnJZKawleOBQBHyCVtR9bNofueE2oocarbfw3gcxcu0
	LNx7SMSaNcHIizcFDB7XNO7NbRtmGN3o39As7fSpx9J7JDAAaBXR5eTsJEkN4L4QIkhk
	cH9A==
X-Received: by 10.224.151.209 with SMTP id d17mr35130844qaw.45.1385267081855; 
	Sat, 23 Nov 2013 20:24:41 -0800 (PST)
Received: from localhost (198-84-204-234.cpe.teksavvy.com. [198.84.204.234])
	by mx.google.com with ESMTPSA id p17sm26532677qak.4.2013.11.23.20.24.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 23 Nov 2013 20:24:41 -0800 (PST)
From: Mark Asselstine <asselsm@gmail.com>
To: bruce.ashfield@windriver.com
Date: Sat, 23 Nov 2013 23:25:03 -0500
Message-Id: <1385267103-25565-1-git-send-email-asselsm@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] lxc: correct use of PN vs. BPN to fix multilib builds
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
X-List-Received-Date: Sun, 24 Nov 2013 04:24:43 -0000

BPN should be used in place of PN otherwise the fetcher will attempt
to download a file with the multilib prefix,and fail, and S will not
be what is expected, causing patching and other failures.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 recipes-containers/lxc/lxc_0.9.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
index 03d4589..24e0249 100644
--- a/recipes-containers/lxc/lxc_0.9.0.bb
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -21,7 +21,7 @@ RDEPENDS_${PN} = " \
 		perl-module-exporter-heavy \
 "
 
-SRC_URI = "http://linuxcontainers.org/downloads/${PN}-${PV}.tar.gz \
+SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
 	file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch \
 	file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
@@ -31,7 +31,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${PN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
 SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
 
-S = "${WORKDIR}/${PN}-${PV}"
+S = "${WORKDIR}/${BPN}-${PV}"
 
 # Let's not configure for the host distro.
 #
-- 
1.8.1.2


