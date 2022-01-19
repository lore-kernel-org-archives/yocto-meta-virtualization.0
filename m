Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1473C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 05:13:46 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.2613.1642569226018225944
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 21:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jpjW2QLp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642569224; i=@fujitsu.com;
	bh=VkI6uaJNOxToDLvO1J9LoYyojBmSxWfGkqJIrc8YqdQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jpjW2QLp2id6v5vapROntDJvtPZqSaa1aS6QtOzYqjpPx49teBwBMRGFqQWdMlyNy
	 wR1E/QIKsZKxN8N4Zi27mK8Mb8TSjK/YitPWqeIzq4Rlkhfz67lcUvQI0sWahQk+rR
	 UKJQ7f5GJJaQWG8Fefag5tNcHsdNR+rB8rLdaSM22wWmn3Iy5NOgHzbKydAjJA3X2L
	 NwdMANwKhyJqzrIZz7tf8rb7UQJjKHGvCeSTR2LjXHQNpBqAiMEELL+qVRvms2dSbR
	 pcGt7FvUhlwib77dpaTgk8cW/dREHDjlx/e3GRfL8UY8IdisUe2GuTRtwlEfr7xNEU
	 7ay2CvCZocdUQ==
Received: from [100.115.71.148] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 B8/75-31213-70E97E16; Wed, 19 Jan 2022 05:13:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8ORqMs+73m
  iQfNhBYtFX56xOjB6zDz1iDmAMYo1My8pvyKBNePawYlMBU9YK/bP8GpgnMHaxcjFISTwlFFi
  8tP9LBDORSaJDTevATmcQM4JRonDq51AbDYBNYnpt26wgtgiAgYS587NZwaxmQVUJF787mEHs
  YUFSiXubTzHCGKzCKhKnJ98iA3E5hVwkjj5shNspoSAgsSUh+/BejkFnCXOnzzMDrHLSWLbi6
  uMEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZeboeZUSMya1cYEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWiXVJSZnlGSm5iZo2toYKBraGiqa2ama2hqqpdYpZuol1qqm5yaV1KUCJTWSywv1kstLtYr
  rsxNzknRy0st2cQIDOWUYqfZOxh39P3UO8QoycGkJMorGv88UYgvKT+lMiOxOCO+qDQntfgQo
  wwHh5IEb9MMoJxgUWp6akVaZg4wrmDSEhw8SiK8j0HSvMUFibnFmekQqVOMilLivBdmAyUEQB
  IZpXlwbbBYvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHf7HKApPJl5JXDTXwEtZgJa3P/
  sGcjikkSElFQDU0/w1ocZvr9WKPlNWyfMnht17dOcNvs7XC3vORbGKJ+dvHcnux7f0+MBicLX
  P6jr1trpnT57a/ntf2nFKd3BnRMz3h7I/K968GFH5sPax73nixW3bvEIePsudqnTU59LTyR1p
  IJYf65zcPLkXZqj9PpijYP3BI7TDWqJdbN2BB8/nLU793Iaz6QI+ZctT/O415pcsT7o8kSZ/1
  XZVsfNvFzq2r9jHddEvfEMbXBz/a0ec9KNNcv15qYi5/t3fdYqbyk76s+RsLt+zh3mN8Ivppo
  ynJ96sdza1Yu7peex8iUVc4Z/v2zOzP9/iE37/esJcrN7L64+PC9UrPlU+1q7E065P1937V2g
  0LfylMFRfyWW4oxEQy3mouJEANTilYNgAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-532.messagelabs.com!1642569223!79426!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13538 invoked from network); 19 Jan 2022 05:13:43 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 05:13:43 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0F28910019C
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:13:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 02C63100184
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:13:43 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 05:13:24 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH 7/8] mod-wsgi:
 inherit setuptools3-base not distutils3-base
Date: Wed, 19 Jan 2022 13:13:13 +0800
Message-ID: <1642569194-18853-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642569194-18853-1-git-send-email-wangmy@fujitsu.com>
References: <1642569194-18853-1-git-send-email-wangmy@fujitsu.com>
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
 https://lists.yoctoproject.org/g/meta-virtualization/message/7021

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
index 910bba1b..b0daf54d 100644
--- a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
+++ b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
 	file://configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch \        
 	"
 
-inherit autotools-brokensep distutils3-base
+inherit autotools-brokensep setuptools3-base
 
 DEPENDS += "apache2-native apache2 python3"
 RDEPENDS:${PN} = "python3"
-- 
2.25.1


