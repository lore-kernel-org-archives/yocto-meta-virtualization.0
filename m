Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53019.1795437684701073825
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Nov 2026 04:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=haTq2qt2;
 spf=pass (domain: baylibre.com, ip: 209.85.221.178, mailfrom: rnunez@baylibre.com)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eac319a6c2so2330602e0c.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Nov 2026 04:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795437683; x=1796042483; darn=lists.yoctoproject.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ch/afUEJMsxBnFTiALYrRLStZuSkXDSbA8UivQX19VE=;
        b=haTq2qt2hHWQWtmwIY9G3xIX+rX0NdXOw8A+5tX2rj3+Xn6k0GHRTSi5GyjvPw7898
         pN4N5VrwvWK6B4XXR/Ml1F5JKl08gF/lunVjTClbh7E09mzimYP0CERxSHKtt0Xew2tu
         Stiiwi3t+9MgGTadM6Xl+v5UHZPufTRKzkWrAIQDQU+QGyHFZcsRLZhWt8dbvLHowZ3B
         ku4BDHwA1yRPWXeBuL0GVUizu5ybNqoJT6k9udh1pTzpq3e31s2X5lCNmH5gYvhFA5Sv
         mwbSOM03xxuj56dgaQIXQhcC7OrQtE1Aur9fwuqH71MROuhmVMqViqPRxFS7w03rPPFv
         I/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437683; x=1796042483;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ch/afUEJMsxBnFTiALYrRLStZuSkXDSbA8UivQX19VE=;
        b=TCq3+K+SzixbD11DIYnFCpEa830mg6RZBaVFQDH0XAvIolFCcCq2ZHBL01d3olAvId
         9YzY4MAtHR7ufo+vaTxbn5yuVy/5Bee/X/wl+QmwLYnpQoEdcbLHBJX++EN4g1lnlkeu
         KcPDCATn56enZlQQyTVZZYsHpjTutpEqf+ba4o34b5Krb46sigFrNAmINCP5WVlLKvYP
         otHCTU80eVEfLnLMsOHhY0MFR4rh48rAylIeyPwDjibS87kNhlQYI4xq2Y4JQ/9S6ari
         UrfwwltrHf0hWRm5kPflGkmoStXQzqMU+YZMc1fbUqHMPTcfLu6Y72zoKvYwGoohwn1w
         TpXw==
X-Gm-Message-State: APuU4Z8FJ/z4gYJX4I2I/gmCW5oUHVe1jilmvmPwbSgo8mdoH0+QoWfG
	fPDbi7/Eltpsgc1a3dPFPWAqaeR6XyAHNFwlwjEe8z9lQ+Ho3pNUQWDRLJf/SKf3JOaYEnt3aMb
	XNeam
X-Gm-Gg: AZFdTZfcVVhmRoinE/+zfYE5yrDJfGTysAdAg0BATbTWSS1nITGrY7kQNjS4XfLPIe+
	KuNa+OOgzNkYKG/BSAcN2qwnsBrKz9QR9b03ZMKhHvDOfW1okSeje0DKZmNuauOTAlk8AgkpUJh
	2d2okzTtfHv1h6Hh3FoQQwsLy0i4Ta5UkkT3YyERwlla9hxbFauKyql8DHVjK5W93hpEwccBL71
	O9Jy8JO9IkNO/ef476vSRLearasfrHY6eUEB0nk2KbcPijWivLP6JCvcDkzauOD5SNldsNemH1k
	7ggyhuRaa2hFbluyTU/DPDzKLc+giJG+xuPZZs1bGPL0bkoJpBR/u9E7Q1zjrn7CTIK0KHKh1jB
	DnnESC5hkiqqePrcJHO4RIOJipGStfFv8TZTbXqMt2sc1InRMCOjTcAaslg7sdxMKUYYUxRFsfH
	Ug/wZylxvc1StdgbV4ScmQMQscB8D0HGyKoeY9/+tA5jbwAoAEgSVdA6Ajm9Mf/4T7u2qtJCknq
	tbCXAHxD9mwpaZQ9L6EbX3J0+H1r3gFXmu5jRcg22eXzmiGwkY98bDIc0Z0FAO7WGHitfSIBIiK
	PUxNryuTGnPfNNWAX1V8Ztd+tQ==
X-Received: by 2002:a05:6122:1352:b0:5ea:d247:adb0 with SMTP id 71dfb90a1353d-5ee8aec0273mr5231504e0c.4.1795437683562;
        Mon, 23 Nov 2026 04:41:23 -0800 (PST)
Return-Path: <rnunez@baylibre.com>
Received: from [127.0.0.1] ([2804:7f0:7543:4532:5471:ddc9:4fc9:5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b5bb61asm10586564e0c.10.2026.11.23.04.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:41:23 -0800 (PST)
From: Ronaldo Nunez <rnunez@baylibre.com>
Date: Mon, 23 Nov 2026 09:41:19 -0300
Subject: [PATCH] xen: fix sstate namespace collision
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-sstate-collision-fix-v1-1-ba36dfe1ccdc@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAG40BGsC/x2MSwqAMAwFryJZG7ANfq8iLoqNGhCVRkQovbvF5
 TzmTQTlIKwwFBECP6JyHhlMWcC8uWNlFJ8ZbGUbYyyh6u1uxvnc91/GRV5sqSairibfe8jXK3C
 e/+w4pfQB7JT0imYAAAA=
X-Change-ID: 20261123-sstate-collision-fix-735333853d9d
To: meta-virtualization@lists.yoctoproject.org
Cc: Ronaldo Nunez <rnunez@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Nov 2026 12:41:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10180

The sstate namespace is defined by PACKAGE_ARCH which defaults to
TUNE_PKGARCH. Building for a second MACHINE that shares the same tune
will fail due to a collision on that namespace.

Set PACKAGE_ARCH to MACHINE_ARCH in both recipe include files, so each
machine gets an isolated output namespace.

Tested by building xen for qemuarm64 and for a qemuarm64-derived
machine with the same tune, both now build.

Signed-off-by: Ronaldo Nunez <rnunez@baylibre.com>
---
 recipes-extended/xen/xen-hypervisor.inc | 2 ++
 recipes-extended/xen/xen-tools.inc      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index f448564d1f96634605ec97658d48333ff6dd96d8..40d2e472aabc0ad3236c3325c0d16c818ed35e13 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -11,6 +11,8 @@ COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux'
 
 inherit deploy python3native cml1
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 PACKAGES = " \
     ${PN} \
     ${PN}-dbg \
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index f38cabc2b1766ceb9b2a64f48eddc37e413a5cc6..2a18fe1e3613e45f4755cbb0767bebb537db0f24 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -6,6 +6,8 @@ COMPATIBLE_HOST = 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux'
 inherit setuptools3 update-rc.d systemd deploy
 require xen-blktap.inc
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 # dom0 network topology for DomU guests. Set XEN_DOM0_NETWORK in local.conf:
 #   bridged (default) - eth0 is enslaved into xenbr0 and xenbr0 gets DHCP; DomU
 #                       vifs bridge onto whatever LAN xenbr0's uplink is on.

---
base-commit: 89b00d096a432000766729cd721ae647af500112
change-id: 20261123-sstate-collision-fix-735333853d9d

Best regards,
-- 
Ronaldo Nunez <rnunez@baylibre.com>

