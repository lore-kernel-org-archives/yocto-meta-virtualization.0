Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.94825.1638376909456687219
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q6OCCWcU;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id e3so104381345edu.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ybx/sq1oV4wpmZXMu5k44z6xcGX5hved3LdPV1XQjj0=;
        b=Q6OCCWcUUqq21oHslhrIyvKBjaBh3kqO5ceS0JJTkoFKqlCs/NFW+AwKYn25tTeuBy
         pFK7PalvDDn549lffDPf6ghRVnZJQr6wHM+xu5OGr7e90h5ik6jWJlw3M7+tgq4FRGBq
         NgeKa9xVIidT3Yc8695myzdEJPKXD2j4wZ2tQkyVCHZQ95RRXYouSD5CU9MyhmmP09R8
         d2krD9GWLPSbvILOGPI1DisEhCAOmfQDVF3H1GHpAQUCcrhz7GuPj+s400y/prOrpY1t
         0fsVesfMJQgch10OMxvCfdb8/vwLQdwqfGnv70an+/rDxhAoSqXpjNDYRFh7lgRjujn3
         YUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ybx/sq1oV4wpmZXMu5k44z6xcGX5hved3LdPV1XQjj0=;
        b=7wV807B4VMvzNstW61mShtAZib2J7L7ercUPpmyi8wX6gFsdKpjxtN+KwH7fU6DOFM
         d5hhShI90BFfx+qEFY04MGrG60OeUA7UNdNXCXXKIabI2g7U7Hh5dRm0aI4KCoIAeyA8
         ME9COcUaGcirmTZxQA3S2YfxEszchPnIIEuSmJBi6CjOoMfAS7WL4D0+MctYASqseYyu
         ZdM1PjYwlbKTcMpe+AD3cftD5slkdeTMyTiPur7LHnBgCAvzNSqPHzShC6ihStcr9e3y
         5OvyWG0YFQLhMRv49OKd+VqqbuvwX6hzVTua/XsQMHrUSI6tPudTnvX9Jpf/RXQUrIam
         522A==
X-Gm-Message-State: AOAM531SmoVVdPeNgcR56X2Z+UEN/dAGdDuBLUYRtWkGSARL69WskN8O
	afJrrpwpEvchLvROUtm5jopOva/CuDU=
X-Google-Smtp-Source: ABdhPJz89aIS1u3t7pigJ+6HfuT4C69FsUFRSvhaxfa+Orf0m9ayC1sdkgNeRDhovJM/XbalTwcDAg==
X-Received: by 2002:a17:906:7954:: with SMTP id l20mr8192266ejo.143.1638376907989;
        Wed, 01 Dec 2021 08:41:47 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id sd28sm215910ejc.37.2021.12.01.08.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:41:47 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][hardknott][PATCH 06/13] xvisor: set PV
Date: Wed,  1 Dec 2021 17:41:29 +0100
Message-Id: <20211201164136.33802-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201164136.33802-1-Martin.Jansa@gmail.com>
References: <20211201164136.33802-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* use something more reasonable than default 'git' from filename
* there wasn't a new tag for a long time, so this is quite far
  from 0.3.0 as git describe shows:
  v0.3.0-231-g6b23764a
  but 0.3.0 is still the closest release I've found
  and matches PROJECT_VERSION in Makefile:
  https://github.com/avpatel/xvisor-next/blob/6b23764a1439f9d08b2ed2f363da522460d8a22b/Makefile#L29

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/xvisor/xvisor_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/xvisor/xvisor_git.bb b/recipes-extended/xvisor/xvisor_git.bb
index 85ac163..7510a8b 100644
--- a/recipes-extended/xvisor/xvisor_git.bb
+++ b/recipes-extended/xvisor/xvisor_git.bb
@@ -8,6 +8,8 @@ require xvisor-configs.inc
 
 inherit autotools-brokensep
 
+PV = "0.3.0+git${SRCPV}"
+
 # This version support the RISC-V v0.5.0 Hypervisor extensions
 SRCREV = "6b23764a1439f9d08b2ed2f363da522460d8a22b"
 SRC_URI = "git://github.com/avpatel/xvisor-next.git;branch=master;protocol=https \
-- 
2.32.0

