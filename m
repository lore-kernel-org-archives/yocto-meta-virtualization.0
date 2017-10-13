Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4CE10E00D26; Fri, 13 Oct 2017 12:27:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1DC84E00D19
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Oct 2017 12:27:35 -0700 (PDT)
Received: by mail-wr0-f173.google.com with SMTP id j14so1728808wre.8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Oct 2017 12:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xWzluiMHYvBqiHbYaH1cz4+g8BQSCy6I14OEpfMfZeU=;
	b=OhUrVlDk58x1BQ7DE3DFjGpZfKLN1D0ejDWquXivovs7GILxI7Ma03g+oIGHk9FpwU
	ClxEjuC9ooxdha4mXxZhKQ36XU7uIdiWKacy2bP+vq9LEq8cAd5xBhtR6HsKC0r4ueYW
	O5qzRI2hhzYiOBcr8TdyTYNB/myG/+VsXWiOLrFSxzoU5yq9QBfIq12K9j8tgTSQOhR3
	3kewo59vk4aVEvUJX/JResiJN6QtoKcZn6YVdnL9Dwg7xB2Ktm0UEUWsz9/rlRpGh09N
	Hkwflq9jqLwDTU/+pcYK/SgS2rfHFiVHNlBGD+MHQ6xjt2FCTf9904YxJKJMT6gKbcQQ
	RFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xWzluiMHYvBqiHbYaH1cz4+g8BQSCy6I14OEpfMfZeU=;
	b=Gn8MOPmcGnFiMvkSt4JL1liHgopfSxD5Ft3Z8bUsd1D2Id0bSIbiDrFaQxVlE0B2xm
	bH04+RZ1m6s9M2VIe8/278B4Y6srW37P6DZcRsu1qd08EouTtm8+6dAix3cIj5d993dX
	YQ5e90yCAduiTcqe+NMS3UB8uFKi+znRWwIZN6sKozWPtpP1KqMcgI/d5x1KPiXKQmrj
	xnoHsdXavRR7/lcLfQ2mPUNt/O9cMHhPJDMAwTvKK0AtUvejgyKGirblF6SRijBpuf2C
	F2Mq2gNNh/GXoQDCKAGn+VmEpRgKwRhg35qw3DYDqJFdwY/vH+0xNlYqF6BztLmSN1CY
	zaqQ==
X-Gm-Message-State: AMCzsaV/1zA+771ic7wVtUTXvObhccu3KO0aV5/yFNUYW5nGAYWXwndo
	+F+LzKataInifnxuGpyly6suSvdR
X-Google-Smtp-Source: AOwi7QD3VJvodVFrTBi5220zLgoI9ReYi8SwsK3jyfZV58WxwcYRiByGr/NL3ffz5qCJIwyI5+RWMg==
X-Received: by 10.223.129.228 with SMTP id 91mr2378944wra.233.1507922854937;
	Fri, 13 Oct 2017 12:27:34 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id 69sm1846839wmm.2.2017.10.13.12.27.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Oct 2017 12:27:34 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 13 Oct 2017 19:27:16 +0000
Message-Id: <1507922836-17295-6-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507922836-17295-1-git-send-email-pbarker@toganlabs.com>
References: <1507922836-17295-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 5/5] runc: Merge common metadata into inc file
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
X-List-Received-Date: Fri, 13 Oct 2017 19:27:43 -0000

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 recipes-containers/runc/runc-docker_git.bb         | 4 ----
 recipes-containers/runc/runc-opencontainers_git.bb | 4 ----
 recipes-containers/runc/runc.inc                   | 4 ++++
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index b8754bd..9db48ee 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -12,8 +12,4 @@ SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
            file://0001-Disable-building-recvtty.patch \
           "
 
-GO_IMPORT = "import"
-
 RUNC_VERSION = "1.0.0-rc3"
-PROVIDES += "virtual/runc"
-RPROVIDES_${PN} = "virtual/runc"
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 78488e0..a97676b 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -6,7 +6,3 @@ SRC_URI = " \
     file://0001-Use-correct-go-cross-compiler.patch \
     "
 RUNC_VERSION = "1.0.0-rc4"
-PROVIDES += "virtual/runc"
-RPROVIDES_${PN} = "virtual/runc"
-
-GO_IMPORT = "import"
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index c1ff08f..d2aec84 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -12,6 +12,10 @@ PV = "${RUNC_VERSION}+git${SRCREV}"
 
 inherit go
 RRECOMMENDS_${PN} = "lxc docker"
+PROVIDES += "virtual/runc"
+RPROVIDES_${PN} = "virtual/runc"
+
+GO_IMPORT = "import"
 
 LIBCONTAINER_PACKAGE="github.com/opencontainers/runc/libcontainer"
 
-- 
2.7.4


