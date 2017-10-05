Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4F22E00D8A; Thu,  5 Oct 2017 06:39:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3D74E00D6D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Oct 2017 06:39:03 -0700 (PDT)
Received: by mail-wr0-f179.google.com with SMTP id k62so10856521wrc.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Oct 2017 06:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Se+S69r1F7KgsTAoEzjcjRK6u7TdFY5Gw8/eXNTnjlI=;
	b=UovtacaGEGPHiP/6XhA4bMzm35Auepha7+mRPW72i4XC2Rmo8aj7oonEG6bL+41Xqo
	clt7RXD1bnO325SFCJRms6ytXDowpoHGjp7qz3CQcqjgzxX9NM4VVXuXCDoSHs2GkSdD
	rKBkAWlqc/IKkyJjkd5Tp1xCv9RpftTH0+AOYaXkyES1Mm8X0vrtFdFsDnTx0fN9tzfk
	Almsj2JsuwOZa1NJ6ahBgaUzZiCkjiCLpBs8h05OyemCIGzzMweh3kyX1gp337dGfYsZ
	ARJql/HfyQAqUCKFnSxCTRsJmLRpSXiZEmkuO4eQA2b5TEonFhqyYZh7ojwFrM50wd+G
	gT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Se+S69r1F7KgsTAoEzjcjRK6u7TdFY5Gw8/eXNTnjlI=;
	b=ow1dqmfglYlTcOssEgfRqyJnzA5qN5mWhJaD4iQOYxwna+xZRk9ITs8JpH6XEYLvfP
	Ez5jLAAy21Spx8p3gFM8lJhjOfxF954NPcWYMhaYnPZ9aIf8if9CrkyX3J+BsNtrMC75
	VTfjSMHy5xhJWSATLin+3dx1OXfAtXDK4q0n6DT6k/j/PVIelimCU21ghnpPPha3W4Mp
	f14fFMnpuwWKdCC6+Q2Pfxui5qt8tuBFCBCZ0VcTKkfF7E4zBsB7YYR9P4oWa2JxlB6m
	6A1pl3DzRbD43kEhvj/sbkrs1AyJTtSrGWWqkzCaGRGxS8SY9LR0FuznuCyuMfbTJb/x
	xekw==
X-Gm-Message-State: AHPjjUhtxzuwN+ipuUjvFRTXHHDjeYH8EyV8RmEVhbPUsHt46a0NQ2UZ
	XyWUv3nN9TfbGX+cuDFsB7fJreL0QG0=
X-Google-Smtp-Source: AOwi7QDe1Fh4afjggTMXv/ogzTYk/VSyaMPVD5tZq43JvBfxR46eHJC4DxhVH0N64ju27XhHRN3Elg==
X-Received: by 10.223.169.143 with SMTP id b15mr26038817wrd.127.1507210742753; 
	Thu, 05 Oct 2017 06:39:02 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id v3sm6749043wra.39.2017.10.05.06.39.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Oct 2017 06:39:01 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  5 Oct 2017 13:38:17 +0000
Message-Id: <1507210699-13911-3-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507210699-13911-1-git-send-email-pbarker@toganlabs.com>
References: <1507210699-13911-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 2/4] runc: Drop obsolete patch
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
X-List-Received-Date: Thu, 05 Oct 2017 13:39:05 -0000

This patch hasn't been used in a long time.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 .../0001-nsexec-fix-build-against-musl-libc.patch  | 48 ----------------------
 1 file changed, 48 deletions(-)
 delete mode 100644 recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.patch

diff --git a/recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.patch b/recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.patch
deleted file mode 100644
index aa57636..0000000
--- a/recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ac6bd953192fa6752a07be7501f69f7cffe33e8e Mon Sep 17 00:00:00 2001
-From: Natanael Copa <natanael.copa@docker.com>
-Date: Tue, 19 Apr 2016 10:43:00 +0200
-Subject: [PATCH] nsexec: fix build against musl libc
-
-Remove a wrongly added include which was added in commit 3c2e77ee (Add a
-compatibility header for CentOS/RHEL 6, 2016-01-29) apparently to
-fix this compile error on centos 6:
-
-> In file included from
-> Godeps/_workspace/src/github.com/opencontainers/runc/libcontainer/nsenter/nsexec.c:20:
-> /usr/include/linux/netlink.h:35: error: expected specifier-qualifier-list before 'sa_family_t'
-
-The glibc bits/sockaddr.h says that this header should never be included
-directly[1]. Instead, sys/socket.h should be used.
-
-The problem was correctly fixed later, in commit 394fb55 (Fix build
-error on centos6, 2016-03-02) so the incorrect bits/sockaddr.h can
-safely be removed.
-
-This is needed to build musl libc.
-
-Fixes #761
-
-[1]: https://github.molgen.mpg.de/git-mirror/glibc/blob/20003c49884422da7ffbc459cdeee768a6fee07b/bits/sockaddr.h#L20
-
-Signed-off-by: Natanael Copa <natanael.copa@docker.com>
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-Upstream-status: Backport
----
- libcontainer/nsenter/nsexec.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/libcontainer/nsenter/nsexec.c b/libcontainer/nsenter/nsexec.c
-index 8f37d6c..40a8f89 100644
---- a/libcontainer/nsenter/nsexec.c
-+++ b/libcontainer/nsenter/nsexec.c
-@@ -18,7 +18,6 @@
- #include <unistd.h>
- #include <grp.h>
- 
--#include <bits/sockaddr.h>
- #include <linux/types.h>
- 
- // All arguments should be above the stack because it grows down
--- 
-2.1.4
-
-- 
2.7.4


