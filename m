Return-Path: <straka.derek@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 417ADE00B70; Thu, 24 Mar 2016 08:30:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.47 listed in list.dnswl.org]
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8779CE00AEA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:30:27 -0700 (PDT)
Received: by mail-qg0-f47.google.com with SMTP id j35so41161590qge.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U7FqHNXzoYL+RyF9qcTDXNtX1tzgsudLJcKOv8wVa2c=;
	b=PZtDJ/VqYICBMrH0CBxs8xhNiMFEM/X5FeDir5dtgXRN8Gm4Y+zqQ9ocVi+9RQQNF6
	LoGDUj6h8ZNIl3J0lhRHlfqsnee92uSyB/Lvp8Yrdc9nPu6pybVlwm/hTCbmShKJQoza
	l7jXKS5wYCvXE52Yva3us+SACkqhnGIxnTnaBHBsk3yb4aP4d8Tu6nI6YoUnPN8iL9E6
	WUcQ5DU5AcBfMBnfuSEVY7liD5xU2+Hc+Fq4VLQkpIhJyEV8HHL4qWe0O5zZ5cWAY3IN
	d25GMLuRKASjb9H2Sb5X8o6hvm3Hv5gAx7E/V9e9J2Dpmqr6XKAxk/CtaX7asjNTrqQt
	I7VQ==
X-Gm-Message-State: AD7BkJIBr49/dIZWUOVRGhJkqBzZJKNjMn+CZgnkfd2H2o9uAWFrJdJi3SfXp3i61Zy+FQ==
X-Received: by 10.140.108.229 with SMTP id j92mr11248373qgf.17.1458833426833; 
	Thu, 24 Mar 2016 08:30:26 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	a102sm3483378qgf.21.2016.03.24.08.30.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Mar 2016 08:30:26 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: meta-virtualization@yoctoproject.org
Date: Thu, 24 Mar 2016 11:30:17 -0400
Message-Id: <1458833417-7662-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH] ipxe: add cdr-tools-native to the list of depends
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
X-List-Received-Date: Thu, 24 Mar 2016 15:30:31 -0000

During the compile phase, ipxe needs to use mkisofs which is part of cdrtools

Signed-off-by: Derek Straka <derek@asterius.io>
---
 recipes-extended/ipxe/ipxe_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index 6dc492e..d52c567 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Open source network boot firmware"
 HOMEPAGE = "http://ipxe.org"
 LICENSE = "GPLv2"
-DEPENDS = "binutils-native perl-native syslinux mtools-native"
+DEPENDS = "binutils-native perl-native syslinux mtools-native cdrtools-native"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 SRCREV = "8c43891db4eb131d019360ccfb619f235b17eb58"
-- 
1.9.1


