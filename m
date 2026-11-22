Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38746.1795372180117809053
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2026 10:29:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=abxb4j52;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so1222772a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Nov 2026 10:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795372179; x=1795976979; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04WVb2eur3STmOHvSD6NI/7p0zFOPvuR2WoCwXNbLoQ=;
        b=abxb4j5260wsYm6vl7MeaqWIf0tf/oyPR0jETl5qdjcXvnpFXzttXXYqe7QSKdw2C9
         Wbztfq0BSlZFQstl+64ZNJpm1WwVqOkXSRw9wqObUc4R6g4jeRS8X83q1kQvAgWGB+3V
         x90gbuciZbR5eBr5sIScCHhQwQdDIu9XafBDGQFoeYwHxY5ysVTfJIRKEZ8HCI8rziIZ
         kGVFv0tj8sMH5AXyb3cIXYhOHW0TEH3YrO8Yet0H9uf+m3uv0f9hj9Ay6AM1dHJI/AvK
         +VzUcXbhKS9Dj4jEnrATcBZ/ErzR7UMvAPWHGWrT/eIzCwT+gOhsvoDZDt50rlsUT8ym
         ub3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372179; x=1795976979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=04WVb2eur3STmOHvSD6NI/7p0zFOPvuR2WoCwXNbLoQ=;
        b=IefbtqmDWimNIguBQHsGdDkPbwem6Swz8Yggm0/eN1PCQsNP0PjX/mNSqzi+ZOGj2+
         nIF1AYklJ2ULx6KPshecsP+OGswWkRcL2YET7GH+WT1ti9V7zJJ0u7u6Fa6yqfVDewAE
         OIDxKTRghq7PrNLYgprZxfAusnP5FpLyVKFZq9gAA/bXK/XHyOcs2hK++yXHDDpPn+XW
         iFPVzm/fwPH48repQRZG2KmG94d8KWoai3JKP3qzCQLfuA8DgpXEI7r8/QOAKP2HaDaT
         zt6rAcNm9jWpjoiYetJdKhdm7MrvmYrBGiZaMMKFQYGDH1NJYK4Kn4tOOJy+fyRQLe0T
         S1hQ==
X-Gm-Message-State: APuU4Z8Uwlp3iK+vmqbGtc6Q979HAjZ3F4o8sRUWeWbD7mjoaX0Zcw4/
	sM5bJ11ElkUgvfHJO40aEEyGWJE560tY2Rm+bPA/dsqSeVlSm2k2+NzWQ7PeMlw6
X-Gm-Gg: AZFdTZe7RDsI8QqurDydnyEWpvhsGdubDm+n1JlQKDGUFFw+QOH9eiJnlnkicVj11EJ
	4L56NbwsIqCiG69RnfCB4pnNj8Oz0gfzmdBqpS2cRs7KNaPQCKRw/H07+tr47XLICxr4Ac3F+07
	TcsdCV0TGohjbNFSD81yLglA+nggXBfy4E3wFpr0S9j4Fu0MFPrQyuxtiksXun3aeiRttM0XKko
	t9msChk0kpvualzFZws5SnWJorY7aRDpPKlRQgx1jRPXlW55oN0WAFZmg05bhJFMNCjYiN9xkU4
	eEB5az6kjyigqd7NSUYVom1oUwqvHtzXGkx+T4oyCfsDXnsRuS2yqAtDUTySCgK5ucDzgJHQxqq
	9d6yNauNPGVaxTrAn1D8EIGRXNfrxDgJEQvMgvEmCxRDHo/1HDANVeL+3lUCP9f3Kg3EOxd3UC+
	EwS+V14dhd7fFYDRfmoZke1lHFzqYU5LczeF/s34yLbWMpfgt7M8fTDDced83Qo3+uk9nFkFF/G
	ZpoVZHDiB+pfhOue2UOTkSnHkkRrbiD/DRSgt+ulDi27Wsa46vv98JjELCa0o5kBg3B39yAzhp9
	JX2rJ8hk6Alkv6htzglPWHmEN75ll4+8kF9ojRmOPKRhgERs04qjljt4Ks6GbWJDH+vtYx6sbRw
	pm/QcookW20aFKTRGKnQo7YQU
X-Received: by 2002:a05:6a20:a125:b0:3fa:2e9c:fc84 with SMTP id adf61e73a8af0-4014c15bb78mr9851347637.21.1795372179488;
        Sun, 22 Nov 2026 10:29:39 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0818c1sm3882952a12.30.2026.11.22.10.29.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 10:29:38 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH 3/3] app-container-nginx: create /run/nginx and /var/log/nginx in rootfs
Date: Sun, 22 Nov 2026 10:29:10 -0800
Message-ID: <20261122182910.35849-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122182910.35849-1-tim.orling@konsulko.com>
References: <20261122182910.35849-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Nov 2026 18:29:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10178
Content-Type: text/plain; charset="utf-8"

nginx removes /run and ${localstatedir}/log from its package and creates
them at boot via tmpfiles.d or populate-volatile, which never runs in a
container. The nginx-dirs layer and NONROOT_OWNED_DIRS therefore find
nothing to copy or chown:

  OCI: Directory not found in IMAGE_ROOTFS: /run/nginx
  OCI: Directory not found in IMAGE_ROOTFS: /var/log/nginx

Create both directories in a ROOTFS_POSTPROCESS_COMMAND, appended after
rootfs_fixup_var_volatile so the /var/log -> volatile/log target exists.

Tested with the containers-library autobuilder target (aarch64 and
x86-64).

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-containers/images/app-container-nginx.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/recipes-containers/images/app-container-nginx.bb b/recipes-containers/images/app-container-nginx.bb
index f57c7887..c4e84bd3 100644
--- a/recipes-containers/images/app-container-nginx.bb
+++ b/recipes-containers/images/app-container-nginx.bb
@@ -47,6 +47,17 @@ inherit image-oci
 inherit container-nonroot-user
 inherit container-volatile-fixup
 
+# AI-generated (Claude Code, Claude Opus 5.5).
+# nginx deletes /run and /var/log from its package and relies on
+# tmpfiles.d/populate-volatile at boot to create them, which never runs in
+# a container. Create them at rootfs time so the nginx-dirs layer and
+# NONROOT_OWNED_DIRS find them. :append keeps this after
+# rootfs_fixup_var_volatile, which provides the /var/log symlink target.
+ROOTFS_POSTPROCESS_COMMAND:append = " nginx_container_dirs"
+nginx_container_dirs () {
+    install -d -m 0755 ${IMAGE_ROOTFS}/run/nginx ${IMAGE_ROOTFS}${localstatedir}/log/nginx
+}
+
 IMAGE_FEATURES = ""
 IMAGE_LINGUAS = ""
 NO_RECOMMENDATIONS = "1"
-- 
2.56.1

