Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49065E00E43; Sun, 18 Dec 2016 08:45:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.195 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E4FBE00C1E
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 08:45:16 -0800 (PST)
Received: by mail-yb0-f195.google.com with SMTP id h184so6582808ybb.1
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 08:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uJcSwda+rog9fYmK/IHr37kQ+ZMfQtStQu1n+Qj+LYM=;
	b=aZ84VNZ7itbiXwmsx49wvCDGrOUJG90H3HKRJFBzNtBixB1dcHXnCZMTg9esUxxKv4
	XhOdE4ce2C4wb6mAXwXD/Ie00jZdW7Szl7pPp2/h2dV9HyxoMXqoatdD/2x7RhvIPof4
	Z3XYESSSA+78N6+iPQQ13kR9rdleNZ7bFUea8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uJcSwda+rog9fYmK/IHr37kQ+ZMfQtStQu1n+Qj+LYM=;
	b=SCQUid6ASTaGbpokHQrufpGpv84LrMZp2Om5Xx2HXUtGL00iaQrldDacbSc1Y6GLlr
	/mlm1TqtIH7I0u7N7t22sRIbalb+njZ3GG7V0PHnsg3McXwBIXjQWGuNAkuZoc7EB438
	sY/C+lONOekfoN3fnlEEj0LPqv1lGg8sioCVUHkSOCXwQ8qFsnYzK88jirfUYEfXHXxa
	ZK7+QnqpLZlk8hXXXbjNBG2DPjGGeR6itHvhSOYJDl+sUnvWkg+Uti1W6wh2YdC5itm5
	tExFt9IX9YHkSiEiLb4RMP9hTfHIY+6zcdamMlmz3ZwPSu6R97yGBPJBmh7VpVmFy1hk
	BDCA==
X-Gm-Message-State: AIkVDXJD6k0vcwVhFwd9aDLzLKI0gTk+x9eASq2+VIZLgbXjVtLgNB/8nnc6AdGCDr4Aew==
X-Received: by 10.37.105.201 with SMTP id e192mr258803ybc.18.1482079516320;
	Sun, 18 Dec 2016 08:45:16 -0800 (PST)
Received: from swanson.attlocal.net
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	g132sm6145667ywc.23.2016.12.18.08.45.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Dec 2016 08:45:15 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Sun, 18 Dec 2016 10:44:56 -0600
Message-Id: <20161218164456.30100-3-cardoe@cardoe.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161218164456.30100-1-cardoe@cardoe.com>
References: <20161218164456.30100-1-cardoe@cardoe.com>
Subject: [PATCH 3/3] xen: bump to version 4.8.0
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
X-List-Received-Date: Sun, 18 Dec 2016 16:45:19 -0000

Version bump to the latest release.
---
 recipes-extended/xen/xen_4.7.0.bb | 11 -----------
 recipes-extended/xen/xen_4.8.0.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)
 delete mode 100644 recipes-extended/xen/xen_4.7.0.bb
 create mode 100644 recipes-extended/xen/xen_4.8.0.bb

diff --git a/recipes-extended/xen/xen_4.7.0.bb b/recipes-extended/xen/xen_4.7.0.bb
deleted file mode 100644
index 431160f..0000000
--- a/recipes-extended/xen/xen_4.7.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xen.inc
-
-SRC_URI = " \
-    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
-    file://libxl-compilation-warning-fix-for-arm-aarch64.patch \
-    "
-
-SRC_URI[md5sum] = "3aa4e01bf37a3a5bc8572907cb88e649"
-SRC_URI[sha256sum] = "be5876144d49729572ae06142e0bb93f1c1f2695578141eff2931995add24623"
-
-S = "${WORKDIR}/xen-${PV}"
diff --git a/recipes-extended/xen/xen_4.8.0.bb b/recipes-extended/xen/xen_4.8.0.bb
new file mode 100644
index 0000000..35c9137
--- /dev/null
+++ b/recipes-extended/xen/xen_4.8.0.bb
@@ -0,0 +1,10 @@
+require xen.inc
+
+SRC_URI = " \
+    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
+    "
+
+SRC_URI[md5sum] = "d738f7c741110342621cb8a4d10b0191"
+SRC_URI[sha256sum] = "1e15c713ab7ba3bfda8b4a285ed973529364fd1100e6dd5a61f29583dc667b04"
+
+S = "${WORKDIR}/xen-${PV}"
-- 
2.10.2


