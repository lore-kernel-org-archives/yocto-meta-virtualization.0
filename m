Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79829E00B6F; Tue,  9 Oct 2018 23:59:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CA6AE0097C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Oct 2018 23:59:16 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9A6xGww007069
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 9 Oct 2018 23:59:16 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 9 Oct 2018 23:59:15 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 10 Oct 2018 14:59:09 +0800
Message-ID: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-cloud-services] consul: add INSANE_SKIP for textrel
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
X-List-Received-Date: Wed, 10 Oct 2018 06:59:17 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. for i586, bitbake consul will have QA error of textrel.
   consul-git-r0 do_package_qa: QA Issue: ELF binary i
   'work/i586-wrs-linux/consul/git-r0/packages-split/consul/usr/bin/consul'
   has relocations in .text [textrel]

   according to go doc:
   -buildmode=pie
   Build the listed main packages and everything they import into
   position independent executables (PIE). Packages not named
   main are ignored.

   checked use command "eu-findtextrel ./consul", functions not
   compiled with -fpic/-fPIC are from packages not named main, and
   also not imported into package main.

   so -buildmode=pie cannot reslove this problem. so refer commit
   b689c72a of oe-core, just skip it.

2. This problem is caused since security_flags.inc is used by default.
   so alternative work around is:
      SECURITY_CFLAGS_pn-consul = "${SECURITY_NOPIE_CFLAGS}"
      SECURITY_LDFLAGS_pn-consul = ""

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-connectivity/consul/consul_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
index a44e0b2..ee49c5e 100644
--- a/recipes-connectivity/consul/consul_git.bb
+++ b/recipes-connectivity/consul/consul_git.bb
@@ -23,3 +23,6 @@ do_install_append() {
 }
 
 FILES_${PN} += "${systemd_unitdir}/system"
+
+#for i586, executable consul contains textrel
+INSANE_SKIP_${PN} += "textrel"
-- 
2.7.4


