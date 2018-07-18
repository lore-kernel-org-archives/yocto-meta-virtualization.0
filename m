Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D2F1E0164C; Wed, 18 Jul 2018 15:04:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AD1BE00AC5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jul 2018 15:04:00 -0700 (PDT)
Received: by mail-pl0-f42.google.com with SMTP id w3-v6so2639860plq.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jul 2018 15:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IL0vRHbVfhHPlaJJzRgNFxb1OMZ11lQ+qn/pphLE5FA=;
	b=DkcxHzT3ZCfuk7wI+eUzUrNT6COKxfgQA98mqOCt8SMpnbh7SJ71E8i7/WwC1roNVq
	07Q4aLtIngBV4DlF2gaS3+D1u6B2vPZR5DgA1Ad0ow5AIRd42EVIHYK4KmlVsmCeHFSL
	QT6ZtMuxn4JwZqXGwLN2JeR97KSBguI/s5vA7isW8T+YTBz7zGGDCYRt01t4Ix7yZgm7
	3a+3lAEh/kMBh1nD7kHY/YopHzeGpFaB7YkhGv8B1QFO4xhc21XNgDot4Hos8pT+bdKf
	DBLOmhX//F+7RulMKa1pf4Pvkirq7yUwDoi9Qwy994/gG/5iCsqYYHTMMPqIVb4jh/Vd
	xnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IL0vRHbVfhHPlaJJzRgNFxb1OMZ11lQ+qn/pphLE5FA=;
	b=i5+FWtXfmqwnpyEfwXaPovFFO2xMWX2CGyAs21hCDgSBkDahZF93raLAsRvfiMvvOT
	LzrQgL2cVzwXp7d277O7ZpD23t8dN94/5CQAYiyMR6hGxSXZ1lE60wjMAdP2leSAeYqq
	wMX9PbUnAagmDdEaTK+9Rx7J+/xCpNLNrMN592ezUU8QmHyzM9K5vcE8qVaVQ7zenKYe
	3cy2GQOwrs7Ys1QxQBuiBu/rtpY5r3BWJRcatJSiHLCpLJymey79m1+iv63NWE1kLz1f
	uqiH/MWhCYe4q0gatIcpovwI5oLN+yLllxwTWNhrThmi0N+UYvfzVeaewkR6/lofoF3z
	bKrA==
X-Gm-Message-State: AOUpUlFXfZJGwiHBr2bqx9iZsFv//QVvgiEFx4X0lPFCsKcecOIDyxFs
	6fMo5m2RqQqHmlIYXkSKyO9nGZ3/
X-Google-Smtp-Source: AAOMgpe3MN+4SzD8JURRFg8MgxGiUkdPL+FaV0i9DDRT5g/nUOyIyl++NCnFb1LH0N4kblNt4gfDRw==
X-Received: by 2002:a17:902:1ab:: with SMTP id
	b40-v6mr7322515plb.55.1531951440308; 
	Wed, 18 Jul 2018 15:04:00 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	h7-v6sm19341965pfd.155.2018.07.18.15.03.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Jul 2018 15:03:58 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 18 Jul 2018 15:03:43 -0700
Message-Id: <1531951428-28983-3-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
References: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH 2/7] xen: add recipe for 4.11.0
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
X-List-Received-Date: Wed, 18 Jul 2018 22:04:06 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>


Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
Please use my gmail address for any correspondence to me.

 recipes-extended/xen/xen_4.11.0.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-extended/xen/xen_4.11.0.bb

diff --git a/recipes-extended/xen/xen_4.11.0.bb b/recipes-extended/xen/xen_4.11.0.bb
new file mode 100644
index 0000000..4b0754f
--- /dev/null
+++ b/recipes-extended/xen/xen_4.11.0.bb
@@ -0,0 +1,13 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+require xen.inc
+
+SRC_URI = " \
+    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
+    file://tools-xentop-vwprintw.patch \
+    file://build-undef-object-vars.patch \
+    "
+
+SRC_URI[md5sum] = "cbec0600284921744bc14119f4ed3fff"
+SRC_URI[sha256sum] = "826e3a9f6d0eac94a825d272cc2c1294e22640ae75af906eb13920f9ad667643"
+
+S = "${WORKDIR}/xen-${PV}"
-- 
2.7.4


