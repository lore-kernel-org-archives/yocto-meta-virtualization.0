Return-Path: <royzah@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48262C982D7
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 18:40:20 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17187.1789843214147660310
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 19 Sep 2026 11:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H/R1FHOa;
 spf=pass (domain: gmail.com, ip: 74.125.225.76, mailfrom: royzah@gmail.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso1366028f8f.0
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 19 Sep 2026 11:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789843212; x=1790448012; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7+X28x2jeg6RHCIIMmKadAtLkQFuDzjZjevsS9//1c=;
        b=H/R1FHOavxwJbza3TiphDAyVv2MH3sFma3ErIDIlBuJlT0Y48aB1Ek8ISD9uasuVdC
         S+/E5y5uxoSum9RGMHlaHJyeSd0awKawwjd4yTy3NeUogrAIPka+cAFz7FQxV8a46yvq
         mU12bbHx0M52IGVxfFe+YIzl/rkgj3oS6zJXJLoKwhrbUIyer+Q2zgGtIt8jHhCVyBj+
         1CqkGZ0tgMA1sCljNhYLBcF/yRpHvChq9dNsbtDDklWn/7XQydlP0Td6OG/2A+H6D2Fy
         NrybAh6k5PAKjSszmNSC9H9AphSvNWMP27W9rTA5Hk+X7aj+mDjRAJ/mreoyGPcRKF0h
         ziFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789843212; x=1790448012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7+X28x2jeg6RHCIIMmKadAtLkQFuDzjZjevsS9//1c=;
        b=qYsIWy8wYcS1TFMoN8PD/qCqtX78jozN1eM48TRj4U54rkED+f34bezcIe8vuRvGsj
         nUWq47U4oJuOgabasoaw5WImNEKkdrdflu03yUP2xtKsPhF6Z9LlBZ2pBHLXrDXPXXou
         LPLg/QJOooY1JzDJ9laovrDTp79KwB4qIFnPfy3NVPZUIvSvMtdruVas+9LcJuBfPeD/
         y560lXPmUmMzoz9J5AtO0oRn3MwheS8RQ+goI+VJaZKtEiPxLI9CR2jwmafyCIZWH5dA
         6c5AFQ4KGTgd6L8OdzlEbYl6zJgLrALPHpGPrBQKrzAVCt26zzVHf8jUhvf2c0szxMmK
         4e2w==
X-Gm-Message-State: AFuF++kSIJ0++p15j3z832nQHsE1WIf2pfXMbYnMkLE2Hk6Q2XIyESka
	TQAPR1omnaI7MJmLJGtGHuBnpLGBG+bSEw8GVn9bugJXTKJQXO1ZDWu523J2E39o0zTvOCkAkTE
	=
X-Gm-Gg: AYBFou0cdXOqta9WE2NAI4YWOtYOw2KrTv1Yn3SykHQMUSlfYRxbqqN90GgtJX5XRwk
	bwsF3vSr2l6/Qyfpvv2fIV6QBKPDhMl9IRRt7063CGkklBOMY8mU2XBeYxzMQqFLSb8dFRTmCPw
	degYitbqNVdi0OZlq72UuNrM+HatMcxTmjWEBbxFsMuQCLK1g9bhpEcgtbPszwzwKRAVUe50HvT
	81i0a0hF1ftMI2dPiWAKjOQqjj3XrSUxCucgblRTiNJYzBDOmxqyjq5j8U1NPs03AmTBvsP4/aq
	K/wOef1pVhMnMK1iT+rkOqFgmvFkFa5CR9ya16seH6TNhgQMrNAZPqzFWpSbArQ22s1c+qDp2s+
	04Cj/IDPPv09JPyy3QMzCKkAPlk8lexjTyT1Huv4f+eJQFgalDcTHGQlzodHBSZXNRacIfS0NAn
	+Zscp8A/hriFMV2OPV/3Y2G1wNbyL8YE76kZwBgoK3Dv4iYnc3b4buhwo/jKbHGBd4C3qzGvAfg
	Gbyp5PLojHAWXXgvo4+AwpCETYELjFzRBXIKTdX80Pc9g==
X-Received: by 2002:a5d:6f17:0:b0:488:54ff:67c9 with SMTP id ffacd0b85a97d-48854ff685amr654962f8f.46.1789843212370;
        Sat, 19 Sep 2026 11:40:12 -0700 (PDT)
Received: from royzah-ThinkPad-T14-Gen-4.tail7db7d.ts.net ([2001:8f8:1137:5e38:4ab9:7dbd:93ae:5ae6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724591eaasm8793213f8f.26.2026.09.19.11.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 11:40:10 -0700 (PDT)
From: Royyan Zahir <royzah@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH v2] crun: honour CRUN_AS_RUNC
Date: Sat, 19 Sep 2026 22:39:56 +0400
Message-ID: <20260919183956.1795771-1-royzah@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919173559.1598000-1-royzah@gmail.com>
References: <20260919173559.1598000-1-royzah@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 19 Sep 2026 18:40:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10089

CRUN_AS_RUNC = "false" installs the /usr/bin/runc symlink anyway. Both
guards read the string as true: the shell one because -n tests for a
non-empty string, the python one because a non-empty str is truthy. The
only way to disable the symlink today is to set the variable empty.

Normalize once with bb.utils.to_boolean() and use that in both places.

to_boolean() rejects values outside y/yes/1/true and n/no/0/false, so a
config setting CRUN_AS_RUNC to anything else now fails to parse instead
of silently enabling the symlink.

Signed-off-by: Royyan Zahir <royzah@gmail.com>
---
v2: drop the RPROVIDES virtual-runc hunk and the RCONFLICTS comment
    rewording, per Bruce.

 recipes-containers/crun/crun_git.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index 288c953..97c6603 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -31,6 +31,10 @@ CLEANBROKEN = "1"
 # with container stacks
 CRUN_AS_RUNC ?= "true"
 
+# Normalized once: a bare "false" is a non-empty string and would otherwise
+# read as true in both the shell test and the python expansion below.
+CRUN_AS_RUNC_ENABLED = "${@'1' if bb.utils.to_boolean(d.getVar('CRUN_AS_RUNC')) else ''}"
+
 PACKAGECONFIG ??= " \
     caps external-yajl man \
     ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)} \
@@ -56,13 +60,13 @@ do_configure:prepend () {
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
-    if [ -n "${CRUN_AS_RUNC}" ]; then
+    if [ -n "${CRUN_AS_RUNC_ENABLED}" ]; then
         ln -sr "${D}/${bindir}/crun" "${D}${bindir}/runc"
     fi
 }
 
 # When crun provides /usr/bin/runc symlink, it conflicts with the runc package
-RCONFLICTS:${PN} = "${@'runc' if d.getVar('CRUN_AS_RUNC') else ''}"
+RCONFLICTS:${PN} = "${@'runc' if d.getVar('CRUN_AS_RUNC_ENABLED') else ''}"
 
 REQUIRED_DISTRO_FEATURES:class-native ?= ""
 DEPENDS:class-native += "yajl libcap go-md2man m4 libseccomp"
-- 
2.55.0


