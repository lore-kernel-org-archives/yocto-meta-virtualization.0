Return-Path: <kamil.dziezyk@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951C0C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 11:33:09 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.45])
 by mx.groups.io with SMTP id smtpd.web10.7463.1642073587718176702
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Jan 2022 03:33:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=YUsIWnys;
 spf=pass (domain: arm.com, ip: 40.107.6.45, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlUEJPO4B7FSM6HzNm6LGrIwzu4MWG26kalTDHxNFO8=;
 b=YUsIWnyso5bR7EwM00HRCD6FTrwzBYcC4CLWmV4NGfcWMXsmM3Zvn7T7u+W+X7grwTqLwqcWP+I4rcCOnN5HH7d9PDi+iK/avNwqeq/+sNkPqbjsJ2zAuu/hS/5BSg51wNhF14afN5P9+zXrWybY5dlW7pWYbhWU095k9y6HaMY=
Received: from AM0PR02CA0144.eurprd02.prod.outlook.com (2603:10a6:20b:28d::11)
 by VI1PR08MB3647.eurprd08.prod.outlook.com (2603:10a6:803:85::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Thu, 13 Jan
 2022 11:33:05 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:28d:cafe::59) by AM0PR02CA0144.outlook.office365.com
 (2603:10a6:20b:28d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Thu, 13 Jan 2022 11:33:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 11:33:04 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Thu, 13 Jan 2022 11:33:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1020210c767ffc20
X-CR-MTA-TID: 64aa7808
Received: from d95faf0cf61e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4575A5C5-E14B-4EC7-80DC-73467AA654DA.1;
	Thu, 13 Jan 2022 11:32:58 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 d95faf0cf61e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Jan 2022 11:32:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsMMPRq2VH3qXL4aeUCf4/b3flcTx/5rqCPxvHOirMHKto6HY6M7HNv3RMe6efLtrWQDkviFrGRoioflhJxI/sca2fP8NTtqV374UHJOJ8XJrMxaOk15+N86JHR6//lBZmvp6flB+eon0kaa1hRiyDLtZlb9jaHj0ErQ67tUuqdEO+e6iWcu1iZlB5v7d5SQq5HU1dVltMafOa84mm68J+0FbgdHAYilPS7G58bGdRozUwj6aht9BRH7PNSmBD3YGrjeAzg80yBD1/Zz6Kw8qpjryYEK/CDokZmqCELCOhwl8cUBgBYBGBqVYD7RX45Y/u2hnLqdXu2RcxhUjq76ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlUEJPO4B7FSM6HzNm6LGrIwzu4MWG26kalTDHxNFO8=;
 b=J15oTTyNwfY1gyarDnrEbfLoslPJaiiD9syzxFalmk507EDpTME4G8PrjiA72AW1vw0atqJbU+9vkImKIEusnYojMWq1Mo6nqXvqy3+uSx2iMthhQIPSqMYRUASfGSfs2zu5/Y/7Z3+2f4Jd8qEMzu/EDrG+bdnm/bBtAm2rsWQ9MqjKdPDbhF0HpEk0NCjCrmLOtC2eHW4JynXzZ/UXuv+DWmH701+7tGxCl+D75/SgGyX5axYc1vmyoikNI/Y/+r9VQcYz21Qgn4oeaUve19SVBF1jw7QSWiJsMpu6AT2tJK09XYQbr8x1YEkQ7DZt5kmQOn1UeXD3J4nOXVhF8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlUEJPO4B7FSM6HzNm6LGrIwzu4MWG26kalTDHxNFO8=;
 b=YUsIWnyso5bR7EwM00HRCD6FTrwzBYcC4CLWmV4NGfcWMXsmM3Zvn7T7u+W+X7grwTqLwqcWP+I4rcCOnN5HH7d9PDi+iK/avNwqeq/+sNkPqbjsJ2zAuu/hS/5BSg51wNhF14afN5P9+zXrWybY5dlW7pWYbhWU095k9y6HaMY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by AM0PR08MB3905.eurprd08.prod.outlook.com (2603:10a6:208:10a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 11:32:56 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::408:fd93:d0d3:5315]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::408:fd93:d0d3:5315%3]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 11:32:56 +0000
From: Kamil Dziezyk <kamil.dziezyk@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	cardoe@gentoo.org
Subject: [PATCH v3 2/2] xen: Clear TUNE_CCARGS for Xen build for aarch64
 machines
Date: Thu, 13 Jan 2022 12:30:59 +0100
Message-Id: <20220113113059.20489-2-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220113113059.20489-1-kamil.dziezyk@arm.com>
References: <20220113113059.20489-1-kamil.dziezyk@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:806:21::17) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 0707595e-6fa3-481e-3f43-08d9d68876bb
X-MS-TrafficTypeDiagnostic: 
	AM0PR08MB3905:EE_|AM5EUR03FT006:EE_|VI1PR08MB3647:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB364765427A4098E97046E7A7FD539@VI1PR08MB3647.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
Content-Transfer-Encoding: quoted-printable
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 jXdrrniCvguERHjeEH3eMiILypfyZ/l+UDMH9K6vt2cHPenVPpJJl+Z2/DAQgZTH8NzA5LN3yAJKdu+dvl0KV2Btc0ScRms+qDrtBvsTSl/f5BTypmRh0wAPBvivqNa8VAQ93/1zKMM5PLNmD1W8sql2wN+T7Anwk+iq/+VF+rPUnlr/L9vK8EecMnFOZ6JxkPvFeK14K0FElgFh7F+crjpxfrcXRUMSGaMM559bXA36AYvhUsXw3c+kbuBv8kmY4/3/3YJ4RkbYUmaIqrfFnmmQj1vjN69gK8j6H+8g5eqTMndI9u4BQFbvM1tyi6IMGG1Q3EOlIbb+0qTbXf3Zrl/BSAVRijF3Sng14HK6pLQeLA1odr3y2X4+hpXbBOkRroHlhWM/biJ+hTcBKekibao2g8160QRiPVAo3tD5o2ZiDCJ8TtTK6hTnKGmGnsnAlM1bhhE8xBYJTLotKXXPF/iPgxZ11tLf87di7sl1HYgoh4AKQ1JsgtgL2qWohp9CHjYBrv0c54sr6Sg45phFadJOYEjoWdVLmt//kUho9UUtn7HSQgsidOqwPn/ov+v9kzdC9g4Hwjqt3i9eaYMtdiWvKlpYQ19Mu+vw+3pa243eLKg1Tp1Wd8igQa4P2JurmTB/x2bgyQXrA/X3ONlihwEseBWKlHT6xBBfEueDkAOm62amIsQgmIC4tT6JASmuBO4UCkz8VofINf2XBZFmdQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(508600001)(2906002)(26005)(5660300002)(6506007)(8936002)(52116002)(186003)(8676002)(36756003)(1076003)(6916009)(86362001)(83380400001)(6486002)(316002)(6512007)(66556008)(44832011)(66946007)(38100700002)(38350700002)(66476007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3905
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2e5208f8-2e77-4935-5a41-08d9d68871b0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nyRd+ZI+i7INfd5pnnQD0GytI+qMqrMAAyjB5dUecSXn+x9XSQ8xfbXOrrJBbBXLfflqWneSTUcFdrAg8wzE2xmV1T5dZGK4F0LH/7yeLUDq4iUZRqOoEWRdFt39cJv2+Gfvs4VM4aH+IMIiSe/zNi0+ahEQ9zRkcc+w4VzUXQMyHJFhlTVfCfH858ZP0J5Dha+vebywYb3zOsKeLv6otzy2+brdz0BzrIlqNE3xiSsiAX0sriyRShURwl+354r/5ufP7D1Qkdi0E9slDCtRadRsGIr/HGn4b5jQf/ydiJ3zNfoiGrFq7bxHMDnjSGyDeTrovewyUE7JldOLPu+SowKiOBwDZYnSIxSaRxj48n0tjieNPrwsbp+oGvfD/PmMbY0M6X8Uf3XXLyie8frwuecE2qwHZA8H/GXYyBJvvxk/pqj5jWn/LTS40fBPmHQG2eAZKwl1pPWIH0PIDy4XaF+IEbgqsmH2zXgIHNXHWdPFBryGguRjyxdoHK6BefbygOpIbpcRivOpihcVJqXcrFFugQHg0Hk1srj2p28HYMjTVIhAhWxs2MLIaGaliYEcSt2+NYooit+oS2fYlIorKlTlXPSoBsFp9GfSU2ztfAKCdc7cpVVKiVE4Iu+1MMdUkVAqK+3/Wz0dYbqtKy5pyFzPe4dMl7bfBEkOMSSRh9pUm5oFe4etvC+QUzgYJ5suE4NowqxRHu0u6yCvpU6oCNCoXy2NiDWvj2uY2J0laSwz0uWSjU5xVQIqVqjocIfWbtGDyHMO8yau19IZtmDdDQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(70586007)(336012)(81166007)(86362001)(26005)(47076005)(82310400004)(8936002)(70206006)(6916009)(6506007)(1076003)(2906002)(356005)(44832011)(36756003)(40460700001)(508600001)(5660300002)(316002)(83380400001)(107886003)(6512007)(2616005)(6486002)(4326008)(8676002)(36860700001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 11:33:04.4890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0707595e-6fa3-481e-3f43-08d9d68876bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3647
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 13 Jan 2022 11:33:09 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7000

Xen build may fail for arm machines that have enabled extra flags,
that can be enabled only for specific architecture version, e.g. armv8-2a.

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 recipes-extended/xen/xen-hypervisor.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen=
/xen-hypervisor.inc
index cffd491..81e361f 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -103,3 +103,7 @@ CROSS_CURSES_LIB +=3D "-L${STAGING_LIBDIR_NATIVE}"
 # Specify the root dir of the .config file for do_menuconfig and do_diffco=
nfig
 # tasks
 KCONFIG_CONFIG_ROOTDIR =3D "${S}/xen"
+
+# Xen is setting all CC flags on its own. Make sure that they are not modi=
fied
+# for aarch64, e.g. with architecture-specific optimizations.
+TUNE_CCARGS:aarch64=3D""
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

