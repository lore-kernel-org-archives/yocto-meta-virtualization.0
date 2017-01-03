Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61211E008F2; Mon,  2 Jan 2017 20:48:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.196 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FB70E00890
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Jan 2017 20:48:11 -0800 (PST)
Received: by mail-yw0-f196.google.com with SMTP id r204so37365100ywb.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Jan 2017 20:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=hG7DGusgKcxiVmRnQOF9yBtONsZV4T29sfdfmHUhWxU=;
	b=L90Y/t6y8uU2f4VvPVAOMP6Sx8u0OJ+HxmmKS6+xXvA3J1KzlbCzkJRXu6WGuY1qrH
	uszqZ+4BlWzYKOJizKf63CesGcwiVKV0xqsXPu2TbsFS2tnqcyI3I22le4lmrml9Q2Ng
	6H7ufnKvfptt0NJWJMdnIrLuKP4q6UYu0DkjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hG7DGusgKcxiVmRnQOF9yBtONsZV4T29sfdfmHUhWxU=;
	b=uT6xNjBSK6lyD4zqyYukNBnPplY5D4VcYJgQITdj5z08nr9/6qlnQ4FuKGm7nQCecH
	xU3fIzPImbyFQSjHh+5X05bsr+eppBTElGqlNdARoVPi0JqABM9rejx/km+zztxVPYm/
	7rQ7GJeJon68MfotoU4J89IF29oo3/ieEzFlRpSFlMn4RrypWaTzQYvcgqhlKi7kshD6
	jsIGee1e1lGWnh+hMa7v6Y2HhhJefjTJGAdhg4vNQrxeOvnCwDMqH7/RdIqH302F5J7O
	697da5E7+zGssEJjwhB9nEgVGWlKd0QtqFodY+7EGfr844BkxnHbluB1y7Bv9F74F6Mw
	GRZg==
X-Gm-Message-State: AIkVDXL9ZVxX6mzVlC3gPGpY0qNFWdMcUTq5LBAGbV52zyUO9tqj2HcD22xVZUxIwyw67w==
X-Received: by 10.129.95.11 with SMTP id t11mr61564489ywb.128.1483418890615;
	Mon, 02 Jan 2017 20:48:10 -0800 (PST)
Received: from swanson.attlocal.net
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	v1sm16209892ywc.17.2017.01.02.20.48.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Jan 2017 20:48:10 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  2 Jan 2017 22:47:50 -0600
Message-Id: <20170103044754.15012-1-cardoe@cardoe.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-virtualization (krogoth)][PATCH 1/5] xen: switch to updated download URL
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
X-List-Received-Date: Tue, 03 Jan 2017 04:48:14 -0000

The Xen Project has changed the officially supported download URL to use
xenproject.org. This changes to the officially supported URLs.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen_4.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen_4.6.1.bb b/recipes-extended/xen/xen_4.6.1.bb
index 0adf8ad..c3ba3c8 100644
--- a/recipes-extended/xen/xen_4.6.1.bb
+++ b/recipes-extended/xen/xen_4.6.1.bb
@@ -1,7 +1,7 @@
 require xen.inc
 
 SRC_URI = " \
-    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
+    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
     "
 
 SRC_URI[md5sum] = "df2d854c3c90ffeefaf71e7f868fb326"
-- 
2.10.2


