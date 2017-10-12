Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AAE6CE00D5E; Thu, 12 Oct 2017 09:50:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.50 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.50 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5A21E00D00
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 09:50:33 -0700 (PDT)
Received: by mail-wm0-f50.google.com with SMTP id l68so15022536wmd.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 09:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9ibry9GEi5gPiuE982QdQX+uQVonEwAstAGhqOmMgLA=;
	b=fa7rmGbDz69KDtC93VqGEMbOz4OiY+xpySS9nkgfhbwJ6k0F2smtOvrp9eQBwRgtAC
	jPEQlLBcAvwNYK6N3c6l3wy4tQ9Cy9UcQgGg/7tMvcheBfJ9ZqQ8ZQn7TOomjdllVR5H
	7rAnMbGdth/A34Mf7bzmGZpS/ImK/SPwMypxp/kMnPlevzEiZewbY2N71O6wlLnXgmw4
	VenPMMO9IJvM+A+UPzEp7Jt7/O0jOK8OPXFHovFMfe+YLdpZ7XpIu7AT0P0DzzJ4eJHX
	3uWvfDip/SXWoPpR0/aLk/zaBWscLwH08CKElOGBA5xQGsBOUSNr3No2q9s+OLVxBmVi
	X2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9ibry9GEi5gPiuE982QdQX+uQVonEwAstAGhqOmMgLA=;
	b=WDca/cBN7cZl6KD53zBs+RAhfd8lBQDzZiO3f3h3IWjBhBbdjZ3tjBqfYy9picSy3T
	U6ditRUGsIPTZBtTIpqeg4HM/tjpH6U7bYBJkyR2ElQIyF12JvupJPsIFMUe5KGJz5lK
	etRgH3EpQTnNzoMZtFWwoIXu3M1h1APXk3gejOmBMmxq2iiC2lXgAWpMxkN+PFVqVlnH
	7pj7mEgRG9c28RMiC50eNib5pQsoDaNGqbssnHZV9Ki9wpRaFqdRh0gVIZ9eZ+J7eU74
	XWECpMu3BuBit3fKRGrQbBimffnvu6Oe7oCXmgDwcMEi47gLWGB0fJx+ARvd6IThiNZx
	AXqA==
X-Gm-Message-State: AMCzsaUuyUGfowCKmDNoyCmaSIAQNh9wHRkTglT0rhnYLrZTAXGmlLA2
	EhP84d8E5pZazORXJb/L27WuSp0m
X-Google-Smtp-Source: AOwi7QDEi3/SpFrj7bMkopLrV57We2NxWMZ+7xjM3ELvUB/Cni+7q7F/mFVKD7SPAI6KimJ2V4A2Jg==
X-Received: by 10.28.15.198 with SMTP id 189mr2234259wmp.140.1507827032467;
	Thu, 12 Oct 2017 09:50:32 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	h201sm756969wmd.27.2017.10.12.09.50.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Oct 2017 09:50:31 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 12 Oct 2017 16:49:57 +0000
Message-Id: <1507826997-28383-5-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507826997-28383-1-git-send-email-pbarker@toganlabs.com>
References: <1507826997-28383-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 4/4] runc: Simplify recipes
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
X-List-Received-Date: Thu, 12 Oct 2017 16:50:36 -0000

* All common settings are merged into the runc.inc file.

* SRC_URI and SRCREV settings are normalised, dropping unnecessary arguments.

* Variables in runc.inc are re-ordered slightly to make things clearer.

* Drop unused EXTRA_FLAGS variable in runc-docker which isn't picked up by the
  runc Makefile anyway as it isn't exported.

* Drop unnecessary do_compile_prepend in runc-opencontainers as the "vendor/src"
  symlink is already created in do_compile in runc.inc.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 recipes-containers/runc/runc-docker_git.bb         | 10 ++--------
 recipes-containers/runc/runc-opencontainers_git.bb | 19 ++++---------------
 recipes-containers/runc/runc.inc                   |  9 ++++++---
 3 files changed, 12 insertions(+), 26 deletions(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 28232d9..b1fb624 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -2,8 +2,8 @@ include runc.inc
 
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
-SRCREV_runc-docker = "9d6821d1b53908e249487741eccd567249ca1d99"
-SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
+SRCREV = "9d6821d1b53908e249487741eccd567249ca1d99"
+SRC_URI = "git://github.com/docker/runc.git \
            file://0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch \
            file://0002-Remove-Platform-as-no-longer-in-OCI-spec.patch \
            file://0003-Update-memory-specs-to-use-int64-not-uint64.patch \
@@ -12,10 +12,4 @@ SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
            file://0001-Disable-building-recvtty.patch \
           "
 
-GO_IMPORT = "import"
-
-EXTRA_FLAGS = "-v -x -work"
-
 RUNC_VERSION = "1.0.0-rc3"
-PROVIDES += "virtual/runc"
-RPROVIDES_${PN} = "virtual/runc"
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 2cfceea..ea093ee 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,19 +1,8 @@
 include runc.inc
 
 SRCREV = "2e7cfe036e2c6dc51ccca6eb7fa3ee6b63976dcd"
-SRC_URI = " \
-    git://github.com/opencontainers/runc;branch=master \
-    file://0001-Use-correct-go-cross-compiler.patch \
-    "
-RUNC_VERSION = "1.0.0-rc4"
-PROVIDES += "virtual/runc"
-RPROVIDES_${PN} = "virtual/runc"
-
-GO_IMPORT = "import"
+SRC_URI = "git://github.com/opencontainers/runc \
+           file://0001-Use-correct-go-cross-compiler.patch \
+          "
 
-do_compile_prepend() {
-	# Go looks in a src directory under any directory in GOPATH but
-	# runc-opencontainers uses 'vendor' instead of 'vendor/src'. We can fix
-	# this with a symlink.
-	ln -sfn . "${S}/src/import/vendor/src"
-}
+RUNC_VERSION = "1.0.0-rc4"
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index b1f2ba8..7901bc7 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -2,6 +2,10 @@ HOMEPAGE = "https://github.com/opencontainers/runc"
 SUMMARY = "runc container cli tools"
 DESCRIPTION = "runc is a CLI tool for spawning and running containers according to the OCI specification."
 
+PROVIDES += "virtual/runc"
+RPROVIDES_${PN} = "virtual/runc"
+RRECOMMENDS_${PN} = "lxc docker"
+
 # Apache-2.0 for containerd
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
@@ -11,14 +15,13 @@ S = "${WORKDIR}/git"
 PV = "${RUNC_VERSION}+git${SRCREV}"
 
 inherit go
-RRECOMMENDS_${PN} = "lxc docker"
+GO_IMPORT = "import"
 
 LIBCONTAINER_PACKAGE="github.com/opencontainers/runc/libcontainer"
 
-do_configure[noexec] = "1"
 EXTRA_OEMAKE="BUILDTAGS=''"
 
-inherit goarch
+do_configure[noexec] = "1"
 
 do_compile() {
 	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
-- 
2.7.4


