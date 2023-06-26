Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EA4EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 16:27:39 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.345.1687796855162857132
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 09:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ReaL1tXm;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-98df69cacd1so169376466b.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 09:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687796853; x=1690388853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dto0IP3WC7BaAw4UBRqrJb2vhUQzwMSTMQRCdbxKZtU=;
        b=ReaL1tXmO/06dq3mtEuv380f6e9qMN+CXLS09tyYl/raWRg6pgwxX+ykU+bLqqN/B9
         be/7+nrSMhuICevcWJNz3pBfvk0Ct39CGPj7ySEkmBrx1LFocDYKBN2gE9XX/NuuDMC/
         XLvxs+C2XwwAie4rA5hzWCU27hGEQtS+7WJwY/4BxVtQ4YZKilHe3dyLZKbUYEusK4bZ
         isB2U4K//pvPDiMD4cq7B/km1Uwk0PIyfscGUT+BI7DOBLFo7q9kv8nqmgkA8Af/GbJh
         KK6GOR1wsA2eNg7OriKJDsz8Fxs6SQ8LjLue8prIYeeBzDDQhOw60htWxcSr8qkaQlwa
         LpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687796853; x=1690388853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dto0IP3WC7BaAw4UBRqrJb2vhUQzwMSTMQRCdbxKZtU=;
        b=gWnALy/PfbzeewZJoxK53VsT9+fNKBjDfz+yU3byeatCIbJlfDLD156xKb2EtRxnJL
         AiN9kjk7KrX6OIcsk3WODQz+m7RwIoy06c8znYuqswko7a3SWq5HeGMurKjRQDlKWqRb
         M9lrgILwVzjq5HGgRN3L/MXDGE+HECkcXVlFktAYotbiO7v2OdsIOANO5mUHNh/HdCkX
         Ak92GlddLR29V3QFn9t5Ho0FDYnaXNHsKxj7zhIA1sQyht6ngx6JliASPSWeNLl/SDwG
         6AttgyniND8KOZkY17sAWC6dLClW90AmW4hL7jzydCybX3ciuHzbeHK8fXvbwetKfiso
         w+5w==
X-Gm-Message-State: AC+VfDxOeJAowGyJESnNeCugwyv2QgvSE8iOhbgWI2E+yr35l8pnEAte
	3tQSwgGQYU9fmN4hI1uuIe6TlAm0xks=
X-Google-Smtp-Source: ACHHUZ4jM7ZKnwFb7PtbOY7HA2x0r12xTVEWIUXaJnboe8tfYrlHIWVN+sKzIGj68fPSIuOiow9hAw==
X-Received: by 2002:a17:906:4fc5:b0:974:20bd:6e15 with SMTP id i5-20020a1709064fc500b0097420bd6e15mr25475211ejw.4.1687796853192;
        Mon, 26 Jun 2023 09:27:33 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a16-20020a170906369000b009887c9b2812sm3493909ejc.8.2023.06.26.09.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 09:27:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [mickledore][PATCH] Revert "yq: Redefine do_compile"
Date: Mon, 26 Jun 2023 18:27:11 +0200
Message-ID: <20230626162711.3354372-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 16:27:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8110

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This reverts commit 49a6827cbdb6e00d3af5e5c4a4479c47573a4533.

The workaround is no longer needed, as oe-core has upgraded go to
a version that has fixed the issue.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-devtools/yq/yq_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index bd474a7..45f2f97 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -50,7 +50,7 @@ GO_IMPORT = "github.com/mikefarah/yq"
 
 inherit go ptest
 
-do_compile() {
+do_compile:prepend() {
     # arrange for some of the golang built ins to be found
     (
 	cd ${WORKDIR}/build/src/
@@ -60,7 +60,6 @@ do_compile() {
     # arrange for the fetched dependencies to be found
     export GOPATH="${GOPATH}:${WORKDIR}/build/vendor/"
     export GO111MODULE=off
-    ${GO} install ${GOBUILDFLAGS} `go_list_packages`
 }
 
 do_install:append() {
-- 
2.41.0


