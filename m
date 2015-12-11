Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F55DE00C2F; Fri, 11 Dec 2015 13:58:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW,URIBL_BLACK autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.176 listed in list.dnswl.org]
	*  1.7 URIBL_BLACK Contains an URL listed in the URIBL blacklist
	*      [URIs: cardoe.com]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66AFBE007C9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 13:58:48 -0800 (PST)
Received: by qkdp187 with SMTP id p187so59699883qkd.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 13:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=jOapEwWAvCRz4QrdKYe1iW166+ZGGByOAYxozDB/220=;
	b=olVYSP1ib8Bqb6WAiF0g9eTu9Q/ydFwHm7zbEsuNOaZVtwOHNKp3BuGA5MRPgg0PED
	pBnS8WfeGx4VPmQUEggwN1xQPdCuFnJ0UWfd2TmY9c8CWomErUDeD2pBg/OtwLwH8hcj
	SAA5xxFWUK5TUbqocVToGWdcTN3lH3g18e/hwR8I8xiXhuub4PnOKkFJn15czhfPSAOa
	U82DBKXoSvmVSJe/xvxihmWVpN6GjNNEoTQ767byrGLyaApXTQaok1+zAsuVTaIWrybE
	av0h8iNTFwkoUC+omITQUvaWTWDcxt/pgTr+muDXNOjU8oXLriJJJpYsf5Z55EUd8i7X
	sEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jOapEwWAvCRz4QrdKYe1iW166+ZGGByOAYxozDB/220=;
	b=P4bTFG171cJvp3nWlA1nq8ZoyH/jEnxMOBksuD7AvLpS1YqprhGGgJp4ogCHobi+rh
	krD75F53hzNAu9HAKz8bJWv/a5WaIo3HMnuegCSTht1AGCbN2Qu0Q5G5I6xJ6vzV0yR9
	HG1TsCuUFjgNPj3HmBSb/sm49vwJYpQDAHhSmziXv01gxeG+nRpnkj4K8Q0JscnUHhIb
	TT5U+a/Z4+gneniXa6F8u2NtFJ8SqJjfchxWomsiV6BXD9aAoCjPpchQ79v5YwVxKUE1
	/fa8XDaizEM33N6MLvnbodQv1LUM5buc7wy4WYz0qOuALw2kBzgJZFi4TFNFm5EcngMx
	1a1g==
X-Gm-Message-State: ALoCoQmz9x8S0Bvnmab50zDH3CPcMNzR5VEstKQQWltZCIpwYQxmtfvAiD94jfmC2xZ0wPSeWOAnd0ZkjdHDe6pL8jk2X4INtg==
X-Received: by 10.129.153.198 with SMTP id q189mr10446552ywg.337.1449871128227;
	Fri, 11 Dec 2015 13:58:48 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	e64sm14070336ywb.25.2015.12.11.13.58.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Dec 2015 13:58:47 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 11 Dec 2015 15:58:29 -0600
Message-Id: <1449871112-12401-1-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
Subject: [PATCH 1/4] xen: use proper variable for /usr/share path
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
X-List-Received-Date: Fri, 11 Dec 2015 21:58:52 -0000

Don't open code /usr/share but instead use ${datadir} which is more
correct.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index da8cfb9..6fe0cbf 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -257,7 +257,7 @@ FILES_${PN}-libxenguest-dev = "${libdir}/libxenguest.so"
 FILES_${PN}-libxenlight = "${libdir}/libxenlight.so.*"
 FILES_${PN}-libxenlight-dev = " \
     ${libdir}/libxenlight.so \
-    /usr/share/pkgconfig/xenlight.pc \
+    ${datadir}/pkgconfig/xenlight.pc \
     "
 
 FILES_${PN}-libxenvchan = "${libdir}/libxenvchan.so.*"
@@ -269,7 +269,7 @@ FILES_${PN}-libxenctrl-dev = "${libdir}/libxenctrl.so"
 FILES_${PN}-libxlutil = "${libdir}/libxlutil.so.*"
 FILES_${PN}-libxlutil-dev = " \
     ${libdir}/libxlutil.so \
-    /usr/share/pkgconfig/xlutil.pc \
+    ${datadir}/pkgconfig/xlutil.pc \
     "
 
 FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
-- 
2.4.10


