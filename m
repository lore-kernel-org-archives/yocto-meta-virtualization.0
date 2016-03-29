Return-Path: <straka.derek@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC133E00BA0; Tue, 29 Mar 2016 05:47:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C44BFE00B30
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 05:47:04 -0700 (PDT)
Received: by mail-qk0-f173.google.com with SMTP id s5so5206417qkd.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 05:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kcM7XoAQFKmBYRQt6waDtF9vNL0X4YBhCvW4uKVbO5o=;
	b=TmxKUuwfHTbqDKQwYodO4imByD6lPXNP8SDEVj9JatBnyyrFz04uevIRu4H5FsQ7nM
	4OFR4dxVK9RMAEJMwratu1c/YehiKoE9hODvY0x561A5xhfxsx9m1QHU6CS5HR6VfKI9
	AkiD9eqqS8720+9wzMv8MlOrNmsEzf6KbxjPHx6XaSmP2OXnyIyyWXZ7yA1sK5JyM0kq
	MhbKM0CdwiPMgLgqeGtThSf404DvrusadUkMFUmVRd1vCfkF0n27IKT6xIr+VfkaRs8l
	HvrIK/YyBQme6os/dUgRT1RtbqDrXgA76chue/25uFZ9s9bl0NXs/Nppr3bQab6RfMMn
	PXow==
X-Gm-Message-State: AD7BkJJrpo10UI11P92ys9IpADhSiGmKohYrE6n1na6c4leQiLQkXY9kCbd7C47QWOgu1g==
X-Received: by 10.55.76.213 with SMTP id z204mr2362233qka.58.1459255623675;
	Tue, 29 Mar 2016 05:47:03 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	i46sm13864021qgd.19.2016.03.29.05.47.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Mar 2016 05:47:03 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: meta-virtualization@yoctoproject.org
Date: Tue, 29 Mar 2016 08:46:37 -0400
Message-Id: <1459255600-14043-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCHv2 1/4] xen: split the flask package into a policy and tools package
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
X-List-Received-Date: Tue, 29 Mar 2016 12:47:06 -0000

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


