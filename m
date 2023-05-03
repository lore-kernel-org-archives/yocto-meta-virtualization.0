Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1ED8C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:05:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.14463.1683104749672199975
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 May 2023 02:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=o1eXmmFK;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f1cfed93e2so48653105e9.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 May 2023 02:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683104748; x=1685696748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y1TQmpa6ULIUpwdkuNkDoroOlvo2OsQYoGPhC+QghTg=;
        b=o1eXmmFKXwBWfgLEkQjiEFktcLaIOo9iB/Sim/lwGpbmSGCauBe30BodgA9IovFZwX
         KLZE8xSkwQULDINuEneiBq7HDZ65FznMI41FC5+NcY6ImlR8QYD9/9ki1+lY18XyuLNM
         KhdT5ZQvErwERzQYvJuApZlf4jM0rWq5rcQUoReAOnffTk/9ifIQcXLZ43imcjGhcvta
         GfqRbzTzUcPaA9x+MXz93I0uLuSX6rec9qZ6sj/HTzDDqouJpdyl1BoT1NFJNJXP6MoV
         4QYtObDEubZaVW9qYh0k+A5FVHn3cEkszmro7guyQMZzXS+9+M9dni/1c74M8Mub1LFw
         QTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683104748; x=1685696748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1TQmpa6ULIUpwdkuNkDoroOlvo2OsQYoGPhC+QghTg=;
        b=PAPdtxeUTNtCxvwU0Z/TurJRc/k4+dxVNfOR+nv66Sp/R4enkzXRM1/kyabAjpqBS6
         rhEqG84JFaFsvhZx0pLXD4L7NxdVL8hAR36JPkhZUahp8lFNy0W3vTJncbR5TmBnUc41
         0q1HlMnEF+foFk7aVqoldgofThklssRLnha2WAwFQeBIZ5ZAJb4odFo8GBJVovyIL0hf
         UULj+j/L9G8/sshKm1itUXOPXfTceC1e8NY6eZQ0xN4mI96R+DXiki2F8oYhX8zjuILs
         AbT4RnNRaQLNE4ORegmvFsNnlwIES5jvJeO3Xarg1BuUPHYsOhs3qrBXXJIK8ykAMWHU
         U2Nw==
X-Gm-Message-State: AC+VfDwkgcGKdaIdFAAU6cHXjvYoQE5j/ASGNlvADAK+Iabls78biQRe
	6TbvONifiDSTscxD0IAWzvIP8lsg+rc=
X-Google-Smtp-Source: ACHHUZ43itU5MG+hvEHr56jVKfBiTk3uMg/i5+209BU7vkekP/nY6C2lYbSpJXfSg+gUF4RvINvAvw==
X-Received: by 2002:a5d:6781:0:b0:2e9:bb2f:ce03 with SMTP id v1-20020a5d6781000000b002e9bb2fce03mr12388849wru.0.1683104748014;
        Wed, 03 May 2023 02:05:48 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600001ca00b002fab755e10bsm33006821wrx.68.2023.05.03.02.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:05:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] libvmi: add dependency on flex-native and bison-native instead of byacc-native
Date: Wed,  3 May 2023 11:05:44 +0200
Message-Id: <20230503090544.1149841-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 03 May 2023 09:05:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8042

* fails to build with byacc-native 20230219 from:
  https://git.openembedded.org/meta-openembedded/commit/?id=3462709d651f44f3d067b3ce0bcfba876be9ff1d

* https://invisible-island.net/byacc/CHANGES.html#index-t20230219 says:
  provide for a named union, e.g., "%union foo" by detecting the name and
  deferring the typedef in that case until the end of copying the union
  definition (report by Dag-Erling SmÃ¸rgrav).

  which in this case leads to this diff (compared to byacc 20230201):

  --- 0.14.0+gitAUTOINC+41600b6028-r0-byacc_20230201/git/libvmi/config/grammar.c  2023-05-03 07:44:51.694234317 +0000
  +++ 0.14.0+gitAUTOINC+41600b6028-r0-byacc_20230219/git/libvmi/config/grammar.c  2023-05-03 07:37:14.177205785 +0000
  @@ -5,7 +5,7 @@
   #define YYBYACC 1
   #define YYMAJOR 2
   #define YYMINOR 0
  -#define YYPATCH 20230201
  +#define YYPATCH 20230219

   #define YYEMPTY        (-1)
   #define yyclearin      (yychar = YYEMPTY)
  @@ -273,7 +273,7 @@
   #ifndef YYSTYPE_IS_DECLARED
   #define YYSTYPE_IS_DECLARED 1
   #line 249 "libvmi/config/grammar.y"
  -typedef union YYSTYPE{
  +typedef union YYSTYPE�(�o&V{
       char *str;
   } YYSTYPE;
   #endif /* !YYSTYPE_IS_DECLARED */

* and the unicode chars after YYSTYPE lead to:
  http://errors.yoctoproject.org/Errors/Details/702745/

libvmi/config/grammar.y:249:22: error: stray '\370' in program
  249 | %union{
      |                      ^
libvmi/config/grammar.y:249:25: error: expected ')' before '+' token
  249 | %union{
      |                         ^
      |                         )
libvmi/config/grammar.y:249:26: error: stray '\3' in program
  249 | %union{
      |                          ^
make[1]: *** [Makefile:1997: libvmi/config/libconfig_la-grammar.lo] Error 1

* bison-native works fine, so use that for now

* I've reported this issue to byacc author over e-mail

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/libvmi/libvmi_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvmi/libvmi_git.bb b/recipes-extended/libvmi/libvmi_git.bb
index 72069c6..6338b80 100644
--- a/recipes-extended/libvmi/libvmi_git.bb
+++ b/recipes-extended/libvmi/libvmi_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SECTION = "console/tools"
 PV = "0.14.0+git${SRCPV}"
 
-DEPENDS = "libvirt libcheck bison fuse byacc-native"
+DEPENDS = "libvirt libcheck bison fuse bison-native flex-native"
 
 SRC_URI = "git://github.com/libvmi/libvmi.git;branch=master;protocol=https \
            file://0001-Build-vbd-only-when-xen-is-enabled.patch \
-- 
2.40.1


