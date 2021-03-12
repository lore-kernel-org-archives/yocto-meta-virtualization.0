Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com [209.85.160.202])
 by mx.groups.io with SMTP id smtpd.web10.4279.1615525105361245436
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 20:58:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=ZiFlVzek;
 spf=pass (domain: flex--rburanyi.bounces.google.com, ip: 209.85.160.202, mailfrom: 38prkyagkaa86q96p2dxv33v0t.r31@flex--rburanyi.bounces.google.com)
Received: by mail-qt1-f202.google.com with SMTP id m35so7453233qtd.11
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Mar 2021 20:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=XKgkNBrf8V+Cn/ppuWb1CN7n7DBQpJ/G5tJLwvhu1PI=;
        b=ZiFlVzekuaWOrUyson8oM6w/jsmXPryDVTzO/183LNIaGHeghhVco3WiepN9t/+a49
         Kjxpx60txxAPqFrkLMOT7tEu9ugGxomVeu0lHyIbYFcekyWDVVABOlv6mZhcHhPtBYvl
         lRM+pgaymRzJzw3kLjRaNA7KFuqvat1pRYuDGTIr0Tulyet83WRn3URxXen3Jrb9vGBV
         lBUepSuvABD8Kzqiosct7PZE0ZGvi8ALyqn0K4Yoz1xy+UnYdmzjwocEssJvlv4PnlSA
         5FvYnkB1dK4OnPvOUsKlXgswVZGaQYXNpsKDXuwNILNIJ6xIJWOV+IPcUjFtsWJRKR7s
         WTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=XKgkNBrf8V+Cn/ppuWb1CN7n7DBQpJ/G5tJLwvhu1PI=;
        b=K4QnJA5Ho1j34H9cDoQPkEFzd5545wkUmcaBpeWVQ0jdySFH5KAeUhdl+itqaQfOH7
         +qB1YUzJjRTc8qvpLhIZNdckFrXFg8JvJKEimZaP3JzEKgkMKMZhAo7+61Ihn77+05k8
         cO0ClcWyNP8QGaitWBtbPXKar89/dBUkA/cM4jK1Z/j5q7I0UiAjYEKYjmTYpQAaY3+F
         0cg2sc40+LlgTf5iDphZIbJnuO8W2g2KbkF+f1raSYsrx7bMkMfBGI1HdC91N8wI/uR8
         HJC3dPaazXD7eoPumtawMr+CUgjR9DyPem2HseFFiXGTYKRd7KSeywuuUgMscfrikdjQ
         vggg==
X-Gm-Message-State: AOAM530wdkAOHvlXtQaXiC3pS8UhnZ5AFEZpRPhGeJipLguXHnK5Rire
	q0t7cfSYtr6yaiJSCUY6swqMpVFqmuwZsqkhf8FoUejlpUD6fTdi6ViF69if8t3a+yimO4yRPNu
	0927I38F85oZ2QM8KBbzAD1jLu+VtsUzr/vwFNT5w8vtLLnajkY0vfXT+B3bHl2vX0/x3ZCmSi/
	TddX0xRlLo9gin9b5nFQ==
X-Google-Smtp-Source: ABdhPJz81RFX82+5g5rhG3MU4qH1uweKRAjiXQrpz49BVuNb+qVCq/CmbqBCnMkCK6T78V9nlWZqRppAxb2eAQ==
X-Received: from rburanyi-linux.svl.corp.google.com ([2620:15c:2c5:3:f08b:e781:cc76:369a])
 (user=rburanyi job=sendgmr) by 2002:a0c:d843:: with SMTP id
 i3mr5330318qvj.16.1615525104219; Thu, 11 Mar 2021 20:58:24 -0800 (PST)
Date: Thu, 11 Mar 2021 20:58:13 -0800
Message-Id: <20210312045812.541509-1-rburanyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [meta-virtualization][PATCH] lxc: change download folder
From: "Robi Buranyi" <rburanyi@google.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Robi Buranyi <rburanyi@google.com>
Content-Type: text/plain; charset="UTF-8"

The URI has been changed to 'https://linuxcontainers.org/downloads/lxc'
by the site maintainers recently. Updating the recipe to reflect the new
path.

Signed-off-by: Robi Buranyi <rburanyi@google.com>
---
 recipes-containers/lxc/lxc_4.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_4.0.1.bb b/recipes-containers/lxc/lxc_4.0.1.bb
index 807232e..ded8065 100644
--- a/recipes-containers/lxc/lxc_4.0.1.bb
+++ b/recipes-containers/lxc/lxc_4.0.1.bb
@@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
 
 RDEPENDS_${PN}-networking += "iptables"
 
-SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
 	file://run-ptest \
 	file://lxc-fix-B-S.patch \
-- 
2.31.0.rc2.261.g7f71774620-goog

