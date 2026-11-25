Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3557.1795647525470184846
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 14:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mq/JYQcR;
 spf=pass (domain: konsulko.com, ip: 209.85.214.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f04bea9a93so56685005ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 14:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795647525; x=1796252325; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XAsaTKfVBwcCXY9xsRvbBzTDo7z5J3BKwE+PjUR9qk=;
        b=mq/JYQcRL6iKOyUHcaqOESOSpPJ+ZbsSu8GQHqIIha9pYZ9LqYjDYy5YsSWW+Dusi8
         fPY50EDRo+pG2F82hkFaR+9tDumA5zUC5BjsWHOsTARFzYJCdBs0stUpRqjByEic0IHE
         ToS9ms1bxVmjQ+eJ0mECSZ3Ka7ukeB65Ej7wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795647525; x=1796252325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0XAsaTKfVBwcCXY9xsRvbBzTDo7z5J3BKwE+PjUR9qk=;
        b=vpFneoT6lTSYRoRJi54+NI/XnGszeEHKj75OtaOPomf81MlzxGLjx5AHSAtvA2tXH4
         s68UGlzjbXQLztGMaSRWeYX5QzF9moDICbTfDbC1x8JxJyfFe0MlCFIm/cuJd7nh+37i
         B6jtM3P0d4nDTQaUpaDL8jkOUuBdJ1MryVz+bV6V7W7HgEkzD6GGGzTFaM/5KiEKnhtu
         LoBfjg8Fa0MX1yGtEz5nc/aKyKuo5EkAoImsAH/Ra9sldq8bvyhNac4s+oe4fRDJtUy/
         cxSbalas1EMl7II5PU7NSgi0Fvf/Z0Z/On2FF9Ga/hsqYRhgel6sI6yT6p2wCzR1hoOU
         9z4g==
X-Gm-Message-State: APuU4Z+sDKcdbErNnmfG7fhcLvTcoagBaLM8SEzw5eJzyc/vY5l7tlPL
	opHU1yzlP3uaUAjT8YRwxmXkJDqvUGRe3XzyqUyQ81+97aAMvND+5h8eJapyZrywYEBJpdqTomP
	xHQqcNRU=
X-Gm-Gg: AZFdTZc0in2Q/t02AzMdnADdLZqa//wmU8eMfDLsZylx6ofkD2Tt7POq9XJWmvWc7x+
	pCiS0y2jI9ahedWgil2Z/dm0+Hn6+pQtP3jOxhp5wReeVEYiOSpJgngdujc5Ju/84QyXKODmzo2
	1wDi5JUj9tdhPsphtSbOgS1KFntuSJepByLHPBjdbMgoTD+v/o7Jp8ISlWclP2KFbGYChGyLnxM
	XFAoyGXz76FYXShMp9ewRWtEmhuUFoskfdMZ2LKse6rl9cbj7/4MlTkquvkcEOU8WUIRxw/WTLE
	dl6dH32MVHDg8OeK6uuLVRBbq02Pga1RJh1G9NjrJXtqWBqZgHW9zl2GNdm78GF5/SAljoobRrG
	kbgH6f+bAnIolhcDCieXFvvD2TdZKY8I81h8HC6L6quHWaCMBb2t+11AlX528BWg8N727ZkjEgq
	Ayqoa5rjNQ64HoKmyu8Nhu0758s+6HGQ1iSIJZb9SGJbireNvuC6EPa2uBri93Xw5jhEKMq6/5w
	RBwy0mw6SqWJHjekuYz7dTUj/s5hXORW1J4aCX4zRBovgQuLVSVvbJCL4L5YGp4sR96MSeCFtJy
	BoA8HK5ncc1aoRh6TgEPlNM4cIsOYbUjEDSRnf6tPMVjfinlz+Yc7JGt6/VF4/o840qpMBGDr5i
	cWxPWK9BQc+qgTdzGbd5hf1RjmjCOLmxLM2ttOSVXXAGfRbJusHeyxq2vNctqn/mlrQ==
X-Received: by 2002:a17:902:e847:b0:2ed:3d74:b640 with SMTP id d9443c01a7336-2f03f26b691mr184612545ad.59.1795647524789;
        Wed, 25 Nov 2026 14:58:44 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from localhost (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b5647b94sm42073555ad.14.2026.11.25.14.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:58:44 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH v2 2/2] xen-rpi-u-boot-scr: replace UBOOT_ARCH
Date: Wed, 25 Nov 2026 14:57:09 -0800
Message-ID: <20261125225836.83743-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125225836.83743-1-tim.orling@konsulko.com>
References: <20261125225836.83743-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 22:58:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10187
Content-Type: text/plain; charset="utf-8"

Since oe-core:
bdcd04bbc5 "kernel-arch: Drop UBOOT_ARCH", we should just use the
oe.kernel.map_uboot_arch(d) call directly. This was the only
reason for inheriting kernel-arch, so we can drop it.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
v2: resend so the author is tim.orling@konsulko.com (v1 arrived as ticotimo@gmail.com)

 .../recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
index e25963ad..7e7b2f6a 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
@@ -19,10 +19,10 @@ do_compile() {
         -e 's/@@RPI_DEBUG_XEN_ARGS@@/${RPI_DEBUG_XEN_ARGS}/' \
         "${UNPACKDIR}/boot.cmd.xen.in" > "${WORKDIR}/boot.cmd"
 
-    mkimage -A ${UBOOT_ARCH} -T script -C none -n "Boot script" -d "${WORKDIR}/boot.cmd" boot.scr
+    mkimage -A ${@oe.kernel.map_uboot_arch(d)} -T script -C none -n "Boot script" -d "${WORKDIR}/boot.cmd" boot.scr
 }
 
-inherit kernel-arch deploy nopackages
+inherit deploy nopackages
 
 S = "${UNPACKDIR}"
 
-- 
2.56.1

