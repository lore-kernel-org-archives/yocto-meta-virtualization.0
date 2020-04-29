Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1382.1588157474604324739
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Apr 2020 03:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=ktjTOgbK;
 spf=neutral (domain: igalia.com, ip: 140.211.169.56, mailfrom: psaavedra@igalia.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDB05E01A54; Wed, 29 Apr 2020 03:51:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 1188 seconds by postgrey-1.32 at yocto-www; Wed, 29 Apr 2020 03:51:12 PDT
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5123E01A18
	for <meta-virtualization@yoctoproject.org>; Wed, 29 Apr 2020 03:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; s=20170329;
	h=Message-Id:Date:Subject:To:From; bh=qJiaqrgCkc2Gi59Qq0KhkDunGKbpKtZAL54C6lp3vpI=;
	b=ktjTOgbKaTjB4d+RBucbCyQ961kvSoyYYdqhJ5SfRg3F1CY3nSr9fC0SsLyAu0wnC5CzY/89ukDztqc9TBXbNiqApNaIs738nLstw1QoN/s29tMme+w1yKtb4CICvsYIiDaPyyjFzB1qfgRgcoArq+JvqNzBmXExZBSIu/c+0cdKlSKOreFkKnnS/dwY83Cq0rTNuwDWkj7sgiCx4iGci4DWQFcR21hLQpt0W8uLhSfO1K23AfBQ2ftxlVY15IsnSloP3vCqZuDS5gdr/bKFDDYedapE6264t0M5Arxd8sh2VE7CmnfgiRm5N9DjssbwUZQLiLhvrWJkm3bQKguOHA==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim)
	id 1jTjzv-0005bA-F6
	for <meta-virtualization@yoctoproject.org>; Wed, 29 Apr 2020 12:31:23 +0200
From: "Pablo Saavedra Rodi?o" <psaavedra@igalia.com>
To: meta-virtualization@yoctoproject.org
Subject: [meta-virtualization][m-c-s][PATCH] ruby: Add sysroot dir to the ldflags and process all the existing extconf.rb
Date: Wed, 29 Apr 2020 12:31:20 +0200
Message-Id: <20200429103120.10716-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0

* add lib path of the sysroot directory [1] to avoid ld errors during
  the installation
* ruby_do_compile() find the extconf.rb file in the sources instance of
  assume a single file.

[1] https://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#var-STAGING_LIBDIR

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 classes/ruby.bbclass | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/classes/ruby.bbclass b/classes/ruby.bbclass
index 15ac9f4..5fb8e6b 100644
--- a/classes/ruby.bbclass
+++ b/classes/ruby.bbclass
@@ -104,23 +104,31 @@ EOF
   system("perl -p -i -e 's#^arch =.*#arch = ${ruby_arch}#' Makefile")
   system("perl -p -i -e 's#^LIBPATH =.*#LIBPATH = -L.#' Makefile")
   system("perl -p -i -e 's#^dldflags =.*#dldflags = ${LDFLAGS}#' Makefile")
+  system("perl -p -i -e 's#^ldflags  =.*#ldflags = -L${STAGING_LIBDIR}#' Makefile")
 EOF
 }
 
 ruby_do_compile() {
-	if [ -f extconf.rb -a ! -f extconf.rb.orig ] ; then
-		grep create_makefile extconf.rb > append2 || (exit 0)
-		ruby_gen_extconf_fix
-		cp extconf.rb extconf.rb.orig
-		# Patch extconf.rb for cross compile
-		cat append >> extconf.rb
-	fi
-	for gem in ${RUBY_BUILD_GEMS}; do
-		${RUBY_COMPILE_FLAGS} gem build $gem
-	done
-	if [ -f extconf.rb.orig ] ; then
-		mv extconf.rb.orig extconf.rb
-	fi
+    EXTCONF_FILES=$(find . -name extconf.rb -exec ls {} \;)
+    for e in $EXTCONF_FILES
+    do
+        if [ -f $e -a ! -f $e.orig ] ; then
+            grep create_makefile $e > append2 || continue
+            ruby_gen_extconf_fix
+            cp $e $e.orig
+            # Patch extconf.rb for cross compile
+            cat append >> $e
+        fi
+    done
+    for gem in ${RUBY_BUILD_GEMS}; do
+            ${RUBY_COMPILE_FLAGS} gem build $gem
+    done
+    for e in $EXTCONF_FILES
+    do
+        if [ -f $e.orig ] ; then
+            mv $e.orig $e
+        fi
+    done
 }
 
 
-- 
2.11.0

