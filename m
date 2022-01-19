Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA94C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 05:12:39 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.2637.1642569158277174262
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 21:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tPzE3mmK;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642569156; i=@fujitsu.com;
	bh=5G/tG5dDNBn88x37/njzUc6RAx/BT9tA6CHPolQisCA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tPzE3mmKoBTDzgOi9hj9a8DSL8WicUAmUm17KnD/MiJe8drlzrhrGrrv9yRpEjOo/
	 u21N4sE4kb3FHHq9SD7u4mnvVZh/Ep9cQMvbciQjrtVlSrmnaa58IiR+CyhpuqkBZy
	 SC1++U7jPxMpeJKBT9RIZ3Zh1PBYL8mzoi2VmjaODUJNGCRcwLZLIMbBnKWYgYQh5u
	 Ts1g0uWfvp6i6OueOKEcyqp+R4aKtdSyNLbdbXbPf9xBrz3MrIolC8iPAF61gIszQv
	 mgj1w5ddqIcmlZV74a+dE+zNjK6Dc3JlWUWGx/CpfMw9Ggov8FNmQ0p46shoqBsfla
	 Ri6JGXEY+IXaw==
Received: from [100.115.37.147] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 3C/FA-28974-3CD97E16;
 Wed, 19 Jan 2022 05:12:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxRffw3Oe
  JBhOXqFss+vKM1YHRY+apR8wBjFGsmXlJ+RUJrBkrX79hL9jDVnHr537WBsa3rF2MXBxCArOY
  JCYvvQrlnGCUOPDgAVMXIycHm4CaxPRbN1hBbBEBA4lz5+Yzg9jMAioSL373sIPYwgJFEq8fb
  WUDsVkEVCUu710HVMPBwSvgJNE+owAkLCGgIDHl4XuwVk4BZ4mlW4+BtQoBlczfcpIRxOYVEJ
  Q4OfMJC8R4CYmDL14wQ/QqSsy+3MwCYVdIzJrVxjSBkX8WkpZZSFoWMDKtYrROKspMzyjJTcz
  M0TU0MNA1NDTVNbbQNTI00kus0k3USy3VLU8tLtEFcsuL9VKLi/WKK3OTc1L08lJLNjECgzKl
  WO3KDsY9q37qHWKU5GBSEuUVjX+eKMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCt2kGUE6wKDU9t
  SItMwcYITBpCQ4eJRHexyBp3uKCxNzizHSI1ClGRSlx3guzgRICIImM0jy4NlhUXmKUlRLmZW
  RgYBDiKUgtys0sQZV/xSjOwagkzLt9DtAUnsy8Erjpr4AWMwEt7n/2DGRxSSJCSqqBaamn8R2
  GbQFdbuVir/8rs8RVnZuztGsS/2nHxjl1e856/X92XX+6huWHOKUtuXseTM4qVHhWMZ1BK5ZV
  TerlU23Pdxcufnum7PePd6pLH8txj1+ftVZ80VKc0/FvSiKD2zPHfYmvVbg+VX1f1br2yr+8x
  qdNO0/yLO6XOCCyKufoLzvbzXoCE+W/v3Dc6Kv1sEX55br77yum3tncbZ24pcTyB7vL718d/E
  UhiwVmnv4vO4n16N1QyT+qhTNzortzT7vfrpgZctCvdH6bVmNqEONhbkH/trT65QVLRb/+9DA
  9UbcsWW2bQEyh9YxpHgdnif9Pfshw57T3sjf+jnaXr7V0Xbo3b8WsRTy6pfXprkosxRmJhlrM
  RcWJAEIrbGJFAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-571.messagelabs.com!1642569155!63973!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5749 invoked from network); 19 Jan 2022 05:12:35 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-25.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 05:12:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20J5CSXA009487
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:12:35 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 05:12:32 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH 4/8]
 python3-lockfile: inherit setuptools3 not distutils
Date: Wed, 19 Jan 2022 13:12:05 +0800
Message-ID: <1642569125-18758-4-git-send-email-wangmy@fujitsu.com>
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
 https://lists.yoctoproject.org/g/meta-virtualization/message/7016

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/python3-lockfile_0.12.2.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-lockfile_0.12.2.bb b/meta-openstack/recipes-devtools/python/python3-lockfile_0.12.2.bb
index 81e1f22b..ba446380 100644
--- a/meta-openstack/recipes-devtools/python/python3-lockfile_0.12.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-lockfile_0.12.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2340dffbbfea534b58f1349984eeef72"
 SRC_URI[md5sum] = "a6a1a82957a23afdf44cfdd039b65ff9"
 SRC_URI[sha256sum] = "6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361e9f799"
 
-inherit distutils3 pypi
+inherit setuptools3 pypi
 
 DEPENDS += "\
     python3-pbr \
-- 
2.25.1


