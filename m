Return-Path: <okaya@kernel.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59682E00A9B; Thu, 11 Oct 2018 13:28:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.145.29.99 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4DF8E00566
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 13:28:35 -0700 (PDT)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [104.211.36.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 22C59204FD;
	Thu, 11 Oct 2018 20:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1539289715;
	bh=PTup/7bfboStBlyIB//dbHYL/WutPg4lgjQrsgAnnRI=;
	h=From:To:Cc:Subject:Date:From;
	b=IeUrU+GI6vCuagQdm031h/14VePVa2UiXTwo5XFNi2ukpAxNntu+m2G/YGRvhT4pF
	494qJ4YKAdRh3BDixBtiviQ1L6Eo3Pcy2h95ActUieazo99rcZX4L3jHSDz6Ix14yu
	Zawoggvt8py2A75mvbpjvnuAWn4JA26VJlV6Xrko=
From: Sinan Kaya <okaya@kernel.org>
To: meta-virtualization@yoctoproject.org
Date: Thu, 11 Oct 2018 20:28:31 +0000
Message-Id: <20181011202832.20004-1-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Mark Asselstine <mark.asselstine@windriver.com>
Subject: [sumo] [PATCH v1 1/2] lxc: fixup 'download' template use
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
X-List-Received-Date: Thu, 11 Oct 2018 20:28:36 -0000
Content-Transfer-Encoding: 8bit

From: Mark Asselstine <mark.asselstine@windriver.com>

We have a new dependency on 'mountpoint' which is now called in the
download template script. We also hit an upstream bug due to improper
use of 'mktemp', so we apply a patch to fix this and sent the fix
upstream as well.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 ...ually-create-DOWNLOAD_TEMP-directory.patch | 39 +++++++++++++++++++
 recipes-containers/lxc/lxc_2.0.8.bb           |  2 +
 2 files changed, 41 insertions(+)
 create mode 100644 recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch

diff --git a/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch b/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch
new file mode 100644
index 0000000..2b1ab87
--- /dev/null
+++ b/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch
@@ -0,0 +1,39 @@
+From 1d83b86a9bf017257c068c662ec3bf52ec0cfe90 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 31 May 2018 16:21:45 -0400
+Subject: [PATCH] templates: actually create DOWNLOAD_TEMP directory
+
+The way 'mktemp' is currently used you will get a temp directory in
+$TMPDIR or '/tmp' and DOWNLOAD_TEMP will not be pointing to an actual
+directory. This will result in the wget operations failing and the
+container will fail to create:
+
+    ERROR: Failed to download http://....
+
+Instead we want to use the '-p' option for mktemp to set the base path
+and this will ensure that the temp directory is created in the correct
+location and DOWNLOAD_TEMP will be consistent with this location.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ templates/lxc-download.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/templates/lxc-download.in b/templates/lxc-download.in
+index f09475d..d6333ad 100644
+--- a/templates/lxc-download.in
++++ b/templates/lxc-download.in
+@@ -310,7 +310,7 @@ if ! type mktemp >/dev/null 2>&1; then
+     DOWNLOAD_TEMP=/tmp/lxc-download.$$
+     mkdir -p $DOWNLOAD_TEMP
+ else
+-    DOWNLOAD_TEMP=$(mktemp -d)
++    DOWNLOAD_TEMP="$(mktemp -p ${DOWNLOAD_TEMP} -d)"
+ fi
+ 
+ # Simply list images
+-- 
+2.19.0
+
diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index c87b875..facad2e 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -23,6 +23,7 @@ RDEPENDS_${PN} = " \
 		libidn \
 		gnutls \
 		nettle \
+		util-linux-mountpoint \
 "
 
 RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
@@ -38,6 +39,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
 	file://cgroups-work-around-issue-in-gcc-7.patch \
+	file://templates-actually-create-DOWNLOAD_TEMP-directory.patch \
 	file://dnsmasq.conf \
 	"
 
-- 
2.19.0


