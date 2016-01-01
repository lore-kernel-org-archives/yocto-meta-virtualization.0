Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0124E00AAA; Fri,  1 Jan 2016 07:54:35 -0800 (PST)
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
	*      [209.85.192.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6AE08E0033E
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Jan 2016 07:54:33 -0800 (PST)
Received: by mail-qg0-f43.google.com with SMTP id o11so216806456qge.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 01 Jan 2016 07:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=L+nmRGCDhWjdGmnyqAg4la/IGx4Ry1wYOyzYcWcprlk=;
	b=wlo6Wcf8hIibKO6cpxAzrKB2Rf+VhUxCKPEIO4DJnrU3/6/KXvYAJXwiV4wMHqYxsa
	QBHTlzBKFYl6iGIlcrugnGaVQ8Hocey3JIypO3yjqpfvWKULSmX1SZl3iFKXQNblpF9M
	uaJQwZrmrAjLkQyNGEviVrgJQDpH9ApLHF05E3kfyIHWFxLqerUDi8x4QSjNMVArngUn
	zkkehDC36eTS7yZdnbX9g+KzHrU6TUoJapj/B3GOt4aQZ1x2GH83cKwSJe2aJEV+Mphh
	et7lzClFkpUp9zyD05SmLw8UIPmoG4ZoYrz/EqqNFo7+VzRVB2lN7j9dCfv2g87jV83E
	ieBw==
X-Received: by 10.140.44.38 with SMTP id f35mr26993634qga.49.1451663673537;
	Fri, 01 Jan 2016 07:54:33 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	d6sm34987134qkb.13.2016.01.01.07.54.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jan 2016 07:54:33 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  1 Jan 2016 10:54:27 -0500
Message-Id: <1451663667-25116-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] xen: package remus-netbuf-setup into xen-remus
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
X-List-Received-Date: Fri, 01 Jan 2016 15:54:35 -0000

Package remus-netbuf-setup script which does not ship with
any existing package (throwing up a QA warning).

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/xen.inc |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index d3a8b10..ac9796b 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -100,7 +100,10 @@ RDEPENDS_${PN}-misc = " \
     python \
     "
 
-RDEPENDS_${PN}-remus = "python"
+RDEPENDS_${PN}-remus = " \
+    bash \
+    python \
+    "
 
 RDEPENDS_${PN}-scripts-block = "\
     bash \
@@ -478,6 +481,7 @@ FILES_${PN}-qemu = " \
 
 FILES_${PN}-remus = "\
     ${bindir}/remus \
+    ${sysconfdir}/xen/scripts/remus-netbuf-setup \
     "
 
 FILES_${PN}-scripts-network = " \
-- 
1.7.10.4


