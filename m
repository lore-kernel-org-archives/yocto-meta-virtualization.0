Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.5097.1581746819889190927
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 Feb 2020 22:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ETs3XNDa;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: jpuhlman@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id i6so6047826pfc.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Feb 2020 22:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=Xn7EZoiGjUEpW74Mg37XSwDqbahU5FDt9unOAhaA6jU=;
        b=ETs3XNDaa5oEUtw76/0aseiaaGUeu5UIZLMQvgecG6/g25kT44zW7zt0EkyByZFU79
         PnJpSELFq4j1IT6UiRQhwqpGaX7CjUqCFH+8+F/fUKBG04uq81ilyEmuSDopIHeW/mPD
         6QM/uf/R8DcBPLDC7tvj4vlHMyKButGMZg2RehIkDUUVp9zk0hbLZ4PVHsJX0je5Ftd7
         N36bJCAEXwDfWSMV5DWxreSh//AjGN4QOguloh28OffvAgSxajLzyyZSFvUs6LTTyRfz
         OYrN+dznvJFjOZ1M3fXqT+RFwk5ACdqSZEu5vMangQDdoMVO0i3XCY/MZkJAFYJFtSOp
         UvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=Xn7EZoiGjUEpW74Mg37XSwDqbahU5FDt9unOAhaA6jU=;
        b=lX1gZMTDFJQnC3YGjuAssVSR9AJpMDNniIdImeIrxJ+3Z/CKkIoi96zyBiWPB0RApf
         zydqAUVBeK1p8E390u0+prTbsjO8L0K0/PbxIOMQ+7y2rBaRkXFK89KLrCTznUUM+AIL
         Dk/9omb9eyEa8Vrhl/Cii1MtYzJJLVJLxptlsqkIhQczQNYqaTdXfdakvTzkeIDjP/bo
         oCscq4Jmm6/935Jiy7TsGR3sEauOvF38ISCIb2dwiVzz9DM4czZRxzBF5D7CLph/wGsO
         82/KoorKjvIBzklLlw0DWmbazoMRTalzlXSFH7Yt1MJbcxREMOxmdsJ3SLpZ21Guozbd
         SU/Q==
X-Gm-Message-State: APjAAAUIVV5VEiCV1rkwJBrifSQYqCF30BCf+K9t7iKidLYH76OHF5Pn
	t7L1QMUFZb7wLsAJ4cInlyVj9skiG4lbnw==
X-Google-Smtp-Source: APXvYqxE5CUOUvbWUW2j4pFDamHSANuQnF3jChwkA+EShSbfX6fpvzYZCcSp/5O9i8QLn/W/vrRnuA==
X-Received: by 2002:a63:ec0c:: with SMTP id j12mr6964892pgh.78.1581746819020;
        Fri, 14 Feb 2020 22:06:59 -0800 (PST)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain ([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
        by smtp.gmail.com with ESMTPSA id j125sm8764928pfg.160.2020.02.14.22.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 22:06:58 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 05F612A04B2; Fri, 14 Feb 2020 22:06:56 -0800 (PST)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [meta-virtualization][m-c-s][PATCH] python-novnc: typo from distutils sed fix
Date: Fri, 14 Feb 2020 22:06:55 -0800
Message-Id: <20200215060655.7821-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3

---
 meta-openstack/recipes-devtools/python/python-novnc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-novnc_git.bb b/meta-openstack/recipes-devtools/python/python-novnc_git.bb
index 4898bae..3f36ef5 100644
--- a/meta-openstack/recipes-devtools/python/python-novnc_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-novnc_git.bb
@@ -11,7 +11,7 @@ SRCREV = "3b8ec46fd26d644e6edbea4f46e630929297e448"
 PV = "0.5.1+git${SRCPV}"
 
 SRC_URI = "git://github.com/kanaka/noVNC.git \
-           file://python-distutils3.patch"
+           file://python-distutils.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.13.3

