Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A04C001B0
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 12:53:53 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web11.41914.1691758428356377107
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 05:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=MaMIcuMY;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: l.anderweit@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1691758426; x=1694350426;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ljYo7sVv5bHthaQYxPMJKskjs9RcCy9Xhd4W+aWXDlU=;
	b=MaMIcuMYCYBjOMCiBDdXVVg9bFEkEl2vCqvj2T1AANyp6B3kirvSfv7Rj3fGTZSD
	/KfvlfMV9qdyF66IyWdCGAYAktRL9JV/G3cELlHTiLMPfYEQ3mdOqJnUZnEtPtfp
	HObsaQcc1q3bJhiGqEdPlb16in6b3f7H6tz5jA3jsuA=;
X-AuditID: ac14000a-923ff70000007ecb-4d-64d62f5a4717
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 68.F9.32459.A5F26D46; Fri, 11 Aug 2023 14:53:46 +0200 (CEST)
Received: from llp-anderweit.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Aug
 2023 14:53:46 +0200
From: Leonard Anderweit <l.anderweit@phytec.de>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <upstream@phytec.de>
Subject: [meta-virtualization][PATCH] podman-compose: Add missing runtime dependency python-dotenv
Date: Fri, 11 Aug 2023 14:53:37 +0200
Message-ID: <20230811125337.102460-1-l.anderweit@phytec.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsWyRpKBVzdK/1qKwbcpohaLvjxjdWD0mHnq
	EXMAYxSXTUpqTmZZapG+XQJXxuGlf9gKTrNWLJm6lqmB8RNLFyMnh4SAicSBSXeZuxi5OIQE
	ljBJ3D7fzwbhPGeUaLnVzQhSxSagL7Hy5SKwDhEBA4lz5+Yzg9jMAhISrzrXs4HYwgJJEp/P
	3AOrZxFQldi9+j4riM0rYC1x6sgUZoht8hL7D55lhogLSpyc+YQFYo68RPPW2XAzD754AWYL
	CShJ3Dn1iw2md9q511BzQiU6/9xnmcAoMAvJqFlIRs1CMmoBI/MqRqHczOTs1KLMbL2CjMqS
	1GS9lNRNjKDwE2Hg2sHYN8fjECMTB+MhRgkOZiURXtvgSylCvCmJlVWpRfnxRaU5qcWHGKU5
	WJTEee/3MCUKCaQnlqRmp6YWpBbBZJk4OKUaGFslW8y+tDeX/dc4NvmF9nflzdxKH69IeGg/
	/iLKrXbi4LV1EyU/OnPuO7ixpP2VzMmXogeuJ06TsrOYeEqZmz9aXfuzT/o7+ZSPMhZTJz3O
	Vlduzth80C3+Ma/hi70PeY1/xy1bt13luQnX5raTC5frPX+xVfuJoVeazYU3xoYtHAWS7cIX
	Y5VYijMSDbWYi4oTAQj7nUktAgAA
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Aug 2023 12:53:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8173

Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
---
 recipes-containers/podman-compose/podman-compose_1.0.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/podman-compose/podman-compose_1.0.6.bb b/recipes-containers/podman-compose/podman-compose_1.0.6.bb
index cb569209e675..04c1be9bcb5b 100644
--- a/recipes-containers/podman-compose/podman-compose_1.0.6.bb
+++ b/recipes-containers/podman-compose/podman-compose_1.0.6.bb
@@ -12,4 +12,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS += "${PYTHON_PN}-pyyaml-native"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-pyyaml"
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-pyyaml \
+    ${PYTHON_PN}-dotenv \
+"
-- 
2.34.1


