Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D132C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 12:27:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web08.8516.1657628853935134972
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 05:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=c3CJUW6Y;
 spf=pass (domain: siemens.com, ip: 40.107.21.80,
 mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3G0MGlylJCoqJhXhpWUAeMGXsVKsiIeJF+vAMdNJ4UqvekAKA7ooyPAb8xqr4dWMp08q+O5Irx7QQknURyuZgkO0Cm8uzATLggUDPyIf+ragmkeKBQpDWAAtjNJY7slTKOjdIqRACsm2fTitVDMcTEMd9vsl/o+TKDBpgiRogHbpPI2EUV5GmRT06kXHheCWrStjyc9EIvARKlKwh/169M/lxkR0NBDtWhm12jdiEFZodKF0dHEpIhNXMJIJKAa9UF3ZRkzaRfh+C9QQOQ0Dnf83nYmRzwvHCgdtx7Ba+j7paSlJ+NcYv1CpD4aDND/WZF1qasPm/Zmc2V6jmHjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXpzwgvFZeef1vVHFRZ7RD5sK/NwEY0vQcJMrVNofK4=;
 b=N6WdWPgrDYAVlyL5+/GORYxNq5pxOZM9Z0spREp8kgK7ov761xPdeCUN9JcpbdPEhT3M85uKHEw9tt6Sn5+xSjhz3KaTqISQIVJ3Le0RJhlA4S8pZTTKrw5Jdvtftmjap7GoEANInJ7RBzwS/oyjeCiW30jI45aqR+4bnCEpG5InOxk5L1y4zHUTY2/y7Sh6Z4S4oRFYtA8KttujOQcQ21T6GOCdVvfiammErqYDfmmc7PjYpfBgLHOuQEPqEJw2NG2JsIA3P6VfVqrtNrSKD6xRUZRb9QYeFaIeEWXrpMVbg25UgSdD3Qqwxe2ZTBpvUVvWm3yaAZDC1M5qvy93eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXpzwgvFZeef1vVHFRZ7RD5sK/NwEY0vQcJMrVNofK4=;
 b=c3CJUW6YE6wGuvjFDSKuZA2YDCPhJ1AGhLRTM//K2jsF/pfzx2RGa2/U1IbgeFUKm1egbZ48HVMcvw18R6vsHiovq2NzQSafhsiVZMsMrnWyLLcii//9jqjwtEjEhJKZONLA4OlL7z+bdnNef6QXc7TdsPcXYPblS6Lzzi6LPoJ/ELGgESWONyvjmrxYVZ8wS5ZNTILkujVI8anPNthVJBOmdeMbqgAjZUBH3SXctZRrcsFvvJxyDfN4X2CZ34rETtDFKqV9h8DDvjGq2ifzXkGmemoE781tY3u3mN1quDi1YCQ6sLIVECLzeQqeTH5pL7pBHgzDsrBaaURi0q8o/A==
Received: from FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::16)
 by DB6PR1001MB1127.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:66::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Tue, 12 Jul
 2022 12:27:30 +0000
Received: from VE1EUR01FT092.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:1d:cafe::8a) by FR3P281CA0006.outlook.office365.com
 (2603:10a6:d10:1d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.11 via Frontend
 Transport; Tue, 12 Jul 2022 12:27:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.73) by
 VE1EUR01FT092.mail.protection.outlook.com (10.152.3.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 12:27:29 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Tue, 12 Jul 2022 14:27:28 +0200
Received: from md3itd2c.ad001.siemens.net (139.21.146.185) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Tue, 12 Jul 2022 14:27:28 +0200
From: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Subject: [meta-virtualization][PATCH 3/3] image-oci-umoci: skip parent
 directory in tar
Date: Tue, 12 Jul 2022 14:26:47 +0200
Message-ID: <20220712122647.12746-3-vasileios.anagnostopoulos@siemens.com>
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
X-TM-AS-Result: No-10--11.422200-8.000000
X-TMASE-MatchedRID: lXGXXqp5QrebGd7an/OkWZ8qOWCG6OCXahH+l6+69liRgPzABkqxIOx8
	b780hPr+3Gx7xHTmTjPZAIZE0qrMHF32vf0LJwlilrJx0HXHbqN/H+vX/A1i2j8Ckw9b/GFeTJD
	l9FKHbrmAI7Mvq/sL52xAqm+JOC8IfS0Ip2eEHnzmEN83F06F6/oLR4+zsDTt9xS3mVzWUuCgZH
	IBpyeFpq9V5HZcpP0qcyTaq2Afi5HABdQkAcxUjE33xZ6xKRjaftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.422200-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 D060CC98FAE09339DA0EE81AAD24762827E920E5AA7DFF354D710820C874C4892000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a098699e-a568-4239-f71c-08da6401e336
X-MS-TrafficTypeDiagnostic: DB6PR1001MB1127:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1O/pMJKyiDX+1FSNDRfiCYJ9Vyr7YVYd3exuho0/Nb0T/9zEn51+yqVPp/h6GL2q/65Xx8s0HvZYl3L0VK9HtOpMHJba/NcdFzpM/JJRYGQHNMQizYUmjuBb9I1LUEwA631b61oyBZwBX9lha5nuT1RoKQub20gk3fz160+S6i1XeBuSQW6vlZsPU+99UJsi0kWs3S2vpqhgnE9JiZjwLgih9698n9vh7Zs7HmE9ePoBZyJfvbuYaJ7gFcHJVo1fB7jK3aQOeNRJv99pgkOaq5ZgTqZ6I+uPLwBN2qKZFPzS8E8xCTFWYd7Ggy6UN/iU8n2dyRT213U2+MOtFcUTJ023WG8jH28CAqhVKBu1aDudB5SchRnJ+NMGVx58AVV4lWf6hwjm0q9xL3As3rT/w7O1dNRJJUAwMz7UwXNxGvF/sVwvMuhiKqsCmP9SCB0k/HuihjkaYP9GgiDEqvxDldcQBO3kyQiJ5KGlfoL2Xb7nIsegChq4FmMdKEroVy3cTJkYoxO12KnpTXWl0w9RVCy2el0EGjGTQvYaaADickdEQXTX2ipi1iDiLn51LZCFuDnuQu94kAQKMlLL5OO52zcI2OqyxQXKVno+gHjxVaXDTwS4jRCi1WxUum4LwnYPnY0OOPrByk+BNhob6laDV5rjcErRabIJ2Kows87eYbGajQuAjj8vX3POCUzlkIhZxtGJs33KPqV+L800ryfYxfvI4VwAcKLzCoopdUbtxKopvmON1kGaELhJAojwJU6trIlN7HyfDg5aG9y8bPJP0eSsvK8rFcNDmdahAGGpueZjKv0qdpJCR37O4dXQgfaBKicrnKpGkMw2bsoeTkm/ADy5zqxQhhXML6yom4clc18=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966006)(36840700001)(40470700004)(107886003)(41300700001)(336012)(8676002)(1076003)(26005)(6666004)(186003)(2616005)(956004)(36860700001)(16526019)(82960400001)(47076005)(83380400001)(478600001)(81166007)(356005)(82740400003)(4326008)(70206006)(8936002)(2906002)(44832011)(4744005)(36756003)(5660300002)(6916009)(70586007)(86362001)(40480700001)(316002)(40460700003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 12:27:29.5652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a098699e-a568-4239-f71c-08da6401e336
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT092.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1127
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Jul 2022 12:27:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7443

Skip the inclusion of the parent directory in the tar file.
Most tools expect a tar file without it. An example of this
use case is skopeo, where the skopeo copy oci-archive command
will not work with the generate tar file.

Signed-off-by: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens=
.com>
---
 classes/image-oci-umoci.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index f941795..771f288 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -107,7 +107,7 @@ IMAGE_CMD:oci() {
=20
     # make a tar version of the image direcotry
     if [ -n "${OCI_IMAGE_TAR_OUTPUT}" ]; then
-	tar -cf "$image_name.tar" "$image_name"
+	tar -cf "$image_name.tar" -C "$image_name" .
     fi
=20
     # We could make this optional, since the bundle is directly runnable v=
ia runc
--=20
2.34.1


