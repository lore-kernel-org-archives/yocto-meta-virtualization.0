Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73916C761AF
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 08:21:18 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.29709.1679905272258344722
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Mar 2023 01:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yh/I8RFU;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id p34so4505764wms.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Mar 2023 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679905270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RtwwLGsedXYM6r2X7BDGluFs8w3CwGTlpwOp39BgB8=;
        b=Yh/I8RFUdn7W+ZWeT9huXjXDYWCrKrzTl/+CT1R3Vf3TdHy3+cRnW/5cHiMMl5i4Nu
         t+deR3jsTgQuIlCiKpib2QERu5fv1LD2MS+vQxY56wluTZU6afgvwqXSBQoRiELm7xub
         Wt2++rxz2BZ9qw4rrrHgYSfhlbsvm1wP/16CumpAfHGLOCsWexU6gc2MZx8JWQrPAKNE
         fh5DquHFp6Gx3NbIhQgnCrpmz/RfsSLeUcLxWBXIlzi6Eh4Tp2QgR4B2Z5QsIoAXzvu5
         ZbaKmfWOjmK1w8eEyP2INKdstMGQkCQOSzyfGxCuveoSDtEM4fYJNH+77qLMjQXNrlG/
         IpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679905270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RtwwLGsedXYM6r2X7BDGluFs8w3CwGTlpwOp39BgB8=;
        b=pD6oHcjxRmFPPw/xD10kH7d+XC+9MAGmM2xzXiFCQLlGOhQWcUuRzY4HRsRCbVCGZZ
         wUpKY4NRsYuMzUq79GQmOLOXqpAHB/CgJjCq/QXma3YGh+Sj5PUXOaMZZieDHIy+OYBa
         twBgne0y7+dHQV+5jLjxM6oyhVaJhR+Tm1AE3RcusboxcJCCZA6nEOnuLB2S4sxUWdoe
         TrFATjvl7Zwgx7s2oq5FQeUYNa+0gTs2XD3P/odVTUELOhsvj/1/7E0eK5HGQS5fUMvL
         mPZfRRZakv/B6ffZIab6PLxDA9i8nuM9bzFUcXydioGmtJ2HVZNkKR9A0mMFrLjkZQXi
         bNwg==
X-Gm-Message-State: AO0yUKV46OlVs/pbgP/SBv70xQrU5TZHBT1U66GFHweU8GK8PWDZXSig
	yMoTVRoi7fURGN5XzyutXdGIe+VUkIk=
X-Google-Smtp-Source: AK7set/WYVty/+wnyKSgThY0Ho9mkTIgmBQAR0SigRPk1HXrs1jSoj1xMWYhetSITuurq6rtTo1IHg==
X-Received: by 2002:a1c:f70c:0:b0:3ed:d261:50a6 with SMTP id v12-20020a1cf70c000000b003edd26150a6mr8453710wmh.9.1679905270304;
        Mon, 27 Mar 2023 01:21:10 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id z4-20020a05600c0a0400b003ef4cd057f5sm8002842wmp.4.2023.03.27.01.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:21:09 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][PATCH 2/2] buildah: enable linkshared
Date: Mon, 27 Mar 2023 08:20:37 +0000
Message-Id: <20230327082037.3173653-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327082037.3173653-1-jose.quaresma@foundries.io>
References: <20230327082037.3173653-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Mar 2023 08:21:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7957

The linkshared is fixed upstream and backported in oe-core.
https://git.yoctoproject.org/poky/commit/?id=d5c79ca6a77af1a04992fff4300333e02d94d84d

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 recipes-containers/buildah/buildah_git.bb | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 3c17c98..af340eb 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -40,9 +40,15 @@ do_compile:prepend() {
 go_do_compile() {
         export TMPDIR="${GOTMPDIR}"
         if [ -n "${GO_INSTALL}" ]; then
-                ${GO} install ${GOBUILDFLAGS} ./cmd/buildah
-                ${GO} install ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
-                ${GO} install ${GOBUILDFLAGS} ./tests/copy/copy.go
+                if [ -n "${GO_LINKSHARED}" ]; then
+                        ${GO} install ${GOBUILDFLAGS} ./cmd/buildah
+                        ${GO} install ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
+                        ${GO} install ${GOBUILDFLAGS} ./tests/copy/copy.go
+                        rm -rf ${B}/bin
+                fi
+                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./cmd/buildah
+                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
+                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/copy/copy.go
         fi
 }
 
-- 
2.34.1


