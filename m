Return-Path: <dylantdmt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BABC46467
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 23:24:23 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.134614.1669677861378771242
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Nov 2022 15:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jLZbIVl3;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: dylantdmt@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-13bd2aea61bso15083636fac.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Nov 2022 15:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LO6pmwRWCdsqmtdpQE4iW+vdMxpLPnCDNmgYueUZGs8=;
        b=jLZbIVl3/BK/OlrtT28ntesrxlSUWCb2cdfpAgt2Qs6y7ORe8OMyg1J7vIRHXrl1n6
         xcDnKj4Qv5wkcyfRp+1GGAodGhLv5FU5b3wjQDdTzdQ/Ud/djLZYdDOTaUcXw2vtKEkM
         RVC5fWoGWXvN+v/gVO7DLZhzJT50Amqj07Fc7SurgIbxxvMcJrlPiwrSa7ltRTeWylbf
         dRFnLbPVrOJiouaONzI8Pqp5cBsThCw7+VCuIsfPU6vdsnKg2Cr/pcRQ8HV6kT+rV7bW
         KhOV1Yh25qRK1XGnxF8lRvrNesSdKPayQBgVqXQ1D5f/pEZTUr8XdFogOIRH7LFFaZ8C
         ZHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO6pmwRWCdsqmtdpQE4iW+vdMxpLPnCDNmgYueUZGs8=;
        b=LadWR9nyyc9XPLHDuAvTQ6eqCsL8t3CAyvMOErxGRHEogyG1eqmwTVEj1wzUQod/K8
         XKSoKXml51Z1ODwFVNTJVvtu+/ukjXeZwyxblNFsunVKVksZ8JiYo5/1SoU6iwj8u8Xn
         ZsiMmNV6xpjrgZ74eeY8cXQbh89lNUZ4FTZNrVizL+w++BHmVtZ2TKmgpwmAfTPOffhK
         SmycPALZn1wY864nwlXcusxVSapxSb8o+qlNrirOHSuIPpoE8smknpdogw71WylLRxc+
         DrmBt0IOgWx0cqDQ5YnBtITVtOgw3GBS3Hzr+NN+G8otiestPLIJ4936ow8HdLBLf4eG
         /qjA==
X-Gm-Message-State: ANoB5pmWDtcusSZEKLz9yGywOI04zCj3VO7JEbdr2kmBcCJRD6PytKIY
	n4kszG0UvIESzO5XIOEQMD2lwSVeXF0=
X-Google-Smtp-Source: AA0mqf7YpOed12pphvMUclrsn2iA0JoY7NGaFF+juvWcIDWLcFzS9byh3+ZkSgxKpCRLc+b36F9oCA==
X-Received: by 2002:a05:6870:4610:b0:143:93d1:8533 with SMTP id z16-20020a056870461000b0014393d18533mr6638137oao.132.1669677860565;
        Mon, 28 Nov 2022 15:24:20 -0800 (PST)
Received: from dturner-linux-box.ni.corp.natinst.com ([130.164.62.28])
        by smtp.gmail.com with ESMTPSA id 90-20020a9d06e3000000b006605883eae6sm5214171otx.63.2022.11.28.15.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 15:24:09 -0800 (PST)
From: dylantdmt@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Dylan Turner <dylan.turner@ni.com>
Subject: [PATCH] python-psycopg: switched from distutils to setuptools
Date: Mon, 28 Nov 2022 17:23:00 -0600
Message-Id: <20221128232300.14201-1-dylantdmt@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Nov 2022 23:24:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7702

From: Dylan Turner <dylan.turner@ni.com>

---
 meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb
index d054214b..94787e6f 100644
--- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb
@@ -12,7 +12,7 @@ SRC_URI += " \
 SRC_URI[md5sum] = "9e7d6f695fc7f8d1c42a7905449246c9"
 SRC_URI[sha256sum] = "eccf962d41ca46e6326b97c8fe0a6687b58dfc1a5f6540ed071ff1474cea749e"
 
-inherit distutils3 pypi
+inherit setuptools3 pypi
 
 DEPENDS += " \
     postgresql \
-- 
2.38.1


