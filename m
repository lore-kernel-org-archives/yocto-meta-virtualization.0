Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 38555E00C55; Thu, 23 Jun 2016 14:03:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93977E00C3E
	for <meta-virtualization@yoctoproject.org>;
	Thu, 23 Jun 2016 14:03:05 -0700 (PDT)
Received: by mail-qk0-f193.google.com with SMTP id l81so17897264qke.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 23 Jun 2016 14:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aaWlKj67CTfdDYv4yW9cvBbRNj+SQiOlwsW5eKVRJdc=;
	b=N8veOGWWtzBVpRYZp9T7PrFFZmuae0B6yTRCbGGjdrWt+jToS91wzyPV4hGbsln46k
	lUSu+9s8FBptsDZucPnzlYCCNtAOvIRH8sKvNiBygNkx0/dF+z2sqN/hvZhxkNZKTfdm
	w3XNk8sv7+4uClGbyU+X7gM0IZtGxLZklTMZY+HXJMN1D/UFKDRhmRMRBXeBogkPNTWZ
	DHfAUlH3nsTLcVK66v0ezOsVyl06ztG/2TvdCv8Bejt+eOkkRwSiuKAq/EvrORlWXLBc
	Yasq70KMk8tbaAcMpsYGPFCVxrkftsgp7DjInyJlwExm3SAgnnoqjLvOJ4HZvI5inSw5
	kWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aaWlKj67CTfdDYv4yW9cvBbRNj+SQiOlwsW5eKVRJdc=;
	b=WRq2PEmW2I+n4O3Jnpvy2dp58IZ9H3/GxGkoa6BfC2OOF6zBT9hlwHdV5fHrOYoBEV
	25jRjyUaazpcohbMue8aRdShjCYAEvpwLp7nOzWQ/6BEmHrYEHWOPoG6JQtcBrop554x
	CXSWgT1Z/a77qs8LvXNtv08K6UrL89xbb/3R5XQBCXHUijSRg0GD0m9MEoLtDDNcbjye
	velixXzAqfXoeWuX3GY1vKnreOg25dRM2cOeQJaFIxB/H5C4129Jq52enIiS5qyPnwVx
	QhNlu62t+03WCgHRhURdQNHL1gzmG9AwQkKQl4nKXvJkSnpWdC7vjLh3yK+ihCvXYdgS
	HUfw==
X-Gm-Message-State: ALyK8tLYt6jl4MSy5r7gEpT+9xfJ4fRjKLSIeP+WU6FTlp6w0+HIMyoWZcCNDLLQtEhOqQ==
X-Received: by 10.55.191.129 with SMTP id p123mr694361qkf.1.1466715784217;
	Thu, 23 Jun 2016 14:03:04 -0700 (PDT)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	n89sm756267qte.38.2016.06.23.14.03.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jun 2016 14:03:03 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 23 Jun 2016 17:02:58 -0400
Message-Id: <1466715778-32065-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [PATCH] xen: uprev to 4.7.0
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
X-List-Received-Date: Thu, 23 Jun 2016 21:03:09 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

- update packages and add additional ones for new binaries
  (cpuid and livepatch)
- update xen_git to point to 4.7, make branch= fully variable,
  and remove assumed .0 from release version.

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 recipes-extended/xen/xen.inc      | 15 +++++++++++++++
 recipes-extended/xen/xen_4.6.1.bb | 10 ----------
 recipes-extended/xen/xen_4.7.0.bb | 10 ++++++++++
 recipes-extended/xen/xen_git.bb   |  9 +++++----
 4 files changed, 30 insertions(+), 14 deletions(-)
 delete mode 100644 recipes-extended/xen/xen_4.6.1.bb
 create mode 100644 recipes-extended/xen/xen_4.7.0.bb

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index de8c168..ff502ff 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -151,6 +151,7 @@ PACKAGES = "\
     ${PN}-base \
     ${PN}-blktap \
     ${PN}-console \
+    ${PN}-cpuid \
     ${PN}-dbg \
     ${PN}-dev \
     ${PN}-devd \
@@ -196,6 +197,7 @@ PACKAGES = "\
     ${PN}-libxenvchan-dev \
     ${PN}-libxlutil \
     ${PN}-libxlutil-dev \
+    ${PN}-livepatch \
     ${PN}-misc \
     ${PN}-pygrub \
     ${PN}-python \
@@ -369,6 +371,10 @@ FILES_${PN}-console = "\
     ${sbindir}/xenconsoled \
     "
 
+FILES_${PN}-cpuid = "\
+    ${bindir}/xen-cpuid \
+    "
+
 FILES_${PN}-devd = "\
     ${sysconfdir}/init.d/xendriverdomain \
     "
@@ -399,6 +405,10 @@ FILES_${PN}-kdd = "\
     ${sbindir}/kdd \
     "
 
+FILES_${PN}-livepatch += " \
+    ${sbindir}/xen-livepatch \
+    "
+
 FILES_${PN}-misc = "\
     ${bindir}/xencons \
     ${bindir}/xencov_split \
@@ -527,6 +537,7 @@ FILES_${PN}-remus = "\
     "
 
 FILES_${PN}-scripts-network = " \
+    ${sysconfdir}/xen/scripts/colo-proxy-setup \
     ${sysconfdir}/xen/scripts/network-bridge \
     ${sysconfdir}/xen/scripts/network-nat \
     ${sysconfdir}/xen/scripts/network-route \
@@ -544,6 +555,7 @@ FILES_${PN}-scripts-block = " \
     ${sysconfdir}/xen/scripts/blktap \
     ${sysconfdir}/xen/scripts/block \
     ${sysconfdir}/xen/scripts/block-common.sh \
+    ${sysconfdir}/xen/scripts/block-dummy \
     ${sysconfdir}/xen/scripts/block-enbd \
     ${sysconfdir}/xen/scripts/block-iscsi \
     ${sysconfdir}/xen/scripts/block-nbd \
@@ -837,6 +849,9 @@ do_configure() {
 }
 
 do_compile() {
+    # workaround for build bug when CFLAGS is exported
+    # https://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.html
+    unset CFLAGS
     oe_runmake
 }
 
diff --git a/recipes-extended/xen/xen_4.6.1.bb b/recipes-extended/xen/xen_4.6.1.bb
deleted file mode 100644
index 0adf8ad..0000000
--- a/recipes-extended/xen/xen_4.6.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xen.inc
-
-SRC_URI = " \
-    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
-    "
-
-SRC_URI[md5sum] = "df2d854c3c90ffeefaf71e7f868fb326"
-SRC_URI[sha256sum] = "44cc2fccba1e147ef4c8da0584ce0f24189c8743de0e3e9a9226da88ddb5f589"
-
-S = "${WORKDIR}/xen-${PV}"
diff --git a/recipes-extended/xen/xen_4.7.0.bb b/recipes-extended/xen/xen_4.7.0.bb
new file mode 100644
index 0000000..0565596
--- /dev/null
+++ b/recipes-extended/xen/xen_4.7.0.bb
@@ -0,0 +1,10 @@
+require xen.inc
+
+SRC_URI = " \
+    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
+    "
+
+SRC_URI[md5sum] = "3aa4e01bf37a3a5bc8572907cb88e649"
+SRC_URI[sha256sum] = "be5876144d49729572ae06142e0bb93f1c1f2695578141eff2931995add24623"
+
+S = "${WORKDIR}/xen-${PV}"
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index a86a501..391b47e 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,15 +1,16 @@
 require xen.inc
 
-SRCREV = "1fd615aa0108490ffc558d27627f509183cbfdaf"
+SRCREV = "9a6cc4f5c14b3d7542b7523f88a1b65464733d3a"
 
-XEN_REL="4.6"
+XEN_REL ?= "4.7"
+XEN_BRANCH ?= "staging-${XEN_REL}"
 
-PV = "${XEN_REL}.0+git${SRCPV}"
+PV = "${XEN_REL}+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = " \
-    git://xenbits.xen.org/xen.git;branch=staging-${XEN_REL} \
+    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     "
 
 DEFAULT_PREFERENCE = "-1"
-- 
2.1.4


