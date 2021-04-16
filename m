Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.3496.1618537285871845216
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 18:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Vl1LAYW8;
 spf=neutral (domain: fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@fujitsu.com)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 34D8238C0632
	for <meta-virtualization@yoctoproject.org>; Fri, 16 Apr 2021 01:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618537281; i=@fujitsu.com;
	bh=TZsvbaS2KKS13PAqCZzbgwdwAHDr81YzCwHi5d9k1Vk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Vl1LAYW8AFlKlkiNBByjB4jdJN5uGQWl8PN2FMxosaot1p+xupUGmd1yd4ChC3xwI
	 3h5VNhfFT97UunmdF0Y+XKG9iwXJaEVJ+cQOm+e9Aw0GnVwT5MUX7/DSbRHCFBWjiq
	 ksWNfRQb4Mo3hfClO9gEyTvU0rz5Kng0H22bHlPAaQqdZHbk5B5FbJgmJHhDIBPCJs
	 xE5fAHYTxvmur2hTfdkf5scQg4FCsJLPOc38XjSB+IJIXc5rvKeeAOMxAkML6AhlrL
	 ow527HBg//DgR1haGffGepJyMH4eL+pQlsP8B6xm6OR/fdpoZkv8xpLbXFzxqr3Wn4
	 SLVU3kIRVa6rQ==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 80/99-01834-14BE8706; Fri, 16 Apr 2021 01:41:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0XV4XZF
  gcPiApcXtA0eYHRg92k/0sQUwRrFm5iXlVySwZsx8OJml4KlExbGHv1kbGHeLdjFycQgJTGOS
  WLRvHzOEc5xRYmL3DfYuRk4ONgEdiY4X3SwgtoiAlkR76y9mEFtYwElizcwXjCA2i4CqxNHbi
  8DivAJuElsfHwPrlRBQkJjy8D1UXFDi5MwnYHOYBSQkDr54wQxRoyixfecZFgi7UmL7tLOMEx
  h5ZiFpmYWkZQEj0ypGi6SizPSMktzEzBxdQwMDXUNDI11DSyNdIwMTvcQq3US91FLd8tTiEl1
  DvcTyYr3iytzknBS9vNSSTYzAQEopOHBmB+Op1x/0DjFKcjApifIeWlGWIMSXlJ9SmZFYnBFf
  VJqTWnyIUYaDQ0mC1/lFRYKQYFFqempFWmYOMKhh0hIcPEoivB9eAqV5iwsSc4sz0yFSpxgVp
  cR5F4AkBEASGaV5cG2wSLrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZi3EWQKT2ZeCdz0V0
  CLmYAWV6wqBVlckoiQkmpg8jgpKMZjdfrMi0l8zJdnvTjwXDF+gpAy89Kn071mGj0Rvnjhx6r
  Lr2713TcM6f120rLsVcU7RrE+P+tj5VEzjthvLV2s+cz912uTNwXvxUtZ33J7zNxvbrhbVqTr
  +/pTeY5HbuhpHdj+Wr330vu+G6cXmmuWzlX5x9EZPWnqOccrM3/lFn7KTn0foZ7NmynOaf1oV
  ekMwZ2uO2wF5JgqLBj2F4abvEpcqlc29fr2AqdHc1b/5l/UcLbkWJ3Kvmm5L+Qe8XwyzVt8z+
  /U4866rPxv602SbmT2BXhpP+a+mVSzX8vDY8/keVen7rxz24Mt7GrKjZnlXZead6yYd5pne/c
  Z/elGnRM866zT1rPFZCuxFGckGmoxFxUnAgAasGekHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-35.tower-265.messagelabs.com!1618537280!1544517!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15799 invoked from network); 16 Apr 2021 01:41:20 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-35.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Apr 2021 01:41:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13G1fD1K019884
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Fri, 16 Apr 2021 02:41:20 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Apr 2021 02:41:11 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] novnc: upgrade 0.4 -> 1.2.0
Date: Fri, 16 Apr 2021 09:41:04 +0800
Message-ID: <1618537264-7180-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Refer to Fedora's style and upgrade to the latest version.

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../recipes-extended/novnc/novnc_git.bb       | 51 ++++++-------------
 1 file changed, 16 insertions(+), 35 deletions(-)

diff --git a/meta-openstack/recipes-extended/novnc/novnc_git.bb b/meta-openstack/recipes-extended/novnc/novnc_git.bb
index 7099d85..07a9153 100644
--- a/meta-openstack/recipes-extended/novnc/novnc_git.bb
+++ b/meta-openstack/recipes-extended/novnc/novnc_git.bb
@@ -1,52 +1,33 @@
 DESCRIPTION = "HTML5 VNC client"
 HOMEPAGE = "https://github.com/kanaka/noVNC"
 SECTION = "web"
-
-PR = "r0"
-
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ac06308a999996ffc2d24d81b3a39f1b"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b428e7772bf00c07fb7b863b80358adf"
 
-SRCREV = "8f12ca7a5a64144fe548cada332d5d19ef26a1fe"
-PV = "0.4+git${SRCPV}"
+SRCREV = "9142f8f0f7b4a53447f5cfec3a797cbf0d6204a9"
+PV = "1.2.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/kanaka/noVNC.git"
 
 S = "${WORKDIR}/git"
 
-RDEPENDS_${PN} += "python-numpy"
-RDEPENDS_${PN} += "python-novnc"
-RDEPENDS_${PN} += "python-websockify"
-
 do_compile() {
     :
 }
 
+RDEPENDS_${PN} += " \
+	bash \
+"
+
 do_install() {
-    install -m 755 -d ${D}${bindir}/novnc
-    install -m 755 -d ${D}${datadir}/novnc/include
-
-    install -m 644 ${S}/vnc.html ${D}${datadir}/novnc
-    install -m 644 ${S}/vnc_auto.html ${D}${datadir}/novnc
-    install -m 644 ${S}/images/favicon.ico ${D}${datadir}/novnc
-    install -m 644 ${S}/include/base64.js ${D}${datadir}/novnc/include
-    install -m 644 ${S}/include/des.js ${D}${datadir}/novnc/include
-    install -m 644 ${S}/include/display.js ${D}${datadir}/novnc/include
-    install -m 644 ${S}/include/input.js ${D}${datadir}/novnc/include
-    install -m 644 ${S}/include/logo.js ${D}${datadir}/novnc/include
-    install -m 644 ${S}/include/base.css ${D}${datadir}/novnc/include
-    install -m 644 ${S}/include/blue.css ${D}${datadir}/novnc/include
-    install -m 644 ${S}/include/black.css ${D}${datadir}/novnc/include
-    install -m 644 ${S}/include/playback.js ${D}${datadir}/novnc/include
-    install -m 644 ${S}/include/rfb.js ${D}${datadir}/novnc/include
-    install -m 644 ${S}/include/ui.js ${D}${datadir}/novnc/include
-    install -m 644 ${S}/include/util.js ${D}${datadir}/novnc/include
-    install -m 644 ${S}/include/websock.js ${D}${datadir}/novnc/include
-    install -m 644 ${S}/include/webutil.js ${D}${datadir}/novnc/include
-    install -m 644 ${S}/include/jsunzip.js ${D}${datadir}/novnc/include
-
-    sed -i -e 's:#!/usr/bin/env bash:#!/bin/sh:' ${S}/utils/launch.sh	
-
-    install -m 755 ${S}/utils/launch.sh ${D}${bindir}/novnc-launch.sh
+    install -m 755 -d ${D}${datadir}/novnc
+   
+    cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/novnc
+    
+    install -m 444 ${S}/vnc.html ${D}${datadir}/novnc/index.html
+    install -m 444 ${S}/vnc_lite.html ${D}${datadir}/novnc/vnc_auto.html
+
+    install -m 755 -d ${D}${bindir}
+    install -m 644 ${S}/utils/launch.sh ${D}${bindir}/novnc_server
 }
 
-- 
2.25.1

