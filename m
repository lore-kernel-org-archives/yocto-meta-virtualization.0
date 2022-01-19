Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DA5C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 05:12:32 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.2607.1642569151282499713
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 21:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mMiRXj0i;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642569149; i=@fujitsu.com;
	bh=PKV79REZ4oe3VuAMOfsTOJH110aMtW4RV6c9fWT6U6I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mMiRXj0i7k8vpz5/L9u/tVGPJGCKir5WkfsipvRd2DijFtOnaKXC9wcAZbn/g0D0f
	 zMMd8q2lLLrvLN+wp7DxpHkCDEURozqYnFQ08f3+iAfbnOKm97N4TPsnl2EdjiM/fh
	 WxjRh+ZoMEmOEoz3k6qOI28e39gUlbieoYEPIxAcK0agtEUj0g1oz0w3M2oI+3vLno
	 EYjku8wBVoKZ/t5jDP9KdvbHXtzYzbSd7udBYHbESyPLM0BeMxQ0Q/R/uzugjFOzC2
	 CLF7W6u5ui2bwC4YarJ21T9HlSO1op5/9xkTrXfwmxFC84mhsPrRdkCT4GQAf63niB
	 Z8SBtQGcOuDDA==
Received: from [100.115.71.148] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 A0/93-31213-CBD97E16; Wed, 19 Jan 2022 05:12:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8ORqLtn7vN
  Eg+cNqhaLvjxjdWD0mHnqEXMAYxRrZl5SfkUCa8aU61tZC46wVvSv+8DcwNjC2sXIxSEk8JRR
  4uu78ywQzkUmiZ1HLjNCOCcYJRY3vGXuYuTkYBNQk5h+6wYriC0iYCBx7tx8sDizgIrEi9897
  CC2sECeRGNrHxOIzSKgKnHrSguYzSvgJNF5fRlYjYSAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2
  aIGkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYOSfhaR9FpL2BYxMqxjtkooy0zNKchMzc3QNDQx
  0DQ1Ndc3MdA1NTfUSq3QT9VJLdZNT80qKEoHSeonlxXqpxcV6xZW5yTkpenmpJZsYgeGZUuw0
  ewfjjr6feocYJTmYlER5ReOfJwrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4G2aAZQTLEpNT61Iy
  8wBxgpMWoKDR0mE9zFImre4IDG3ODMdInWKUVFKnPfCbKCEAEgiozQPrg0Wn5cYZaWEeRkZGB
  iEeApSi3IzS1DlXzGKczAqCfNunwM0hSczrwRu+iugxUxAi/ufPQNZXJKIkJJqYAq9ZVtmNFN
  2rc9HaSFOdZe2xxbnHkYwr7uz83DU/QXmMdoWZZbu4W0X5RpNp00N8jzys9tRP/z/5gUu79Z/
  Lb2kWnvy9vNnh85x81wuS6j+yqn2+7daUw/7sfcTvHtYDq8xClPYvu+KrrGo2jOHdQ+VFyn/S
  a6qWpSRplo4yWO/mfPVO+YeUZ8yVPIu/z0/Z+mzZ+rtF1heqNdobdvzpCPcottzTuxp7hfX1r
  CFt+f89JdWaPAQMEmMk3B2mHYkPqX9VtZzBUYzi/nyfZerJnrvsVlvsyB3xnLpPStuXw5i+7f
  Y98mO+0+OfzPtmr2tv3LbXe2rE+6zuv9bc3Vf+PF+7SahyocHTuZHc6449E+JpTgj0VCLuag4
  EQAOEG1gSgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-545.messagelabs.com!1642569148!61368!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32515 invoked from network); 19 Jan 2022 05:12:28 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 05:12:28 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 25EAF10018F
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:12:28 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 16DD6100187
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:12:28 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 05:12:18 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH 1/8] python-novnc:
 inherit setuptools3 not distutils
Date: Wed, 19 Jan 2022 13:12:02 +0800
Message-ID: <1642569125-18758-1-git-send-email-wangmy@fujitsu.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jan 2022 05:12:32 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7015

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-novnc_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-novnc_git.bb b/meta-openstack/recipes-devtools/python/python-novnc_git.bb
index 50041ac9..da5f048e 100644
--- a/meta-openstack/recipes-devtools/python/python-novnc_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-novnc_git.bb
@@ -15,6 +15,6 @@ SRC_URI = "git://github.com/kanaka/noVNC.git;branch=master;protocol=https \
 
 S = "${WORKDIR}/git"
 
-inherit distutils3
+inherit setuptools3
 
-DEPENDS += " python-websockify"
+DEPENDS += " python3-websockify"
-- 
2.25.1


