Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FC35E00CC4; Sun, 17 Sep 2017 18:22:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.68 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.68 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42282E00C8A
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Sep 2017 18:22:14 -0700 (PDT)
Received: by mail-pg0-f68.google.com with SMTP id d8so4440468pgt.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Sep 2017 18:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GZvB71qUUspyqIk2YfhA/cQl+RrebzVcay1TJbY9Frw=;
	b=CxUFg6+Fq56lz1pHDDjYyq5qC8BJbcabRL9e/1TStFq+mV8cH59StIreqxHBjETp12
	nHvG4cHaQB91psDhMimExtLBzOKsZ+Z5EavKmesAQ6YBH5j1xpBJHCBEAhO53yif4fBv
	oXOl0XsR2lUx1LeCI/npL5jw4QpGo8z9G37WTAqpahxinTxHuCSFUsJFmZp4K7+hpibl
	vKKGiOlvFTRgFMpRYCM2Y2cY2sXqPjAb6NL5fq3Lyl0zDib3HQY3cb5l8PQciNf/nXWx
	aB98uXcdZ6T4VO9OmZXHa7jtWenStZc0fLtoy0cfhZXS739HBhvRl5u11Qnj1zNqdLVg
	rfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GZvB71qUUspyqIk2YfhA/cQl+RrebzVcay1TJbY9Frw=;
	b=roM3sB6jF41SFVB5JiMpO1z9FnPBa43bTfVddTNVEeN5l9jj7/t4MAG186H+YZKUPB
	WNY5wAJo4+vDahj1M0aqWLSvrFG3i4+4qNmad6nzXJ/oUoxMLdUc14PGB2cP1sb7TDsc
	1W0MOKEWtDO01Gq5N2oz/qnPUlMeUKjJQ+TLpML8gyvLdn4qlUyfvyfEQroS0L0KaGs9
	g22hdSzXQqbwc0GRHF3z3wH50sJpLE3MBMz8UfO0uHMPKXBPO8KBpzozkr8rZD4Jg7k0
	/bJzXXS49wDKJTufSS816+omORAFIYMKtCTJ9REp5HlHbvKpeG00bHuaIwI8MO4RhBV3
	BoGQ==
X-Gm-Message-State: AHPjjUj2bGloyIVWiM0LtmFiZwmE/U0RkJnfU+UflguQo5PwnTzkobZE
	51iSlx0/dfdvPX/bHt8=
X-Google-Smtp-Source: ADKCNb4v4O+xhdvuDBJl8UFMfDkYE5X8LKs4zGG/dqU5TeiA7yIuqbukg0Jdpyfr0M/01sK8eEVx5Q==
X-Received: by 10.101.66.205 with SMTP id l13mr30428411pgp.278.1505697734363; 
	Sun, 17 Sep 2017 18:22:14 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	5sm11286089pfr.151.2017.09.17.18.22.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Sep 2017 18:22:13 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Sun, 17 Sep 2017 18:22:09 -0700
Message-Id: <1505697729-17421-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org, nathan.studer@dornerworks.com
Subject: [PATCH] xen: Replace 'inherit gettext' with explicit gettext-native dependency
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
X-List-Received-Date: Mon, 18 Sep 2017 01:22:30 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

This fixes the build when libc-locale-code is not a DISTRO_FEATURE.

xen's configure script checks for xgettext and will abort if not found.

xgettext is provided by the gettext-native package but not by
gettext-minimal-native. This means that "inherit gettext" is not
sufficient to satisfy Xen's build requirements: gettext-native is
required.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---

Please use my gmail address for any correspondence.

 recipes-extended/xen/xen.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 3ca38fb..cb314f8 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bbb4b1bdc2c3b6743da3c39d03249095"
 
 COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux'
 
-inherit autotools-brokensep gettext setuptools update-rc.d systemd deploy
+inherit autotools-brokensep setuptools update-rc.d systemd deploy
 
 require xen-arch.inc
 
@@ -29,6 +29,7 @@ DEPENDS = " \
     dev86-native \
     flex-native \
     file-native \
+    gettext-native \
     iasl-native \
     ncurses-native \
     util-linux-native \
-- 
2.7.4


