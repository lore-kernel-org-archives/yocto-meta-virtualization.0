Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD389E00E51; Tue, 13 Mar 2018 08:37:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.35.17.14 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 205 seconds by postgrey-1.32 at yocto-www;
	Tue, 13 Mar 2018 08:37:53 PDT
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5FB2E0084D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Mar 2018 08:37:53 -0700 (PDT)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w2DFYQBu003580
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Mar 2018 16:34:26 +0100
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.77.152])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w2DFYQ3G011334;
	Tue, 13 Mar 2018 16:34:26 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 7E59410D3F8A;
	Tue, 13 Mar 2018 16:34:26 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 13 Mar 2018 16:34:18 +0100
Message-Id: <20180313153418.13771-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] README: remove reference to oe-meta-go
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
X-List-Received-Date: Tue, 13 Mar 2018 15:37:56 -0000

It is no longer supported nor is it it needed as the support has
landed in openembedded-core

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 README | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/README b/README
index d653f11..6d8fbe0 100644
--- a/README
+++ b/README
@@ -39,14 +39,10 @@ URI: git://github.com/openembedded/meta-openembedded.git
 branch: master
 revision: HEAD
 layers: meta-oe
-	meta-networking
+        meta-networking
         meta-filesystems
         meta-python
 
-URI: git://github.com/errordeveloper/oe-meta-go.git
-branch: master
-revision: HEAD
-
 BBFILE_PRIORITY_openembedded-layer = "4"
 
 Required for Xen XSM policy:
-- 
2.11.0


