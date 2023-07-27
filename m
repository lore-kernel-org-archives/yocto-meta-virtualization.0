Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABB8C00528
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 23:22:43 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.83])
 by mx.groups.io with SMTP id smtpd.web11.21608.1690500157421696683
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 16:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=ITVM+SQQ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.94.83, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtxnPSJuyXE4zTh6dVo53jsUMALm+5UG2z6nnEWLT27nW4LIXDehuRrQ+CkhOlZZXHkA10vZfnA1P/FIInl2e3uU/im935qeTa1JjWqes9D8MuMDv+azBZ4Xl1RdULcMyz8Rx1QBldybzQH7YvcYQ05ES5EjYygGMar+THICEDaLHIm770mqw3ngWHWw+jkmlD7l61rQbxHIGXX7ESWb1toI+I7WjoSSsM+gupMWI8m9+CI2uqNNtz8tKGaKPJk/G3KUJnzwA3kaGkl4DQ4ie5DKtybyN/GVbGUuRadcdCqoYMEbO72dG8MCIivGjA3YcOn2b67AaSv2i8z/DaZXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qz0cLW3CexDksCcyLhfsb1LZhF9vj0X+uZHVonrh70=;
 b=nWOuVhRLBFAxWRfr/yhouIim73jxH8XzYpr5xYSP+FbGnpFsGDta+XQthZ4CtKXhctbk2YaxCbGpAp7zxEHoZNo4Iv6+T6ovJY7TRZ90tHBMHvCfm1n9Tbwc5I/i9wnaTjPP7OXhL55STb9fwA2mI89EfxJ8hi0uLr1fuk48v2WoJPTS1o1Xk6dohAJ3g118fVMIh/pdTDXkGXOqBnKDOK3GPdfzOto/Gzfuyfd+Esi8V7ZV8JtH2SuOA4hIiwn8vK45W+DoSYQ7oZFzd8BGO0OwyR2Azo15QpxpXdsMsYh6M3tS9v2tbj5f5umLcXPNqHqgl91cPfKte3hcaOAmUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qz0cLW3CexDksCcyLhfsb1LZhF9vj0X+uZHVonrh70=;
 b=ITVM+SQQH3wcAE1SYWvFlxHnZ0+dUSBzBGCTqs33DXvjwmC42M0hkVU0V5+LkYgRHMD4FVsBULIa70Rf3zetAh3LhkrFnWJBVD5t2J0rOg96EB5gbygtETMXNdomrvSQ3s/OsNb6aMe/IFXpXGCXMjnuiRBCCBVQejUH030Svxw=
Received: from MW4PR02CA0016.namprd02.prod.outlook.com (2603:10b6:303:16d::22)
 by PH7PR12MB7889.namprd12.prod.outlook.com (2603:10b6:510:27f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 23:22:34 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::99) by MW4PR02CA0016.outlook.office365.com
 (2603:10b6:303:16d::22) with Microsoft SMTP Server (version=TLS1_2,
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
 15.20.6631.29 via Frontend Transport; Thu, 27 Jul 2023 23:22:34 +0000
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
 Transport; Thu, 27 Jul 2023 18:22:30 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>,
	<christopher.w.clark@gmail.com>, <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][PATCH 2/2] recipes-bsp: Add u-boot-xlnx scripts for Xen support
Date: Thu, 27 Jul 2023 17:22:29 -0600
Message-ID: <20230727232229.3784426-3-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
References: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT011:EE_|PH7PR12MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: e48887e2-a0c9-4c7f-44f7-08db8ef85bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4QbC4Bd5qBf8LbC30s5qEMwoVXtVz/DYf5oewkAyVwjSzsB2kPutl/zF31lmGK3SQQFfUfn+O9bdwEzIcun8ydw9H/BMh2Jp2o7fQst2zbyC02NKw33BEEogvbvjzBW7K4ZxeGrUZYH3HneO6Dfv87FdXnH/YTOUKWJjUp74uUEabbjwfXzTpIzSMWbAUyMYVSt7UMTpPXqDR+AjxArfO4kw6ZcTkSw21Sa2NJsKsrw0lziDYWXR7lNFZd5jTrL9B+bek6+WkrhOp+Cox48R8k6NNi0nZW285aoPxKyAwfBPCbmivBoLtbAVu6SQKgE3eVnHRKT68/fKbrHZfE2Wxbr81WbpJMlv0p6OM4zDCngipQgR4nbyu50BQIOOIVZyyuOWV/iAhSdOI1Ux1XUq9xPjLn+OgY/xQ+7E7/E5ESOuBdab8chrEjJfeQUANPmzBv6EsXhaXvH8HDjzKMqeW73JiJK9pIeTZ27bVwcmSibN2nNAp6LyFWLkLoDGdQSOVvbiM9/AAngnvngw+0p7quYm9FAujU+In5PWr7TgecErlg4LwY4XUAGBG8GY/QDr+bmks+yRJHH/7TCqND8z+Hir5e3TF+DdVtHs97h6d5AsjozHDwW+O4dLFVkxBDLN8+mWtV4bKYwU5b82w3A+OwavhclnALVcHL+50sIWrshRXzlX2yvj1PXbIadAk80vwfjqpdztYeinXi7PnEtbcdPGcKSHi0+ikAsllU4hVYc0oJTBrY+c/SfdzJIUuofm+T4pNexpZ2Khs5UnYqBo+FWutuWTwK96FXOoxQFAGw4=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(82310400008)(40470700004)(46966006)(36840700001)(336012)(186003)(1076003)(2906002)(26005)(81166007)(36860700001)(426003)(40480700001)(47076005)(2616005)(5660300002)(70586007)(41300700001)(40460700003)(316002)(70206006)(356005)(8936002)(36756003)(86362001)(8676002)(110136005)(82740400003)(478600001)(36900700001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 23:22:34.3724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e48887e2-a0c9-4c7f-44f7-08db8ef85bbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7889
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Jul 2023 23:22:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8144

Add new boot.cmd.xen to u-boot-xlnx-scr bbappend to enable
Xen support for ZynqMP and Versal devices.

User can enable xen u-boot script by adding below variable from
configuration file.

BOOTMODE =3D "xen"

This u-boot script also supports to configure below Xen params from
configuration file

params          variable assignment
------          -------------------
duart           XEN_SERIAL_CONSOLES =3D "serial0"
dom0_mem        DOM0_MEM =3D "1500M"
dom0_max_vcpus  DOM0_MAX_VCPUS =3D "1"
extra params    XEN_CMDLINE_APPEND =3D "loglvl=3Dall"

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../u-boot/u-boot-xlnx-scr.bbappend           |  2 +
 .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       | 80 +++++++++++++++++++
 .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 38 +++++++++
 3 files changed, 120 insertions(+)
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-sc=
r.bbappend
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-sc=
r/boot.cmd.xen
 create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.i=
nc

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbapp=
end b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
new file mode 100644
index 0000000..ae847cb
--- /dev/null
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
@@ -0,0 +1,2 @@
+# Include xen-boot-cmd.inc only if xen distro features is enabled.
+include ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen-boot-cmd.inc',=
 '', d)}
diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.=
cmd.xen b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd=
.xen
new file mode 100644
index 0000000..25e5842
--- /dev/null
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen
@@ -0,0 +1,80 @@
+# This is a boot script for U-Boot with Xen parameters used by yocto machi=
ne
+# configuration file.
+# Generate boot.scr:
+# mkimage -c none -A arm -T script -d boot.cmd.xen boot.scr
+#
+################
+xen_name=3D@@XEN_IMAGE_NAME@@
+kernel_name=3D@@KERNEL_IMAGE@@
+rootfs_name=3D@@RAMDISK_IMAGE@@
+@@PRE_BOOTENV@@
+
+for boot_target in ${boot_targets};
+do
+	echo "Trying to load boot images from ${boot_target}"
+	if test "${boot_target}" =3D "jtag" ; then
+		tftpboot @@KERNEL_LOAD_ADDRESS@@ ${kernel_name}
+		setenv kernel_size 0x$filesize;
+		tftpboot @@RAMDISK_IMAGE_ADDRESS@@ ${rootfs_name}
+		setenv ramdisk_size 0x$filesize;
+		tftpboot @@XEN_LOAD_ADDRESS@@ ${xen_name}
+		tftpboot @@DEVICETREE_ADDRESS@@ system.dtb
+	fi
+	if test "${boot_target}" =3D "mmc0" || test "${boot_target}" =3D "mmc1" |=
| test "${boot_target}" =3D "usb0" || test "${boot_target}" =3D "usb1"; the=
n
+		if test "${boot_target}" =3D "mmc0" || test "${boot_target}" =3D "mmc1";=
 then
+			setenv bootdev mmcblk${devnum}p
+		fi
+		if test "${boot_target}" =3D "usb0" || test "${boot_target}" =3D "usb1";=
 then
+			setenv bootdev sda
+		fi
+		echo "Checking for /${xen_name}"
+		if test -e ${devtype} ${devnum}:${distro_bootpart} /${xen_name}; then
+			echo "Loading ${xen_name}";
+			fatload ${devtype} ${devnum}:${distro_bootpart} @@XEN_LOAD_ADDRESS@@ ${=
xen_name};
+		fi
+		echo "Checking for /${kernel_name}"
+		if test -e ${devtype} ${devnum}:${distro_bootpart} /${kernel_name}; then
+			echo "Loading ${kernel_name}";
+			fatload ${devtype} ${devnum}:${distro_bootpart} @@KERNEL_LOAD_ADDRESS@@=
 ${kernel_name};
+			setenv kernel_size 0x$filesize;
+		fi
+		echo "Checking for /system.dtb"
+		if test -e ${devtype} ${devnum}:${distro_bootpart} /system.dtb; then
+			echo "Loading system.dtb";
+			fatload ${devtype} ${devnum}:${distro_bootpart} @@DEVICETREE_ADDRESS@@ =
system.dtb;
+		fi
+		echo "Checking for /${rootfs_name}"
+		if test -e ${devtype} ${devnum}:${distro_bootpart} /${rootfs_name} && te=
st "${skip_ramdisk}" !=3D "yes"; then
+			echo "Loading ${rootfs_name}";
+			fatload ${devtype} ${devnum}:${distro_bootpart} @@RAMDISK_IMAGE_ADDRESS=
@@ ${rootfs_name};
+			setenv ramdisk_size 0x$filesize;
+		fi
+	fi
+	fdt addr @@DEVICETREE_ADDRESS@@
+	fdt resize 0x1000
+	fdt get value bootargs /chosen bootargs
+	fdt set /chosen \#address-cells <0x2>
+	fdt set /chosen \#size-cells <0x2>
+	setenv xen_bootargs "console=3Ddtuart dtuart=3D@@XEN_SERIAL_CONSOLES@@ do=
m0_mem=3D@@DOM0_MEM@@ dom0_max_vcpus=3D@@DOM0_MAX_VCPUS@@ bootscrub=3D0 vwf=
i=3Dnative @@XEN_CMDLINE_APPEND@@"
+	fdt set /chosen xen,xen-bootargs \"${xen_bootargs}\"
+
+	# Check that env $ramdisk_size is 0 or not.
+	if test -n ${ramdisk_size}; then
+		fdt mknod /chosen dom0-ramdisk
+		fdt set /chosen/dom0-ramdisk compatible  "xen,linux-initrd" "xen,multibo=
ot-module" "multiboot,module"
+		fdt set /chosen/dom0-ramdisk reg <0x0 @@RAMDISK_IMAGE_ADDRESS@@ 0x0 ${ra=
mdisk_size}>
+		setenv rootfs_param @@KERNEL_ROOT_RAMDISK@@
+	else
+		setenv rootfs_param @@KERNEL_ROOT_SD@@
+	fi
+
+	fdt mknod /chosen dom0
+	fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module=
" "multiboot,module"
+	fdt set /chosen/dom0 reg <0x0 @@KERNEL_LOAD_ADDRESS@@ 0x0 ${kernel_size}>
+	setenv dom0_bootargs "console=3Dhvc0 earlycon=3Dxen earlyprintk=3Dxen clk=
_ignore_unused ${rootfs_param}"
+	fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
+
+	setenv fdt_high 0xffffffffffffffff
+
+	@@KERNEL_BOOTCMD@@ @@XEN_LOAD_ADDRESS@@ - @@DEVICETREE_ADDRESS@@
+done
diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc b/dy=
namic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
new file mode 100644
index 0000000..38f6f26
--- /dev/null
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
@@ -0,0 +1,38 @@
+FILESEXTRAPATHS:append :=3D ":${THISDIR}/u-boot-xlnx-scr"
+
+SRC_URI +=3D "file://boot.cmd.xen"
+=20
+# Image offsets for Xen boot
+KERNEL_OFFSET:zynqmp ?=3D "0xE00000"
+KERNEL_OFFSET:versal ?=3D "0xE00000"
+
+DEVICETREE_OFFSET:zynqmp ?=3D "0xC000000"
+DEVICETREE_OFFSET:versal ?=3D "0xC000000"
+
+RAMDISK_OFFSET:zynqmp ?=3D "0x2400000"
+RAMDISK_OFFSET:versal ?=3D "0x2400000"
+
+XEN_OFFSET:zynqmp ?=3D "0xBA00000"
+XEN_OFFSET:versal ?=3D "0xBA00000"
+XEN_LOAD_ADDRESS ?=3D "${@append_baseaddr(d,d.getVar('XEN_OFFSET'))}"
+
+# If dom0-ramdisk is used for Xen boot then set RAMDISK image to cpio.gz
+XEN_IMAGE_NAME ?=3D "xen"
+RAMDISK_IMAGE =3D "rootfs.cpio.gz"
+
+# Set the amount of memory for dom0 depending on total available memory si=
ze(DDR).
+DOM0_MEM ?=3D "1500M"
+
+# Specify which UART console Xen should use. You can sepecify the devicetr=
ee
+# alias or full path to a node in the devicetree
+# XEN_SERIAL_CONSOLES ?=3D "serial0" or XEN_SERIAL_CONSOLES ?=3D "/axi/ser=
ial@ff000000"
+XEN_SERIAL_CONSOLES ?=3D "serial0"
+
+# Specify additional Xen paramaters which will be appended to xen-bootargs
+# This can alos be used for debugging purposes.
+# Examples: XEN_CMDLINE_APPEND ?=3D "sched=3Dcredit loglvl=3Dall guest_log=
lvl=3Ddebug"
+XEN_CMDLINE_APPEND ?=3D ""
+
+# Specify the max number of vcpus for dom0
+# Example usage: DOM0_MAX_VCPUS =3D "2" or DOM0_MAX_VCPUS =3D "2-4"
+DOM0_MAX_VCPUS ?=3D "1"
--=20
2.34.1


