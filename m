Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85679E01462
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:13:54 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id d13so2757036eaa.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=2EjBdoQ2bscUUI+g4AceAL06lrBI4bhrluZ/zfUgvW8=;
	b=Q6STgDn0dQfonl5tmduMCVOpP1kMaavsIkb3fV2YTwu56YiyXeIVmmHpFh3xYbtX3l
	4FIxCwwtruoMUjsuwH1PgAv55WKVrYrPp5+RCtScranmjnv01fb86jCHQESGiSfORyhF
	c2J8baXIabCEo0AkQEg9Bn8ZSM/VPk1i/hgxw94Txct4jF5QtcrSyBbu/NFlEKutjWGp
	bZ+bakwAculjSGG7pFj42tjl23gbMy8HzxwHx62RhtlIl+gnOeeOOZZVq0Qo9muNEpNa
	4So8sdpltQC055Md57WxHRzQJqALnCFQP7UBDt8LujBIl/5a+y6SLwNTIYtOma5cif8c
	adyA==
Received: by 10.14.194.195 with SMTP id m43mr5495487een.44.1354799634243;
	Thu, 06 Dec 2012 05:13:54 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id w3sm15835314eel.17.2012.12.06.05.13.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:13:53 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 744AF4011B6; Thu,  6 Dec 2012 14:13:49 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:13:43 +0100
Message-Id: <1354799626-6911-13-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
References: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
Subject: [PATCH 12/14] Added some details in README, and made the description common
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
X-List-Received-Date: Thu, 06 Dec 2012 13:13:54 -0000

---
 README |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/README b/README
index 0ee4047..f9f890b 100644
--- a/README
+++ b/README
@@ -1,12 +1,8 @@
 meta-xen
 ===========
 
-This layer provides support for building Xen, Libvirt, and associated
-packages necessary for constructing an OE-based Xen distribution.
-
-This layer provides support for building KVM, Libvirt, OpenvSwitch et.c.
-and associated packages necessary for constructing virtualized solutions for
-Openembedded based distros.
+This layer provides support for building Xen, KVM, Libvirt, and associated
+packages necessary for constructing OE-based virtualized solutions.
 
 Dependencies
 ------------
@@ -15,10 +11,13 @@ This layer depends on:
 URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
+prio: default
 
 URI: git://github.com/openembedded/meta-oe.git
 branch: master
 revision: HEAD
+layers: meta-oe
+BBFILE_PRIORITY_openembedded-layer = "4"
 
 Maintenance
 -----------
-- 
1.7.9.5


