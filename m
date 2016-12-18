Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E23DEE00C1A; Sun, 18 Dec 2016 08:45:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.196 listed in dnsbl.sorbs.net]
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94ED1E00C1C
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 08:45:16 -0800 (PST)
Received: by mail-yb0-f196.google.com with SMTP id v78so166274ybe.0
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 08:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oaiu/gUfm8ZFGHKr02lMbjVvIfvCCpFjGzZSHuynfy4=;
	b=UQdS3DYByJ6lKjUP0X7X2FIJ7gdQZnVWV59xFqnnPIFHg9JicKYaW+X9TgjJE6lgy4
	GoFsh8oKddqcZCllJN98CMkXT3JrBeCq5cOT7VYIcANOXVSWDMTd0Vizfu5WMg6Sv343
	mOSXjAidhBJ5+YaogjpZrqlvnVXYdCz6wzHjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oaiu/gUfm8ZFGHKr02lMbjVvIfvCCpFjGzZSHuynfy4=;
	b=eRABSv+2Zy03wShw9ZzWLEeI20x1KLeuYdRBZhgj9FietoT2HwJvIjpPrS4mqLEHWs
	mypXWEK5DW7w8rQNCZ5Yi9jux8xg18kDmYdlPAAV5zy35Ig/tYOJNfirCvcjddSJb7FY
	jp5TrxaeCOsWnDdObu49qy4iRx7wEgHh593Wz5wtzLuXSPP5usvvsh0uqX+xPMQx9wSA
	2sKvRj2WB5ouWW9FrG4PVza2N3qHNZQCdmHfhAhvmIwW0qp/z28f2rcQm7u2sMeUqpo8
	O5hGQ3IqNjyEejB7AhdnD07kT45f9Km6yqjkUxkrR9ZOEUN+expqgWsK5JVIWIkK+i2W
	a18Q==
X-Gm-Message-State: AIkVDXLH5/dCtH8kbPib6khdwvCwvBjZ26Cu89B8n5KzaG+Q/IArStvklRlFFOS3w53qJA==
X-Received: by 10.37.163.197 with SMTP id e63mr42540ybi.125.1482079515571;
	Sun, 18 Dec 2016 08:45:15 -0800 (PST)
Received: from swanson.attlocal.net
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	g132sm6145667ywc.23.2016.12.18.08.45.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Dec 2016 08:45:15 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Sun, 18 Dec 2016 10:44:55 -0600
Message-Id: <20161218164456.30100-2-cardoe@cardoe.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161218164456.30100-1-cardoe@cardoe.com>
References: <20161218164456.30100-1-cardoe@cardoe.com>
Subject: [PATCH 2/3] xen: switch to updated download URL
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
X-List-Received-Date: Sun, 18 Dec 2016 16:45:18 -0000

The Xen Project has changed the officially supported download URL to be
from xenproject.org. This changes to the officially supported URLs.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen_4.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen_4.7.0.bb b/recipes-extended/xen/xen_4.7.0.bb
index adb5c36..431160f 100644
--- a/recipes-extended/xen/xen_4.7.0.bb
+++ b/recipes-extended/xen/xen_4.7.0.bb
@@ -1,7 +1,7 @@
 require xen.inc
 
 SRC_URI = " \
-    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
+    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
     file://libxl-compilation-warning-fix-for-arm-aarch64.patch \
     "
 
-- 
2.10.2


