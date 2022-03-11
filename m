Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D65C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 04:20:31 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.2222.1646972430158398574
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 20:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qACdvMHM;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id p8so6901163pfh.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 20:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vDRZJmZJu+XGWd/is1o1NqkcJvkJTHLeeLRHcLOUaGg=;
        b=qACdvMHMb/kb9JXT0YE4z59HrYcX1S0BMrjI2615seZbXKXn4/Pq40otl2loQ1jAzB
         4SIVmPT9awv+kMboGsA+SsppdVWJxnN3Gp4bjO62ELk5d0DzmWqOdqearhcrWLH+C5lN
         WOWkgWezSiDmW7IQU8jX+O+zy+qc0j5Otq3CrDkH9DXfZgLs/SJFTJZpjFUxlHyR+piC
         65vNbUMPv1/Yr/6zOi77hu24T38CKiWExZewWRXYAOqY9n/HSAgZY+Pv80rNSphEXR1/
         wsdVZta28qOKX1LC7wSxnzW4u3PzJr0qeaYfMerbacK8ePLeWSyAhaudDdDELbMfC5nr
         1zMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vDRZJmZJu+XGWd/is1o1NqkcJvkJTHLeeLRHcLOUaGg=;
        b=SiqnB99p3RLcOeXlaWukWN/eYhdku5f1+hlz80iQll/aW+UDj50lmM8mBZL9NzHiXc
         3jUyFZqcJw3H5OCIReV8U3atDwp8UOT05k8OG1CFNTTNiDkuVRl9GLilr+RUER7Dk0hi
         rk5wRnHHb4vAZ337rL0CAYxuxN0KFYXbEgR3vEWBI2WNISkaiJb/vCx7p+lShkwUg/c6
         FuJwoVlWHUt60/Gb3JQEQUgVjWqQixJTP7TH3IKZC1OBrQ+DWiy7p36SsufvbsrcKIBk
         VsEusT88nPs7CDBmd1ZdgK3xBZh3c3hrHBrv0STbJbNCyFysFc1jliqZrHF20aky9uOC
         jpYA==
X-Gm-Message-State: AOAM532I5ya3HMHpZlxCSaa64M/q6TZrqVWn7v3olFX6PCK2xeM1o/aP
	1X8/A/xXK66aHnwm56hVpq6iHJocAgc=
X-Google-Smtp-Source: 
 ABdhPJwuYZmCHK59hVMQ1xcsY/qgtLdgoe+KkL6xPwxwI9QoUG3rbB80kbeCfaw3PWYgq9TNGPZPSg==
X-Received: by 2002:a63:8441:0:b0:380:625b:bbb5 with SMTP id
 k62-20020a638441000000b00380625bbbb5mr6886653pgd.472.1646972429259;
        Thu, 10 Mar 2022 20:20:29 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1b20:e742:baa5:ec1e:1dce])
        by smtp.gmail.com with ESMTPSA id
 q9-20020a056a00088900b004e03b051040sm9064253pfj.112.2022.03.10.20.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 20:20:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH] cloud-init: inherit setuptools3_legacy
Date: Thu, 10 Mar 2022 20:20:18 -0800
Message-Id: <20220311042018.39631-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Mar 2022 04:20:31 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7089

cloud-init still requires legacy setup.py behavior.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-extended/cloud-init/cloud-init_21.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
index 37cf303..f549db9 100644
--- a/recipes-extended/cloud-init/cloud-init_21.4.bb
+++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
@@ -22,7 +22,7 @@ do_install:append() {
 }
 
 inherit pkgconfig
-inherit setuptools3 
+inherit setuptools3_legacy
 inherit update-rc.d
 inherit systemd
 
-- 
2.30.2


