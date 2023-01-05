Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17B7C3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 13:54:31 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.42])
 by mx.groups.io with SMTP id smtpd.web10.13195.1672926864678852826
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 05:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=jd2sQuX2;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.100.42, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6SZMt7FdhMew0oV+wwcsNJeGqS1t5wOCRpl4rq/yrkk6maGgyJ1eH49Lj0hdeU2DlmO6hg5MTM5J6A0msmhNKyF8uEUwTbXDxR8BTcPCpmrz+j+OlDtMsfYG6DWMORbMbQ/wDO+xzn1bmpyegFwiuDxJheKIZsDSwKzLoPOvnX6mM4k65KbTkTb0t4ilCNK+R0W/5Q7tOFcAch5BIZ/SNJ/sDIIlGJp7uJEF8ube+IQc6ebLoL3kXDYh4X8eMiDBQxP1EoSgz/KqMM5imAPdjtP15sH8IlVQwYowcCGylsJqZb8umNWcghB44azwBUf1jYeNuc2XrCN7b2KdvZZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Tf2aQob79feBjQFMUcM8rhz16KwJZdFsPbOP2UIeqc=;
 b=MUdzqi/KnU98jjoE7NOfMAvUCJwPMXr3ZdP/dWyF/DD1ZEJb5M47kdBN+L9l5N+AwLHV9Er7ftCTWx61e1TCluA6poJOiEalFqGAVp62QN3qHUxfckgdf+ikRyYfyK7lhNRr2wqOIIcpcd3PVcuohz/5l7L4uJAfpjCyI0k4iQwtRy1AnSnZ8F7b0attQyum673rWdH3vVcmNXMyqr7eNWfWSJLrB3R/Q4CzXKSrplu8wlCUTGhPasU3jWaVAqYnYMlJRRFlVVPG997fS5K+lw+WO6yx94dl7/5q57PeekLIL7++u7qUwHCJC06hY9QMjUEG78i2n70Y5rfCNaqcFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Tf2aQob79feBjQFMUcM8rhz16KwJZdFsPbOP2UIeqc=;
 b=jd2sQuX2lCFHw2XbZOE5fntSK5Z8OAZD27bEUvzZZL4KKnaQi8Uttr/NHQnEYCckXXpEaF10IfPin25DaaM3MamVQG3mlPF+klNVYJ960ICMFWXJlF6w7AGOPaqqP8wujmJVPcwip3/p3ArLAXP8g/Lv7DVy1cm+FCmnD9fveIc=
Received: from BN9PR03CA0480.namprd03.prod.outlook.com (2603:10b6:408:139::35)
 by MN0PR12MB6175.namprd12.prod.outlook.com (2603:10b6:208:3c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 13:54:22 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::1a) by BN9PR03CA0480.outlook.office365.com
 (2603:10b6:408:139::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 13:54:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 13:54:21 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 07:54:21 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 05:54:21 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 5 Jan 2023 07:54:19 -0600
From: Michal Orzel <michal.orzel@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <christopher.w.clark@gmail.com>, <bertrand.marquis@arm.com>,
	<stefano.stabellini@amd.com>, <stewart.hildebrand@amd.com>,
	<bruce.ashfield@gmail.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 2/3 RESEND] xen: Add recipes for stable Xen 4.17 release and update master
Date: Thu, 5 Jan 2023 14:54:04 +0100
Message-ID: <20230105135405.10168-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105135405.10168-1-michal.orzel@amd.com>
References: <20230105135405.10168-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT058:EE_|MN0PR12MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d26bd9-db2c-4261-8642-08daef245919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s2gxZjPSloJz1oNxQJL/7P0ODRhyxns8wrLIlgtdLxgj2j6F5X8WPAWs69zQIw6Nu/NfhoE5ND3QZprI0Ft5mBEag6v9Y2xbSXCmPjW7iBdR2x64oSQ5YPptajzGhUOekXP7OzkxXc/F0IeiuDuraUJczO6FYhBajgS3DZVD1iwXxn6TY9m60lBbSY0QOzup/snVs/Ba+xTCQP2vhjWO9+yRFRLPxPuMV13fEkRlLOCMd+QYB+0ZjOBNgLXPF+0GH3FoyNy7/YyQ2VYRoW+TZz93tbcN1f0aEgHuIdCitSt4H+kbHnPt0tL5X8AxrkNxkveTcJa4mrQqlgveSQJ/4fseawg9RvOkd9KBQ8ZI9fucpaYdy7Ce7AUfT3zY3cjTigrZRcGFqAFSPyF4PZfesbpjQxPi+YNIMUg2HD9D3ywd5nq+8PHvJYCeTJuneMSKjJe/s0JWDZryO54dnUNQDt2VVwzY7NZofcSdclAklfJeb94hwNvAr6o3SiyiBaI8PSXes0mv3/Nl+V52WHXW43Ib+bBscqu2E9imr3aRRLh3oXjtCJsMt2cWre5PqWiBc1GvFKi0TmmjOMN97RRfNYVB6GaNBcUUvQnlPH0xKrhrf5ZLM+UiBWSkkjj3r4lCk5sb9Wr+9HOdw7wPLz7QJ5OAUZkueeGUPkW0Jb6Gt/XWiSW9wuX2bLqqlmqPlL7pmtszQ3R9VCzEqZhaMjn2LhlzWpDIkkRBTfCRpyuDOM8=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(36840700001)(46966006)(40470700004)(47076005)(336012)(426003)(83380400001)(40480700001)(82310400005)(26005)(6666004)(2616005)(186003)(40460700003)(86362001)(36756003)(36860700001)(356005)(81166007)(82740400003)(1076003)(8676002)(41300700001)(4326008)(66899015)(15650500001)(4001150100001)(2906002)(8936002)(44832011)(5660300002)(478600001)(70586007)(316002)(70206006)(54906003)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 13:54:21.8583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d26bd9-db2c-4261-8642-08daef245919
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6175
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Jan 2023 13:54:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7791

Add recipes for xen and tools for the newly released 4.17 version and
take the opportunity to update master recipes.

Reflect 4.17 tools changes in xen-tools.inc:
 - add test-paging-mempool to test package,
 - add a new package init-dom0less that contains init-dom0less script,
 - add localstatedir to dev package.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Adding localstatedir to dev package is a little quirk just to keep the old
behavior unchanged and silence Yocto installed-but-not-shipped error.
The reason being, 4.17 onwards removed /var/lib/xenstored as it is mostly
unused. This leaves the build with empty /var and /var/lib. There are other
possible ways to handle this problem. We could remove the complete localsta=
tedir
while removing installed volatiles or add some checks for the version.
Suggestions are welcomed.
---
 recipes-extended/xen/xen-tools.inc     |  8 ++++++++
 recipes-extended/xen/xen-tools_4.17.bb | 19 +++++++++++++++++++
 recipes-extended/xen/xen-tools_git.bb  |  8 ++++----
 recipes-extended/xen/xen_4.17.bb       | 19 +++++++++++++++++++
 recipes-extended/xen/xen_git.bb        |  8 ++++----
 5 files changed, 54 insertions(+), 8 deletions(-)
 create mode 100644 recipes-extended/xen/xen-tools_4.17.bb
 create mode 100644 recipes-extended/xen/xen_4.17.bb

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-=
tools.inc
index d47309a72b1c..1a422255014e 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -212,6 +212,7 @@ PACKAGES =3D " \
     ${PN}-test \
     ${PN}-xen-vmtrace \
     ${PN}-xen-mceinj \
+    ${PN}-init-dom0less \
     "
=20
 PROVIDES =3D+ " \
@@ -245,6 +246,7 @@ FILES:${PN}-dbg +=3D "\
=20
 FILES:${PN}-dev =3D "\
     ${includedir} \
+    ${localstatedir} \
     "
=20
 FILES:${PN}-doc =3D "\
@@ -688,6 +690,7 @@ FILES:${PN}-test +=3D "\
     ${libdir}/xen/bin/test-resource \
     ${libdir}/xen/bin/test-cpu-policy \
     ${libdir}/xen/bin/test-tsx \
+    ${libdir}/xen/bin/test-paging-mempool \
     "
=20
 # test-xenstore and test-resource currently only exist in 4.16
@@ -708,6 +711,11 @@ FILES:${PN}-xen-vmtrace +=3D"\
 # xen-vmtrace is only built for x86 4.16, so allow empty package
 ALLOW_EMPTY:${PN}-xen-vmtrace =3D "1"
=20
+FILES:${PN}-init-dom0less +=3D "${libdir}/xen/bin/init-dom0less"
+
+# init-dom0less is only built for Arm 4.17, so allow empty package
+ALLOW_EMPTY:${PN}-init-dom0less =3D "1"
+
 INSANE_SKIP:${PN} =3D "already-stripped"
=20
 # configure init.d scripts
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


