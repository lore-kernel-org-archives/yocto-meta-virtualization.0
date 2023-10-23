Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0D0CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 09:33:40 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web11.116975.1698053614496461351
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 02:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=VJB7+2yg;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: l.anderweit@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1698053611; x=1700645611;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hzb1O7qAaIcZvQC3csvpmN06k1xsrhwzSP6eYUWRMjk=;
	b=VJB7+2yg21dUAIWYotwaZs0Y8blx6xKrrRVAev0mqydjkrVI4cayI629G2tzscUY
	FWsqQry9FK/5iIvASvZ+aqePsMSXGTcoj9Obi/p0W0jI6I66Kg0iBYRStfQ79WiQ
	3bdcGWWz5DU61fUP+7f2YvefQJgb++q0fo9PxUKHp6s=;
X-AuditID: ac14000a-b2f4b700000074e4-93-65363debc5ae
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id EA.89.29924.BED36356; Mon, 23 Oct 2023 11:33:31 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 23 Oct
 2023 11:33:31 +0200
From: Leonard Anderweit <l.anderweit@phytec.de>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <upstream@lists.phytec.de>
Subject: [meta-virtualization][PATCH] podman-compose: Actually update to v1.0.6
Date: Mon, 23 Oct 2023 11:33:20 +0200
Message-ID: <20231023093320.2584858-1-l.anderweit@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrILMWRmVeSWpSXmKPExsWyRpKBV/e1rVmqwYOvZhaLvjxjteh+p+7A
	5NHf3cLqMfPUI+YApigum5TUnMyy1CJ9uwSujFkPdrIXnGOvaF15lrWB8QpbFyMnh4SAicSh
	11uAbC4OIYElTBILj0xlBEkICTxmlJhw2A7EZhPQl1j5chELiC0iYCBx7tx85i5GDg5mATmJ
	Zf1FIGFhAX+Jlx82gbWyCKhKLLv4lxXE5hWwkTi0+RHULnmJmZe+s0PEBSVOznwCNpIZKN68
	dTYzhC0hcfDFC2aIE5Qk7pz6Bdc77dxrZgg7VKLzz32WCYwCs5CMmoVk1CwkoxYwMq9iFMrN
	TM5OLcrM1ivIqCxJTdZLSd3ECApGEQauHYx9czwOMTJxMB5ilOBgVhLhnR1ukirEm5JYWZVa
	lB9fVJqTWnyIUZqDRUmc934PU6KQQHpiSWp2ampBahFMlomDU6qBMY9Lb/u7754zj66zLdqY
	OffxpV23ODeqis3a7bnoTkTdl6DFG0I63gpsns5462ZLm0TSn4Ox+44Hbb7nMeP13cX5JSKH
	rFnEDdY932DC23Nnbmq0wprNXVWKsS7WRR3Hq1/MORHgt6U75NzOuC8pPHWCToadE/qO374r
	2q2+53bfDPH90jO6jiuxFGckGmoxFxUnAgBIoul9NAIAAA==
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Oct 2023 09:33:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8383

Commit 1fc1b193 (podman-compse: update to v1.0.6) states an update to v1.0.6
but does not change the SRCREV. Fix this by using the correct SRCREV of v1.0.6.

Fixes: 1fc1b193 (podman-compse: update to v1.0.6)

Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
---
 recipes-containers/podman-compose/podman-compose_1.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/podman-compose/podman-compose_1.0.6.bb b/recipes-containers/podman-compose/podman-compose_1.0.6.bb
index 04c1be9b..8a7c0c9e 100644
--- a/recipes-containers/podman-compose/podman-compose_1.0.6.bb
+++ b/recipes-containers/podman-compose/podman-compose_1.0.6.bb
@@ -6,7 +6,7 @@ inherit setuptools3
 
 SRC_URI = "git://github.com/containers/podman-compose.git;branch=stable;protocol=https"
 
-SRCREV = "24ec539932580a6bc96d6eb2341141b6d7198b39"
+SRCREV = "f6dbce36181c44d0d08b6f4ca166508542875ce1"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


