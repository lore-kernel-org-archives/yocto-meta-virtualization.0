Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B852FD2D9C
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 13:58:38 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40615.1773151110050574886
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 06:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YYw9v0EA;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439c4a93841so5019102f8f.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773151108; x=1773755908; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8huJ86zuCCyoOBRG9UZmg+p1KtdD8QJ9g1eAhyUPZFg=;
        b=YYw9v0EAU21jCrNOeL4AuOuz6VV9687aXTa2pCLH7FZ0LF/A5BENsC6vBlGLm3u14r
         oOqOu0UwncfOV3KTzZzH1R3/slPBpsOw4nPbCTFKG5dyJP8BU84yZhjwalMatmCpNjz+
         6RH7+viLSuZZ0gyuds5H/2tndGFbyjeru3DCOU6g7VCne9Th8dI1CtjUFpf96ZVt1Lw2
         iC/PLoqG2+gQ1kDBVXfG0PobWmJr1lAKMT2OBfa/MTUrbUn2vHwB/8C0XEuMMuLazSau
         wCfrA6Zq2XfP94/WFGsLDo/sl6+FGeo7dBqkkz1p7D+hnxDLAHzaOD0ok8foG1tbgfid
         h3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151108; x=1773755908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8huJ86zuCCyoOBRG9UZmg+p1KtdD8QJ9g1eAhyUPZFg=;
        b=mKgaA5tVebuWUVQJi2dHCMwmT8Ejt6j6Etvq0sTfLzj0wA/vZTFMUdSHIbJfkTnLq2
         At5D3i9VssaELQGwRbQms8uEi3/RI+Ny+noN3oVF0I1LEClOZXKqxElu8ujxZToXs+ds
         uUhL6Bt+VufQubhu4tIaNqne11oi02d1GgHJkunIkU0egYOVD4o+Bp5l6Z87j9qSJouJ
         hb3ApsRH8V7BENXCpB93oEVfefM1LJ/lXtVlTM1AK2qJ/tl1mejlkw+g0qK8/SD6AhoC
         4yxA3Sg0mxT/FfemEx3X2G7McGX7gqYVzbgK/edX46RgBN1UF9FG2vydoIfbojCU76K8
         4mtw==
X-Gm-Message-State: AOJu0YyV0kyyKN5yHvvi6PEjdZ7nDJ681L2zgc5CTCraGXFIHFXYSJsn
	nzzRpUYVzXlDRqdub9JodIIU8sh90wqo7+Nebb40lja8dXm6/70p/1kz0NQmpUz5
X-Gm-Gg: ATEYQzzYL4D6TaTh8of4SFbKnSMbYmC0I0lo15u8dcAvqmWqz03qDh4thDPDfSdGXBW
	bGr2AJtK39hnNh+TjJNVvIbU99dt1a3bFbhPRHqc1vOgc/ipOm7/lfqgQouaQ5QfTTYBC99UFid
	Ik5TdFY9n8fBJOD/Nd9LtXnoWXVT/aTNs2n3j+qojMFx7G330GrkiAYtcxDRPHLqdaWYWI4LOMk
	ltjCBVaUo9x7avHMe9GlwOYnYA3tZ9kndOOeCY2GIjndmi2uHC3Ahj6QasWWbbGu5MNdSCp6Dxw
	Tgp3Th2v/1s3nEm0wksl6WM8/RNFnMAUqIGCNgyICsE/uz2JOO/7u+dsbxMlw9xw8AknBFHvMs0
	cmFD8HWpu+BD0ESOnrBYc3nrzcO50mHkBUfMQnexU5YhUSFAptb/IhueSze+NRB7ymAuBzK6dM0
	fR9UP2te+ss6zcmwl7l2kmRc/B3ul/NEiy1LQM
X-Received: by 2002:a05:600c:4445:b0:483:6a8d:b2f9 with SMTP id 5b1f17b1804b1-4852690febamr278507005e9.5.1773151108376;
        Tue, 10 Mar 2026 06:58:28 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853a498afbsm132992015e9.0.2026.03.10.06.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:58:27 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 2/2] example-xen-guest-bundle: require xen and x11 in DISTRO_FEATURES
Date: Tue, 10 Mar 2026 14:58:15 +0100
Message-ID: <20260310135815.3353144-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310135815.3353144-1-martin.jansa@gmail.com>
References: <20260310135815.3353144-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 13:58:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9634

From: Martin Jansa <martin.jansa@gmail.com>

to match the image recipe from XEN_GUEST_BUNDLES

Fixes:
ERROR: Nothing PROVIDES 'xen-guest-image-minimal'
xen-guest-image-minimal was skipped: using DISTRO 'distro', which is missing required DISTRO_FEATURES: 'xen'
in bitbake world builds

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../xen-guest-bundles/example-xen-guest-bundle_1.0.bb        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen-guest-bundles/example-xen-guest-bundle_1.0.bb b/recipes-extended/xen-guest-bundles/example-xen-guest-bundle_1.0.bb
index 96e17275..70f12492 100644
--- a/recipes-extended/xen-guest-bundles/example-xen-guest-bundle_1.0.bb
+++ b/recipes-extended/xen-guest-bundles/example-xen-guest-bundle_1.0.bb
@@ -26,7 +26,10 @@ DESCRIPTION = "Demonstrates xen-guest-bundle.bbclass by bundling the \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-inherit xen-guest-bundle
+inherit xen-guest-bundle features_check
+
+# matches xen-guest-image-minimal recipe
+REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' x11', '', d)} xen"
 
 # Define guests to bundle
 # Format: recipe-name[:autostart][:external]

