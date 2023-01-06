Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25E8C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 14:46:50 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.41])
 by mx.groups.io with SMTP id smtpd.web11.15070.1673016405171856698
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Jan 2023 06:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=LxgGvULM;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.237.41, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKSM5/Uwaugw6xVzlgcgjn99Lz/K3WsbrCac0XKA5n5/LnJbNoXvOpw8QudVLJ8MzBMME5DtI3hbF5JCztkmJf9brC9QG7uGwDk8vmnTuzvWxJpFzfPQkW4u+0G/aBsNQY/5RP5Li4668j85AJivUpBQknoaB1syxeywMx21UAjRf1Y1lPFJLS9G1HNgCCYanRaWRIYB55PLEMvL11EqNPyx2p8kj7gM2kSnwLG2Z3Dhhw0CZr/OKwTl2vuCmMlpuhPzkcrHmYpE6epP/xrR1G8/T6AK99DbH+MOR6pZJhgOHNjA++B+vba3oINhkcH/GT+4oIHF5VpONR9HsperIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHzmF1ocPxkoZvhXSaqzFw0RIlE7XFQslJw2K803p84=;
 b=girXIEB/m5G9bc+ZUEi9QVT2GlB+bWC0bGvCdobuqjo7c5kKgPMh9Xc93SPwR+0n8f/tXwlaWpbC9vF5AsfV2AivIC9h/cJ+L2Xp6Uj5ymZWu6bhaKzoDyDDjVKZs3TAiTAlmB0XEc/OZ3OdkfFTAUkxGyso4Icp5hGvBWNp5Kj73D8ssPgUvf2rP0wZgmAyzhX4T/aH8VPCZmgu9eVC0NbgOY30zogOlb3hBY4d1+WJOAV2+oSLSZwJU8Tezlc8qeKdavUodBxhXerbRPFsiCk7G0fblpam7HPzSXPJ0lO7jEGUkopdBVLNO1j3Sv6AzUN8a2ILJ9Y3MTJv+bHIzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHzmF1ocPxkoZvhXSaqzFw0RIlE7XFQslJw2K803p84=;
 b=LxgGvULMHuV4rdeONnQlba3wmVx9zfDhXOZpsknpbBG2eB4r1ajNzFQB3aiY0w8Rb90wqmtyLckL3MsgOjX3/4N//WHuMpG277TcyDI9imaDpg6YvRb7zfGGmsyKpBffn+9Fww/wtPzak89XxqtmxrA72N2KAfp1EHwnN2x+dtI=
Received: from BN8PR15CA0067.namprd15.prod.outlook.com (2603:10b6:408:80::44)
 by CO6PR12MB5410.namprd12.prod.outlook.com (2603:10b6:5:35b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 14:46:42 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::af) by BN8PR15CA0067.outlook.office365.com
 (2603:10b6:408:80::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 14:46:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Fri, 6 Jan 2023 14:46:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 6 Jan
 2023 08:46:41 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 6 Jan
 2023 08:46:40 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 6 Jan 2023 08:46:39 -0600
From: Michal Orzel <michal.orzel@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <christopher.w.clark@gmail.com>, <bertrand.marquis@arm.com>,
	<stefano.stabellini@amd.com>, <stewart.hildebrand@amd.com>,
	<bruce.ashfield@gmail.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 2/3] xen: Add recipes for stable Xen 4.17 release and update master
Date: Fri, 6 Jan 2023 15:46:29 +0100
Message-ID: <20230106144630.23637-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106144630.23637-1-michal.orzel@amd.com>
References: <20230106144630.23637-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|CO6PR12MB5410:EE_
X-MS-Office365-Filtering-Correlation-Id: eb97d8b4-3568-4550-a2dd-08daeff4d2d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	itmF1lx1LG4ne1QrI3+X3OpH6gi7JlQLisd4PheACqD2sE7my534BydeYJ1R7XCWpMDXDSD1AEntoxu1i4BCip9ra2cEmntX3YjF41uzSPCSiY0BPTlhLNEMP1Lnlk7ZoP3KC3tMvx/n458b5J8DdrFrlvzb6Gb7TvGD/ab7XUoP/IvY/E+rmVhg/sRTd1Jgl4hrVEugPBPYyLSJ0/02aneolNqOwA714bTbj800ooX8VT/wQp+DzTIUhGoYlh2RavkHK9bSKJWWCMEZDlfgttdHpqPrd3fbkcyXJT3EQ/MECiqTiCuI7+IP0ZA6Dp2h60BYsjDtcLz8KAugSZz1gHz/0Aq9MgzJByLLVNOSb7IogDLZ0Osp/fSTqIeMjIMtGQEAm5ppyJUVz/fgq3bljdyPCuHlygMPtWVhYIQs+auu/smDwdaxUe5e6qYShlYq+z0iXchkvLDXwUFVzOCieWNrX3CWujOjukhlxGyYop8QaG6rJBP+du0lw1tEfpPg4lvvKx12QoTEe7t+oMKGrfvoKok8UOkNCd4O4jDYd44GAhqFevwbPfoRFsb3mgOgXbmfkQcPJPxFZruAgN5JcDHVY95pNt7GPnxsmh7PlLGOpNh45GO/xuMqw5F/Vy6aXAog0IlayJ9B1345z9Pj0PiFG0K3XP6pS7JaKn9wJMo/J0JHEl1IFYIxK2jkrEQVc5YJF425zYYcx3w1wZyR19NuvMKVll10EfzAPxeEEkc=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(46966006)(36840700001)(40470700004)(4001150100001)(356005)(2616005)(316002)(40480700001)(81166007)(478600001)(186003)(36756003)(86362001)(40460700003)(82310400005)(54906003)(26005)(6916009)(5660300002)(41300700001)(336012)(6666004)(8936002)(83380400001)(44832011)(15650500001)(1076003)(36860700001)(2906002)(426003)(4326008)(8676002)(70206006)(70586007)(82740400003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 14:46:41.4218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb97d8b4-3568-4550-a2dd-08daeff4d2d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5410
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Jan 2023 14:46:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7800

Add recipes for xen and tools for the newly released 4.17 version and
take the opportunity to update master recipes.

Reflect 4.17 tools changes in xen-tools.inc:
 - add test-paging-mempool to test package,
 - add init-dom0less script to xl package,
 - add localstatedir to xencommons package (this is needed as from 4.17
   onwards, there is no /var/lib/xenstored resulting in /var being
   installed but not shipped in any package).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - add init-dom0less to xl package
 - add localstatedir to xencommons package
---
 recipes-extended/xen/xen-tools.inc     |  3 +++
 recipes-extended/xen/xen-tools_4.17.bb | 19 +++++++++++++++++++
 recipes-extended/xen/xen-tools_git.bb  |  8 ++++----
 recipes-extended/xen/xen_4.17.bb       | 19 +++++++++++++++++++
 recipes-extended/xen/xen_git.bb        |  8 ++++----
 5 files changed, 49 insertions(+), 8 deletions(-)
 create mode 100644 recipes-extended/xen/xen-tools_4.17.bb
 create mode 100644 recipes-extended/xen/xen_4.17.bb

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-=
tools.inc
index d47309a72b1c..95da2bfbb6ce 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -616,6 +616,7 @@ FILES:${PN}-xl =3D "\
     ${libdir}/xen/bin/libxl-save-helper \
     ${sbindir}/xl \
     ${libdir}/xen/bin/xen-init-dom0 \
+    ${libdir}/xen/bin/init-dom0less \
     "
=20
 FILES:${PN}-xl-examples =3D "\
@@ -658,6 +659,7 @@ FILES:${PN}-xencommons +=3D "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_unitdir}=
/system/xen-init-dom0.service', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_unitdir}=
/system/xenstored.service', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_unitdir}=
/system/var-lib-xenstored.mount', '', d)} \
+    ${localstatedir} \
     "
=20
 FILES:${PN}-xend +=3D " \
@@ -688,6 +690,7 @@ FILES:${PN}-test +=3D "\
     ${libdir}/xen/bin/test-resource \
     ${libdir}/xen/bin/test-cpu-policy \
     ${libdir}/xen/bin/test-tsx \
+    ${libdir}/xen/bin/test-paging-mempool \
     "
=20
 # test-xenstore and test-resource currently only exist in 4.16
diff --git a/recipes-extended/xen/xen-tools_4.17.bb b/recipes-extended/xen/=
xen-tools_4.17.bb
new file mode 100644
index 000000000000..0f323cb32aac
--- /dev/null
+++ b/recipes-extended/xen/xen-tools_4.17.bb
@@ -0,0 +1,19 @@
+# xen 4.17.0 release sha
+SRCREV ?=3D "11560248ffda3f00f20bbdf3ae088af474f7f2a3"
+
+XEN_REL ?=3D "4.17"
+XEN_BRANCH ?=3D "stable-${XEN_REL}"
+
+SRC_URI =3D " \
+    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
+    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
+    "
+
+LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3Dd1a1e216f80b6d8da95fec897d0dbe=
c9"
+
+PV =3D "${XEN_REL}+stable${SRCPV}"
+
+S =3D "${WORKDIR}/git"
+
+require xen.inc
+require xen-tools.inc
diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/x=
en-tools_git.bb
index a450a7d6574a..fd42cf2963b4 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -1,7 +1,7 @@
-# master status on 2022-04-05
-SRCREV ?=3D "14dd241aad8af447680ac73e8579990e2c09c1e7"
+# master status on 2022-12-29
+SRCREV ?=3D "7eef80e06ed2282bbcec3619d860c6aacb0515d8"
=20
-XEN_REL ?=3D "4.17"
+XEN_REL ?=3D "4.18"
 XEN_BRANCH ?=3D "master"
=20
 SRC_URI =3D " \
@@ -9,7 +9,7 @@ SRC_URI =3D " \
     file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
     "
=20
-LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44a4=
e5"
+LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3Dd1a1e216f80b6d8da95fec897d0dbe=
c9"
=20
 PV =3D "${XEN_REL}+git${SRCPV}"
=20
diff --git a/recipes-extended/xen/xen_4.17.bb b/recipes-extended/xen/xen_4.=
17.bb
new file mode 100644
index 000000000000..f35689d4120f
--- /dev/null
+++ b/recipes-extended/xen/xen_4.17.bb
@@ -0,0 +1,19 @@
+# xen 4.17.0 release sha
+SRCREV ?=3D "11560248ffda3f00f20bbdf3ae088af474f7f2a3"
+
+XEN_REL ?=3D "4.17"
+XEN_BRANCH ?=3D "stable-${XEN_REL}"
+
+SRC_URI =3D " \
+    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
+    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-locati=
on.patch \
+    "
+
+LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3Dd1a1e216f80b6d8da95fec897d0dbe=
c9"
+
+PV =3D "${XEN_REL}+stable${SRCPV}"
+
+S =3D "${WORKDIR}/git"
+
+require xen.inc
+require xen-hypervisor.inc
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git=
.bb
index ebd1b76ff420..2138424406f9 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,7 +1,7 @@
-# master status on 2022-04-05
-SRCREV ?=3D "14dd241aad8af447680ac73e8579990e2c09c1e7"
+# master status on 2022-12-29
+SRCREV ?=3D "7eef80e06ed2282bbcec3619d860c6aacb0515d8"
=20
-XEN_REL ?=3D "4.17"
+XEN_REL ?=3D "4.18"
 XEN_BRANCH ?=3D "master"
=20
 SRC_URI =3D " \
@@ -9,7 +9,7 @@ SRC_URI =3D " \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-locati=
on.patch \
     "
=20
-LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44a4=
e5"
+LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3Dd1a1e216f80b6d8da95fec897d0dbe=
c9"
=20
 PV =3D "${XEN_REL}+git${SRCPV}"
=20
--=20
2.25.1


