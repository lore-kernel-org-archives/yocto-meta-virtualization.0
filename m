Return-Path: <straka.derek@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D02BFE00C39; Thu, 24 Mar 2016 08:31:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6AC0FE00AEA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:31:46 -0700 (PDT)
Received: by mail-qg0-f65.google.com with SMTP id y89so4345034qge.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kcM7XoAQFKmBYRQt6waDtF9vNL0X4YBhCvW4uKVbO5o=;
	b=ksqO3UGAPELhBfwnpvHHIzCAy2z2dDQzLzBd3B3t4chY/4PqI8Cvxzb1rdz7fRBWGw
	cuZJGVRCaae1rRgJdVkM9rcwNtMLnkK1kGlROUfEhtnzetohVWvDZ9AvWadwU9LzjvK7
	59WEa0PhSA3Gzv/DCvRzZ9doCKyTHW1n8hh6jSG7NWCqp07OYG88fMc05eI9rlQwvw3Q
	u2mPzxWsVfVPYnqPSl3tKygFuKrV0cjlghWKAEswUEPMP/2ZwVm/QbmvALgCj7AjnfT2
	o6UKbF4jrojOPgr9KzqKVEvA6EG+KVvMwuK2Ijs9T3HvfSeWEavg6qJRI/UaQfbLeoMj
	O7CA==
X-Gm-Message-State: AD7BkJIsR6erfHD6eh08CDHB7HDi7xGM0CsW++7JHjmjQGn3aV2l2/nsrR7fjH+iqzz2Ew==
X-Received: by 10.140.99.72 with SMTP id p66mr11319134qge.16.1458833506488;
	Thu, 24 Mar 2016 08:31:46 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	a11sm3473110qge.43.2016.03.24.08.31.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Mar 2016 08:31:46 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: meta-virtualization@yoctoproject.org
Date: Thu, 24 Mar 2016 11:31:28 -0400
Message-Id: <1458833491-7717-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH 1/4] xen: split the flask package into a policy and tools package
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
X-List-Received-Date: Thu, 24 Mar 2016 15:31:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 recipes-extended/xen/xen.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 2eba012..bc5ff85 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -153,6 +153,7 @@ PACKAGES = "\
     ${PN}-doc \
     ${PN}-efi \
     ${PN}-flask \
+    ${PN}-flask-tools \
     ${PN}-fsimage \
     ${PN}-gdbsx \
     ${PN}-hvmloader \
@@ -342,13 +343,16 @@ FILES_${PN}-devd = "\
     "
 
 FILES_${PN}-flask = "\
+    /boot/xenpolicy-${PV} \
+    "
+
+FILES_${PN}-flask-tools = "\
     ${sbindir}/flask-get-bool \
     ${sbindir}/flask-getenforce \
     ${sbindir}/flask-label-pci \
     ${sbindir}/flask-loadpolicy \
     ${sbindir}/flask-set-bool \
     ${sbindir}/flask-setenforce \
-    /boot/xenpolicy-${PV} \
     "
 
 FILES_${PN}-gdbsx = "\
-- 
1.9.1


