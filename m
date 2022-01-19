Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA11C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 05:12:39 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.2611.1642569158276493877
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 21:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=a618CLrG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642569156; i=@fujitsu.com;
	bh=b6dOd9/DdxxAfpP4RhRm+O8d1D4BrosgjwDAngQE3pY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=a618CLrGWHd/zHPu+zVtGNw87dOX4TBwD/9s9O9ddPWYLdylot9DB3ZGwV+HuMXdT
	 JYBve+6aQ2kV1G8sZQvpgTk95MWj47aJ4LtMVS0NG0LicBAjPnmm0D7FqrSiho5cZp
	 r+VZ3dxW7Ry93X+8VTXQ+r5eDk21PMtkZLUViggn45mMWN8O3760C9ChIZz08RPI76
	 BUXGc6anBglveZISIT7DNqnhycs7LxJGZjeVnwN29oav754DTIJ8XLFsC+IiY5WzYH
	 ljbj/nCzGZ9hg3/tl9wud57U8IvPSQCr21EBhXWgAoaA6ZuwNi/6fccrsUghF8lmwU
	 gWd0ZvVrc9VHQ==
Received: from [100.115.7.63] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id A9/F4-30341-4CD97E16;
 Wed, 19 Jan 2022 05:12:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxRffw3Oe
  JBif69CwWfXnG6sDoMfPUI+YAxijWzLyk/IoE1ow9i9YyF2xlq+g/u5axgfEVaxcjJ4eQwCwm
  iadPVbsYuYDsE4wSe2aeZwdJsAmoSUy/dQOsSETAQOLcufnMIDazgIrEi989YDXCAgUSG3ZfY
  eli5OBgEVCV2N/LBhLmFXCSmDZjBwuILSGgIDHl4XuwVk4BZ4mlW4+xQ+x1kpi/5SQjRL2gxM
  mZT1ggxktIHHzxghmiV1Fi9uVmqDkVErNmtTFNYOSfhaRlFpKWBYxMqxitkooy0zNKchMzc3Q
  NDQx0DQ1NdQ10jQxN9RKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS9PJSSzYxAgMypZjh
  +g7GiX0/9Q4xSnIwKYnyisY/TxTiS8pPqcxILM6ILyrNSS0+xCjDwaEkwds0AygnWJSanlqRl
  pkDjA6YtAQHj5II72OQNG9xQWJucWY6ROoUo6KUOO+F2UAJAZBERmkeXBssIi8xykoJ8zIyMD
  AI8RSkFuVmlqDKv2IU52BUEubdPgdoCk9mXgnc9FdAi5mAFvc/ewayuCQRISXVwLS6I/d4tyL
  fmaUs9dH8Xy1beey1Pp+cxt63M10vUvXliza+R4L7vjJNSmBO+yn9PtdvwYFPF5+LObqnty10
  kIo5Ebbw2weBhk/zTq+c4BPwwe6g9Y+DvLOt93+f/y66SUtxKbMBn2lcQKmLE3vGlqku21v3x
  W8KFX0y8+FvTcH+mfIOpoFvotbKr+6qan2e/SFp3Um1m7ovDurf7Hz6PWnVocrtVr0SGyb+aL
  3Q+N3kpmluHoeMVVUdoydb1ydvj7V8NQJ3jlozWqq2bfAvWHLcPeJL8avL5fclOS/OyzaJ1gi
  58obp5PUdZ6pdjicstsk/kqqib/vsf9OVH46e+87WZa/7HfTh+1+/Rd8jZyixFGckGmoxFxUn
  AgBhWt7iQwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-587.messagelabs.com!1642569155!65282!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 943 invoked from network); 19 Jan 2022 05:12:35 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-18.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 05:12:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20J5CSX9009487
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:12:35 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 05:12:29 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH 3/8] python3-ipaddr:
 inherit setuptools3 not distutils
Date: Wed, 19 Jan 2022 13:12:04 +0800
Message-ID: <1642569125-18758-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642569125-18758-1-git-send-email-wangmy@fujitsu.com>
References: <1642569125-18758-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jan 2022 05:12:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7017

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python3-ipaddr_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-ipaddr_2.2.0.bb b/meta-openstack/recipes-devtools/python/python3-ipaddr_2.2.0.bb
index 2706954a..bb236eb8 100644
--- a/meta-openstack/recipes-devtools/python/python3-ipaddr_2.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-ipaddr_2.2.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e7e54827196088e6e96b33e9aec35c4a"
 SRC_URI[md5sum] = "f88353e40dec06410acfa075b8209b27"
 SRC_URI[sha256sum] = "4092dfe667588d16aa12b59acb7c8a4024e5dcb23a681cd0b0b602373eca88d6"
 
-inherit distutils3 pypi
+inherit setuptools3 pypi
 
 DEPENDS += " \
         python3-pip \
-- 
2.25.1


