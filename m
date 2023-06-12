Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA724C7EE2F
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 16:17:23 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.63845.1686586640555058414
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 09:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NUmTGVtT;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-977e83d536fso651409466b.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Jun 2023 09:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686586639; x=1689178639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1D2anQyJgyjKpOCsrdD+r7i2uVFIlPH7Lbw+gp6PJ8A=;
        b=NUmTGVtTp1mSD4GiHBbXAkkvewoC+GA3RxGQD5upr8HtQ0gEKVS0Zxh8u7D1Od5Oms
         9iTtam0syP3gUNK5zuhSyvH4KDm+J0hZquHViPxrLCDitCP1jnRs5TIsZ9rCPn/VlDvt
         GR7vU0E1pZp6aALo1MhbGJiudbOpmoSmnJK186IPBzhfzyl0IjUbgQj2FqZ8m65BU77J
         Xiy1lhHw+mzQqCNcixKnclfzOi1WVxVdD8PEC7Kf8hYuZQ23u0O8hqHyt6iQBNP7MuEX
         fdWZ3ekFuYqB+ni6g3r1tf+M85ZDx+hFwqgI75fCQHE8my91TsYtXW50hU/F9/BvGclX
         TLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686586639; x=1689178639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1D2anQyJgyjKpOCsrdD+r7i2uVFIlPH7Lbw+gp6PJ8A=;
        b=BPvre9epbC9Do6vcjBAP75EdugVE+zdoVvmarX/8+u01gYwyjCqvllduQlLhMUjU+J
         Q5jyP+m6AKCtbbIlFw/Tp0ZyYEIenpStJtI38VD7g3XyN8NT8bac7RjeWYzV2PqiUS8F
         tcIA/YVz97ZLiVvAb7OMAnn17mv9z1up9aLR5UosD3bu7Gp8ACV4UIsoVBwDaY987qz7
         Gm0YgffznUiuLg7DEU7oyvBziOdobH+p2VZ0J7JDzTZR2bf3ISTDQC4lRIZu6g+lW2f0
         OeifsW4K4hkfPjOo7jzkCt+LKTRF0BOHnOSotDVk2xY1HLbt2+TvLxoZKTFi3FsTA/dJ
         wmtw==
X-Gm-Message-State: AC+VfDweHTptqzvjPdv9WsNzl7j2o6Wjw2soPTPxejbNHLNidbPP6psE
	EKWjp5IvYmLkALVMDIEExbhcCXGLnZE=
X-Google-Smtp-Source: ACHHUZ4MxcIaovZEFE2ba87q1WuM5Moy6D21yoDp+paAP4GxceEzn9LKHqmTCeQ/uKvN5gOzbw7xuw==
X-Received: by 2002:a17:907:3d8d:b0:973:344:6a39 with SMTP id he13-20020a1709073d8d00b0097303446a39mr11139764ejc.76.1686586638578;
        Mon, 12 Jun 2023 09:17:18 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id kd14-20020a17090798ce00b00965a0f30fbfsm5428280ejc.186.2023.06.12.09.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 09:17:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] libvmi: add dependency on autoconf-archive-native
Date: Mon, 12 Jun 2023 18:17:12 +0200
Message-ID: <20230612161712.3586578-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Jun 2023 16:17:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8096

* since https://git.openembedded.org/openembedded-core/commit/?id=571132415ea7fe2d91c62948f2b6aa553eafa83d
  this doesn't get autoconf-archive-native dependency and fails with:
  http://errors.yoctoproject.org/Errors/Details/708195/

  ./configure: line 14424: syntax error near unexpected token `-fno-strict-overflow,'
  ./configure: line 14424: `  AX_CHECK_COMPILE_FLAG(-fno-strict-overflow, HARDEN_CFLAGS="$HARDEN_CFLAGS -fno-strict-overflow", , -Werror )'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/libvmi/libvmi_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvmi/libvmi_git.bb b/recipes-extended/libvmi/libvmi_git.bb
index 6338b80..25d7d40 100644
--- a/recipes-extended/libvmi/libvmi_git.bb
+++ b/recipes-extended/libvmi/libvmi_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SECTION = "console/tools"
 PV = "0.14.0+git${SRCPV}"
 
-DEPENDS = "libvirt libcheck bison fuse bison-native flex-native"
+DEPENDS = "libvirt libcheck bison fuse bison-native flex-native autoconf-archive-native"
 
 SRC_URI = "git://github.com/libvmi/libvmi.git;branch=master;protocol=https \
            file://0001-Build-vbd-only-when-xen-is-enabled.patch \
-- 
2.41.0


