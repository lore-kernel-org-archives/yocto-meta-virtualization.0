Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF499C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 05:12:39 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.2608.1642569158643930148
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 21:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Vn73yO/T;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642569156; i=@fujitsu.com;
	bh=ZVSs6Pbajzhe3y+IKmhRwzTtuufhTGD3WRyyFNg2WBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Vn73yO/Th9K0iy8uO7lnUuff4lIFc+8yXlq47eFpmoQVdZRckbEJXSYVEEpSb4bEd
	 HO/4iOdYK1BJ6GO4+KTYag4xZMZ2HgOVECYxMYJDvpNTKJ27kB50uDpu2uUhPvmajw
	 sgf3/1gdXryFPAl9jeaVtwR2jnHK/gQkfbWOmt+LCVqsKlObit1jMnHKS2FhJ8Bm07
	 WuXrvC9egzM3H99CFDYrT/B3gB1YW8HolZhSBsN3KBql9SI/vh8ccCvUWw6/Nus9w4
	 hOxagopJ0xFxDGWHJzH6NMbPpplImYrcIic5vqJpFHt8RkkWIzifposr4VnlhYaZPq
	 TMqIeXMQbe7tA==
Received: from [100.115.71.148] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 E4/C5-06742-4CD97E16; Wed, 19 Jan 2022 05:12:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MxRffw3Oe
  JBpummlos+vKM1YHRY+apR8wBjFGsmXlJ+RUJrBl7329jL7jJVjFhbjNrA2MHWxcjF4eQwCwm
  ic0X3kE5Jxglup+9Ze1i5ORgE1CTmH7rBpgtImAgce7cfGYQm1lAReLF7x52EFtYoEhi09zTY
  DUsAqoSLZN+MILYvAJOEjfeXmcBsSUEFCSmPHwP1ssp4CyxdOsxsF4hoJr5W05C1QtKnJz5hA
  VivoTEwRcvmCF6FSVmX26GmlMhMWtWG9MERv5ZSFpmIWlZwMi0itEuqSgzPaMkNzEzR9fQwED
  X0NBU18xE18jEVC+xSjdRL7VUNzk1r6QoESitl1herJdaXKxXXJmbnJOil5dasokRGJwpxQ5f
  dzAe7/upd4hRkoNJSZRXNP55ohBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3qYZQDnBotT01Iq0z
  BxgpMCkJTh4lER4H4OkeYsLEnOLM9MhUqcYFaXEeS/MBkoIgCQySvPg2mDReYlRVkqYl5GBgU
  GIpyC1KDezBFX+FaM4B6OSMO/2OUBTeDLzSuCmvwJazAS0uP/ZM5DFJYkIKakGpqPFU/m3SMa
  vr3xqWXF7x05OvnJnrt93WZZs1Nzuw3XyFb/VrMJS1tPe6XWP5x6ds+EiW6C5rfibO8/5DNX5
  TERbjkd/OB6Rb3Bq5+cp1ybZffhy1cfbjDvkoN9HJf0zM97NL5D125b5+eiX+2lzO/LmL69ba
  RdfWyhzQCR1yU9/XVY/29mLdoc4nO0RZc5eGjWt9fShxkcFEz7P2tS6f4ZBUXGz46svFaJPBY
  U7/DND1CwUu91eO726bzJ9z72niQqJq71O36liatgxa898VdsIo8d/rJPZ+G/8MG4Nf/BrnX5
  +19vF/6Wd/2q9D58x4+TD11WLrnGt+r321J+Xkp86J51XyX6zMVfj19yj/7KUWIozEg21mIuK
  EwHpK8vaSQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-545.messagelabs.com!1642569155!61061!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30949 invoked from network); 19 Jan 2022 05:12:35 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-10.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 05:12:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20J5CSX8009487
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:12:35 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 05:12:26 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH 2/8]
 python3-fixtures: inherit setuptools3 not distutils
Date: Wed, 19 Jan 2022 13:12:03 +0800
Message-ID: <1642569125-18758-2-git-send-email-wangmy@fujitsu.com>
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
 https://lists.yoctoproject.org/g/meta-virtualization/message/7018

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/python3-fixtures_3.0.0.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-fixtures_3.0.0.bb b/meta-openstack/recipes-devtools/python/python3-fixtures_3.0.0.bb
index 6cd0d810..a9335317 100644
--- a/meta-openstack/recipes-devtools/python/python3-fixtures_3.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-fixtures_3.0.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=239e2f4698b85aad5ed39bae5d2ef226"
 SRC_URI[md5sum] = "cd6345b497a62fad739efee66346c2e0"
 SRC_URI[sha256sum] = "fcf0d60234f1544da717a9738325812de1f42c2fa085e2d9252d8fff5712b2ef"
 
-inherit distutils3 pypi
+inherit setuptools3 pypi
 
 DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
-- 
2.25.1


