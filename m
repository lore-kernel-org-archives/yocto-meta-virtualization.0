Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E9E6E01683
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Oct 2013 14:22:52 -0700 (PDT)
Received: by mail-ie0-f177.google.com with SMTP id qd12so13235514ieb.8
	for <meta-virtualization@yoctoproject.org>;
	Sun, 06 Oct 2013 14:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u1lVNHyC/i7Cka1QlCAx6xL5tKy7Z2yzKikDY1zymlk=;
	b=cJlBOz5QltwdXKrAZUkwetCpsnrMC55y20mdGwNx6n7ESTEmPatDcY/R0nkhpBeyJF
	5HnW4S6lZeUUJCCosJMtL4A83yFdxrat413rIwErFDSGQ0Tu8mdXpYvxMe2Ly7cLy1uB
	xRxKtVYWIoBNsXGQY7nBvThfjDp3AizFawYhXXEbSDI+X7wvSoEdfJIFN3c4z2+9gtnH
	t3l+dy+7XklNs1QymiOVvFoIDX4IsS4Qh4m++ziSqGrfEtXB/LpGjVLSdhfu9sVMYvVX
	UnO6Z+3a3sW1Mh6eINKcMCIug/oggmnNrs0r/mYE/xknvhOcXta8UHhwJqbV+KCBofFp
	S/Iw==
X-Received: by 10.50.77.72 with SMTP id q8mr14612514igw.14.1381094572117;
	Sun, 06 Oct 2013 14:22:52 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id i3sm22631061igh.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 06 Oct 2013 14:22:51 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sun,  6 Oct 2013 17:22:14 -0400
Message-Id: <1381094537-11576-2-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
References: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH] xen: add INSANE_SKIP flag 'already-stripped' to silence QA warnings about stripped qemu binaries.
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
X-List-Received-Date: Sun, 06 Oct 2013 21:22:54 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/xen_4.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.0.bb
index 9cbd2ac..e9a22cc 100644
--- a/recipes-extended/xen/xen_4.3.0.bb
+++ b/recipes-extended/xen/xen_4.3.0.bb
@@ -299,6 +299,7 @@ FILES_${PN}-python = "\
     ${libdir}/python2.7 \
     "
 
+INSANE_SKIP_${PN} = "already-stripped"
 INSANE_SKIP_${PN}-qemu = "arch"
 FILES_${PN}-qemu = " \
     ${datadir}/xen/qemu \
-- 
1.8.4.rc3


