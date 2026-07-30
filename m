Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28810C55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 13:40:37 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12021.1785418830920642971
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jul 2026 06:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qdNyiWKh;
 spf=pass (domain: konsulko.com, ip: 209.85.214.176, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceab75934dso25206275ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Jul 2026 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785418830; x=1786023630; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUQB9R6QWjXWGNcPD3mcykG2nOgE9KHNPBJJsLvGs5Q=;
        b=qdNyiWKh4kc9kS0U3iTSxDNssMueHq9A8HWMsbWIXfExpR9T5PlJ4/THyPal4xtjAH
         pJLDwZoxueuAM7V9Jqbn8Tup9O+XGC3yOSj4x5UAg1E2BJosBxYMd8pkpzhkB8VciKli
         84SmqS4uEObJsEbewhc0B9GQ+CbI5+VafG9aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785418830; x=1786023630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GUQB9R6QWjXWGNcPD3mcykG2nOgE9KHNPBJJsLvGs5Q=;
        b=O5QqTX5ymAoq+K/eQBz4rOAb1v1h8sPaa+Ml3kHivzNjPKoF8bP1F88Rx/8x7sHRJO
         xL2N4xmZ86Q035pba4qJbd84ZsmwzIT9YxTLgrXuAOLKD8rdT9ShkvDLiqj1MDxlMztJ
         /tM9X5/yDRR4Bjb4zE2GgKBsMLnstU+m01zS8mFnYCc0cWnBAFmbm+L/6O8E2+LedCBP
         dZr0L9O0pW53l+cYc7utwzAOfVvvKeHNN8qqOdMY3RG1eBZ1niFxDK157Gzp9XS+7o4h
         BryEjmBSvtkWyA5tEuJcHYbUxfQtuytlo5SPM1E6+LMviNXFzoV8Grfy+ndeV6UMsZxd
         9u6g==
X-Gm-Message-State: AOJu0YyZet3w7XDx9kfUZlLzHDy6Q6afQVkcvTEP0uvajEMJZ2o5Dy47
	MED9wiDhxnEbJMpASKM+fQVkSxnDLc3SKy9AFpLHRHs+lGMNfD+iwxw1ai8o03xT9FQVvfF1V+a
	xQt3D
X-Gm-Gg: AR+sD12Q5Q8Od6Kdj4/HD5nO71Hhpti9EICq4XyKdLfL9BXDqKpsh2MvhcCJvm2Y6gy
	uMCnDwb3+q8rLlMnKUiii/q5szSc3izjAHlVaG8OrM9GGB+/su5/jK6xqPmpX5l3S7ndn50pnAQ
	bV8L4oI4/W4NeAT94ThA2KIw7O+DMxlqMMBq1rvG1gpMmaCaH+XGjqODmnQucweQ1UGoNa5vHUj
	Soh29xlcEqol8tCXKHM0NyfWQfpcCH/ucOoa6BxUNTp0lUvb/Mye/6k8MSecSR1NlBGZEtUItkW
	h4p6mmwIS8PSutUuuiiOZyd9ANMKAwoXjQE4Pdxl/FSX8HHjchFM6KCJAz2EjPiM7JqOxUxvT2x
	XrYPHMZBh89zgVwiUjHsO7h3FXMncoRNBa50L4TpXd6YS5u21Yc09xMnoUgG6GMY9nKu8bv8N31
	eFhoq9sQsBYt2CuAaA5hdHKIDjfFiC+IRtw0ThU8srmCnVnroRcJsWX9Z/on6MJzDlXwsPfl7TS
	xAdcZNx4hn3+DnLhvb/aa5ZgKp/HETSgeQ7MCA=
X-Received: by 2002:a17:903:18b:b0:2ca:c4a5:84bb with SMTP id d9443c01a7336-2d035d1a275mr25491755ad.38.1785418830199;
        Thu, 30 Jul 2026 06:40:30 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a45f1esm27519615ad.20.2026.07.30.06.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:40:29 -0700 (PDT)
From: tim.orling@konsulko.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 1/5] vcontainer-bbmask.inc: add python3-pexpect,-ptyprocess
Date: Thu, 30 Jul 2026 06:40:09 -0700
Message-ID: <20260730134009.1547930-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727000247.1623785-3-tim.orling@konsulko.com>
References: <20260727000247.1623785-3-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Jul 2026 13:40:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10019

From: Tim Orling <tim.orling@konsulko.com>

For container-yocto-builder, the container is the "host" and so
we need the "Build Host Packages" equivalent in [1]. When
we are building with mc:container-aarch64,-x86-64 multiconfig
and the vcontainer distro, we need python3-pexpect and its
dependency python3-ptyprocess to fulfill
packagegroup-yocto-builder-extras. Otherwise we see a build-time
error like:

ERROR: Nothing RPROVIDES 'python3-pexpect' (but mc:container-aarch64:
.../meta-virtualization/recipes-core/packagegroups/packagegroup-yocto-builder.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-pexpect' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-pexpect']
ERROR: Required build target 'packagegroup-yocto-builder' has no buildable providers.
Missing or unbuildable dependency chain was: ['packagegroup-yocto-builder', 'python3-pexpect']

Remove the layer-wide meta-python BBMASK and allow these
specific recipes.

Once meta-python is allowed, there was an error for
meta-oe/dynamic-layers/meta-python which we do not need for the
above recipes. It can be enabled in the future when needed.

[1] https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#build-host-packages
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 conf/distro/include/vcontainer-bbmask.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/conf/distro/include/vcontainer-bbmask.inc b/conf/distro/include/vcontainer-bbmask.inc
index 0c9b8b02..572ebc4a 100644
--- a/conf/distro/include/vcontainer-bbmask.inc
+++ b/conf/distro/include/vcontainer-bbmask.inc
@@ -94,6 +94,9 @@ BBMASK += "meta-openstack/recipes-dbs/postgresql/"
 BBMASK += "meta-oe/dynamic-layers/networking-layer/recipes-core/"
 BBMASK += "meta-openstack/recipes-extended/libvirt/"
 BBMASK += "meta-webserver/recipes-(?!httpd/nginx)"
+# To satisfy RDEPENDS for packagegroup-yocto-builder-extras in mc:container-*
+BBMASK += "meta-python/recipes-devtools/python/python3-(?!pexpect|ptyprocess)"
+BBMASK += "meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/"
 
 # ---------------------------------------------------------------------------
 # Entire layers with 0 recipes in the container image dependency graph.
@@ -101,7 +104,7 @@ BBMASK += "meta-webserver/recipes-(?!httpd/nginx)"
 # does not warn about zero files matching BBFILE_PATTERN.
 # ---------------------------------------------------------------------------
 BBMASK += "meta-filesystems/"
-BBMASK += "meta-python/"
+
 # Warning suppression for these fully-masked layers is in meta-virt-host.conf
 # (BBFILE_PATTERN_IGNORE_EMPTY) because BitBake checks the base datastore,
 # not per-multiconfig datastores.
-- 
2.43.0


