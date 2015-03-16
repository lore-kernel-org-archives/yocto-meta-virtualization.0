Return-Path: <kergoth@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 633C8E008DC; Mon, 16 Mar 2015 11:55:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.45 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (kergoth[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCCA0E008CA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Mar 2015 11:55:41 -0700 (PDT)
Received: by wgbcc7 with SMTP id cc7so47640201wgb.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Mar 2015 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=iah9aKrKsdRuWD3WCs6/uZu+nbTeuY/ooDa2xdxjdLk=;
	b=tORUxi3uiozekhHgiR6x2DgvoVW4nGIxf26xmzYrhCBOJfJe7jOqKrx2W4ZsHNjx+D
	OOewWpQnWTWxa/1LonSJ1bskmYgrhSGNZcK42dIq0UJ2sJGuPDwwhIu1kfd6I68w/l4Q
	LzqapPnsAhtBUVaYe6qYXdA2za1nIhnO5NZALir48VxjtggBIx0yaR+daZ+VmUTJfwlg
	zUtgjPm7WEinhzeSQl37AlZ2LPMlY9g3DA8AhdXf9ATr+LdfhN9mM4z5UCsbR0RErguc
	3o5FZIwFGHnHOhsWG0UIzmcRybK6T1VaprpP19Q6GPwFgFN4sQV2iL19KZ6KYAy1ow6e
	ll7w==
X-Received: by 10.180.8.165 with SMTP id s5mr123173848wia.16.1426532140341;
	Mon, 16 Mar 2015 11:55:40 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id ei3sm16559371wib.4.2015.03.16.11.55.38
	for <meta-virtualization@yoctoproject.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Mar 2015 11:55:39 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 16 Mar 2015 11:55:33 -0700
Message-Id: <1426532133-30849-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [PATCH] xen: avoid parse time errors for non-xen-archs
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
X-List-Received-Date: Mon, 16 Mar 2015 18:55:43 -0000

XEN_TARGET_ARCH, when expanded, would emit a bb.error(). Referencing
XEN_TARGET_ARCH in PACKAGECONFIG resulted in its expansion at the up front
parse time, rather than at compile time, so non-xen-supported-archs like
powerpc would see parse time errors, resulting in non-zero bitbake exit codes.

Naturally this isn't ideal, so instead have the mapping function return
'INVALID' in the unsupported case, and in anonymous python, raise SkipPackage
if the mapped architecture is invalid, so it's seen as unbuildable in that
case.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 recipes-extended/xen/xen-arch.inc | 2 +-
 recipes-extended/xen/xen.inc      | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen-arch.inc b/recipes-extended/xen/xen-arch.inc
index bcf9f54..fb0093e 100644
--- a/recipes-extended/xen/xen-arch.inc
+++ b/recipes-extended/xen/xen-arch.inc
@@ -14,5 +14,5 @@ def map_xen_arch(a, d):
     elif re.match("aarch64.*", a):   return "arm64"
     elif a in valid_archs:           return a
     else:
-        bb.error("cannot map '%s' to a xen architecture" % a)
+        return "INVALID"
 
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 0e4136a..432bf4d 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -663,6 +663,11 @@ export STAGING_LIBDIR
 export XEN_TARGET_ARCH = "${@map_xen_arch(d.getVar('TARGET_ARCH', True), d)}"
 export XEN_COMPILE_ARCH = "${@map_xen_arch(d.getVar('BUILD_ARCH', True), d)}"
 
+python () {
+    if d.getVar('XEN_TARGET_ARCH', True) == 'INVALID':
+        raise bb.parse.SkipPackage('Cannot map `%s` to a xen architecture' % d.getVar('TARGET_ARCH', True))
+}
+
 # hardcoded as Linux, as the only compatible hosts are Linux.
 export XEN_OS = "Linux"
 
-- 
2.2.1


