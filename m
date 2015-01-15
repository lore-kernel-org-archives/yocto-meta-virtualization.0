Return-Path: <dbaryshkov@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2AEFE008DE; Thu, 15 Jan 2015 02:14:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.176 listed in list.dnswl.org]
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B38EE0083C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 15 Jan 2015 02:14:44 -0800 (PST)
Received: by mail-ie0-f176.google.com with SMTP id tr6so14001010ieb.7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 15 Jan 2015 02:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=SnNezCgNO0GwolGqU7PIVHoLuinuGTPpbdRBSidEN+Y=;
	b=oIuGXhsva+3esXtxQsctKPndBHrnUQyuvFS8dF1lPqoL4r+T4QMB569iHzNT7kWhio
	tyoBLNJTLexaqLgRrbgH2jhebhUWWA1hVSt8vs7qwmP3TAFkyhZGDiX37gyMZgGM+syc
	r9ulzwYXCiGj8R4Aq2C04Gyyy8yDEOWUpfyPUQFh/KGLpMC6ARkC/By/PIuJ4o6pSqr9
	OZBsWMDSqI4GmaZSw8iH8hdTQqeF5C1RPHuNJyo/TgudqfRmpk8Q+6q44qO2HBE/kbYn
	fOUadFVil07BWgG3OZ7n8k/C4aehHt/iPlJlKcIxkix32SWlcO2L5JvICesKWXo6q0Dn
	YhdA==
X-Received: by 10.50.43.162 with SMTP id x2mr9416868igl.46.1421316883729;
	Thu, 15 Jan 2015 02:14:43 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by mx.google.com with ESMTPSA id
	q10sm3111024iga.12.2015.01.15.02.14.42
	for <meta-virtualization@yoctoproject.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Jan 2015 02:14:43 -0800 (PST)
Sender: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: meta-virtualization@yoctoproject.org
Message-Id: <1421316872-10473-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:40 -0800
Subject: [PATCH] libvirt: correct --with-capng configure argument
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
Date: Thu, 15 Jan 2015 10:14:49 -0000
X-Original-Date: Thu, 15 Jan 2015 13:14:32 +0300
X-List-Received-Date: Thu, 15 Jan 2015 10:14:49 -0000

PACKAGECONFIG[libcap-ng] incorrectly names argument --with-capnp instead
of --with-capng, fix that.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 recipes-extended/libvirt/libvirt_1.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_1.2.8.bb b/recipes-extended/libvirt/libvirt_1.2.8.bb
index 0f4b29f..bbc326f 100644
--- a/recipes-extended/libvirt/libvirt_1.2.8.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.8.bb
@@ -175,7 +175,7 @@ PACKAGECONFIG[iproute2] = "ac_cv_path_IP_PATH=/sbin/ip,ac_cv_path_IP_PATH=,iprou
 PACKAGECONFIG[numactl] = "--with-numactl,--without-numactl,numactl,"
 PACKAGECONFIG[fuse] = "--with-fuse,--without-fuse,fuse,"
 PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
-PACKAGECONFIG[libcap-ng] = "--with-capnp,--without-capng,libcap-ng,"
+PACKAGECONFIG[libcap-ng] = "--with-capng,--without-capng,libcap-ng,"
 
 # Enable the Python tool support
 require libvirt-python.inc
-- 
2.1.4


