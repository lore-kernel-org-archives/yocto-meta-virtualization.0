Return-Path: <paul@paulbarker.me.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8330CE00816; Sun,  1 Jan 2017 14:45:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [217.70.178.86 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 1215 seconds by postgrey-1.32 at yocto-www;
	Sun, 01 Jan 2017 14:44:57 PST
Received: from slow1-d.mail.gandi.net (slow1-d.mail.gandi.net [217.70.178.86])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C3B1E007F1
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Jan 2017 14:44:57 -0800 (PST)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
	[217.70.183.195])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id B180847FE48
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Jan 2017 23:21:07 +0100 (CET)
Received: from mfilter9-d.gandi.net (mfilter9-d.gandi.net [217.70.178.138])
	by relay3-d.mail.gandi.net (Postfix) with ESMTP id D1F06A80CF;
	Sun,  1 Jan 2017 23:20:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter9-d.gandi.net
Received: from relay3-d.mail.gandi.net ([IPv6:::ffff:217.70.183.195])
	by mfilter9-d.gandi.net (mfilter9-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id NrZ8saM5y3uT; Sun,  1 Jan 2017 23:20:56 +0100 (CET)
X-Originating-IP: 5.9.142.21
Received: from autobuilder.betafive.co.uk (srv1.betafive.co.uk [5.9.142.21])
	(Authenticated sender: noreply@paulbarker.me.uk)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3CB72A80C8;
	Sun,  1 Jan 2017 23:20:56 +0100 (CET)
From: Paul Barker <paul@paulbarker.me.uk>
To: meta-virtualization@yoctoproject.org
Date: Sun,  1 Jan 2017 22:21:19 +0000
Message-Id: <1483309280-9112-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] go-osarchmap: Skip golang recipes for unsupported architectures
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
X-List-Received-Date: Sun, 01 Jan 2017 22:45:03 -0000

Building any recipe for a mips-based machine like arduino-yun currently leads
to errors in go_map_arch(). Instead, errors should only be raised if a recipe
which uses golang is built. This is achieved using the same error handling seen
in recipes-extended/xen.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 classes/go-osarchmap.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/classes/go-osarchmap.bbclass b/classes/go-osarchmap.bbclass
index 4e00c7b..303b30b 100644
--- a/classes/go-osarchmap.bbclass
+++ b/classes/go-osarchmap.bbclass
@@ -11,6 +11,11 @@ TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH', True), d.getVar('TUNE_FEAT
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
 GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE',True) == d.getVar('HOST_GOTUPLE',True)]}"
 
+python() {
+    if d.getVar('TARGET_GOARCH') == 'INVALID':
+        raise bb.parse.SkipPackage('Cannot map `%s` to a go architecture' % d.getVar('TARGET_ARCH', True))
+}
+
 def go_map_arch(a, d):
     import re
     if re.match('i.86', a):
@@ -24,7 +29,7 @@ def go_map_arch(a, d):
     elif re.match('p(pc|owerpc)(|64)', a):
         return 'powerpc'
     else:
-        bb.error("cannot map '%s' to a Go architecture" % a)
+        return 'INVALID'
 
 def go_map_arm(a, f, d):
     import re
-- 
2.1.4


