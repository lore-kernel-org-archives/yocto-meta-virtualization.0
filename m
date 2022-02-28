Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF230C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 20:41:52 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.117.1646080911867135181
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Feb 2022 12:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=USx5azkF;
 spf=pass (domain: mvista.com, ip: 209.85.210.182,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pf1-f182.google.com with SMTP id a5so11259301pfv.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Feb 2022 12:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e4r35pX00Pk8H+nmWJaN5Vxn/ELZIpQV/eEi61ARySI=;
        b=USx5azkFofDCnDlzlkcdHLA1ETyc/TnO2tNWhPfFU8FCqVi2WZ4tVpMvoCNgT6U1qZ
         KlQNZri9l1eiAaE8mxaiyPI3AXxsANTux8fZuqp78Hnqk/6pj+yNjvFp5RtPehtpJypo
         zuh2DGeZ/MC0ko+2dNi/5M5VhxIsjVmNBXVj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e4r35pX00Pk8H+nmWJaN5Vxn/ELZIpQV/eEi61ARySI=;
        b=1HYmz9POsceCRzUIlgB9hVn5dxDD+HHOrJ83N/BegZZ97TvSE/E1EseJKg9TBidRRQ
         QYmahJxhLjYsvZOu3uDjwn/rVogEq1JJNOfGDGRapH/hOGHwYdONB3PIgEyf5r0xOwme
         qim/hWWOPxDARmJnJx7sCqSR+znzPiL8xWPDlx0wHuHkFiJUUwox2qlbtAa8XBUu1xc0
         mX4+z/U+1xWW0s1j9wrRvAOGbRVhatWnKrSHiruT0E8HIdpPE/zx/xT1oIc4g4yXdBZs
         xwMmTU8gAAO9UpvMzv2EVeBK0ckGCZdNH9J468CLdyJPy8flHZoACXUH8p0bxCrYUX1y
         JFog==
X-Gm-Message-State: AOAM532umA2z7XY9oVAYWRaUgoKGJA/nckyp79MeC61fUDNf/OwJuMX/
	SNAB99M+FV3eZ+he7AaJEf5CnFr/mgyE7g==
X-Google-Smtp-Source: 
 ABdhPJwJvasegEtsrL4fMoeeLeVSQIzYvaV8KZR+0cZ3HNmTyrxhPZwVDE8fEZYm/cSx2e84YJSerQ==
X-Received: by 2002:a05:6a00:1995:b0:4e1:a7dd:96d6 with SMTP id
 d21-20020a056a00199500b004e1a7dd96d6mr23415265pfl.16.1646080911067;
        Mon, 28 Feb 2022 12:41:51 -0800 (PST)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 d7-20020a056a00244700b004e1300a2f7csm14302482pfj.212.2022.02.28.12.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 12:41:50 -0800 (PST)
Received: by red (sSMTP sendmail emulation); Mon, 28 Feb 2022 15:41:48 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-virtualization][m-c-s][PATCH] glusterfs: switch from distutils3
 to setuptools3
Date: Mon, 28 Feb 2022 15:41:44 -0500
Message-Id: <20220228204144.4184386-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Feb 2022 20:41:52 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7068

---
 recipes-extended/glusterfs/glusterfs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index 646b521f..5c960bca 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://COPYING-GPLV2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING-LGPLV3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://contrib/fuse-util/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit autotools pkgconfig distutils3-base update-rc.d systemd
+inherit autotools pkgconfig setuptools3-base update-rc.d systemd
 inherit python3-dir
 
 DEPENDS += "bison-native flex-native python3-native fuse libaio libtirpc libxml2 ncurses \
-- 
2.24.1


