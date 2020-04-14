Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.8852.1586862843592711436
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Apr 2020 04:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: yanfei.xu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 03EBE2pT007110
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Apr 2020 04:14:02 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 14 Apr 2020
 04:13:55 -0700
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 0/1] correct the LIC_FILES_CHKSUM and LICENSE fields
Date: Tue, 14 Apr 2020 19:13:52 +0800
Message-ID: <20200414111353.8404-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

Hi maintainer,

   There is a mistake about "LICENSE_" field in the last patch 
which is "[PATCH] lxc: uprev from 3.2.1 to 4.0.1". Now fix it.
   BTW, with a md5 checksum comes from bitbake messages for 
an non-existent lisence file specified in LIC_FILES_CHKSUM, the 
target lxc can still be compiled successfully. And I have reported 
this issue to Robert Yang.

Thanks,
Yanfei

*** BLURB HERE ***

Yanfei Xu (1):
  lxc: correct the LIC_FILES_CHKSUM and LICENSE fields

 recipes-containers/lxc/lxc_4.0.1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.18.2

