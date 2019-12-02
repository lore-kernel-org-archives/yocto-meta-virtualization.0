Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.6311.1575314856081035188
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Dec 2019 11:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oVlFy+DF;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id y19so740153lfl.9
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Dec 2019 11:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zKRkBCqkOXR4oz047TyppN48j9SQaq1+jCUM+RbGFpo=;
        b=oVlFy+DFVk+62vo8hTPz/cKlRJzyWAW6Zxn61P/63ETEpX637VuZkGspaV6LRT2kDM
         WW3mnh8429yErCTViIZXfawyEVekOgfJ4sk1+UCCZJstbgX+WZGF/RvP6tcte47oRAAv
         dd3h+s/vb3RBXGXY8piIfaC0cJPes6GyAe/GVsmpRhfbZ8pLUTja5cdk4yXStGbEFzWJ
         bx+vSxHV+drryVyVKFAU0LtpghbuOTF3ASyGgIhhCm0hwXK/EhDM2jxxOW3g8XGOOPFC
         niKQiXefZJHwlleeiI01CA4m+MzoAiSA0L+VprLwulRbmDwcBcLdlRWVDIzkG36xCn1L
         mIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zKRkBCqkOXR4oz047TyppN48j9SQaq1+jCUM+RbGFpo=;
        b=lYbLQHGE7t1CO7L09rb4H1JKdmvYpzjiphNM0qIrFYvAOAznW36P8AvYx+xdGSt7Ly
         FkyY794RjsT1f6nHB5QRPuGiDDR7xRTe1r3IcA/bfdm+yoKcN69cR3+hU2XAKc3WuF1i
         WVJJv839xqk6YZrLbYQGhVOWErrljDRbRbRGLk8k8i6l0rUkKzIkyFRvw5uCEq5JhUCR
         QFGMC27V+9cHrt2KCqBn//tnpg+YTR3eqV7uWDvzC3q6O8o0+t0/L7K6su/EVTgsoPMs
         tZ0yIPQfD95kbYuBBXw+jPw5rYENesax8Jq1H9En6nbU7+B7OWqo+6mIQpwW1XGL9SLR
         xpqQ==
X-Gm-Message-State: APjAAAWDkTfcBAEBZ0p6805NRo8fSDKu0ofaUBtOZu8Dqta6iLWKw3ww
	965w0d4OWtz+n8EketnndsUoYuEbveU=
X-Google-Smtp-Source: APXvYqzkckb5yspBOhdMjJWzRc7WFI0jfRggHqA2VyEZOM91lj8X4d9bAbpaJ61YBv2CmyxTNFnERw==
X-Received: by 2002:ac2:5931:: with SMTP id v17mr379277lfi.166.1575314854264;
        Mon, 02 Dec 2019 11:27:34 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
        by smtp.gmail.com with ESMTPSA id z20sm224534ljj.85.2019.12.02.11.27.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 02 Dec 2019 11:27:33 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	Qi.Chen@windriver.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization] [PATCH 2/3] python-docker: uprev to 4.1.0
Date: Mon,  2 Dec 2019 20:27:12 +0100
Message-Id: <1575314833-10994-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575314833-10994-1-git-send-email-liu.ming50@gmail.com>
References: <1575314833-10994-1-git-send-email-liu.ming50@gmail.com>

From: Ming Liu <liu.ming50@gmail.com>

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-devtools/python/python-docker.inc                             | 4 ++--
 .../python/{python-docker_3.4.0.bb => python-docker_4.1.0.bb}         | 0
 .../python/{python3-docker_3.4.0.bb => python3-docker_4.1.0.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python-docker_3.4.0.bb => python-docker_4.1.0.bb} (100%)
 rename recipes-devtools/python/{python3-docker_3.4.0.bb => python3-docker_4.1.0.bb} (100%)

diff --git a/recipes-devtools/python/python-docker.inc b/recipes-devtools/python/python-docker.inc
index a0ba60b..cb7c523 100644
--- a/recipes-devtools/python/python-docker.inc
+++ b/recipes-devtools/python/python-docker.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/docker/docker-py"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
 
-SRC_URI[md5sum] = "02491d168c048cdb99cc20d0b352ea0f"
-SRC_URI[sha256sum] = "e9cc39e24905e67ba9e2df14c94488f5cf030fb72ae1c60de505ce5ea90503f7"
+SRC_URI[md5sum] = "e1e8dc73e3220fe9eec1faf80b0290de"
+SRC_URI[sha256sum] = "6e06c5e70ba4fad73e35f00c55a895a448398f3ada7faae072e2bb01348bafc1"
 
 RDEPENDS_${PN} += " \
 	${PYTHON_PN}-misc \
diff --git a/recipes-devtools/python/python-docker_3.4.0.bb b/recipes-devtools/python/python-docker_4.1.0.bb
similarity index 100%
rename from recipes-devtools/python/python-docker_3.4.0.bb
rename to recipes-devtools/python/python-docker_4.1.0.bb
diff --git a/recipes-devtools/python/python3-docker_3.4.0.bb b/recipes-devtools/python/python3-docker_4.1.0.bb
similarity index 100%
rename from recipes-devtools/python/python3-docker_3.4.0.bb
rename to recipes-devtools/python/python3-docker_4.1.0.bb
-- 
2.7.4

