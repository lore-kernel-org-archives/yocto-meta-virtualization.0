Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32E2DE00C8F; Sun, 17 Sep 2017 18:23:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D84BE00C89
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Sep 2017 18:22:39 -0700 (PDT)
Received: by mail-pf0-f196.google.com with SMTP id e69so3935045pfg.4
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Sep 2017 18:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NoItPWt7ifvwzsw2zR2DWmAHetoal4f56q7tgLEKzHU=;
	b=Eh8XndWp3g+vS0/hC0hvYBlqtHdNBQKUp930ACxfb191aey9Cg2DxLDafQQYaPCyq4
	tztNvAza0dEyUh/HfF2pfz3gk0RA3n1GXSA/oFDbAo0mN6jbhKT7Yx0EbaKtux3L5lSf
	DzfyO2FmkM3GdiGFmFJnLz9WWDItLUvEpL04Fo6wJMj2FOdU5lC8zZoECKPr89gMTbza
	PAciWEiDeqgmF1n64yzdRWAXKvFtSQo0KYd6Jx1iJKY8/MI2CmEHR5ybklzHEmJnY/sD
	LrD4fCPEWJjSQdBbNIF4BusmC24tA6MeNtQ10VireqNT+7sEsM5JPp0MiuL+2kblYHzP
	YKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NoItPWt7ifvwzsw2zR2DWmAHetoal4f56q7tgLEKzHU=;
	b=UVl1eAvp9pQolO8i0/r8nRdKYDIFv8fsgL++qrEnty1oRCCXVryGUMqZkYFji/8e4X
	E4SowHG8dHU30EjjvgNykZA/545kO+tvUjDXurBVT3y78Xc05WXRRgdoOkhjZKfXJ5DM
	8LJnnujAS5pWgtdRg99BbtkjzgGHh5kiFuKY/2emg4BWQnM1Y+qn8DK198InrdXQqFjy
	86SlYW+Qh/VPE030wfLnipkMY/tRjZOoImS63X7NGG6t6wiRDmtqUgbQHXewd/F77cAy
	447ocQ8GbuVevN0cLVoRXfBCJh5l/Kng58RsORzFimtrY8VaPNoALF7QGAt1z1Nyxubs
	hj3w==
X-Gm-Message-State: AHPjjUiGbR5kbLwH8gWIaFudC6cBUg6jRLZGGeJomwDC35iCHIcsR59h
	CeSe9b5uUrZJXG26DOs=
X-Google-Smtp-Source: ADKCNb74Q6q3cgYGX+foXWHvMuDmGDq0Ys4Jw2a3+vaRAq44+plPWMQFa3DxEUD+9YfS82SIIqx5FA==
X-Received: by 10.84.231.138 with SMTP id g10mr34036661plk.263.1505697759020; 
	Sun, 17 Sep 2017 18:22:39 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	p77sm11041007pfa.92.2017.09.17.18.22.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Sep 2017 18:22:38 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Sun, 17 Sep 2017 18:22:33 -0700
Message-Id: <1505697753-19300-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org, nathan.studer@dornerworks.com
Subject: [PATCH] xen: patch to fix ARM libxc missing variable init
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
X-List-Received-Date: Mon, 18 Sep 2017 01:23:09 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Fix Xen 4.9.0 build error on ARM architecture with gcc 7:
Import upstream Xen patch 88bfbf90e35f1213f9967a97dee0b2039f9998a4

Error was:
xc_dom_arm.c:229:31: error: 'domctl.u.address_size.size' may be used
uninitialized in this function [-Werror=maybe-uninitialized]

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---

This patch has been requested for inclusion in the upstream 4.9 branch
and later Xen 4.9 releases.

Please use my gmail address for any correspondence.

 ...x-libxc-xc_dom_arm-missing-initialization.patch | 36 ++++++++++++++++++++++
 recipes-extended/xen/xen_4.9.0.bb                  |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 recipes-extended/xen/files/fix-libxc-xc_dom_arm-missing-initialization.patch

diff --git a/recipes-extended/xen/files/fix-libxc-xc_dom_arm-missing-initialization.patch b/recipes-extended/xen/files/fix-libxc-xc_dom_arm-missing-initialization.patch
new file mode 100644
index 0000000..05016a7
--- /dev/null
+++ b/recipes-extended/xen/files/fix-libxc-xc_dom_arm-missing-initialization.patch
@@ -0,0 +1,36 @@
+commit 88bfbf90e35f1213f9967a97dee0b2039f9998a4
+Author: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date:   Sat Aug 19 16:21:42 2017 +0200
+
+    tools/libxc/xc_dom_arm: add missing variable initialization
+    
+    The variable domctl.u.address_size.size may remain uninitialized if
+    guest_type is not one of xen-3.0-aarch64 or xen-3.0-armv7l. And the
+    code precisely checks if this variable is still 0 to decide if the
+    guest type is supported or not.
+    
+    This fixes the following build failure with gcc 7.x:
+    
+    xc_dom_arm.c:229:31: error: 'domctl.u.address_size.size' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+         if ( domctl.u.address_size.size == 0 )
+    
+    Patch originally taken from
+    https://www.mail-archive.com/xen-devel@lists.xen.org/msg109313.html.
+    
+    Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+    Acked-by: Wei Liu <wei.liu2@citrix.com>
+
+diff --git a/tools/libxc/xc_dom_arm.c b/tools/libxc/xc_dom_arm.c
+index e7d4bd0..e669fb0 100644
+--- a/tools/libxc/xc_dom_arm.c
++++ b/tools/libxc/xc_dom_arm.c
+@@ -223,6 +223,8 @@ static int set_mode(xc_interface *xch, domid_t domid, char *guest_type)
+ 
+     domctl.domain = domid;
+     domctl.cmd    = XEN_DOMCTL_set_address_size;
++    domctl.u.address_size.size = 0;
++
+     for ( i = 0; i < ARRAY_SIZE(types); i++ )
+         if ( !strcmp(types[i].guest, guest_type) )
+             domctl.u.address_size.size = types[i].size;
diff --git a/recipes-extended/xen/xen_4.9.0.bb b/recipes-extended/xen/xen_4.9.0.bb
index 0b20936..8e9c802 100644
--- a/recipes-extended/xen/xen_4.9.0.bb
+++ b/recipes-extended/xen/xen_4.9.0.bb
@@ -1,7 +1,9 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 require xen.inc
 
 SRC_URI = " \
     https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
+    file://fix-libxc-xc_dom_arm-missing-initialization.patch \
     "
 
 SRC_URI[md5sum] = "f0a753637630f982dfbdb64121fd71e1"
-- 
2.7.4


