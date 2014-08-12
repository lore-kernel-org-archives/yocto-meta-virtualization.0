Return-Path: <bobadeshrikant@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37F3DE0078E; Tue, 12 Aug 2014 00:07:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bobadeshrikant[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.179 listed in list.dnswl.org]
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EDD2E004F2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 Aug 2014 00:07:19 -0700 (PDT)
Received: by mail-pd0-f179.google.com with SMTP id v10so6201888pde.38
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 Aug 2014 00:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dXuQMMMetlpb1VD6MGBbZEMoSmRNk3U3iqJYONdKM/0=;
	b=ZvzMo457wL0cQlhA47dY+KnhRWSzdxcgmGHCW/14nCdgvlcG4ZSl4xMlxEZ/qObDp/
	ZBfrTtYRJK/8ziBv1xLBSi2WDqg6FwUHFVALthpqfXfmm6GCnOoiaLTTOomQSDwF2IEZ
	RN1a0i2NfOBDiH5DomzgGMFJLy//tjWwWQELXr4TEwS3SJlud2dGsc3Udebsl1iB6SOs
	EzE54YIR9+Pe9dR8k51LYBV4FkexNBopESbAT4tr3SQffl+NfVlzgQD7C3xeU4eWtdPR
	itP+L1ZMEgi22wXG6MSNNDqW7qB2sHCpdIqlWub1XQxpXg9hEHHLAQ9s2I5koyrkUOfG
	YRnw==
X-Received: by 10.68.125.202 with SMTP id ms10mr2684971pbb.71.1407827239118;
	Tue, 12 Aug 2014 00:07:19 -0700 (PDT)
Received: from localhost.localdomain ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	d13sm13493526pbu.72.2014.08.12.00.07.17 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Aug 2014 00:07:18 -0700 (PDT)
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 12 Aug 2014 12:39:05 +0530
Message-Id: <1407827345-8097-1-git-send-email-bobadeshrikant@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: [daisy][PATCH] libvirt: set path to pkcheck
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
X-List-Received-Date: Tue, 12 Aug 2014 07:07:27 -0000

From: Shrikant Bobade <Shrikant_Bobade@mentor.com>

The libvirt build would fail whenever x11 was in DISTRO_FEATURES and the host
didn't have polkit installed (either no polkit/policykit at all, or just old
policykit).

Ensure that libvirt uses polkit rather than policykit, whether the host has
pkcheck installed or not, and ensure the path is correct per our config.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
---
 recipes-extended/libvirt/libvirt_1.2.2.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_1.2.2.bb b/recipes-extended/libvirt/libvirt_1.2.2.bb
index 0cd6b99..a14d465 100644
--- a/recipes-extended/libvirt/libvirt_1.2.2.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.2.bb
@@ -67,6 +67,10 @@ ac_cv_path_LVS=/usr/sbin/lvs \
 ac_cv_path_PARTED=/usr/sbin/parted \
 ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
 
+# Ensure that libvirt uses polkit rather than policykit, whether the host has
+# pkcheck installed or not, and ensure the path is correct per our config.
+CACHED_CONFIGUREVARS += "ac_cv_path_PKCHECK_PATH=${bindir}/pkcheck"
+
 # Some other possible paths we are not yet setting
 #ac_cv_path_RPCGEN=
 #ac_cv_path_XSLTPROC=
@@ -75,7 +79,6 @@ ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
 #ac_cv_path_EBTABLES_PATH=
 #ac_cv_path_PKG_CONFIG=
 #ac_cv_path_ac_pt_PKG_CONFIG
-#ac_cv_path_PKCHECK_PATH=
 #ac_cv_path_POLKIT_AUTH=
 #ac_cv_path_DTRACE=
 #ac_cv_path_ISCSIADM=
-- 
1.7.9.5


