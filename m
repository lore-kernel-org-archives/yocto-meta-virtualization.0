Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD666C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 05:13:05 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.2616.1642569184341633283
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 21:13:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=va3fsjUM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642569182; i=@fujitsu.com;
	bh=UlY1tnB81VQvyMKVK1HJRVpRwdgUQVJW0X4CWX4e0gY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=va3fsjUMk7PfaXLaR68JyhjcPTgKqn2BtX2bMG6I1cNs1BdVG/icAIFdnjRhJ3Ycb
	 8PZMmlr9gl4uhfWMEkQdT1BWSecV9BrPNE+FFRLcoWvPOhnsxOK/c8ykwdAw3Vkg6c
	 Xw9jxcHem5kq73Tam8MO6xGnV77+ovzhJtC4GywlpYMZEA6WGyEf5k8c2X7Ba41Puv
	 uJtLIfHBhj8po8uF3dIUnCDdtYqo/Cd4aBoMOLgoXB65BR667Zt3UDtNZmtNu2KJTI
	 aMHLDHw5s282tqGSQQB+jz4KT2uWl5+AMS/eWNVg7SoCfP+hs1del0uOwLtbhHm2dP
	 yv9ksrq//OC7g==
Received: from [100.115.71.148] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 A2/69-15539-EDD97E16; Wed, 19 Jan 2022 05:13:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxSffu3Oe
  JBu2rbCwWfXnG6sDoMfPUI+YAxijWzLyk/IoE1owJrc1MBYfYKjrPmjYwfmTtYuTkEBJ4yiix
  cV19FyMXkH2RSeL5mfNMEM4JRonGfavYQKrYBNQkpt+6AdYhImAgce7cfGYQm1lAReLF7x52E
  FtYoFhi+dYtQPUcHCwCqhJHJjqBhHkFnCS2N68Ga5UQUJCY8vA9M0RcUOLkzCcsEGMkJA6+eM
  EMUaMoMftyMwuEXSExa1YbE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjXVJRZnpGSW5iZo6uoYG
  BrqGhqa6Zpa6hqZleYpVuol5qqW5yal5JUSJQWi+xvFgvtbhYr7gyNzknRS8vtWQTIzAwU4pd
  5+xgvND3U+8QoyQHk5Ior2j880QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErxNM4BygkWp6akVa
  Zk5wCiBSUtw8CiJ8D4GSfMWFyTmFmemQ6ROMSpKifNemA2UEABJZJTmwbXBIvMSo6yUMC8jAw
  ODEE9BalFuZgmq/CtGcQ5GJWHe7XOApvBk5pXATX8FtJgJaHH/s2cgi0sSEVJSDUwPOmz2tj7
  l3fwyPPzqlA1zf+lliPjWa7qxT3vk3PlTz0KGbVL56i2Rl0uWCMtrRX2cmsyWbHF9ryXjv874
  tdO6HNfPXPrcqvSAiOJM0RPGhx2M2lXmiPE/Ph3T4bbtqXDH9oVTW71WeHNNCpqd6bItL5KV3
  cf/W+lmOVejmwqlMc2XzZgiFh55EzVfgqU7pL2k/vrBP7XOuv8vB++SDMp+1iHvtXdd5Z7etv
  4zH88tMbjH4P8vVjpTp276sVrW4gt8s9I3z/VMmP9VOfHjsz+/HaSnrolnPFGy55tai5XUnT2
  3NvV3vAkQWXbLJLZeImP2HoVTk7693bq4e1vmzVyL+t3zHkpdL24Ia0hze6zEUpyRaKjFXFSc
  CAC0GTuTRwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-528.messagelabs.com!1642569181!62884!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14066 invoked from network); 19 Jan 2022 05:13:01 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-24.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 05:13:01 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 87EB2100455
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:13:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7BCB8100452
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:13:01 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 05:12:56 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH 5/8]
 python3-mimeparse: inherit setuptools3 not distutils
Date: Wed, 19 Jan 2022 13:12:45 +0800
Message-ID: <1642569168-18815-1-git-send-email-wangmy@fujitsu.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jan 2022 05:13:05 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7019

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/python3-mimeparse_1.6.0.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-mimeparse_1.6.0.bb b/meta-openstack/recipes-devtools/python/python3-mimeparse_1.6.0.bb
index da87dfdb..ae7bd430 100644
--- a/meta-openstack/recipes-devtools/python/python3-mimeparse_1.6.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-mimeparse_1.6.0.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "python-mimeparse"
 SRC_URI[md5sum] = "a32ae1df93be1ddb581d1c0fa124bab4"
 SRC_URI[sha256sum] = "76e4b03d700a641fd7761d3cd4fdbbdcd787eade1ebfac43f877016328334f78"
 
-inherit distutils3 pypi setuptools3
+inherit pypi setuptools3
 
 DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
-- 
2.25.1


