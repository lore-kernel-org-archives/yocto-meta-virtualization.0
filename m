Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A04EC53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 00:03:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20969.1785110618517503340
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Jul 2026 17:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YdjqJcUl;
 spf=pass (domain: konsulko.com, ip: 209.85.214.178, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caf228a910so15773615ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Jul 2026 17:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785110618; x=1785715418; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fux7clwP4o0fPEJBa81KvYMuBgwntE9EcvW3b3JNqJM=;
        b=YdjqJcUlX8p0fQmzByVLVDUluROj1kVy1r0dNrg0XUeyn2plYNtd5u0GEl854ajShK
         xR+WrvtnaiR0CQSysTCuaLDOd9GvJDZ35l78heoTz/TgGgEKOO3aTEIObroaJKyewCV+
         jciADCTwHKQBHbJpANT9VQEnSHYKBVCkgubN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785110618; x=1785715418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fux7clwP4o0fPEJBa81KvYMuBgwntE9EcvW3b3JNqJM=;
        b=AJcj052wjHEWOdedg+EfD9etUmufuEwCuJSqYqS0m8Z1MOdNmCZXjD/sqJoezbgFSk
         T8hMKPtpacs176dQC0pYH4dzCg2XEMJNmV1VxupXmQeAoQe1rRaSBmM7BPGuQ8lP8sFX
         fohhUL38gEg0jIcT9NnQXmkxuP5hmQ3JIFdIF+IhEYqYQiLVYWDVXFN/kRqDj9JB8o5j
         NYqGGx5B+UI3wzMyizq2MITK9/3jWqf1NTh7B7Xp2vlWJyInNGe2Y/kQjUGiL/vzmSVE
         9XgVVjUSyD4sFVIB/bt2ELw6PTh4+jlYkeWJ+DLVHJ/ditNqP0zJBuJZQtaqiKDHryv6
         6A7Q==
X-Gm-Message-State: AOJu0YwhAGa7EEbWbjpR/HAORg4iG7DwjxKR2dn+fxMjDMbnXzx8p73K
	sA7BDyPtco94Sz8oSV/QwPklMi1tVuEezNLT1n20q3WMv88p1i5evpwb+CF4vZE8YF2EmE5/lZ3
	W/Bgb
X-Gm-Gg: AR+sD10vejcv3BD5t0uvH3EveoYjgy9XyUxPyJnSVGRfjeaOLDRodZRPrMDf6p1nYZT
	iZJVY60FJT/uC5YfyfhKFdUWeR7SueZjGPDqoRwYgZCl59azDkuEtv59oBCJUVpmP9sGcXvdrDg
	SiqpsOitxSVRLkqvrOsRmL6B64jOdwAIZdJA6IeVjIDeMY5otgiJ3QnSM5J33wkH/hkEVBv9KUL
	LdvNIgdT50GnNcD4yS6FEOL9cPg90x3q1oVbNUN0hAPfORdjYHbM0cZfkBjnIM9GguOro9Yp6Y1
	gEOXpy6pqfnjVeL9y/Z5BgKmHeoAIb9/j13G7OkDOCRWeokbFfS4uFcFkEkR5T5qxJVlb+Erix/
	Dzk5hTmSmYXyTX3CNKSBPKGHJpIIL82DLwK6SWMN3LxramBQmySHY8EIQ9mwmmorOOAuc2MsyOw
	5ORG5DJagX+xu66wqQxpU=
X-Received: by 2002:a17:902:d4c5:b0:2cf:a1c1:c60e with SMTP id d9443c01a7336-2cfde78b67dmr62093575ad.1.1785110617829;
        Sun, 26 Jul 2026 17:03:37 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:4c93:d927:aa69:60a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2b44sm25048625ad.27.2026.07.26.17.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:03:37 -0700 (PDT)
From: tim.orling@konsulko.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][RFC][PATCH 2/5] container-yocto-builder: drop redundant IMAGE_INSTALL
Date: Sun, 26 Jul 2026 17:02:43 -0700
Message-ID: <20260727000247.1623785-5-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727000247.1623785-3-tim.orling@konsulko.com>
References: <20260727000247.1623785-3-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jul 2026 00:03:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9982

From: Tim Orling <tim.orling@konsulko.com>

We no longer need explicit IMAGE_INSTALL in multi-layer
recipes, it is handled by image-oci class.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-extended/images/container-yocto-builder.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/recipes-extended/images/container-yocto-builder.bb b/recipes-extended/images/container-yocto-builder.bb
index 0dba4c31..1a0a1c56 100644
--- a/recipes-extended/images/container-yocto-builder.bb
+++ b/recipes-extended/images/container-yocto-builder.bb
@@ -25,9 +25,6 @@ OCI_IMAGE_ENTRYPOINT = "/usr/bin/builder-entry.sh"
 OCI_IMAGE_AUTHOR ?= "meta-virtualization"
 OCI_IMAGE_TAG ?= "latest"
 
-# All packages listed here to trigger builds (multi-layer requirement)
-IMAGE_INSTALL = "packagegroup-yocto-builder"
-
 # No kernel needed for container
 IMAGE_CONTAINER_NO_DUMMY = "1"
 
-- 
2.47.3


