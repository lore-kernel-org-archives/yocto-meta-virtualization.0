Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D166C982D0
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 02:49:43 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3083.1789699779074284880
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 19:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=EWdxsWpW;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 52.101.57.4, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuFY7OxJFR/rIOi6kYIECyhTrhMATpTm+SFpnIHQmmViZtEV+Gqz+977bXXdmJB/ShNF6S97S8nSojW7iRw8j2IF09GoOp3XraQ5BWsrRg4j1P41pjD9vZ1hxIcp4bWT+/zHmEi3BBBEVlJtmBRMxB9sLK5J22ft1ufcyEr0J4w9JhEMk9bBnPnCd8/tjfqKkzTNRFeyzavr5TZAvO6MvhApDUjrOymwmW7UFVDPgNnmBQJpLZ/BuRvuIKWpM0jN9tYS9Bm3S+6JLXWJPRSfMYHWIyQ01q7/oJ/d+YL3xhGLPPlmkkqZ2sPg2dwZ/4AL1rDbmaG3X/gqiQUJwOkOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfgsAl+m1dZlOXa4kxRPGq7DSLLPRSsMnayOt9L6d3w=;
 b=IejGB2JOjsnl6quR26j9mA8YwNOunBxGKA1XR7PqErjWA1li0Cc9Bv0X1ErDtXcOszkGA4zuLjsp+XR077fIqlioaGv84IpIhQvlMNB1q4yd5FgiSdK8beyUFrpQKUtreYCWyfGg3SvVxIeFiN0zdIrL1F2gBb2+HpnPq0dYxZHX1lthjrbnlMkaA4L6uU7g+VA1Bp+kV1NwJ42aABB/yxiKE7ODaxshrWMWJfIL9g4udNRM+tGWH5jNejPyNoo7PAnjITdWGszkgiU59zd9cta0THJwOPWEBJTolAp4gqtRyGhfgCMdtniiCMtHMa+hFCM+AQDEQcb28ce4rE4qdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfgsAl+m1dZlOXa4kxRPGq7DSLLPRSsMnayOt9L6d3w=;
 b=EWdxsWpWo7PyIuRZkZLPtsdxXwPRbRv6+koSpSUZXLwfLQ2wvmHebY9jMhGrg/XvWjzWA+Zlj3QMtQUXlQokwccxEg3cTXIl3MOa2tGtFndidLYm0Ah4zI2XkxyS/5XmnlN6YfDmlOnY0K4ryAKHr+4OXbOmiJateiOaUz0DVmU=
Received: from BL1PR13CA0399.namprd13.prod.outlook.com (2603:10b6:208:2c2::14)
 by CHBPR12MB463627.namprd12.prod.outlook.com (2603:10b6:610:36c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 02:49:25 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:2c2:cafe::10) by BL1PR13CA0399.outlook.office365.com
 (2603:10b6:208:2c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Fri, 18
 Sep 2026 02:49:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=temperror
 (sender IP is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Fri, 18 Sep 2026 02:49:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 21:49:23 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 21:49:23 -0500
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 17 Sep 2026 21:49:23 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][master][wrynose][PATCH 1/1] xilinx: Remove redundant device-tree/u-boot recipes
Date: Thu, 17 Sep 2026 20:49:23 -0600
Message-ID: <20260918024923.1866168-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|CHBPR12MB463627:EE_
X-MS-Office365-Filtering-Correlation-Id: 0446f420-6fd8-45a4-ebe9-08df152f72b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|10067099003|3023799007|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	+5oiG5fI/9qkgEOV+YBnCu4aWI2R71UyICVBPkYWQYEzVN0uJaxAeC9dGWpL95Ry9AgGBnesCgN05xU8lwI01KrFpkY+1+W5pLWnEt/0OfUFDphMhqekdsFhzgPVw6MV89umIVQ1C+jGf+EfDMMruCth8AiYKiLif6shKtU6Q99ivT0NApWhEnQtUS98yBU6n4cgCGQVDM4ARlI7jKhSO6871ZIvX8DfV9cqe4zLmjlTrYjjEEj3xJgYLjAkD7DbrJjm/i6sGSyM6dA+nNxUxM965Q6w+mNn8myW+Qyr64wstqRkdJ+LtB5UC0/6DqLjdHgNx8RI88su2sUenuBw183qzBSr5lTaO3f485XAHSFchaGFjrw5yp/8dbL/bSphjgouuWgbJlP96WUQzVvOK9HYY1mXr6bcf7Qv1FMr4x1qmo3VLVtECJyZTice0Bh0X9OK3Td3uCI9yBmFvqr7QUWwseqdTd2yLYwdT7DkXRV6OVBOfCrsIsI25I/5AakVvlgtVFiVKIST1K6j526R8up7eUgelRacKoAQ2Jyb7SVvbcrgTBhcGu8dcwZ42t3QhpEmeaRHKA/VwSOkbeNEw2HFXgF5B/MMOMLTSksNM5Dxpbn+seXcPz+YXwpJgHJk2kQZjfvu8wriM7RQSbnWSUjwLgObeEfQiXJ0uU9Tgkpr1n1Vd5YsBrCUddHewlvVQ0Gf8c0yYgk+Ez9+Egh0zw==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(3023799007)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TTcfZp7llPTBicnYmlA6v7vq9SuiTjtSm+QERYU6y8887065GkIL7G6TPHvHH46tPM25BmpKuchwZ2zexipMjVntmUzASfTi3AA0Lklb7ckkZB674+J/QrcauvTI58oECgb8lG+tvN4/Q6A8KdrWZYMsxXHb/TlrTEC9EFWfNNl4sKkMKGrs8Eo4w8dRWcthztv/99NCW36mCa/DL4qqXw2YIhErVa/AySJ1pCo0tJZpX3cwFIIQ2Kljz9TcJXD49I0HIuiVzMM0tKDVKwhiLwekF+sswd2oEWriC9Q5bPI4Ta77zTC0hVoil3BHd2VUf+iRnwVLxsbFhNK8s7doeQLtWm0aWODuWQOVe4sKfeYtkImVQoqXAdTlvYxNEXnsKSTxg43FijeyhnQrMFoZR/gujgQ/46g/YF8U5gABsf6cBaK/VvNf5oVB8e7vRCh0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 02:49:24.1449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0446f420-6fd8-45a4-ebe9-08df152f72b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB463627
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Sep 2026 02:49:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10085

Remove dynamic-layers/xilinx/recipes-bsp/device-tree and
dynamic-layers/xilinx/recipes-bsp/u-boot, both now redundant:

- device-tree.bbappend + files/*.dtsi (Xen DT overlay includes for
  zynqmp/versal/versal-net) are duplicated, with additional
  versal-2vp and TARGET_OS-guard support, by
  meta-xilinx/meta-xilinx-virtualization/recipes-bsp/device-tree.

- u-boot-xlnx-scr.bbappend + xen-boot-cmd.inc + boot.cmd.xen provided
  an ENABLE_XEN_UBOOT_SCR-gated Xen boot.scr flow bolted onto
  u-boot-xlnx-scr. The standalone u-boot-xen-scr recipe in
  meta-xilinx/meta-xilinx-virtualization (selected via
  UBOOT_BOOT_SCRIPT:append =3D " u-boot-xen-scr", see
  meta-xilinx-virtualization/README.xen.boot.scr.md) is the
  supported replacement, generating xen_boot.scr via the Xen
  image-builder dom0/dom0less template configs instead.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../device-tree/device-tree.bbappend          |  19 ---
 .../files/versal-net-xen-qemu.dtsi            |   2 -
 .../device-tree/files/versal-net-xen.dtsi     |  67 ----------
 .../device-tree/files/versal-xen-qemu.dtsi    |   2 -
 .../device-tree/files/versal-xen.dtsi         |  59 ---------
 .../device-tree/files/zynqmp-xen-qemu.dtsi    |   2 -
 .../device-tree/files/zynqmp-xen.dtsi         | 123 ------------------
 .../u-boot/u-boot-xlnx-scr.bbappend           |   4 -
 .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  80 ------------
 .../recipes-bsp/u-boot/xen-boot-cmd.inc       |  38 ------
 10 files changed, 396 deletions(-)
 delete mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/device-tr=
ee.bbappend
 delete mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/ver=
sal-net-xen-qemu.dtsi
 delete mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/ver=
sal-net-xen.dtsi
 delete mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/ver=
sal-xen-qemu.dtsi
 delete mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/ver=
sal-xen.dtsi
 delete mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/zyn=
qmp-xen-qemu.dtsi
 delete mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files/zyn=
qmp-xen.dtsi
 delete mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-sc=
r.bbappend
 delete mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-sc=
r/boot.cmd.xen
 delete mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.i=
nc

diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbap=
pend b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
deleted file mode 100644
index 813c08f8..00000000
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
+++ /dev/null
@@ -1,19 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
-
-ENABLE_XEN_DTSI ?=3D ""
-ENABLE_XEN_QEMU_DTSI ?=3D ""
-
-XEN_EXTRA_DT_INCLUDE_FILES =3D ""
-XEN_EXTRA_QEMU_DT_INCLUDE_FILES =3D ""
-
-XEN_EXTRA_DT_INCLUDE_FILES:zynqmp =3D "zynqmp-xen.dtsi"
-XEN_EXTRA_QEMU_DT_INCLUDE_FILES:zynqmp =3D "zynqmp-xen.dtsi zynqmp-xen-qem=
u.dtsi"
-
-XEN_EXTRA_DT_INCLUDE_FILES:versal =3D "versal-xen.dtsi"
-XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal =3D "versal-xen.dtsi versal-xen-qem=
u.dtsi"
-
-XEN_EXTRA_DT_INCLUDE_FILES:versal-net =3D "versal-net-xen.dtsi"
-XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal-net =3D "versal-net-xen.dtsi versal=
-net-xen-qemu.dtsi"
-
-EXTRA_DT_INCLUDE_FILES:append =3D "${@' ${XEN_EXTRA_DT_INCLUDE_FILES}' if =
d.getVar('ENABLE_XEN_DTSI') =3D=3D '1' else ''}"
-EXTRA_DT_INCLUDE_FILES:append =3D "${@' ${XEN_EXTRA_QEMU_DT_INCLUDE_FILES}=
' if d.getVar('ENABLE_XEN_QEMU_DTSI') =3D=3D '1' else ''}"
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net=
-xen-qemu.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal=
-net-xen-qemu.dtsi
deleted file mode 100644
index 336d7a25..00000000
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen-qe=
mu.dtsi
+++ /dev/null
@@ -1,2 +0,0 @@
-/ {
-};
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net=
-xen.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-=
xen.dtsi
deleted file mode 100644
index 7da1f9f1..00000000
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen.dt=
si
+++ /dev/null
@@ -1,67 +0,0 @@
-&smmu {
-    status =3D "okay";
-};
-
-&adma0 {
-    iommus =3D <&smmu 0x210>;
-};
-
-&adma1 {
-    iommus =3D <&smmu 0x212>;
-};
-
-&adma2 {
-    iommus =3D <&smmu 0x214>;
-};
-
-&adma3 {
-    iommus =3D <&smmu 0x216>;
-};
-
-&adma4 {
-    iommus =3D <&smmu 0x218>;
-};
-
-&adma5 {
-    iommus =3D <&smmu 0x21a>;
-};
-
-&adma6 {
-    iommus =3D <&smmu 0x21c>;
-};
-
-&adma7 {
-    iommus =3D <&smmu 0x21e>;
-};
-
-&dwc3_0 {
-    iommus =3D <&smmu 0x230>;
-};
-
-&dwc3_1 {
-    iommus =3D <&smmu 0x232>;
-};
-
-&gem0 {
-    iommus =3D <&smmu 0x234>;
-};
-
-&gem1 {
-    iommus =3D <&smmu 0x235>;
-};
-
-&sdhci0 {
-    iommus =3D <&smmu 0x242>;
-};
-
-&sdhci1 {
-    iommus =3D <&smmu 0x243>;
-};
-
-&qspi {
-    iommus =3D <&smmu 0x244>;
-};
-
-&ospi {
-    iommus =3D <&smmu 0x245>;
-};
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen=
-qemu.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen=
-qemu.dtsi
deleted file mode 100644
index 336d7a25..00000000
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen-qemu.d=
tsi
+++ /dev/null
@@ -1,2 +0,0 @@
-/ {
-};
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen=
.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi
deleted file mode 100644
index 6782e925..00000000
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi
+++ /dev/null
@@ -1,59 +0,0 @@
-&smmu {
-	status =3D "okay";
-};
-
-&gem0 {
-    iommus =3D <&smmu 0x234>;
-};
-
-&gem1 {
-    iommus =3D <&smmu 0x235>;
-};
-
-&dwc3_0 {
-    iommus =3D <&smmu 0x230>;
-};
-
-&qspi {
-    iommus =3D <&smmu 0x244>;
-};
-
-&lpd_dma_chan0 {
-    iommus =3D <&smmu 0x210>;
-};
-
-&lpd_dma_chan1 {
-    iommus =3D <&smmu 0x212>;
-};
-
-&lpd_dma_chan2 {
-    iommus =3D <&smmu 0x214>;
-};
-
-&lpd_dma_chan3 {
-    iommus =3D <&smmu 0x216>;
-};
-
-&lpd_dma_chan4 {
-    iommus =3D <&smmu 0x218>;
-};
-
-&lpd_dma_chan5 {
-    iommus =3D <&smmu 0x21a>;
-};
-
-&lpd_dma_chan6 {
-    iommus =3D <&smmu 0x21c>;
-};
-
-&lpd_dma_chan7 {
-    iommus =3D <&smmu 0x21e>;
-};
-
-&sdhci0 {
-    iommus =3D <&smmu 0x242>;
-};
-
-&sdhci1 {
-    iommus =3D <&smmu 0x243>;
-};
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen=
-qemu.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen=
-qemu.dtsi
deleted file mode 100644
index 336d7a25..00000000
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.d=
tsi
+++ /dev/null
@@ -1,2 +0,0 @@
-/ {
-};
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen=
.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi
deleted file mode 100644
index 3d75be65..00000000
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi
+++ /dev/null
@@ -1,123 +0,0 @@
-&smmu {
-	status =3D "okay";
-};
-
-&gem0 {
-    iommus =3D <&smmu 0x874>;
-};
-
-&gem1 {
-    iommus =3D <&smmu 0x875>;
-};
-
-&gem2 {
-    iommus =3D <&smmu 0x876>;
-};
-
-&gem3 {
-    iommus =3D <&smmu 0x877>;
-};
-
-&dwc3_0 {
-    iommus =3D <&smmu 0x860>;
-};
-
-&dwc3_1 {
-    iommus =3D <&smmu 0x861>;
-};
-
-&qspi {
-    iommus =3D <&smmu 0x873>;
-};
-
-&lpd_dma_chan1 {
-    iommus =3D <&smmu 0x868>;
-};
-
-&lpd_dma_chan2 {
-    iommus =3D <&smmu 0x869>;
-};
-
-&lpd_dma_chan3 {
-    iommus =3D <&smmu 0x86a>;
-};
-
-&lpd_dma_chan4 {
-    iommus =3D <&smmu 0x86b>;
-};
-
-&lpd_dma_chan5 {
-    iommus =3D <&smmu 0x86c>;
-};
-
-&lpd_dma_chan6 {
-    iommus =3D <&smmu 0x86d>;
-};
-
-&lpd_dma_chan7 {
-    iommus =3D <&smmu 0x86e>;
-};
-
-&lpd_dma_chan8 {
-    iommus =3D <&smmu 0x86f>;
-};
-
-&fpd_dma_chan1 {
-    iommus =3D <&smmu 0x14e8>;
-};
-
-&fpd_dma_chan2 {
-    iommus =3D <&smmu 0x14e9>;
-};
-
-&fpd_dma_chan3 {
-    iommus =3D <&smmu 0x14ea>;
-};
-
-&fpd_dma_chan4 {
-    iommus =3D <&smmu 0x14eb>;
-};
-
-&fpd_dma_chan5 {
-    iommus =3D <&smmu 0x14ec>;
-};
-
-&fpd_dma_chan6 {
-    iommus =3D <&smmu 0x14ed>;
-};
-
-&fpd_dma_chan7 {
-    iommus =3D <&smmu 0x14ee>;
-};
-
-&fpd_dma_chan8 {
-    iommus =3D <&smmu 0x14ef>;
-};
-
-&sdhci0 {
-    iommus =3D <&smmu 0x870>;
-};
-
-&sdhci1 {
-    iommus =3D <&smmu 0x871>;
-};
-
-&nand0 {
-    iommus =3D <&smmu 0x872>;
-};
-
-&pcie {
-    iommus =3D <&smmu 0x4d0>;
-};
-
-&zynqmp_dpsub {
-    iommus =3D <&smmu 0xce3>;
-};
-
-&zynqmp_dpdma {
-    iommus =3D <&smmu 0xce4>;
-};
-
-&sata {
-    iommus =3D <&smmu 0x4c0>, <&smmu 0x4c1>, <&smmu 0x4c2>, <&smmu 0x4c3>;
-};
diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbapp=
end b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
deleted file mode 100644
index ec64d246..00000000
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from config=
uration
-# file and xen enabled in DISTRO_FEATURES.
-ENABLE_XEN_UBOOT_SCR ?=3D ""
-include ${@'xen-boot-cmd.inc' if d.getVar('ENABLE_XEN_UBOOT_SCR') =3D=3D '=
1' and bb.utils.contains('DISTRO_FEATURES', 'xen', True, False, d) else ''}
diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.=
cmd.xen b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd=
.xen
deleted file mode 100644
index 25e5842c..00000000
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen
+++ /dev/null
@@ -1,80 +0,0 @@
-# This is a boot script for U-Boot with Xen parameters used by yocto machi=
ne
-# configuration file.
-# Generate boot.scr:
-# mkimage -c none -A arm -T script -d boot.cmd.xen boot.scr
-#
-################
-xen_name=3D@@XEN_IMAGE_NAME@@
-kernel_name=3D@@KERNEL_IMAGE@@
-rootfs_name=3D@@RAMDISK_IMAGE@@
-@@PRE_BOOTENV@@
-
-for boot_target in ${boot_targets};
-do
-	echo "Trying to load boot images from ${boot_target}"
-	if test "${boot_target}" =3D "jtag" ; then
-		tftpboot @@KERNEL_LOAD_ADDRESS@@ ${kernel_name}
-		setenv kernel_size 0x$filesize;
-		tftpboot @@RAMDISK_IMAGE_ADDRESS@@ ${rootfs_name}
-		setenv ramdisk_size 0x$filesize;
-		tftpboot @@XEN_LOAD_ADDRESS@@ ${xen_name}
-		tftpboot @@DEVICETREE_ADDRESS@@ system.dtb
-	fi
-	if test "${boot_target}" =3D "mmc0" || test "${boot_target}" =3D "mmc1" |=
| test "${boot_target}" =3D "usb0" || test "${boot_target}" =3D "usb1"; the=
n
-		if test "${boot_target}" =3D "mmc0" || test "${boot_target}" =3D "mmc1";=
 then
-			setenv bootdev mmcblk${devnum}p
-		fi
-		if test "${boot_target}" =3D "usb0" || test "${boot_target}" =3D "usb1";=
 then
-			setenv bootdev sda
-		fi
-		echo "Checking for /${xen_name}"
-		if test -e ${devtype} ${devnum}:${distro_bootpart} /${xen_name}; then
-			echo "Loading ${xen_name}";
-			fatload ${devtype} ${devnum}:${distro_bootpart} @@XEN_LOAD_ADDRESS@@ ${=
xen_name};
-		fi
-		echo "Checking for /${kernel_name}"
-		if test -e ${devtype} ${devnum}:${distro_bootpart} /${kernel_name}; then
-			echo "Loading ${kernel_name}";
-			fatload ${devtype} ${devnum}:${distro_bootpart} @@KERNEL_LOAD_ADDRESS@@=
 ${kernel_name};
-			setenv kernel_size 0x$filesize;
-		fi
-		echo "Checking for /system.dtb"
-		if test -e ${devtype} ${devnum}:${distro_bootpart} /system.dtb; then
-			echo "Loading system.dtb";
-			fatload ${devtype} ${devnum}:${distro_bootpart} @@DEVICETREE_ADDRESS@@ =
system.dtb;
-		fi
-		echo "Checking for /${rootfs_name}"
-		if test -e ${devtype} ${devnum}:${distro_bootpart} /${rootfs_name} && te=
st "${skip_ramdisk}" !=3D "yes"; then
-			echo "Loading ${rootfs_name}";
-			fatload ${devtype} ${devnum}:${distro_bootpart} @@RAMDISK_IMAGE_ADDRESS=
@@ ${rootfs_name};
-			setenv ramdisk_size 0x$filesize;
-		fi
-	fi
-	fdt addr @@DEVICETREE_ADDRESS@@
-	fdt resize 0x1000
-	fdt get value bootargs /chosen bootargs
-	fdt set /chosen \#address-cells <0x2>
-	fdt set /chosen \#size-cells <0x2>
-	setenv xen_bootargs "console=3Ddtuart dtuart=3D@@XEN_SERIAL_CONSOLES@@ do=
m0_mem=3D@@DOM0_MEM@@ dom0_max_vcpus=3D@@DOM0_MAX_VCPUS@@ bootscrub=3D0 vwf=
i=3Dnative @@XEN_CMDLINE_APPEND@@"
-	fdt set /chosen xen,xen-bootargs \"${xen_bootargs}\"
-
-	# Check that env $ramdisk_size is 0 or not.
-	if test -n ${ramdisk_size}; then
-		fdt mknod /chosen dom0-ramdisk
-		fdt set /chosen/dom0-ramdisk compatible  "xen,linux-initrd" "xen,multibo=
ot-module" "multiboot,module"
-		fdt set /chosen/dom0-ramdisk reg <0x0 @@RAMDISK_IMAGE_ADDRESS@@ 0x0 ${ra=
mdisk_size}>
-		setenv rootfs_param @@KERNEL_ROOT_RAMDISK@@
-	else
-		setenv rootfs_param @@KERNEL_ROOT_SD@@
-	fi
-
-	fdt mknod /chosen dom0
-	fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module=
" "multiboot,module"
-	fdt set /chosen/dom0 reg <0x0 @@KERNEL_LOAD_ADDRESS@@ 0x0 ${kernel_size}>
-	setenv dom0_bootargs "console=3Dhvc0 earlycon=3Dxen earlyprintk=3Dxen clk=
_ignore_unused ${rootfs_param}"
-	fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
-
-	setenv fdt_high 0xffffffffffffffff
-
-	@@KERNEL_BOOTCMD@@ @@XEN_LOAD_ADDRESS@@ - @@DEVICETREE_ADDRESS@@
-done
diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc b/dy=
namic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
deleted file mode 100644
index 7a4e41a6..00000000
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
+++ /dev/null
@@ -1,38 +0,0 @@
-FILESEXTRAPATHS:append :=3D ":${THISDIR}/u-boot-xlnx-scr"
-
-SRC_URI +=3D "file://boot.cmd.xen"
-=20
-# Image offsets for Xen boot
-KERNEL_OFFSET:zynqmp ?=3D "0xE00000"
-KERNEL_OFFSET:versal ?=3D "0xE00000"
-
-DEVICETREE_OFFSET:zynqmp ?=3D "0xC000000"
-DEVICETREE_OFFSET:versal ?=3D "0xC000000"
-
-RAMDISK_OFFSET:zynqmp ?=3D "0x2600000"
-RAMDISK_OFFSET:versal ?=3D "0x2600000"
-
-XEN_OFFSET:zynqmp ?=3D "0xBA00000"
-XEN_OFFSET:versal ?=3D "0xBA00000"
-XEN_LOAD_ADDRESS ?=3D "${@append_baseaddr(d,d.getVar('XEN_OFFSET'))}"
-
-# If dom0-ramdisk is used for Xen boot then set RAMDISK image to cpio.gz
-XEN_IMAGE_NAME ?=3D "xen"
-RAMDISK_IMAGE ?=3D "rootfs.cpio.gz"
-
-# Set the amount of memory for dom0 depending on total available memory si=
ze(DDR).
-DOM0_MEM ?=3D "1500M"
-
-# Specify which UART console Xen should use. You can sepecify the devicetr=
ee
-# alias or full path to a node in the devicetree
-# XEN_SERIAL_CONSOLES ?=3D "serial0" or XEN_SERIAL_CONSOLES ?=3D "/axi/ser=
ial@ff000000"
-XEN_SERIAL_CONSOLES ?=3D "serial0"
-
-# Specify additional Xen paramaters which will be appended to xen-bootargs
-# This can alos be used for debugging purposes.
-# Examples: XEN_CMDLINE_APPEND ?=3D "sched=3Dcredit loglvl=3Dall guest_log=
lvl=3Ddebug"
-XEN_CMDLINE_APPEND ?=3D ""
-
-# Specify the max number of vcpus for dom0
-# Example usage: DOM0_MAX_VCPUS =3D "2" or DOM0_MAX_VCPUS =3D "2-4"
-DOM0_MAX_VCPUS ?=3D "1"
--=20
2.34.1


