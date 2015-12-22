Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4607BE00C89; Tue, 22 Dec 2015 11:02:54 -0800 (PST)
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
	*      [209.85.192.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 299F4E00BD0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 11:02:51 -0800 (PST)
Received: by mail-qg0-f52.google.com with SMTP id 74so70077369qgh.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 11:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PUDLOd0U2A6Z80OqWIQI52UGXeoEo9W53uv++EhuAS4=;
	b=Qa1z/1SAqvzfLqcGqhL5U++6N2nfIUw08IU/Sx3aMKS/DV4zyJngZgu0m1yFm2HpN2
	ulJeQkAC9SiAS8iKb15ECw+vi7KrsOsbzTUGLZlPu08eBKWhsxVbcUBv4Z+rerDE3E/e
	00LXF4Q6kDj2p8FboIPXbzKuuFZaUD2hzmoP+GBExCKfF75155wYJJMsO55WsROkrzjM
	eOl2ARBJg5EWTwCR4PTQddguw90TA/QwCiWNIp41g51TRPCQFeKn7Q1zKmT+fXuJ1jqb
	WINZcW2BeMIfMXwtNiYD4KMbbBcOvLpcKZOHbEPMutynqsf8cvk4mp5/YCx4xll9kYRU
	dVuA==
X-Received: by 10.140.93.117 with SMTP id c108mr34336991qge.101.1450810971187; 
	Tue, 22 Dec 2015 11:02:51 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	m107sm16558240qgm.19.2015.12.22.11.02.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Dec 2015 11:02:50 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 22 Dec 2015 14:02:26 -0500
Message-Id: <1450810948-17131-3-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1450810948-17131-1-git-send-email-cjp256@gmail.com>
References: <1450810948-17131-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 3/5] xen: add support for files added with Xen 4.6
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
X-List-Received-Date: Tue, 22 Dec 2015 19:02:54 -0000

From: Doug Goldstein <cardoe@cardoe.com>

Xen 4.6 dropped udev support and has instead switched to their own
'devd' daemon run by the xl command. There is a SysV init script
provided with it but no systemd service file.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/xen.inc |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index d1f5a1b..1ac033f 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -87,6 +87,10 @@ RRECOMMENDS_${PN}-base = " \
     ${PN}-xenpaging \
     "
 
+RDEPENDS_${PN}-devd = " \
+    ${PN}-xl \
+    "
+
 RDEPENDS_${PN}-fsimage = " \
     libext2fs \
     "
@@ -328,6 +332,10 @@ FILES_${PN}-console = "\
     ${sbindir}/xenconsoled \
     "
 
+FILES_${PN}-devd = "\
+    ${sysconfdir}/init.d/xendriverdomain \
+    "
+
 FILES_${PN}-flask = "\
     ${sbindir}/flask-get-bool \
     ${sbindir}/flask-getenforce \
@@ -648,7 +656,7 @@ FILES_${PN}-xendomains += "\
     "
 
 # configure init.d scripts
-INITSCRIPT_PACKAGES = "${PN}-xend ${PN}-xencommons ${PN}-xen-watchdog ${PN}-xendomains"
+INITSCRIPT_PACKAGES = "${PN}-xend ${PN}-xencommons ${PN}-xen-watchdog ${PN}-xendomains ${PN}-devd"
 INITSCRIPT_NAME_${PN}-xencommons = "xencommons"
 INITSCRIPT_PARAMS_${PN}-xencommons = "defaults 80"
 INITSCRIPT_NAME_${PN}-xen-watchdog = "xen-watchdog"
@@ -657,6 +665,8 @@ INITSCRIPT_NAME_${PN}-xend = "xend"
 INITSCRIPT_PARAMS_${PN}-xend = "defaults 82"
 INITSCRIPT_NAME_${PN}-xendomains = "xendomains"
 INITSCRIPT_PARAMS_${PN}-xendomains = "defaults 83"
+INITSCRIPT_NAME_${PN}-devd = "xendriverdomain"
+INITSCRIPT_PARAMS_${PN}-devd = "defaults 82"
 
 # systemd packages
 SYSTEMD_PACKAGES = "${PN}-xen-watchdog ${PN}-xencommons ${PN}-xendomains"
-- 
1.7.10.4


