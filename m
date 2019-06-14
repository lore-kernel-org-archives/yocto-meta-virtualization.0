Return-Path: <bostancioglucevat@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C873E00BAF; Fri, 14 Jun 2019 09:50:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bostancioglucevat[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.221.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48546E00AAF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 14 Jun 2019 09:50:30 -0700 (PDT)
Received: by mail-wr1-f66.google.com with SMTP id x17so3224590wrl.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 14 Jun 2019 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7fEbbBHwaVmUO0yeIkY46yQmXGyWI+gfmMJQlTt4gus=;
	b=s+EB0pBRD+H/edhljR59rjyXQyBJpsqj6IJSBAnJG4BzK5m5s1F38+v4++qnl4pI/B
	boX6Xv3cyGXVy4FVYCGHjgQIaLsHY7sFhHjsASCh6KdJi8C7W8Do7FpUD+wNZKw1X5gB
	ALi0vdow1tMg+PocOzNmGvLn2AiDDKaUW3iUwVygV5Qx18IuQfEw3vdG6k2REW0s1lD0
	7Xj8zD27oZqmA0JQ8lrSRmkiBwQzysQqZ8JOugK11EcSXBeuEvGIfv1Il7K54TgJE4jb
	Yuc4d3W/zng8rIItK1ye2hBrEyIaB9rv5YR8ogkCLjnUTKTPMiJElnTIpDLhke6uu1c2
	dfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7fEbbBHwaVmUO0yeIkY46yQmXGyWI+gfmMJQlTt4gus=;
	b=bsLmn3ICqf/ujhDMOaSPeSyLMvsJh1CxlNI7XheJ17n2aFp3RMxQU8nBFMJwuCbcXT
	83EYolMh3STmo6MyXNg/AtE1S07qfJicDN5nbxFvDDq6gPGMIB7v4rQBgy0uSnZ+2o9V
	S81fO8Ih4gNX2sTDiGuH5m4lgQB7wvg1k2k++tvsz371/FmbiDUaVa9wZAQFyGFik3nr
	mK9R2iUCfeBWmfY+/4DcaS624QV5tUaWz72XAnSJQqnIb2oT8MSA/FytMc9Ip3suj6Pm
	X/J7tunetiQIUdDiykPQIvSrnaHt3E5HU/gfXe5/4HzDkAb7bEQDt9jTSQ66xmBctb7p
	EUAQ==
X-Gm-Message-State: APjAAAWXRfqx4HxWaZM28ZfZlguJTQPdRl19JWvzo5CIAJryraDkgbqo
	G1eHSoqU9ZpQOCsWq2cmPfN/wocSwwQ=
X-Google-Smtp-Source: APXvYqyG0wDSZAl+gRksGHKF7P2mTu7+r1Op9MXxrn0rMY9lw09Lq/pQfY+2LUGkEbW8brz7EeKSdQ==
X-Received: by 2002:a5d:428d:: with SMTP id k13mr2865666wrq.142.1560531029218; 
	Fri, 14 Jun 2019 09:50:29 -0700 (PDT)
Received: from localhost.localdomain ([78.176.91.117])
	by smtp.gmail.com with ESMTPSA id a81sm5443535wmh.3.2019.06.14.09.50.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Jun 2019 09:50:28 -0700 (PDT)
From: Cevat Bostancioglu <bostancioglucevat@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 14 Jun 2019 19:50:22 +0300
Message-Id: <1560531022-7970-1-git-send-email-bostancioglucevat@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kvmtool: Werror compile time error fixed.
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
X-List-Received-Date: Fri, 14 Jun 2019 16:50:31 -0000

Signed-off-by: Cevat Bostancioglu <bostancioglucevat@gmail.com>
---
 ...-EXTRA_CFLAGS-variable-and-disable-werror.patch | 26 +++++++++++++++++++
 .../0002-kvmtool-add-EXTRA_CFLAGS-variable.patch   | 29 ----------------------
 recipes-extended/kvmtool/kvmtool.bb                |  2 +-
 3 files changed, 27 insertions(+), 30 deletions(-)
 create mode 100644 recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch
 delete mode 100644 recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch

diff --git a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch
new file mode 100644
index 0000000..d910fae
--- /dev/null
+++ b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch
@@ -0,0 +1,26 @@
+From 8e291af191339471c20292784ebb6de6122f4fc4 Mon Sep 17 00:00:00 2001
+From: Cevat Bostancioglu <bostancioglucevat@gmail.com>
+Date: Fri, 14 Jun 2019 18:47:25 +0300
+Subject: [PATCH] kvmtool: add CFLAGS Variable and disable Werror
+
+to avoid CFLAGS and warnings via command argument
+---
+ Makefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 030ff4e..e0a8b23 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,6 +2,9 @@
+ # Define WERROR=0 to disable -Werror.
+ #
+ 
++WERROR=0
++CFLAGS += $(EXTRA_CFLAGS)
++
+ ifeq ($(strip $(V)),)
+ 	E = @echo
+ 	Q = @
+-- 
+2.7.4
diff --git a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch
deleted file mode 100644
index 262531c..0000000
--- a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 977a4d41012d1814f5a5330cacc2e4944de387cc Mon Sep 17 00:00:00 2001
-From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
-Date: Sun, 5 Nov 2017 12:39:21 +0100
-Subject: [PATCH 2/2] kvmtool: add EXTRA_CFLAGS variable
-
-to avoid CFLAGS overriding introduce new EXTRA_CFLAGS variable
-for setting via command argument
-
-Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
----
- Makefile | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 64a0a16..bca1b26 100644
---- a/Makefile
-+++ b/Makefile
-@@ -2,6 +2,8 @@
- # Define WERROR=0 to disable -Werror.
- #
- 
-+CFLAGS += $(EXTRA_CFLAGS)
-+
- ifeq ($(strip $(V)),)
- 	E = @echo
- 	Q = @
--- 
-2.15.0
-
diff --git a/recipes-extended/kvmtool/kvmtool.bb b/recipes-extended/kvmtool/kvmtool.bb
index cb09c66..acecb08 100644
--- a/recipes-extended/kvmtool/kvmtool.bb
+++ b/recipes-extended/kvmtool/kvmtool.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git \
            file://external-crosscompiler.patch \
            file://0001-Avoid-pointers-for-address-of-packed-members.patch \
            file://0001-kvmtool-9p-fixed-compilation-error.patch \
-           file://0002-kvmtool-add-EXTRA_CFLAGS-variable.patch \
+           file://0002-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch \
            "
 
 SRCREV = "0e1882a49f81cb15d328ef83a78849c0ea26eecc"
-- 
2.7.4


