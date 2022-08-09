Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90789C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 16:33:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.14115.1660062809681731715
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 09:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hk6TGApT;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id n185so6573497wmn.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 09:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=R7XjxOdFz7mU1iRWniQF5lqFnndVY89G7vHcKGEwSQw=;
        b=Hk6TGApT5F4pP7l/6LCiwrVU2xzWGV7xbcQBjbyBOgh8RBnqSYqLK0NSctJdPC6lOx
         n5Y4bXlh0Ap96wFf6dJ2AJqQrTHGsUWKdaunDSfjs1pchReBvQGwdDRN67SDU++E0DiW
         CE4MIbMdBomfSER67bytMiJ2t2p5mK/n/OWF/QCC4a03ztvm8Q0mcfiGZfQlIkOVp/r3
         N8b2s8wa9iVxYsw5ZuAHqB/k5wuay4neFGqN5aXGNR6csbg6EfcZJRsSjAes9En88v/9
         ZSrb7uZFo6D8WDgq0vzTe5wGm4AGoyrXKVqRUePNY+OokRxO08E/ZU8a1UcWvf5U+pfb
         O5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=R7XjxOdFz7mU1iRWniQF5lqFnndVY89G7vHcKGEwSQw=;
        b=o6HeiCcF55ddBMItzqSYlNYMXFPykMHx/NY7tUQKfVOKbbKc0/nEl2JbjcHdqPFKBr
         08Z3TzEVz6fozvDRvGCXg7rwASuJz4XeqnMtAVaQ9+Y5/O0mzk3cKgo61pt9M0Do8XZ1
         nuVL8IyN8DYH4wkOvuw2Smp/ctnV1+M8Ubwvn3R5RLtgx7BJA20CGogEpRVQL4cTeXHD
         7uaFQ4Cy2SGG0PY3v5jBy5FIpRHRuBYC0HEr2ZEBcP62XV24eKZUPdqQkBTQlFlqC0Ns
         sTnUr3rfelNNM5PCuDH2ysZX7wXGL3y/R3Z69/fWQdHfaYt4DuBOZKk8dvFVwiQlCb80
         IuSw==
X-Gm-Message-State: ACgBeo1mHygxE3Y6AbGg1eVHGmgYhQXBJ7UwqQq+wJ3x0iEr0iPkCpod
	O4vnvad2BJWdzntKpbO/4MkuCcYdTPs=
X-Google-Smtp-Source: 
 AA6agR71hp3QaZboPJ3w2XI5XV6nC1iir4Q2X2CmD+25ueiU5K+j5Sav9pvTZj8d+YHIGNzZ6p99FA==
X-Received: by 2002:a7b:cb0c:0:b0:3a3:2a38:5066 with SMTP id
 u12-20020a7bcb0c000000b003a32a385066mr16546704wmj.74.1660062807480;
        Tue, 09 Aug 2022 09:33:27 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 r66-20020a1c2b45000000b003a5a4635fadsm1210248wmr.37.2022.08.09.09.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 09:33:26 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][kirkstone][master][PATCH v2 1/3] nerdctl:
 install the binaries in OE standard places
Date: Tue,  9 Aug 2022 17:31:27 +0100
Message-Id: <20220809163127.54464-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 16:33:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7506

- Install the binaries in the default "/usr/bin" and not in "/bin"

- The env BIN_PREFIX is there from the beginning but it is not defined,
also fix a fatal QA errors installed-vs-shipped (only enabled with usrmerge):

ERROR: nerdctl-v0.18.0-r0 do_package: QA Issue: nerdctl: Files/directories were installed but not shipped in any package:
  /bin
  /bin/nerdctl
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
nerdctl: 2 installed and not shipped files. [installed-vs-shipped]
ERROR: nerdctl-v0.18.0-r0 do_package: Fatal QA errors were found, failing task.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

 v2: update commit description, drop k3s patch

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


