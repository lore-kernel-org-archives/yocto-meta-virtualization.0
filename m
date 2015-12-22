Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 000ADE00C9A; Tue, 22 Dec 2015 11:02:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2F0EE00C1E
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 11:02:52 -0800 (PST)
Received: by mail-qg0-f41.google.com with SMTP id 74so70077633qgh.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 11:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=21iz9bR+Dd8T2f+X5rkx/YB/tAV1VI6Hzh71M4u6moo=;
	b=sQajGzH3skNROSc6VNAtYYTWHMYCGAAISATpqfHMAn5RDOsiAf0J1DeccjgCfbBIC5
	46Ge/Heih5WNFnFSwzCvISXRwmFB6gpBasFjrJZ8rQusf/0im+pFASoB7iDdIVBvRa49
	yuXeLtqcyNCjLcuHct/tusK/BE590z/SdEmbIrLYSDJSz6k9oaowiU1DPcTLba91tBZJ
	ICW3eFrog+m3HNyYDV9+s3n8tVjsCMYDgp0VY9LJSHQA68l5L2AHbRFULc4jQ0EYK7Yv
	shbB+zSkGCViPOAjY9aNgOIKPf4vamwozO8agISNV7tAPAV/2IVCuxaDiTIkydzRuh/P
	DWoQ==
X-Received: by 10.140.94.168 with SMTP id g37mr35181528qge.78.1450810971857;
	Tue, 22 Dec 2015 11:02:51 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	m107sm16558240qgm.19.2015.12.22.11.02.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Dec 2015 11:02:51 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 22 Dec 2015 14:02:27 -0500
Message-Id: <1450810948-17131-4-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1450810948-17131-1-git-send-email-cjp256@gmail.com>
References: <1450810948-17131-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 4/5] xen: drop unnecessary variable modifications
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
X-List-Received-Date: Tue, 22 Dec 2015 19:02:54 -0000

From: Doug Goldstein <cardoe@cardoe.com>

These variable modifications are necessary so that Yocto can supply
--sysroot. The other variables are unmodified so there's no reason to
modify them.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/xen_4.5.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen_4.5.0.bb b/recipes-extended/xen/xen_4.5.0.bb
index 6c17b90..7f791cc 100644
--- a/recipes-extended/xen/xen_4.5.0.bb
+++ b/recipes-extended/xen/xen_4.5.0.bb
@@ -29,7 +29,7 @@ EXTRA_OEMAKE += "ETHERBOOT_ROMS=${STAGING_DIR_HOST}/usr/share/firmware/rtl8139.r
 
 do_configure_prepend() {
     # fixup AS/CC/CCP/etc variable within StdGNU.mk
-    for i in AS LD CC CPP AR RANLIB NM STRIP OBJCOPY OBJDUMP; do
+    for i in LD CC CPP CXX; do
         sed -i "s/^\($i\s\s*\).*=/\1?=/" ${S}/config/StdGNU.mk
     done
     # fixup environment passing in some makefiles
-- 
1.7.10.4


