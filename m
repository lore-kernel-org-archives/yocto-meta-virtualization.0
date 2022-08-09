Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA24C25B07
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 12:16:37 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.11157.1660047389672069584
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 05:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yc8swpzm;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 i128-20020a1c3b86000000b003a536d58f73so3857241wma.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 05:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Rl6tmNzHPiLDATATAv6cngaS5AovjbyV2NbrtyNrXjQ=;
        b=Yc8swpzm2Vjk56TvcpHuX3Bna2w3Atg/szLaU9xQVlhX0xu6Rie2bUjjL98scKnW6s
         Ef3lNeKtHIU0mFuzuCwd4LkKFbdYgv1SccYtTFppRXR9KrFio20mv9zwclunbgy20EcV
         7Mj75eaRR+d9GfEiWNLbpv9ockljq+iV5HXi60VNNTP9OZy9vlM9cX50WWaRJiAYZXvc
         jfNoINAzeQ3L/BOPTIdl/53WnZjlk/2M9EsJepZwTk08MMg3wNkk2BMf9/7CC0gskmnK
         FcPDMn0x4TDbDqSKPRKlSoh5FZVoN0EBSZkyetE+enKsp2qvtRSjNVF6MIrcbJrOgj5I
         5iqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Rl6tmNzHPiLDATATAv6cngaS5AovjbyV2NbrtyNrXjQ=;
        b=o36l9bgJHKpO8/C5Q27UPnFEl26ov5HExqFXTI3dLcHky5CCFr3UOpGm42lIQPyKzW
         5lVE5RMTDjlB9I5bGP9qhX8vdVajwlG1/GMuHsN/8lRApfkk40RDhunFc7FF4teBeNdN
         Y7V7qHh6WMxLv1od37lTMWq7r9Nnz71c6RDEF0EPVOrE75pb5NakJFw9Idl3n4nJ7b0e
         MXZvfDk+oT+b25pCEyS1xBkq3Te+NfEWZyrriUV2/wGtEt7nRvlifnBVNUr5BER1Wuf0
         eAba13OgpDk2sX7GHlXSrhjUvWWGBEguHg8IdXpshxp5/WS/lyZ6xqiHax4snO0zaEgc
         Bxyw==
X-Gm-Message-State: ACgBeo3/ZwpU9tGN3aGSMHLfdd1jkYvJ2ODgo+E0QjZeXJGVnmu6iP7+
	mucCZDt53XjpkNELXlCmp3Fe1ccVP3o=
X-Google-Smtp-Source: 
 AA6agR6GTpn6OnkpJMYNkRtONG3Ep1xnRxOk/jwQ1IkEYOGsaBL0E7Q6NyAnDrU2XMNu2i7G1U60Lw==
X-Received: by 2002:a05:600c:b47:b0:3a5:a431:ce36 with SMTP id
 k7-20020a05600c0b4700b003a5a431ce36mr994682wmr.89.1660047387443;
        Tue, 09 Aug 2022 05:16:27 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 n17-20020a7bc5d1000000b003a52969e89csm11178908wmk.4.2022.08.09.05.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 05:16:26 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][kirkstone][master][PATCH 1/4] nerdctl: install
 the binaries in OE standard places
Date: Tue,  9 Aug 2022 13:16:16 +0100
Message-Id: <20220809121619.32258-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 12:16:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7495

- The env BIN_PREFIX is there from the beginning but there are no references to it,
also fix a fatal QA errors installed-vs-shipped:

ERROR: nerdctl-v0.18.0-r0 do_package: QA Issue: nerdctl: Files/directories were installed but not shipped in any package:
  /bin
  /bin/nerdctl
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
nerdctl: 2 installed and not shipped files. [installed-vs-shipped]
ERROR: nerdctl-v0.18.0-r0 do_package: Fatal QA errors were found, failing task.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 5d4d827..ad18f67 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -239,8 +239,8 @@ do_compile() {
 }
 
 do_install() {
-        install -d "${D}${BIN_PREFIX}/bin"
-        install -m 755 "${S}/src/import/_output/nerdctl" "${D}${BIN_PREFIX}/bin"
+        install -d ${D}${bindir}
+        install -m 755 ${S}/src/import/_output/nerdctl ${D}${bindir}
 }
 
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.37.1


