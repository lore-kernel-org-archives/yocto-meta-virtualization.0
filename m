Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D105C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 12:27:39 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.74])
 by mx.groups.io with SMTP id smtpd.web08.8515.1657628851097170302
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 05:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=Do/yBY5M;
 spf=pass (domain: siemens.com, ip: 40.107.104.74,
 mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqVf698fnD/KlUpauBhxgAMzMttP3yEs1iMsFFnK/AsyhtgqSlhqifc71QiCbiw1fRL3dESeAqTyC9gVyYtZDaq6IVm58U8zcyKXONU+Hw+3SbUsqp1ITKCD2kVfl5v7S8W4zvuusSjSzO8weMZul/TD4TAq3hrpOxBb4FpISSvNwKfyxGwOcTy6zx7v3FQCQZ5nz6IPassiOkINQA71jwzyfEsr7xY9a/5xkHEkVZy/PQbreGNX4dYATu9XdjaBZae5wrYZj+4vyMjQ5C1ZwN2QJp6lC6Xvc5C0vX5DqN0FMY8BCexXA9rhOuuhpltaWKIN0bViZtDQ9mB64xWGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxPBx7ftWZhz5Vo4H1dc+yRXpQPVveUKcqWsuO/YJ3M=;
 b=N7Phfm1c7B5rlI8wUO2Y91hyVVv3WEat6UqlyzZxLgK5K+khL+wvKIufynFBh+eWxkYDPsFrZ12qtEN0TOiO/QSRKAIGwk/GyZQMqfXhTEID8NQRbUF4T1TQLI7qdkHAVs/Dr1VTiFd9vj7YkV8KE+hORr/y3R6kH1/c1bsdfUypbSP+Krd7WeTRH6elHIvoTRLW++/yXCJF6eIo4x8Ki+W4LUBC+hDPTh434N52jvnP3//1SNsOqZragyGugokAckmm3QGnjSXTHahTC1wGT6mws4EE9xCNHS+VIQIn5yaDekjlbSImCNUh6fkj5kYj9A8xOoLaefG1QTV53+Sshg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxPBx7ftWZhz5Vo4H1dc+yRXpQPVveUKcqWsuO/YJ3M=;
 b=Do/yBY5MNrjcP9XfxjBqoR7aCSSgLbVg2+Jae/Knb/P75B+2p90otBfVBI4j1MIXTMHmqCquahtWHoXQ4zkk9Q0WbbuBM5tYRvnU7fxTieAKjiKbejywxUOim05EE7fcA74cQ9PyV5XMbxLu8Tv/ODUwqlaqrT/YePyzI80phz6ME8ConA+/ojh3IlBm+RHcxg2WaI0t2+TvO4h6ifj0DEdp06KxujcLCo4gBIuQs/nk8KpYNh1UqgEgUjoytuYkUs9fy2MFdUMQG+s0Hc822vauJPrUfvVyTZXWe9qmKa9ciC9VZtWr1zMGrDKagL/kyL4iMoenP+o189VFrMv43w==
Received: from FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a8::15)
 by DBAPR10MB4059.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Tue, 12 Jul
 2022 12:27:28 +0000
Received: from VE1EUR01FT094.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:a8:cafe::9) by FR0P281CA0117.outlook.office365.com
 (2603:10a6:d10:a8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.5 via Frontend
 Transport; Tue, 12 Jul 2022 12:27:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.70) by
 VE1EUR01FT094.mail.protection.outlook.com (10.152.3.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 12:27:27 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Tue, 12 Jul 2022 14:27:26 +0200
Received: from md3itd2c.ad001.siemens.net (139.21.146.185) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Tue, 12 Jul 2022 14:27:26 +0200
From: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Subject: [meta-virtualization][PATCH 2/3] image-oci-umoci: add parameter for
 stop signal
Date: Tue, 12 Jul 2022 14:26:46 +0200
Message-ID: <20220712122647.12746-2-vasileios.anagnostopoulos@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220712122647.12746-1-vasileios.anagnostopoulos@siemens.com>
References: <20220712122647.12746-1-vasileios.anagnostopoulos@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.21.146.185]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--8.256600-8.000000
X-TMASE-MatchedRID: 9aSuCSGb5I0QwVtkLIfLLYMdEtNFjZ453szvVnpBZzjBe89zsi5D0BNw
	Wv2dBrmkTJDyHMXec/bX6TGug1j07nxs7qFZ9FbOj0IvV7jlqDi1/Y3yaQd6W4IK2tjTqNot64s
	VlliWKx8fE8yM4pjsDwtuKBGekqUpOlxBO2IcOBb8bdFkodeJ58pbtGj/rF06pryYvghwCBhU/k
	Rx/ERkQUjbcGWMIUzTQwymtxuJ6y0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.256600-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 FE165C76BE312ECD6BB366F19CF8BD8BA11360C46474314E01772BB9E46E5C362000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61c062db-98fa-475b-120f-08da6401e1fe
X-MS-TrafficTypeDiagnostic: DBAPR10MB4059:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DQI8OrPcQLx3lsZaS4jOXf5lOIbdW8DZbzfZw5o/QlEw5hsOu7dwE++EwIDq17LYe6cYaxSQHsXL+t5TXmg5L9yqcV98SUTPFjoW+PGsAHFfpx3IXhC4XTETkcnt3u/ONatmtiURSohjL6FwPwkl3iEILSRDuuXHHSE9yzHGyvPxCZaZjl/Zv530QG3iXLZA1eWk5i7jyRS0i07+utBYHNzF22C6M46DmK+GaR4S32PT+saBegiKE+KW7goKFhfTkQYRB9rqSUrROnt/unKbc+OqQXK09J5Ub7xI/Ts/H9X2iQouipMdd4mQXrU3yqOg3lzf8QfwsdsqnsUSwKsfGrOZIw7m2EwheJ5/QN5KrxGVhsyTQY6ivVhHFRNYSjceWOrQAi+mk8H1Xtg+Sh9A0lbV52zfIb3/RUHtX6oVXEJKkatOoyjb+dSxTBLeyTEDPP/FE6zw2VdUQz/V1LOTkHufxYmeNTdRF+gJPtLaFAOA5QLH5CfuBOygvqp9sUoSpg2XiM0JZsGwiWgK5D7L0yv51mAxXKJMYJ2KhOzpSuQVZvatc8S38gLm2oTmsQlKRwWIzHvK9vwxQeXHesRT88msPpYGUx5dlN04QabttpgIvQWi3QCUzorSUCX5ElIzTTCiwmMsUKhNaicOH4c3ZxE5CIk2LWKEO4o5bRGmhMVg/eFiBku45lQXTrzrsRbiOaJazHYRF2ZDxEZ+Uz2Ge9s8f4eGyXkNgmrLZPW9kPFyIh0mzyZcztGastkelnn+UKY++xpulG78e/xpK6zysI5/T3E86HWo9sJDGu5Z1W8sz1/lBGvwOqmyov5jbjh1
X-Forefront-Antispam-Report: 
	CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(40470700004)(46966006)(2906002)(36756003)(40460700003)(316002)(8936002)(44832011)(36860700001)(5660300002)(7636003)(7596003)(1076003)(356005)(4326008)(336012)(16526019)(86362001)(82740400003)(70586007)(41300700001)(6666004)(70206006)(6916009)(82960400001)(107886003)(956004)(8676002)(2616005)(26005)(82310400005)(47076005)(478600001)(40480700001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 12:27:27.5147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 61c062db-98fa-475b-120f-08da6401e1fe
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT094.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4059
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Jul 2022 12:27:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7442

Add an optional parameter that allows to override the stop
signal that is used.

Signed-off-by: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens=
.com>
---
 classes/image-oci-umoci.inc | 4 ++++
 classes/image-oci.bbclass   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index b159614..f941795 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -82,6 +82,10 @@ IMAGE_CMD:oci() {
 	bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --config.wo=
rkingdir ${OCI_IMAGE_WORKINGDIR}"
 	umoci config --image $image_name:${OCI_IMAGE_TAG} --config.workingdir ${O=
CI_IMAGE_WORKINGDIR}
     fi
+    if [ -n "${OCI_IMAGE_STOPSIGNAL}" ]; then
+	bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --config.st=
opsignal ${OCI_IMAGE_STOPSIGNAL}"
+	umoci config --image $image_name:${OCI_IMAGE_TAG} --config.stopsignal ${O=
CI_IMAGE_STOPSIGNAL}
+    fi
     if [ -n "${OCI_IMAGE_OS}" ]; then
 	bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --os ${OCI_=
IMAGE_OS}"
 	umoci config --image $image_name:${OCI_IMAGE_TAG} --os ${OCI_IMAGE_OS}
diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
index 7a39d27..9ddb88b 100644
--- a/classes/image-oci.bbclass
+++ b/classes/image-oci.bbclass
@@ -58,6 +58,7 @@ OCI_IMAGE_SUBARCH ?=3D "${@oci_map_subarch(d.getVar('TARG=
ET_ARCH'), d.getVar('TUNE
 OCI_IMAGE_ENTRYPOINT ?=3D "sh"
 OCI_IMAGE_ENTRYPOINT_ARGS ?=3D ""
 OCI_IMAGE_WORKINGDIR ?=3D ""
+OCI_IMAGE_STOPSIGNAL ?=3D ""
=20
 # List of ports to expose from a container running this image:
 #  PORT[/PROT] =20
--=20
2.34.1


