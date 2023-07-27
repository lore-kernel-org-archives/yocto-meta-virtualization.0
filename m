Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCE7C41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 23:22:43 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.43])
 by mx.groups.io with SMTP id smtpd.web10.21540.1690500157223328163
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 16:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=tzIZW38c;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.244.43, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKK4RDPK0sn6kydoad36/YnTgfWgRNroZCGrjQOuBick/C0tJdE3E34dC6pIDFXbGA5TOX8PMI3Q7nRZKqxn2NhXbML0Nh90tAr0J59y/iVXEb7T5opH/Cx+24uaED+jBe5nS0fGKWLPrrtV5tUwA0qseq0Sg3T4rx64BvdUFLOMxrmYCusnHLGP2AuJrsMy1IJhE3lhzNOFzXtwzlsIpoDOFNQ5eWD8oPyiIYUx12D0l/l3KkN7cNvV7XOgbuSxv16JKlWL9GwAyVRVCAElJPKQfbu1MVJmzIYf191mKKRXvLdfYvW+RqQOn97N6gvy3nBSRsjVCFKTHulZ2pdbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/gLEdv1VxLykisxm1+m8YK5PGoqaA1wK3kEzEbWLIY=;
 b=MSSbDxUfrby7Hv5NoBGIN0J4neO4jpznAPF0ZAO9Wqmgszho0U39W6ZhuqZQQeZ8Fa4WjvPEMyuguE3sS2EdbuWk8PHM+CBQZ/y1mSwbDOiHDr1WpFN5zM+FAtzqOFRObDyRmnYsQyzhFyGKEgZFJJ1pS6A1qd5bVhJawcHRwVUCS1o0EjYgSaRmBheIS31QLZy/TSuMhZDaKQSwovwxstFcBUgNd/XzWhaXlJHit3Xr6SnRcTtTIFah4+9IX29C81uOWWr7vieOviLz+0UnLkc/tW48IbnShj2jjTpJ13PO8BN0wQTeD+ymJX51fmQzo1SyDHl4rxhdO8Tmh8FL4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/gLEdv1VxLykisxm1+m8YK5PGoqaA1wK3kEzEbWLIY=;
 b=tzIZW38cQ5oXiDyBoPFg2q0MV4b4YFN5iEL9xjUDy+uWOabxSvGnhyjpGK3LW6wuUSMdua1pNJZU5OJmUD1oVpkA7TT2UUb2O99hyrhGTuJ10ihmWrEPn1MzDcLqkUGk/w9cIi4bhMWXPefpzSf7qcJg88QpPpKbzQmXsyXCMMg=
Received: from MW4PR02CA0015.namprd02.prod.outlook.com (2603:10b6:303:16d::6)
 by CY8PR12MB7683.namprd12.prod.outlook.com (2603:10b6:930:86::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Thu, 27 Jul
 2023 23:22:34 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::b1) by MW4PR02CA0015.outlook.office365.com
 (2603:10b6:303:16d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29 via Frontend
 Transport; Thu, 27 Jul 2023 23:22:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.29 via Frontend Transport; Thu, 27 Jul 2023 23:22:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 27 Jul
 2023 18:22:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 27 Jul
 2023 18:22:30 -0500
Received: from xcosandeepg41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 27 Jul 2023 18:22:29 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>,
	<christopher.w.clark@gmail.com>, <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][PATCH 1/2] recipes-bsp: Add device-tree files for Xen support
Date: Thu, 27 Jul 2023 17:22:28 -0600
Message-ID: <20230727232229.3784426-2-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
References: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT011:EE_|CY8PR12MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: eae131a0-3ba0-4f1d-8432-08db8ef85b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8NI50TeFg/ZcETSmFaTzmnqiFA8QtUfqjaqVYJ5qUz3juKA1Bhg6YX3WG37Z6c6Drfzf8Ta1sP/+JPfz+PRweAcOmCzECjJx12RWheWHZg+uSYAsHOTufqVGmaj/ZvBng/xc/aMgw9miZ0jhx9R50F4JgOyFEqG9+J1QZFKT2G8BfAk9pOTvHCuAG92QcfGwyGXdIoAktusU4CxTVydLWJw4lMVxFrV6xx39QW7AxqmDtO5mD2dJY4R5VM7EOBDik38nxZ/MKnfkcnG7W+rGUTc0vib1d1BcImBlY47M69SBH80LmR5J8dq5TQrh9qL27qAfCsmr2Nb4FREzkoEBlbThgS1ckb5subnE4ZA8y1V8rvkAYYNugWA7bzXuBJXCdgHfYdjr1+1UHFZrwJ+F6e7HctCkd+nTYw1V6424SUnIJKaXkBRSevDdotxEnWoOt1V1IGMgHU5BVbrQjGRZq0YiLJFHikLyOjrtkP9kxbF6AsGUxE96PcYTku1tmg6fIdFHr0Re8wcdndRW2Ji29DaHRQ9lMwvsvAs9xi9U5XDdBVyLdP0Ybwi0DLhbTy5oWlv68BnV9NGTj2m4AFJqN97Tu64xOTlJShQUCgmjBIGfQ0kBp1ICmNlzm/kDoHpUrlbORncMAYEOD1RR2beBjwa2a7At0nvXlFT1bcK3vyGC7w40PX+uvPyCm/ry6uTFWvjX3n8hJ1FB/jE2oebJZl81ffgByMRQ6sArzPkl99r63wcNVEfwdGvtss5lXEO7G8mqjNb4n8PcUFkCTaY9Zw==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(82310400008)(451199021)(40470700004)(36840700001)(46966006)(478600001)(316002)(40480700001)(70206006)(70586007)(83380400001)(110136005)(41300700001)(36860700001)(36756003)(8676002)(8936002)(186003)(1076003)(40460700003)(336012)(26005)(5660300002)(86362001)(82740400003)(426003)(2616005)(2906002)(356005)(81166007)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 23:22:33.9349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eae131a0-3ba0-4f1d-8432-08db8ef85b7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7683
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Jul 2023 23:22:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8143

Add device-tree files for Xen support, Earlier all these files
were in meta-petalinux layer, Hence move these files to this layer
so that users can build Xen without including meta-petalinux.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../device-tree/device-tree.bbappend          |  19 +++
 .../files/versal-net-xen-qemu.dtsi            |   2 +
 .../device-tree/files/versal-net-xen.dtsi     |  67 ++++++++++
 .../device-tree/files/versal-xen-qemu.dtsi    |   2 +
 .../device-tree/files/versal-xen.dtsi         |  59 +++++++++
 .../device-tree/files/zynqmp-xen-qemu.dtsi    |  16 +++
 .../device-tree/files/zynqmp-xen.dtsi         | 123 ++++++++++++++++++
 7 files changed, 288 insertions(+)
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/device-tr=
ee.bbappend
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/ver=
sal-net-xen-qemu.dtsi
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/ver=
sal-net-xen.dtsi
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/ver=
sal-xen-qemu.dtsi
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/ver=
sal-xen.dtsi
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/zyn=
qmp-xen-qemu.dtsi
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/zyn=
qmp-xen.dtsi

diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbap=
pend b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
new file mode 100644
index 0000000..e235826
--- /dev/null
+++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
@@ -0,0 +1,19 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+
+ENABLE_XEN_DTSI ?=3D ""
+ENABLE_XEN_QEMU_DTSI ?=3D ""
+
+XEN_EXTRA_OVERLAYS =3D ""
+XEN_EXTRA_QEMU_OVERLAYS =3D ""
+
+XEN_EXTRA_OVERLAYS:zynqmp =3D "zynqmp-xen.dtsi"
+XEN_EXTRA_QEMU_OVERLAYS:zynqmp =3D "zynqmp-xen.dtsi zynqmp-xen-qemu.dtsi"
+
+XEN_EXTRA_OVERLAYS:versal =3D "versal-xen.dtsi"
+XEN_EXTRA_QEMU_OVERLAYS:versal =3D "versal-xen.dtsi versal-xen-qemu.dtsi"
+
+XEN_EXTRA_OVERLAYS:versal-net =3D "versal-net-xen.dtsi"
+XEN_EXTRA_QEMU_OVERLAYS:versal-net =3D "versal-net-xen.dtsi versal-net-xen=
-qemu.dtsi"
+
+EXTRA_OVERLAYS:append =3D "${@' ${XEN_EXTRA_OVERLAYS}' if d.getVar('ENABLE=
_XEN_DTSI') =3D=3D '1' else ''}"
+EXTRA_OVERLAYS:append =3D "${@' ${XEN_EXTRA_QEMU_OVERLAYS}' if d.getVar('E=
NABLE_XEN_QEMU_DTSI') =3D=3D '1' else ''}"
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net=
-xen-qemu.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal=
-net-xen-qemu.dtsi
new file mode 100644
index 0000000..336d7a2
--- /dev/null
+++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen-qe=
mu.dtsi
@@ -0,0 +1,2 @@
+/ {
+};
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net=
-xen.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-=
xen.dtsi
new file mode 100644
index 0000000..7da1f9f
--- /dev/null
+++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen.dt=
si
@@ -0,0 +1,67 @@
+&smmu {
+    status =3D "okay";
+};
+
+&adma0 {
+    iommus =3D <&smmu 0x210>;
+};
+
+&adma1 {
+    iommus =3D <&smmu 0x212>;
+};
+
+&adma2 {
+    iommus =3D <&smmu 0x214>;
+};
+
+&adma3 {
+    iommus =3D <&smmu 0x216>;
+};
+
+&adma4 {
+    iommus =3D <&smmu 0x218>;
+};
+
+&adma5 {
+    iommus =3D <&smmu 0x21a>;
+};
+
+&adma6 {
+    iommus =3D <&smmu 0x21c>;
+};
+
+&adma7 {
+    iommus =3D <&smmu 0x21e>;
+};
+
+&dwc3_0 {
+    iommus =3D <&smmu 0x230>;
+};
+
+&dwc3_1 {
+    iommus =3D <&smmu 0x232>;
+};
+
+&gem0 {
+    iommus =3D <&smmu 0x234>;
+};
+
+&gem1 {
+    iommus =3D <&smmu 0x235>;
+};
+
+&sdhci0 {
+    iommus =3D <&smmu 0x242>;
+};
+
+&sdhci1 {
+    iommus =3D <&smmu 0x243>;
+};
+
+&qspi {
+    iommus =3D <&smmu 0x244>;
+};
+
+&ospi {
+    iommus =3D <&smmu 0x245>;
+};
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen=
-qemu.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen=
-qemu.dtsi
new file mode 100644
index 0000000..336d7a2
--- /dev/null
+++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen-qemu.d=
tsi
@@ -0,0 +1,2 @@
+/ {
+};
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen=
.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi
new file mode 100644
index 0000000..6782e92
--- /dev/null
+++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi
@@ -0,0 +1,59 @@
+&smmu {
+	status =3D "okay";
+};
+
+&gem0 {
+    iommus =3D <&smmu 0x234>;
+};
+
+&gem1 {
+    iommus =3D <&smmu 0x235>;
+};
+
+&dwc3_0 {
+    iommus =3D <&smmu 0x230>;
+};
+
+&qspi {
+    iommus =3D <&smmu 0x244>;
+};
+
+&lpd_dma_chan0 {
+    iommus =3D <&smmu 0x210>;
+};
+
+&lpd_dma_chan1 {
+    iommus =3D <&smmu 0x212>;
+};
+
+&lpd_dma_chan2 {
+    iommus =3D <&smmu 0x214>;
+};
+
+&lpd_dma_chan3 {
+    iommus =3D <&smmu 0x216>;
+};
+
+&lpd_dma_chan4 {
+    iommus =3D <&smmu 0x218>;
+};
+
+&lpd_dma_chan5 {
+    iommus =3D <&smmu 0x21a>;
+};
+
+&lpd_dma_chan6 {
+    iommus =3D <&smmu 0x21c>;
+};
+
+&lpd_dma_chan7 {
+    iommus =3D <&smmu 0x21e>;
+};
+
+&sdhci0 {
+    iommus =3D <&smmu 0x242>;
+};
+
+&sdhci1 {
+    iommus =3D <&smmu 0x243>;
+};
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen=
-qemu.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen=
-qemu.dtsi
new file mode 100644
index 0000000..249a786
--- /dev/null
+++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.d=
tsi
@@ -0,0 +1,16 @@
+/ {
+        cpus {
+                cpu@1 {
+                        //compatible =3D "disabled";
+                        device_type =3D "none";
+                };
+                cpu@2 {
+                        //compatible =3D "disabled";
+                        device_type =3D "none";
+                };
+                cpu@3 {
+                        //compatible =3D "disabled";
+                        device_type =3D "none";
+                };
+        };
+};
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen=
.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi
new file mode 100644
index 0000000..3d75be6
--- /dev/null
+++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi
@@ -0,0 +1,123 @@
+&smmu {
+	status =3D "okay";
+};
+
+&gem0 {
+    iommus =3D <&smmu 0x874>;
+};
+
+&gem1 {
+    iommus =3D <&smmu 0x875>;
+};
+
+&gem2 {
+    iommus =3D <&smmu 0x876>;
+};
+
+&gem3 {
+    iommus =3D <&smmu 0x877>;
+};
+
+&dwc3_0 {
+    iommus =3D <&smmu 0x860>;
+};
+
+&dwc3_1 {
+    iommus =3D <&smmu 0x861>;
+};
+
+&qspi {
+    iommus =3D <&smmu 0x873>;
+};
+
+&lpd_dma_chan1 {
+    iommus =3D <&smmu 0x868>;
+};
+
+&lpd_dma_chan2 {
+    iommus =3D <&smmu 0x869>;
+};
+
+&lpd_dma_chan3 {
+    iommus =3D <&smmu 0x86a>;
+};
+
+&lpd_dma_chan4 {
+    iommus =3D <&smmu 0x86b>;
+};
+
+&lpd_dma_chan5 {
+    iommus =3D <&smmu 0x86c>;
+};
+
+&lpd_dma_chan6 {
+    iommus =3D <&smmu 0x86d>;
+};
+
+&lpd_dma_chan7 {
+    iommus =3D <&smmu 0x86e>;
+};
+
+&lpd_dma_chan8 {
+    iommus =3D <&smmu 0x86f>;
+};
+
+&fpd_dma_chan1 {
+    iommus =3D <&smmu 0x14e8>;
+};
+
+&fpd_dma_chan2 {
+    iommus =3D <&smmu 0x14e9>;
+};
+
+&fpd_dma_chan3 {
+    iommus =3D <&smmu 0x14ea>;
+};
+
+&fpd_dma_chan4 {
+    iommus =3D <&smmu 0x14eb>;
+};
+
+&fpd_dma_chan5 {
+    iommus =3D <&smmu 0x14ec>;
+};
+
+&fpd_dma_chan6 {
+    iommus =3D <&smmu 0x14ed>;
+};
+
+&fpd_dma_chan7 {
+    iommus =3D <&smmu 0x14ee>;
+};
+
+&fpd_dma_chan8 {
+    iommus =3D <&smmu 0x14ef>;
+};
+
+&sdhci0 {
+    iommus =3D <&smmu 0x870>;
+};
+
+&sdhci1 {
+    iommus =3D <&smmu 0x871>;
+};
+
+&nand0 {
+    iommus =3D <&smmu 0x872>;
+};
+
+&pcie {
+    iommus =3D <&smmu 0x4d0>;
+};
+
+&zynqmp_dpsub {
+    iommus =3D <&smmu 0xce3>;
+};
+
+&zynqmp_dpdma {
+    iommus =3D <&smmu 0xce4>;
+};
+
+&sata {
+    iommus =3D <&smmu 0x4c0>, <&smmu 0x4c1>, <&smmu 0x4c2>, <&smmu 0x4c3>;
+};
--=20
2.34.1


