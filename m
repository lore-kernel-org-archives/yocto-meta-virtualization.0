Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2392FC3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 13:35:21 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web11.14605.1720618512323033893
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jul 2024 06:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=FPhgCtgb;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: d.schultz@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1720618510; x=1723210510;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4T3XrEoLDwPXc9nl2L/eLqueIimiG/OJHRzs6UdaIVs=;
	b=FPhgCtgbdIKq5i6dTwGyDzb8Vr5x24afnDLgpzYgB6MY3fY98P3EwZAQuT4xwE20
	rj/BKVQI/HloqeaY5B6qAhz6A1tdxnsBAYvwgO0VRLcnqa/uQrv+xeyVszWK/Hzq
	0mb9yVvt7duW9cDcBdUAaLd3R5/4R+QCXwTWH9II1ek=;
X-AuditID: ac14000a-03e52700000021bc-f5-668e8e0ec9a4
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id B2.E0.08636.E0E8E866; Wed, 10 Jul 2024 15:35:10 +0200 (CEST)
Received: from ls-radium.phytec (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 10 Jul
 2024 15:35:09 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <meta-virtualization@lists.yoctoproject.org>, <L.Anderweit@phytec.de>,
	<bruce.ashfield@gmail.com>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [scarthgap+][PATCH] podman-compose: Switch branch to main
Date: Wed, 10 Jul 2024 06:34:42 -0700
Message-ID: <20240710133442.1367169-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsWyRpKBR5evry/N4O09PYvunQdYLRZ9ecZq
	0f1O3YHZY+esu+we/d0trB4zTz1iDmCO4rJJSc3JLEst0rdL4Mq4d/EXe8Em9oor0zrYGxhP
	s3UxcnJICJhI3Jw8hb2LkYtDSGAJk8SKlfcZIZz7jBLrlv9jBqliE9CSuLNlLpgtIpAucbJ1
	PQuIzSzgIrH4xgfWLkYODmEBJ4njb3xBwiwCqhLXXx4FK+EVsJLY1nOOBWKZvMTMS9/ZIeKC
	EidnPoEaIy/RvHU2M4QtIXHwxQswW0hAQWL2tsmMML3Tzr1mhrBDJbZ+2c40gVFgFpJRs5CM
	moVk1AJG5lWMQrmZydmpRZnZegUZlSWpyXopqZsYQSEqwsC1g7FvjschRiYOxkOMEhzMSiK8
	8290pwnxpiRWVqUW5ccXleakFh9ilOZgURLnXd0RnCokkJ5YkpqdmlqQWgSTZeLglGpgjD8S
	t6T1bdWNsLbzKzZn/g5Z/zjYiyXQ/sOmsvbDKuyqH+zj9qkUlzBXf1tQpO0c+ODPrdx690jJ
	JlUmN/6s8hjXD29unWaMCyg+n9G/jjv/yQH/iZtq7gv2TG/UiZdYP/nrivu7DjrdT5x4nEF5
	g2nJlhlens3cvFtcj2lKX/ptpHn01AwNJZbijERDLeai4kQAhIcVpT8CAAA=
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jul 2024 13:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8835

The podman-compose repository has no stable branch anymore and
release 1.0.6 is located on main now.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 recipes-containers/podman-compose/podman-compose_1.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/podman-compose/podman-compose_1.0.6.bb b/recipes-containers/podman-compose/podman-compose_1.0.6.bb
index e055ee45..bcb2b86b 100644
--- a/recipes-containers/podman-compose/podman-compose_1.0.6.bb
+++ b/recipes-containers/podman-compose/podman-compose_1.0.6.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit setuptools3
 
-SRC_URI = "git://github.com/containers/podman-compose.git;branch=stable;protocol=https"
+SRC_URI = "git://github.com/containers/podman-compose.git;branch=main;protocol=https"
 
 SRCREV = "f6dbce36181c44d0d08b6f4ca166508542875ce1"
 
-- 
2.25.1


