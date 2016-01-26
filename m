Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA5FCE00B9C; Tue, 26 Jan 2016 11:09:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f194.google.com (mail-yk0-f194.google.com
	[209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50F25E00B9C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:47 -0800 (PST)
Received: by mail-yk0-f194.google.com with SMTP id a85so15392981ykb.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wpaywfP2IaZny5aa5OlKqnT3Vf1Ortse0enrJkamogc=;
	b=H3kcayPCJJBGMeqlFrbFQzODp/w4rmgV1San61Yus3Tm2t4a82mRJjKZTIJDPsLRQC
	RD7slpTOiqZXwlCvBFTY05ebmg28GT8dg81RuvKZ+R+tfWPuAfAilrwlZZUwoi66L6nw
	VKmkFy7I2qH7jL5E1VRT782t0f5jGIcGOm+SccAYU9EIrLRdOTHNU4oLf9FisQopUI5N
	PZ1uLxa1i2Z6qK/dVaC4sLOTO51NSfGNyh27gpP9nt9VueunbyphJKyjjSZhMxVW9Q59
	FcARMB4XgdmgmKpm0/paUwS6iTZb4q7ZOffYAtYKa509ttzwN4++ZTQyGPmK+SrYvJX1
	glIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wpaywfP2IaZny5aa5OlKqnT3Vf1Ortse0enrJkamogc=;
	b=HJVv6V27XOsNHj+ITuxIhq4XmpsnwnaD5lLhHXC95yu91DuETyOAWSRvcJZ1TQgNpB
	dA5/IbWOTz1iHpbY6gUih5I9JVvXzQlqx7mRZPqSzATlcLveyHJMjevho/X8oCb206vh
	WJItuqdmnFcJNOJd+7C149x5rZKigz4IMbjQWCMddjEY/He5S+IjL//YWe54tgI1H9ek
	C3Vg7U5kK7nu2okpTMgpaTWCejbkdkHt5cx5nTfSbxOmK8BifxEHI0+Olx8k1S1p+eiQ
	3ymJjkoIAQ5a5l1UbMVzFNtTPiwDWt3VjvUsB3v4RTlv1bTppIQFITGiWGYzFqXQrY6H
	8Fkw==
X-Gm-Message-State: AG10YORhNoxO9NwvDGON+p0UmdSE2G2MeKTpiqSYXxams6u/Yxp6l67Aoq7Y6VxZfftwCw==
X-Received: by 10.13.241.199 with SMTP id a190mr13753444ywf.47.1453835386859; 
	Tue, 26 Jan 2016 11:09:46 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	h187sm1899502ywc.0.2016.01.26.11.09.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 11:09:45 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 26 Jan 2016 13:09:18 -0600
Message-Id: <1453835364-6473-3-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
References: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH v2 2/8] xen: drop explicit DEPEND on libgcc
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
X-List-Received-Date: Tue, 26 Jan 2016 19:09:49 -0000

'xen-base' is a meta package and itself should not depend on a library
this. Yocto checks the NEEDED of the dynamic section and automatically
includes those libraries as dependencies.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index c63cb2c..966d356 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -54,7 +54,7 @@ DEPENDS = " \
 RDEPENDS_${PN} = ""
 
 RDEPENDS_${PN}-base = "\
-    libgcc bash perl xz \
+    bash perl xz \
     ${PN}-blktap \
     ${PN}-console \
     ${PN}-libblktapctl \
-- 
2.4.10


