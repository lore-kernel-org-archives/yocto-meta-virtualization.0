Return-Path: <paul.betafive@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6FD2E00D84; Thu, 16 Jun 2016 12:06:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 480CCE00D84
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Jun 2016 12:06:12 -0700 (PDT)
Received: by mail-wm0-f68.google.com with SMTP id 187so11634799wmz.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Jun 2016 12:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=f3W6WH0FyKZuHEDAdxh1dT4gbu5JwQ/Q3dx8N75Q8Z0=;
	b=t7A2VwY+FreQHot3ELxKfyVbeBdsF6c6pUkoYnHomO2GtOAAwxxDHQ4Pak3zya+Gtg
	qnCsX6p0ZoqfVaOg/7QBsUBK0Yz3zwgBwlBjY7iHvRkshMMc5IyrjDEpGyA9063OKLmR
	O9ZEiPWIE4F6QSisLFngFZ1jl1RmZFINLRK564OloNmfSBHdYkLotIMcr0XxDmRgv8r7
	BKeIN5vOtA14ybxmk31y1naj1skod2n6Rq+Q2JhHM3mj2ZF++jjlnt34+wZKluFOZZI/
	pFX6yuWqyDTl/3sJOt3LfInt72sc9MMcZqMP89NSR7hXk19uNcl5JZLEucCG2Eb1DQa0
	xMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=f3W6WH0FyKZuHEDAdxh1dT4gbu5JwQ/Q3dx8N75Q8Z0=;
	b=k2bpwLp80QkDOulhG8TsR7IHAWfImwgJSB1FNEHwHgUaT1icvKxhRtp+h52xeRZAnw
	lMYR8pGDgHt3AVNNvE/Rd26jxIiIam87lUMB0ICQkCLOBSa/HrNBsd9qja9kcDcx8vNI
	MUHgJKKosCX+9BUo9y0HGQNXnSlrj03oEyxblXacVZH5BChwQVS+LyTOd/m2EwrR3hmC
	GCrIbL/bOl3Q4N1J/aSM3tP16dxu7majfP/+LBuqgwVBZz2I5wXC7KDeU8xnhPISiqvg
	VJpS5512QMxYVIVySOVcxyfx6PAVa/grZPIf7BL9YKr8odiTZHR6jrbzi8d1VTEE8aoh
	pqkg==
X-Gm-Message-State: ALyK8tJvwjMtB0T7NHIRr16q2HfpYn6CfI3AQpMrFV9RYax8dq9AeQeZkB7PM8tG4wMAdA==
X-Received: by 10.28.199.139 with SMTP id x133mr16067938wmf.45.1466103971998; 
	Thu, 16 Jun 2016 12:06:11 -0700 (PDT)
Received: from dev-jessie.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net. [86.27.96.131])
	by smtp.gmail.com with ESMTPSA id
	r6sm16243317wme.14.2016.06.16.12.06.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jun 2016 12:06:11 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: meta-virtualization@yoctoproject.org
Date: Thu, 16 Jun 2016 20:06:28 +0100
Message-Id: <1466103989-25752-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] runc: Backport fix for building against musl
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
X-List-Received-Date: Thu, 16 Jun 2016 19:06:14 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../0001-nsexec-fix-build-against-musl-libc.patch  | 48 ++++++++++++++++++++++
 recipes-containers/runc/runc_git.bb                |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.patch

diff --git a/recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.patch b/recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.patch
new file mode 100644
index 0000000..aa57636
--- /dev/null
+++ b/recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.patch
@@ -0,0 +1,48 @@
+From ac6bd953192fa6752a07be7501f69f7cffe33e8e Mon Sep 17 00:00:00 2001
+From: Natanael Copa <natanael.copa@docker.com>
+Date: Tue, 19 Apr 2016 10:43:00 +0200
+Subject: [PATCH] nsexec: fix build against musl libc
+
+Remove a wrongly added include which was added in commit 3c2e77ee (Add a
+compatibility header for CentOS/RHEL 6, 2016-01-29) apparently to
+fix this compile error on centos 6:
+
+> In file included from
+> Godeps/_workspace/src/github.com/opencontainers/runc/libcontainer/nsenter/nsexec.c:20:
+> /usr/include/linux/netlink.h:35: error: expected specifier-qualifier-list before 'sa_family_t'
+
+The glibc bits/sockaddr.h says that this header should never be included
+directly[1]. Instead, sys/socket.h should be used.
+
+The problem was correctly fixed later, in commit 394fb55 (Fix build
+error on centos6, 2016-03-02) so the incorrect bits/sockaddr.h can
+safely be removed.
+
+This is needed to build musl libc.
+
+Fixes #761
+
+[1]: https://github.molgen.mpg.de/git-mirror/glibc/blob/20003c49884422da7ffbc459cdeee768a6fee07b/bits/sockaddr.h#L20
+
+Signed-off-by: Natanael Copa <natanael.copa@docker.com>
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+Upstream-status: Backport
+---
+ libcontainer/nsenter/nsexec.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/libcontainer/nsenter/nsexec.c b/libcontainer/nsenter/nsexec.c
+index 8f37d6c..40a8f89 100644
+--- a/libcontainer/nsenter/nsexec.c
++++ b/libcontainer/nsenter/nsexec.c
+@@ -18,7 +18,6 @@
+ #include <unistd.h>
+ #include <grp.h>
+ 
+-#include <bits/sockaddr.h>
+ #include <linux/types.h>
+ 
+ // All arguments should be above the stack because it grows down
+-- 
+2.1.4
+
diff --git a/recipes-containers/runc/runc_git.bb b/recipes-containers/runc/runc_git.bb
index 30a4640..b47914e 100644
--- a/recipes-containers/runc/runc_git.bb
+++ b/recipes-containers/runc/runc_git.bb
@@ -7,6 +7,7 @@ DESCRIPTION = "runc is a CLI tool for spawning and running containers according
 SRCREV = "baf6536d6259209c3edfa2b22237af82942d3dfa"
 SRC_URI = "\
 	git://github.com/opencontainers/runc;branch=master \
+	file://0001-nsexec-fix-build-against-musl-libc.patch \
 	"
 
 # Apache-2.0 for containerd
-- 
2.1.4


