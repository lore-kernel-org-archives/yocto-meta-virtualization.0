Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2ADEC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 05:13:46 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.2620.1642569226178853928
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 21:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F7RbTCDB;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642569223; i=@fujitsu.com;
	bh=9QnHl55vxfojA+cgFlyYz7t4fWQ3zBDNhiFOvaJyZIc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=F7RbTCDBIuDL+ltGYH3pz5Qwv5CALgO4dxEyk7freLABnqkxnUGWPvfS0bkxMmGYa
	 NP6HQKXUzFF3n/GBuXZlrdVaGCYy03FATZEi1TKCkU7FApZT0+TqBH+VMW+bQE+su1
	 Dr97T5mWlp4tHuRgCdfLQR6KO+Z3nULZzogeC+oh0APrjw/c+QFO3/8hFyclJMYJZC
	 jkYZ5AufmykzDMuuafdxyRRv8oanemjz63s1sKZUR/RE5xGQyFP6+sYmzcEqhGkzgd
	 eFjc0PXnd7Ca4y7I3Ar4dUXCqmZmyerDJbhggHbU4dudvxb/RxRfFMoDCEX9JObKbT
	 Fs9W9D6AoyCUg==
Received: from [100.115.1.107] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id E1/D5-10124-70E97E16;
 Wed, 19 Jan 2022 05:13:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqMs+73m
  iQU+7rMWiL89YHRg9Zp56xBzAGMWamZeUX5HAmrFxo2vBcbaKS313WRoYP7N2MXJxCAk8ZZS4
  /PYVlHORSeLrsxYWCOcEo8StA83MXYycHGwCahLTb91gBbFFBAwkzp2bDxZnFlCRePG7hx3EF
  hYolpg17T9YDYuAqsTK69+YQGxeASeJj6dus4DYEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmC
  FqFCVmX26Gqq+QmDWrjQnCVpO4em4T8wRG/llI2mchaV/AyLSK0SqpKDM9oyQ3MTNH19DAQNf
  Q0FQXSJqa6CVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBAZlSjHDrB2Ms/p+
  6h1ilORgUhLlFY1/nijEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgrdpBlBOsCg1PbUiLTMHGCEwa
  QkOHiUR3scgad7igsTc4sx0iNQpRkUpcd4Ls4ESAiCJjNI8uDZYVF5ilJUS5mVkYGAQ4ilILc
  rNLEGVf8UozsGoJMy7fQ7QFJ7MvBK46a+AFjMBLe5/9gxkcUkiQkqqgUlsu3Pdx1CTQ+ErdzH
  If/kazXAg1aJjtkpUc+SsB5H/7oS/SvHZd4ZPT/kzG1/ew46yzB4HozmxZQt03sblir4xFfra
  fGkn57Lr9XMm7H+m/cVj9r84bsX479pcTAfd9yR9vLGqp+rmuc/L55izvXoqdX1O+bsNr+Zm+
  5sE37hTdLKGvSHtwoR6lslJc53dH36sTHHYdWjiLbePk259/8I/xUzjbP6BlEnPTu1ZrrZWbe
  LLFWuMMg3iHAN2c27/JmZuu4brwX/nzq/dnqLF5daJd/gNg0xVzINUcrn9bsUpTK2o03wWJmK
  3cd1bsz2u4q5lFysOTNqWvGTXzfqPWnlfrlauvSxg8izIq3jdkutKLMUZiYZazEXFiQCX0ab2
  RQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-591.messagelabs.com!1642569223!46510!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12782 invoked from network); 19 Jan 2022 05:13:43 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 05:13:43 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0D844100194
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:13:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 014FF100182
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:13:43 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 05:13:21 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH 6/8]
 python3-termcolor: inherit setuptools3 not distutils
Date: Wed, 19 Jan 2022 13:13:12 +0800
Message-ID: <1642569194-18853-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jan 2022 05:13:46 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7022

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/python3-termcolor_1.1.0.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-termcolor_1.1.0.bb b/meta-openstack/recipes-devtools/python/python3-termcolor_1.1.0.bb
index a8d50097..127287a7 100644
--- a/meta-openstack/recipes-devtools/python/python3-termcolor_1.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-termcolor_1.1.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=809e8749b63567978acfbd81d9f6a27d"
 SRC_URI[md5sum] = "043e89644f8909d462fbbfa511c768df"
 SRC_URI[sha256sum] = "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
 
-inherit distutils3 pypi
+inherit setuptools3 pypi
 
 DEPENDS += " \
         python3-pip \
-- 
2.25.1


