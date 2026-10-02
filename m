Return-Path: <aleksey.vasilenko@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5811CCA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 11:03:55 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9191.1790939033558291653
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Oct 2026 04:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d17qGOTE;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: aleksey.vasilenko@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c20ce3c118aso549746966b.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Oct 2026 04:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790939032; x=1791543832; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7KaRwb1SDn71C6v5EpEnmR4fcVkBPIq6IFZYH76sezE=;
        b=d17qGOTEXzcpDx5n2xxLqm5dGJqcY5s/0QSyV3u//4ANrH/OvEBOqV1tQAvOqv4kH5
         kulqXqmvkdY0Pu01RDIFNPLHl94b8eekXtYXMPjUR9U2/yQjvuuXi0NG4I/xYpPGE2Ji
         hlFK4bhXoqSfJySWlep1bCcMVhrAMSm0SNw6OhhisTkyx58YabVkY7Emf80KvGBV1S+e
         4PkILsNaYMJU9WskYFgjLO2USgGtcsfQdcTQF0/bvdmtn8dGtairJCkIZpBywat/g81I
         McaQg7g7J4LT6AZx8vytEViSTTWscCEbwolL1ULLcmRIipPWxZLHSf9NphdOmjwdecT2
         mOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939032; x=1791543832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KaRwb1SDn71C6v5EpEnmR4fcVkBPIq6IFZYH76sezE=;
        b=TxKV8qubziLmX9sgPTW5R98y040VXcKE0Sp94HsE8FNrRetnhKE73zPdYig2sbCESD
         JAXlGWxoZ3X9qQi9bAs/sqhFkWtU1yFUY0Gnuq/LKzQ9CakPd0VixUM3fNOiJ5daQKt/
         wzRiMCGbg8RpAWYbaBpCn2X0qo7EXNi8QIhwqDXM19bdjqtOr5rNlBQYfrU8rQbrqgBv
         C9jR7QOsulOjrjQro+FzxZrNQwGRRRWEU5e/26ikcnLx3Sh+6EaAZ7WspqoEoFn5oTuP
         UURKwpe8/f4oVoEKFmwx0W/BSCCf4wO/Ruj8JGDIczSjTKFQOTEkRq5W+usb8KZBLo54
         FReA==
X-Gm-Message-State: AFuF++ljABwjc7ftLSgsKtCIn1c9VUWGonwylDl/zrNyjlaNASVMFZzg
	zSOJCOHCIWegcYkuFd9JK2P0K0JRzEENtBqAWo0e0O/JXUVLMCExyvqlMBEZAAQR
X-Gm-Gg: AYBFou0Y12MYUdWHfZDwjMohsgxUiWNLtafq8CKnaD3Q+V/6NWUs0Hd9RcSGfwHzSS4
	t0Nl1ztX2f3PsKExzPPgjhWa0HXs77MH2AXl6Xe8uUlyQJMd2a6GImK4QD1Yg+Ctt6Wz27bdWiL
	zrWZsYeJXKDnxgau9FmH6Bb6zlgdcyrVHsaSay/ZZ/vXB7qJdEIqn2BKxsGYqVMIXMIAQrHLKOL
	2meM5oej4Pw1TMtLebInsMo+YZePxMgS+uNjaXFHkYnb8sw9U9KStUAQUmVeUBP+FYy16GKg+Cx
	p/YporBOZUIBaa1YvqdxqTonjbAiB3pETCYQoChiiP7lGzhxIcN0vzyhvWKjDHc5i0M7HdFn6oq
	SYX8S6gbaPp+L8EfCARoTjM1h23Tl+LFDerHzHJxVffvZ6av/VJL0XASoipEigC7Pxc6zIxndmG
	SpoLfA3fQGcH9OncyOWtx8piV0meqHD60KH3ykhPbGMzN89KpJueKK7PMM8U5pm1eOR7J6CZZMz
	zGUx/8wGiIOr8OAJ2wT7rtciGAcUPTmurkg7r0AVLydan7ixHfmEC+J7bWd0KtuhWpyz/Ofr3Fz
	97iA/N4B73cHmZdCLGk+VT4sAhLhaofFxxsfN9GhgpDdiKuM2GM=
X-Received: by 2002:a17:907:c499:b0:c2d:b9b4:f4de with SMTP id a640c23a62f3a-c2e33f7d7b3mr431659666b.18.1790939031124;
        Fri, 02 Oct 2026 04:03:51 -0700 (PDT)
Received: from zen.reindeer-goldeye.ts.net (host-176-39-72-164.b027.la.net.ua. [176.39.72.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cfa6560sm74454566b.75.2026.10.02.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:03:50 -0700 (PDT)
From: krant <aleksey.vasilenko@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Aleksey Vasilenko <aleksey.vasilenko@gmail.com>
Subject: [meta-virtualization][PATCH] containerd: add -modcacherw to GO_BUILD_FLAGS
Date: Fri,  2 Oct 2026 14:03:47 +0300
Message-ID: <20261002110347.85140-1-aleksey.vasilenko@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Oct 2026 11:03:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10101

From: Aleksey Vasilenko <aleksey.vasilenko@gmail.com>

Because containerd overrides do_compile, it misses the standard
-modcacherw flag from go-mod.bbclass. This leaves read-only files
in the build directory, causing permission errors during cleanup
tasks like rm_work.

Explicitly add the flag to GO_BUILD_FLAGS to fix this.

Signed-off-by: krant <aleksey.vasilenko@gmail.com>
---
 recipes-containers/containerd/containerd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 3d74cdd2..b1fb3115 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -58,7 +58,7 @@ do_compile() {
     # cannot find package runtime/cgo (using -importcfg)
     #        ... recipe-sysroot-native/usr/lib/aarch64-poky-linux/go/pkg/tool/linux_amd64/link:
     #        cannot open file : open : no such file or directory
-    export GO_BUILD_FLAGS="-trimpath -a -pkgdir dontusecurrentpkgs"
+    export GO_BUILD_FLAGS="-trimpath -a -pkgdir dontusecurrentpkgs -modcacherw"
     # As of v2.2.0+ the GO11MODULE setting breaks the build (linking errors). It doesn't
     # seem necessary anymore. Leaving it here for now as a breakcrumb if other errors pop
     # up
-- 
2.56.0


