Return-Path: <paul@betafive.co.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02204E00CD8; Fri, 11 Jan 2019 08:54:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [66.111.4.25 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 329 seconds by postgrey-1.32 at yocto-www;
	Fri, 11 Jan 2019 08:54:50 PST
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EDEB9E00BE8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2019 08:54:50 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 895B723199;
	Fri, 11 Jan 2019 11:49:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Fri, 11 Jan 2019 11:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id; s=fm3; bh=krP7DeQCbuyuoGL
	uyDxaBxYZkyWYfapU1UKlDkMzn/Q=; b=FDTIHOs1IjABGxUymzNbbxekC+SEiQ0
	qu9GWITOm105PKfq5rzEEGvIzCfVZ+Z+LDujOc0KMhkod4JhV8WI0drzwtLdGItd
	x9LAsVZTz+ZZbYnDCU3ufv6CEw6sMKsJlv93QDMtV4hazzbTkZh9qv+Eg0maNf0Y
	ZhhVOGpQpPshsvRrBhCBRb2o669PNDPqJv9bTB6nNfGGD8nIAfvXd2CKIiZHsqHk
	pEier5cfRcxESrXcy7Rng31doWi8Y+NEvrq3RjdDRyZzCrKOZgmahtbGNCJervfJ
	Lg/uEYRUxYuPuj62YSVdrbVYy+ENjKFuSv9cVm/t0i6AMTfxv5xlKwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=krP7DeQCbuyuoGLuyDxaBxYZkyWYfapU1UKlDkMzn/Q=; b=WNFNsMOG
	x5pXN8Q/lkTghqGl+aVqj3SGGS65rJ8HLi6CpdWjVicTfcHYfQQ5+EXbZ3vIfPer
	l5bkBNgCxXaxH02++vuDBlxcGjCmkZaUwyzbnYI8GO2/cMHWGSvDPVPSyqr9uLT5
	XUkLCVrAaHrHZwqL9AQgo/6mIkpH9b9aXUFTjlkWw6E6mob+0QY5ZvfxyXZXMQOv
	CDD5awFqUwxqNQB9hkUhDeQGT/fYFFt9BRzfJvNohWfWThYq/BOU6vH6XVXIZUBt
	ylFOsvE31y5VLGgQqDUra36TZbxVstVD2Hfh7nPot4iayMg0vyI5V5OhwwRJuW9m
	vaz+lYcDejbvDA==
X-ME-Sender: <xms:EMk4XDm3bIEVmgks9SXGxF5Eny6q71bqivL97xVgvza7_qPjYXldRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrfeehgdelgecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
	tdenucenucfjughrpefhvffufffkofestddtredtredttdenucfhrhhomheprfgruhhluc
	eurghrkhgvrhcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucffohhmrghi
	nhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucfkphepkeekrdelledrvd
	ejrdelvdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsegsvghtrghfihhvvgdr
	tghordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Eck4XNmJNqHD53TZnIqUNQBDVa6PDCnZR8yS7i0Af8tQ-9TwhKJS0w>
	<xmx:Eck4XLaH0RgGfPxyJbftvBjYACTu36pvC3DHLsMenYQQXEjriTkgUw>
	<xmx:Eck4XHQhCkg4gQp4nPvty5BsC4lyc_Zp8CxLgMsOpgd452ktiBA0zA>
	<xmx:Eck4XOoJUONyRdnLjrjDVxRPlnZTkPpp-sAofQ66Hp2qdUpxmvzDkw>
Received: from eng01.s01.b5net.uk (unknown [88.99.27.92])
	by mail.messagingengine.com (Postfix) with ESMTPA id 6A120102A0;
	Fri, 11 Jan 2019 11:49:20 -0500 (EST)
From: Paul Barker <paul@betafive.co.uk>
To: meta-virtualization@yoctoproject.org
Date: Fri, 11 Jan 2019 16:49:15 +0000
Message-Id: <20190111164915.14771-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Use SRCPV instead of SRCREV where possible
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
X-List-Received-Date: Fri, 11 Jan 2019 16:54:54 -0000

This change reduces the length of ${PV} for several recipes and gives us
auto-incrementing version numbers.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 recipes-containers/containerd/containerd.inc      | 2 +-
 recipes-devtools/go/go-cli_git.bb                 | 2 +-
 recipes-devtools/go/go-dbus_git.bb                | 2 +-
 recipes-devtools/go/go-fsnotify_git.bb            | 2 +-
 recipes-devtools/go/go-logrus_git.bb              | 2 +-
 recipes-devtools/go/go-systemd_git.bb             | 2 +-
 recipes-extended/hyperstart/hyperstart_git.bb     | 2 +-
 recipes-extended/kvmtool/kvmtool.bb               | 2 +-
 recipes-networking/openvswitch/openvswitch_git.bb | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes-containers/containerd/containerd.inc b/recipes-containers/containerd/containerd.inc
index 0eca5a6..a3f1301 100644
--- a/recipes-containers/containerd/containerd.inc
+++ b/recipes-containers/containerd/containerd.inc
@@ -12,7 +12,7 @@ SRC_URI += "file://containerd.service"
 
 S = "${WORKDIR}/git"
 
-PV = "${CONTAINERD_VERSION}+git${SRCREV}"
+PV = "${CONTAINERD_VERSION}+git${SRCPV}"
 
 inherit go
 inherit goarch
diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/go-cli_git.bb
index 21d01ac..434594c 100644
--- a/recipes-devtools/go/go-cli_git.bb
+++ b/recipes-devtools/go/go-cli_git.bb
@@ -10,7 +10,7 @@ PKG_NAME = "github.com/codegangsta/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
 SRCREV = "27ecc97192df1bf053a22b04463f2b51b8b8373e"
-PV = "1.1.0+git${SRCREV}"
+PV = "1.1.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/go/go-dbus_git.bb b/recipes-devtools/go/go-dbus_git.bb
index 9b206a1..2390861 100644
--- a/recipes-devtools/go/go-dbus_git.bb
+++ b/recipes-devtools/go/go-dbus_git.bb
@@ -10,7 +10,7 @@ PKG_NAME = "github.com/godbus/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
 SRCREV = "5f6efc7ef2759c81b7ba876593971bfce311eab3"
-PV = "4.0.0+git${SRCREV}"
+PV = "4.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go/go-fsnotify_git.bb
index 1d9fbdc..0826aa7 100644
--- a/recipes-devtools/go/go-fsnotify_git.bb
+++ b/recipes-devtools/go/go-fsnotify_git.bb
@@ -10,7 +10,7 @@ PKG_NAME = "github.com/fsnotify/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
 SRCREV = "836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"
-PV = "1.2.11+git${SRCREV}"
+PV = "1.2.11+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/go/go-logrus_git.bb
index 5c0c359..aa89033 100644
--- a/recipes-devtools/go/go-logrus_git.bb
+++ b/recipes-devtools/go/go-logrus_git.bb
@@ -10,7 +10,7 @@ PKG_NAME = "github.com/Sirupsen/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
 SRCREV = "d26492970760ca5d33129d2d799e34be5c4782eb"
-PV = "0.11.0+git${SRCREV}"
+PV = "0.11.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/go/go-systemd_git.bb
index b61c97a..0f89c0f 100644
--- a/recipes-devtools/go/go-systemd_git.bb
+++ b/recipes-devtools/go/go-systemd_git.bb
@@ -10,7 +10,7 @@ PKG_NAME = "github.com/coreos/go-${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
 SRCREV = "b4a58d95188dd092ae20072bac14cece0e67c388"
-PV = "4+git${SRCREV}"
+PV = "4+git${SRCPV}"
 
 RDEPENDS_${PN} += "bash"
 
diff --git a/recipes-extended/hyperstart/hyperstart_git.bb b/recipes-extended/hyperstart/hyperstart_git.bb
index 3c64f24..9f98419 100644
--- a/recipes-extended/hyperstart/hyperstart_git.bb
+++ b/recipes-extended/hyperstart/hyperstart_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/hyperhq/hyperstart.git"
 SRC_URI += "file://0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch"
 
 SRCREV = "15bb718ad34045aa1962a8204f602c6afe9a76ab"
-PV = "v0.2+git${SRCREV}"
+PV = "v0.2+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-extended/kvmtool/kvmtool.bb b/recipes-extended/kvmtool/kvmtool.bb
index d487ee2..cb09c66 100644
--- a/recipes-extended/kvmtool/kvmtool.bb
+++ b/recipes-extended/kvmtool/kvmtool.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git \
            "
 
 SRCREV = "0e1882a49f81cb15d328ef83a78849c0ea26eecc"
-PV = "4.14.0+git${SRCREV}"
+PV = "4.14.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index b8bbb3a..81a66a9 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -14,7 +14,7 @@ RDEPENDS_${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "2.10.1+${SRCREV}"
+PV = "2.10.1+${SRCPV}"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
 
-- 
2.17.1


