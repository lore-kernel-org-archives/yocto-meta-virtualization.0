Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178BDC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 11:12:13 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.85])
 by mx.groups.io with SMTP id smtpd.web12.39641.1666005130076595460
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 04:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=GIKhZcd0;
 spf=pass (domain: siemens.com, ip: 40.107.15.85, mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJGcKaOVKVuXxOj6RlyPEvgyLpnXZej52HALddkwiMGKE4WWl4S6dWFgB55rDykn6sZsmVIzQ1aPOLgI4fkIpUWGMnDePHJ/8qR01zUI3fGVr5oI6gw0NDmd6mFUgc2LUZZx/ui/eOWJOZ03gcr4w1AovTBuf7xjmWTJt85satf5vsLPZv0tD4IVoeP+52b3WPc5PGhBNwHFMKeaFRsTQXgwhVJftqu19qP7WtLyjzO2Hs2735IXlM2Yz5uhM++KPaBgn/ie7++XdnxDUmvJTrOo5m6+AcnZu/xWm4m7gkHIEDwrOudIgWtuF148Mx28sxMgHr4sncX73HvOsS29Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYYT1RRrqKIdR5SPQKxq2j5gtIYsM1yMNmSalYsfAbk=;
 b=OWPNKywQ8kXZHhS4iJRWz/9etIYHqQtXpuLT0/NYqs4Ju4KLXjb8Feqp4kaw59PU82LvN+DwELPYjL3qwxVw1K+N79SlAeG9f6DZ06uNLWChp0fsGTUA973xJp11d62iJ5p60WB30TixBmfsdu4wINxEPP724CxyLyyhfkPrgoNtvUoFE5MZFgJsNiAZSh5InbeffKTJHArd8mADM0Do2mt1N1mFz1oHTaQFexeGRTWv24ij4JOd8aUI/e4FsumYx//hyITIaH0EMe2Qz7O4H74xNWGx68uWmSrV2iQjbXzDJ+C1TpyzSheU1ue/NvaO+TnWt1ye5+VFtUnWmwwJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYYT1RRrqKIdR5SPQKxq2j5gtIYsM1yMNmSalYsfAbk=;
 b=GIKhZcd0TA/FHQsYo1KltK9HMI7Ziqc0B3GeKkcjEuxbPEDSVZI/S5mQE/Oxs3053QTSL+sEyEn212DZC5aaAkV9+9xF5qK/TssBKvv+8xsNCe/F+G8Rmo/IzrIumJDC0c1G1j3FXJGk4djfYwAbWUtBCwgIfGieEdF7HOAxmZqSOoJ7/0TE+WSFmtO7k9ERFmakT8PgIr8X9TDwkEGeMq+vGX/zrVbawyM2ygFuu96yBqTsTUYB/RMHIOr5zp9WzQmLTW62WK5FigyVa2LACXvieItXTWhubndExOcoVbuxnO9/uIlRexiAyjahLP0Lv46tjwUUrNE/IoExoehrtA==
Received: from FR3P281CA0095.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a1::7) by
 DB8PR10MB3516.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.30; Mon, 17 Oct 2022 11:12:07 +0000
Received: from VE1EUR01FT032.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:a1:cafe::55) by FR3P281CA0095.outlook.office365.com
 (2603:10a6:d10:a1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.11 via Frontend
 Transport; Mon, 17 Oct 2022 11:12:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 VE1EUR01FT032.mail.protection.outlook.com (10.152.2.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 11:12:06 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 17 Oct 2022 13:12:06 +0200
Received: from md3itd2c.ad001.siemens.net (139.21.146.191) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Mon, 17 Oct 2022 13:12:06 +0200
From: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Subject: [meta-virtualization][PATCH 1/7] podman: allow overwriting the container runtime
Date: Mon, 17 Oct 2022 13:11:16 +0200
Message-ID: <20221017111121.25341-1-vasileios.anagnostopoulos@siemens.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.21.146.191]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT032:EE_|DB8PR10MB3516:EE_
X-MS-Office365-Filtering-Correlation-Id: 4542c42d-0e73-405e-0335-08dab0306d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hEJVJM1QhYgS6pi26Muc503IS1Xq/qFBBlHD7+OwihZ/fqbCJD9jDHofakyIQCqVWuIefIotp1AHGhBjU/s6BYOAJJqE7FvqOXanD1tYQAPtHIYVL+P7lTa84NwAIHQ4AKv+GUBzMNUX+3mbc7sAZv135/ozdh/r1qBCk5ndb5hXZOdzICSvdBssOteMMPWR8+7zyVokIjyUytv4etX06TFV0sd59kI/mJ4gWsyI8VZMVH4XD7fM9Z61e7jwjTGzr1wByOxAct4LSh20ofmWtOm+08wwruB5x1x+4Ihxo/MBT4KAni2NNVqmknmudg5+Q1HXSic//u5+NhNY2lNLHSoAqz9i7BYZa58AEHtIYlMYjF3kzj9w2VU2ElzxZn8nHm+4V7XSUPqem2kKXNZVI37+fAZ8XLIduTdp4mo9apFcWU1FmsDFD+PcV24Tf9t9wR1yC4m7BVsdZrjA45PzQ3v8L+wdtrmPtboa7i/bRACgPu5DX7SX5CKo1ScS+YchYsDgONHZwWsT3clNU12bCPbfOJg5ZM+dagkE2v5dLIFwGDqIbty1mMCC5Izpix1AIUNokm57xazR53PEHkfKaUIjDg3TGJkzeGPztYuCwVLjrPIM+SQzG3BzduBjCF+PBNhj1nffsNfQSX3/wcHvBCJSGjCRfnKqfDkprOpQS6d+nzQ8lBWI5/8lF2cG7mgy0OeVsfeMnx2e1zP4nAuJniE2W4effwVrSyARaMFuQVA2/PWg8GS7vcIVBb2uF2XGtp31/c9pd6j/ULpOfRWhYN3cwVV8SwCzufRZ6UYMHR7GVaDqJefS5cLjNgvFEdtL
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(8676002)(44832011)(6916009)(316002)(478600001)(41300700001)(4326008)(26005)(186003)(1076003)(16526019)(2906002)(336012)(5660300002)(956004)(8936002)(2616005)(82740400003)(82960400001)(36756003)(356005)(7596003)(7636003)(82310400005)(47076005)(36860700001)(83380400001)(6666004)(107886003)(70206006)(70586007)(40480700001)(86362001)(40460700003)(34020700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 11:12:06.8820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4542c42d-0e73-405e-0335-08dab0306d8e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT032.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3516
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Oct 2022 11:12:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7653

Signed-off-by: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens=
.com>
---
 recipes-containers/podman/podman_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/p=
odman/podman_git.bb
index e3bc908..dea14ba 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -65,6 +65,9 @@ EXTRA_OEMAKE =3D " \
 # packageconfig, the podman package will rconfict with docker.
 PACKAGECONFIG ?=3D "docker"
=20
+# Supported are: virtual-runc, crun
+DEFAULT_CONTAINER_RUNTIME ??=3D "virtual-runc"
+
 do_compile() {
 	cd ${S}/src
 	rm -rf .gopath
@@ -136,7 +139,7 @@ SYSTEMD_SERVICE:${PN} =3D "podman.service podman.socket=
"
 VIRTUAL-RUNTIME_base-utils-nsenter ?=3D "util-linux-nsenter"
=20
 RDEPENDS:${PN} +=3D "\
-	conmon virtual-runc iptables cni skopeo ${VIRTUAL-RUNTIME_base-utils-nsen=
ter} \
+    conmon ${DEFAULT_CONTAINER_RUNTIME} iptables cni skopeo ${VIRTUAL-RUNT=
IME_base-utils-nsenter} \
 	${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'fuse-overlayfs slirp4n=
etns', '', d)} \
 "
 RRECOMMENDS:${PN} +=3D "slirp4netns kernel-module-xt-masquerade kernel-mod=
ule-xt-comment"
--=20
2.34.1


