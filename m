Return-Path: <richard.purdie@linuxfoundation.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64ECDE00A54; Thu, 11 Oct 2018 11:54:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.221.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7A10E00566
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:54:13 -0700 (PDT)
Received: by mail-wr1-f68.google.com with SMTP id q5-v6so10829014wrw.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=64dBYmYDpV88EcxwhVrkshdCAR5Qvqs5rP1d7qwh6tU=;
	b=d928QpwOdwMI9VWV6aCB33b1uB3Dn4AB0z7uqtfxbBOvdas1Sa5zoeqDD6bD3wHJHT
	6EmtGhBgS9nphPtjFCXIjs/58kaNJX4anawX6Y7zASjYJJZrapzUXWOxSW/vzBW0I/zr
	6jHCg1wuYy/nmdnEvapC4NTRJkizrz4qz5kbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=64dBYmYDpV88EcxwhVrkshdCAR5Qvqs5rP1d7qwh6tU=;
	b=N9pNSPXlin3/+oLtxcLMe5dnXmE0M4Vsiuu92ZxSRUY9JhuPOf1AlDUwcT9/f38NTE
	uANeg5X/BQAuNm6N04AZaG6sWuo0XFZG7i0HF9BVdlj2qQLXHTpUGJt27EoSzlQY2Ju3
	6sj2ehZU5uE3OGATaIJrnjPl01YPp4bxitE/TpZzQ5vnxg8nwkjDajHzgi4xQW5i5Nm0
	qN1FNnT80O4yjtc+8FOUqMWPF4eIcVIbOSkyZm2t7okPrsQKySAS2ubqQQmIOHbT1EXk
	fj97cKJatQDmxjM7tNoEOG77qUSDTg6RDQudf8YacU+QjbxHb0pYwvwPLM2+if5fM7Yu
	JLbA==
X-Gm-Message-State: ABuFfohtrzmaijE3WLM5xIk/nypvet+sIPOaAqce37dVeiWobjigu1Bj
	M9LFS7tnURw/x9gcHv0DM9jjHIb0ylU=
X-Google-Smtp-Source: ACcGV628u2gfpBywqFKU/7cQWgQDA2eah83vhVIhwOjwjGUe8MbbIRhb66K4u2CUlLKib5rCeenuzw==
X-Received: by 2002:adf:e387:: with SMTP id e7-v6mr2698160wrm.94.1539284052534;
	Thu, 11 Oct 2018 11:54:12 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x186-v6sm38860271wmx.24.2018.10.11.11.54.11
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 11:54:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meta-virtualization@yoctoproject.org
Date: Thu, 11 Oct 2018 19:54:10 +0100
Message-Id: <20181011185410.28270-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] ceph: Remove accidentally added patch file
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
X-List-Received-Date: Thu, 11 Oct 2018 18:54:14 -0000

This patch was accidentally added in commit
4be88e83904f62786d4af9d03204ba559777ab0f, remove it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 0001-ceph-only-support-x86-64.patch | 22 ----------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 0001-ceph-only-support-x86-64.patch

diff --git a/0001-ceph-only-support-x86-64.patch b/0001-ceph-only-support-x86-64.patch
deleted file mode 100644
index c907e23..0000000
--- a/0001-ceph-only-support-x86-64.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From c1410631e368569f8fa03a2a72938e603eb92578 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Mon, 8 Oct 2018 15:33:25 +0800
-Subject: [PATCH V2] ceph: only support x86-64
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- recipes-extended/ceph/ceph_13.2.1.bb | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/recipes-extended/ceph/ceph_13.2.1.bb b/recipes-extended/ceph/ceph_13.2.1.bb
-index d7186b9..7888e64 100644
---- a/recipes-extended/ceph/ceph_13.2.1.bb
-+++ b/recipes-extended/ceph/ceph_13.2.1.bb
-@@ -60,3 +60,4 @@ FILES_${PN}-dev += "\
- RDEPENDS_${PN} += "\
- 		python \
- "
-+COMPATIBLE_MACHINE = "(qemux86-64|intel-x86-64)"
--- 
-2.7.4
-
-- 
2.17.1


