Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5088.1795654088921889294
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 16:48:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hAyW8Baw;
 spf=pass (domain: konsulko.com, ip: 209.85.216.48, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso2746133a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 16:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795654088; x=1796258888; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SbK9lLArxah6ffgVkOji27/BZZ4+c++pM1EKKS01Goo=;
        b=hAyW8BawRST3JrAiESF/VtjgwWm4DhrAApAGlhiqVLgp6SSqreCwCGFnu+Fq8wL7aj
         5QxIKmkF3Grt9b3aelgRwTOJtvYeJHk0iSZ7B73npIWVJRaq+pYS5IQxgunyGDwUJEFA
         F90YeqJ/jskWj84g1+wbG8TciElzJ797d26Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654088; x=1796258888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SbK9lLArxah6ffgVkOji27/BZZ4+c++pM1EKKS01Goo=;
        b=XPA9od0QwhpPRwQbbuqbqdsVzHF6+mMwVuzVHK7Pi2ZT7g9ZYThxXgcCNHDsIlE74N
         RIhWfdJce/le4ER3E9IZHqEiV9RIy4Oi2NuqkrMT6VCYyEYLt5RiCf4YvKz+1ZAWXdNb
         DtKU3WQYgiUmzjeUugIhLPG1mrVVnDYMf4fjXusJpUz4ZWELuijDA4zZE9GFLSX3D191
         1S5LFmy+VTnhGZGyX/ds9zIntQ+s5OKBO7+YVfDnI8pcqpYom4jMTDFRYg4/3DHDVX0U
         4l8EnsVH2StjwAkM8MdD0ymPC6/t3VuTT1lLNG+3uv7RuAuVw4GjuSj3qpV0AHjrIDM3
         7rsg==
X-Gm-Message-State: APuU4Z9Xh8QFvwdUtPahh6nK5SX0RKWDkiVbifw2snd6Y5ezGeKC2OZ5
	w8glPKlk3Il1/gdPIZk4G5nblvktBl2EOlJEPBGDuM1C4T/FxJVSRrbIAd0QU84jZm0SNu/YEXT
	fwbE3J0Y=
X-Gm-Gg: AZFdTZdLALVAQvUwozi/ruzAndQSvFdRbGn7S5Pt8Eqo2zDn7zWmNlzkIizsvSrv8v3
	Sj5k4pn368/QGdu8QsHtt7xvnE7Ngg9KrdlJQQXdTq66DpmN6G63i3u5vQJ+Y8yEPKluBJVNm3v
	ZteKAzc5jq9icZ1j673uCT4UnX/RtMSd/oY3SzZvx0pqRg4cLNEIG8FmLRbaS32+h/h4lA3Kb0a
	IblX6nzV5kQQGc1UM3uTKygrpR0DBAsHizpJwg9LtaW7ubrNaGe1jPrhCpB86vr0OwoxHRe1ojp
	JLSU08egrK5cKGJZFRBs1z4+4EaCRhh9eVL+8NELxj7zbH/fCxqQjUM+XPIibvJWtk3FWcIbzu1
	4e9pkpbVUH7oV8Q1jTdDQ8xr+1gKcltJNA4DF5H7Kly98pF7DhZRowoJXcU708dwbQndlukkaHi
	E9q2GccJKAFsj4EppLA4iHgX6hvImxlZefT5x4s/tF3mKCCxn/iBd0iCo5aIV0eeFAny9dFhg+E
	MiVoRGys/L2v12kDnvQl5bKwK3BtU0tGR7Gb8DTzONrGwWN003fHsK7Ju6JALPjiNXw2OEa6yxp
	WkbwEYyhEKELezIAZeBi9Gy/8UaAqYSQXk7BWkS1aGMlLKqii59Z+HfCPFJpNJCXXl4UT2pf3XK
	JU4mk0ftMN5GKfk7TMt3Pn+NX/2mETc0y2yG6NA+24SW9oB/KdPN3OI+VlMM0jJAskio=
X-Received: by 2002:a17:90b:4d10:b0:3b3:ce10:7659 with SMTP id 98e67ed59e1d1-3b41c7ac261mr18676991a91.5.1795654088237;
        Wed, 25 Nov 2026 16:48:08 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from localhost (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm30981438a91.1.2026.11.25.16.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:48:07 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH v2 3/3] app-container-nginx: create /run/nginx and /var/log/nginx in rootfs
Date: Wed, 25 Nov 2026 16:47:56 -0800
Message-ID: <20261126004756.89781-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126004756.89781-1-tim.orling@konsulko.com>
References: <20261126004756.89781-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Nov 2026 00:48:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10191
Content-Type: text/plain; charset="utf-8"

nginx removes /run and ${localstatedir}/log from its package and creates
them at boot via tmpfiles.d or populate-volatile, which never runs in a
container. The nginx-dirs layer and NONROOT_OWNED_DIRS therefore find
nothing to copy or chown:

  OCI: Directory not found in IMAGE_ROOTFS: /run/nginx
  OCI: Directory not found in IMAGE_ROOTFS: /var/log/nginx

Create both directories in a ROOTFS_POSTPROCESS_COMMAND, appended after
rootfs_fixup_var_volatile so the /var/log -> volatile/log target exists.

To reproduce, build app-container-nginx with the previous patch applied
and check log.do_image_oci for the warnings above.

Tested with the containers-library autobuilder target (aarch64 and
x86-64).

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-containers/images/app-container-nginx.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-containers/images/app-container-nginx.bb b/recipes-containers/images/app-container-nginx.bb
index f57c7887..9401b10b 100644
--- a/recipes-containers/images/app-container-nginx.bb
+++ b/recipes-containers/images/app-container-nginx.bb
@@ -47,6 +47,12 @@ inherit image-oci
 inherit container-nonroot-user
 inherit container-volatile-fixup
 
+# nginx creates these at boot via tmpfiles.d, which never runs in a container
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

