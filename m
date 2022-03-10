Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F67C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 09:41:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.7699.1646905265492494950
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 01:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QNQM89CH;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646905263; i=@fujitsu.com;
	bh=gAyEeASHciy7T5J0mLDFa7RRLqSjrQooyoXxGfpAl8A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QNQM89CHp51mpHlfTRZBGUxrbCqhG4Lj9eGGmxC89KPbF2+f2rWpNlX69ORwkJ6uI
	 qCBMDTN6aGp+6dJ799kq4ccnQleuXWVsE4IwGowwkYt426C8b9HlPvbxX9xDldlSL6
	 ue8p64VlliSXbEeNf9nqJ6A1UDfROHujzAnUZ2ka3juT6iRAUeJbifqTMKRjbvyM0m
	 iqdhQVYtGbUDs8avEgIsBh9V0SmL1G/7nu89Req6Gw3UHb55M1I4prNQJk3WQmgiBt
	 xCENj7o0sHAcuyUeF62Tzdx9ZRBS953w811ZoIheA0YwTN/RrxRs8gWzsgb9zWIN38
	 Ezn7XtjqIpWqQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqLv+uGa
  SwearIhaLvjxjdWD0mHnqEXMAYxRrZl5SfkUCa8aO3xOZC+6wVpzd2MPcwDiVtYuRi0NI4Cmj
  xOdHl1kgnItMEqe2vmLsYuQEck4wShxepQdiswmoSUy/dYMVxBYRMJA4d24+M4jNLKAi8eJ3D
  zuILSyQInH47XewOIuAqsTv7TtYQGxeASeJt//PgtkSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfboaqr5CYNauNCcJWk7h6bhPzBEb+WUjaZyFpX8DItIrROqkoMz2jJDcxM0fX0MB
  A19DQVNfYWNfQ3FIvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwLFOKFTfv
  YJy48qfeIUZJDiYlUd4zKzSThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwSh4BygkWpaanVqRl5
  gBjBCYtwcGjJML7+yBQmre4IDG3ODMdInWKUVFKnHf6MaCEAEgiozQPrg0Wl5cYZaWEeRkZGB
  iEeApSi3IzS1DlXzGKczAqCfMmgUzhycwrgZv+CmgxE9BiOyM1kMUliQgpqQYmh78WXl8flz5
  I0Re7UD5rX4yLU/F6ra6SOv8/lxM6ivQ4E19cVqt4NP+KltL15VuaDktw5Sk2tfezxs5KrY8t
  nKrAOTVZYe5G7tdbP7jJ2q+udFu/0ilSatnhF2dnVt804zsqFbZ6wcrvX7V3iXpvj3pTeZNhP
  cc63oYD5685NX1ay73YauuOJNEdLbpLE44wW8+xNJxWwM55ztbj9numXF+hv3/VuBMffvqo6l
  rglqjheLtN9hn3qSfqkVs9u7Y6Hn+/fG9PCWN9R++d2D9am0NOVTO/zdkXuettyfkd/tJXGNb
  O2MH1zm6FvOaMk3mXmlJrf3yNndN20T/Cc0eC9f62+oJZktax9+1bJZmVWIozEg21mIuKEwF3
  ed0jRgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-29.tower-548.messagelabs.com!1646905263!33081!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11563 invoked from network); 10 Mar 2022 09:41:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-29.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Mar 2022 09:41:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id ECB51100199
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 09:41:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DF80F100191
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 09:41:02 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Thu, 10 Mar 2022 09:40:41 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] layer.conf: Update
 to kirkstone namespace
Date: Thu, 10 Mar 2022 17:40:30 +0800
Message-ID: <1646905230-64641-1-git-send-email-wangmy@fujitsu.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Mar 2022 09:41:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7081

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-openstack/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index bd5a8ac7..b112030f 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-layer"
 BBFILE_PATTERN_openstack-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-layer = "5"
-LAYERSERIES_COMPAT_openstack-layer = "honister"
+LAYERSERIES_COMPAT_openstack-layer = "kirkstone"
 BB_DANGLINGAPPENDS_WARNONLY ?= "true"
 
 LAYERDEPENDS_openstack-layer = " \
-- 
2.25.1


