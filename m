Return-Path: <royzah@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3364C982D8
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 17:35:59 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16306.1789839355386295193
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 19 Sep 2026 10:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xd8VLZG+;
 spf=pass (domain: gmail.com, ip: 74.125.225.140, mailfrom: royzah@gmail.com)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso14374925e9.3
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 19 Sep 2026 10:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789839354; x=1790444154; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MiCOP7rE9HfhMegLeRUcGNZay2gK84kvQTfNhpLrB/k=;
        b=Xd8VLZG+u00T8AtAHvvtFNaSir1C6GkPFbScPVDI7BoDJRYbQ6xB/VkROVtGH9XH/8
         xl0RlTJP+ALX0tNivRk6JCAHqYkBiOHw/3KjnUFthHlNJnGfA207xs6WWTwwAGF1Be91
         k4ypQ55GdTJksh8kzdFzrJ4esOYVocGXDjwYwZ+PFvEwXmzhBYoIUyoC3KjaZ55HnhPK
         1VYzsjguyNj4C+MYFyW8k8kz1bRasyEl5/7s5D5chXexXSkzGARHeu6M+WyltVHZ88zk
         tEB0fX3aeEFJRDwEN4e78v6dlIortR2iYaQUoILVxhoDFl3PxKJQ+eOwMRmchc13XW5B
         DKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789839354; x=1790444154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MiCOP7rE9HfhMegLeRUcGNZay2gK84kvQTfNhpLrB/k=;
        b=MaYdnoFsMfFxGy5TPbmsfIxkXPoFTZL7/fcCi/i1vtpkyTEjc5Q2Iimn9ukySdVk3D
         MjeDL24DaeCqQ+Ofai1qM1lVh9a48kGlu1KSFXYjy/xDz+XCOhhcKFW3/PufQAMN68KA
         2uksCWF+8Nn0JHizhOAR3fZB8e0/m4+b2MNQ/OAFRN9jqf69Fj2B91mtQyKJYrAL8XaD
         MN0a5TGYpWzqh03jclmCTDumaJcy6RjUqsG+ojvsybHpLvi2VpBRxrZrWYvII45lp7oq
         v1KhgOiHxA7u774L2MlfJlN10deRl8zC1FzyAZuwycUHpnzIYHhInbbs29gWENfqGyot
         o+Rg==
X-Gm-Message-State: AFuF++losmXi+kA0h/0MfGCxsfC0SRXVtlrGgTVTctsHZXxk7dtbHXRT
	trFYtdNiB3X1wIVe46HvMyYdXws6LUKpvIuDkDcaKXn8yVwjDjcJ64rjybzHSNd7+Vsax8wI
X-Gm-Gg: AYBFou3k5kkt19ngnbvo2DcjzTDNgz+xHBh4VPaGy9qRritLh68JQMPp4iG8IGD1N8o
	E92F+EHGvpAye9StNq0R5918J41F1M8VPcZ8ydAjvfDrlr6Lhhf/AeKASRpK7kuOMzbjpcisa89
	IaPuk9tf9zeXepo9iQcRS8YBLlmZQ6QZOEAOxfWks3GXOJKjW7ruHdGA+1uLG+h4e1huD+FWpTh
	httf10BDqUL9rXJLegixuv6KbwPVbxjLSP5H0EUblGzzShinpcBdjMVQ+zRVVzssYEiAu4srSec
	ATWIjgeWo764/8dW/oPhtny/1VyDGT5I3Utm+lK4StmVS4yxeddbQ9cdN1tPmrk4HVh7rVHsBRa
	Q5SABHge18WCjzaP5QUBhKwuURV2adsGRE0UpfhPKeHP0/oUTW426eJmlz6azAMGStC96hVNmE4
	0DBJFqjrhnVCNQggCgzg4gIYTsuUSvSPFfp+f8rUPtWTNvOntq+HlKLa/SsM0gpyqPb7PszQbyy
	wpv3dwve2HIMxRUKnosZkXSiBdB4rj4MJoF
X-Received: by 2002:a05:600c:34c6:b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49fc5742ebamr75445285e9.33.1789839353533;
        Sat, 19 Sep 2026 10:35:53 -0700 (PDT)
Received: from royzah-ThinkPad-T14-Gen-4.tail7db7d.ts.net ([2001:8f8:1137:5e38:4ab9:7dbd:93ae:5ae6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0874c3sm129703785e9.14.2026.09.19.10.35.50
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 10:35:51 -0700 (PDT)
From: Royyan Zahir <royzah@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] crun: provide virtual-runc and honour CRUN_AS_RUNC
Date: Sat, 19 Sep 2026 21:35:39 +0400
Message-ID: <20260919173540.1602199-1-royzah@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 19 Sep 2026 17:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10087

runc.inc declares the provider abstraction the layer builds on:

  PROVIDES += "virtual/runc"
  RPROVIDES:${PN} = "virtual-runc"

crun declares neither, even though it already stands in for runc: with
CRUN_AS_RUNC it installs the /usr/bin/runc symlink and takes RCONFLICTS on
the runc package. So PREFERRED_RPROVIDER_virtual-runc = "crun" cannot
resolve, and every consumer that wants crun as its OCI runtime carries the
same bbappend adding the RPROVIDES by hand.

Join the virtual when the symlink is installed, which is the case where crun
actually substitutes for runc.

While here, make CRUN_AS_RUNC mean what it says. Both guards treat the string
"false" as true, the shell one because -n tests for a non-empty string and the
python one because a non-empty str is truthy, so the only way to turn the
symlink off today is to set the variable to the empty string. Normalize once
with bb.utils.to_boolean() and use that everywhere.

Note that to_boolean() rejects values outside the y/yes/1/true and n/no/0/false
sets, so a recipe or config setting CRUN_AS_RUNC to something else now fails to
parse instead of silently enabling the symlink.

Signed-off-by: Royyan Zahir <royzah@gmail.com>
---
 recipes-containers/crun/crun_git.bb | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index 288c953..67e67e9 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -31,6 +31,10 @@ CLEANBROKEN = "1"
 # with container stacks
 CRUN_AS_RUNC ?= "true"
 
+# Normalized once: a bare "false" is a non-empty string and would otherwise
+# read as true in both the shell test and the python expansions below.
+CRUN_AS_RUNC_ENABLED = "${@'1' if bb.utils.to_boolean(d.getVar('CRUN_AS_RUNC')) else ''}"
+
 PACKAGECONFIG ??= " \
     caps external-yajl man \
     ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)} \
@@ -56,13 +60,15 @@ do_configure:prepend () {
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
-    if [ -n "${CRUN_AS_RUNC}" ]; then
+    if [ -n "${CRUN_AS_RUNC_ENABLED}" ]; then
         ln -sr "${D}/${bindir}/crun" "${D}${bindir}/runc"
     fi
 }
 
-# When crun provides /usr/bin/runc symlink, it conflicts with the runc package
-RCONFLICTS:${PN} = "${@'runc' if d.getVar('CRUN_AS_RUNC') else ''}"
+# When crun provides the /usr/bin/runc symlink it replaces the runc package,
+# so it conflicts with it and stands in for it as the virtual-runc provider.
+RCONFLICTS:${PN} = "${@'runc' if d.getVar('CRUN_AS_RUNC_ENABLED') else ''}"
+RPROVIDES:${PN} += "${@'virtual-runc' if d.getVar('CRUN_AS_RUNC_ENABLED') else ''}"
 
 REQUIRED_DISTRO_FEATURES:class-native ?= ""
 DEPENDS:class-native += "yajl libcap go-md2man m4 libseccomp"
-- 
2.55.0


