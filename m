Return-Path: <bogdan.purcareata@nxp.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 280C7E00C02; Tue,  5 Apr 2016 09:03:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.111.89 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 907 seconds by postgrey-1.32 at yocto-www;
	Tue, 05 Apr 2016 09:03:44 PDT
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0089.outbound.protection.outlook.com [157.56.111.89])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F75EE00B8C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Apr 2016 09:03:44 -0700 (PDT)
Received: from CH1PR03CA005.namprd03.prod.outlook.com (10.255.156.150) by
	DM2PR0301MB0720.namprd03.prod.outlook.com (10.160.97.140) with
	Microsoft SMTP
	Server (TLS) id 15.1.447.15; Tue, 5 Apr 2016 15:48:35 +0000
Received: from BY2FFO11OLC005.protection.gbl (10.255.156.132) by
	CH1PR03CA005.outlook.office365.com (10.255.156.150) with Microsoft SMTP
	Server (TLS) id 15.1.447.15 via Frontend Transport;
	Tue, 5 Apr 2016 15:48:35 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; yoctoproject.org; dkim=none (message not signed)
	header.d=none; yoctoproject.org;
	dmarc=none action=none header.from=nxp.com; 
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11OLC005.mail.protection.outlook.com (10.1.14.145) with Microsoft
	SMTP Server (TLS) id 15.1.453.6 via Frontend Transport;
	Tue, 5 Apr 2016 15:48:34 +0000
Received: from localhost.localdomain (fsr-ub1464-106.ea.freescale.net
	[10.171.73.16])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u35FmX0W012211 for <meta-virtualization@yoctoproject.org>;
	Tue, 5 Apr 2016 08:48:33 -0700
From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 5 Apr 2016 15:48:32 +0000
Message-ID: <1459871312-872-1-git-send-email-bogdan.purcareata@nxp.com>
X-Mailer: git-send-email 2.1.4
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131043449151994234;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(5003940100001)(2906002)(50986999)(110136002)(15975445007)(19580395003)(50466002)(2351001)(36756003)(87936001)(107886002)(575784001)(586003)(1220700001)(19580405001)(1096002)(77096005)(92566002)(47776003)(5008740100001)(6806005)(106466001)(450100001)(85426001)(50226001)(49486002)(11100500001)(33646002)(229853001)(86362001)(104016004)(105606002)(189998001)(15395725005)(48376002)(81166005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0301MB0720;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11OLC005;
	1:jDsj3kdJ9pYesk6a1ctlz4dWo8nRzntAawn7i6m+ziBmL1rvCBjUEiwwsvlEQx0Anq+ED2pomebUDq/svmKqmVckdcJzHN21osUmFIVPYGSe6NJ7oEt5rM+1AVkhhVvq/UQ2qnl0Azx8aUrFIT7r6MS+5sKmjHdhoQiM9ykhpbPCvEKRug+tL5rRnAh1Kza+MyBXRDQiyoqmbdshiFsLTuLiC9VElzf/CUSEIt23Hq5piee9LNwm2s0NcB+Sza95Tg1Ffw5CgAU8WqFiyCevVqEkAf4GO6+mF4JN0XvQJmV3GMTjiZrZjLGhUXWna9k7NXo6Xrknu4t/A0QZz77ngunSH2MSUmJIHUjYp+UofpsUTPYDbJE5zFXriIKUkPZGHbEoKN0z3XEia7ZIOiYIDQYuYj47ymc++d+dYNGLwdUsuYfINg3G1Im/XX+oVlsSrf5lWRdMpU4VJ2gSCcxWC30GWt+xqrsJdNj4FQcONMf0K0YCGYlK1X45GY6o8k1PeDwXLXqEa0iD6cBk/Y2eha6Z/OGSRLnQf2GUG8CSXBE=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 2302e560-3855-494b-ae82-08d35d69bf3c
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0720;
	2:ZCO88bOtKa7miS7XHHd+VReRgAJoFsXa8aTnQVcCLGFdpWVc0a2t3UnYMTaIDaUsI1JJrTWnh1H+ALkmrEpThpEj6iYSgdV8JBahfRTgssqYm8KeIEZiuypDvTdktXxyAbT6BFyu+HibOiOEsJFoijdWnSu3W5F9KfJ8dIsj0kQCysvGdPOUWO7crK35K3O1;
	3:SgqipxazMxIh8gWf26VYcT9a+Pfvls0Dcio/P0S72hqtllzh2cS6gkYXS9AoQQzIcubR9PfzVNDzoCUplE1FTrNdE/I4TsVBTK4/5WNM5EohHjowVBNnyR7L7v05Etr18aYzScnW58mqLfavW0uRuBV0yl2ZcWQ/x4nVVdmcLCeJwS6XWdFJrUazQ3sjClr7hBIPNMKUsWYOZra5N70Z970bkaFMOD95x27BnGO7J88=;
	25:lIOrqgvWTDS5DurF1tXGaXTm0pcvjCDOucQlFpRy9RG2hegPkHxFFNO6V3mV7Nd3wYjmg568/ueq8QvnDZZ3lmNvyy6loFhAQRTC7JwpBsjyu2A60oiU2TgDdv1UHibnG5JHDllxNiHaRDMtBZYzB3OhBZS6vxKPSBp/olj1J1En8imygC9s1U0wOyZixjPYvZgUFA9kBXSsus8j0IatBozTjM17pz4nWxFm4ZK5gKCnT2oZQI4zYnHhkPILhUdO9yRDi79jM0qQu3BIPXi8n2+CGERXgQ6B1sQYbRnAwgMnxluj1d7oasGThtK2pgaYqfGVmmZ933h3TG4YhlAkb1rgqXE8kLgGsBSaAwLnINQ=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB0720;
X-Microsoft-Antispam-PRVS: <DM2PR0301MB072014EEC4E294D845CF837CEA9E0@DM2PR0301MB0720.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13024025)(13023025)(13017025)(5005006)(13015025)(8121501046)(3002001)(10201501046);
	SRVR:DM2PR0301MB0720; BCL:0; PCL:0; RULEID:(400006);
	SRVR:DM2PR0301MB0720; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0720;
	4:g6iwfI3CcbjbWGHuAGkUfUTnY5lYMqrz31mzGBCecrrDLwQciYrqh2ODp86V3xURxocqXdI1Iuf5VWnOrx/aAjOulhgUYuhZ6artA3IzXAXDCDPuRDGlZB26rVVYlgE6qyjUAigywey/2QHtnlII+vGHAJ+8Mcpr6L+XGf7J9iBJ66n8Z3Ry3JIL9bOz8rMupB2wa1lB9q7Q12v1tmrmi8Y7k5EcrzJGltcnDTv+bcvmO4ibkA75lVEj344q+BWrm92F5BPNGUHKZo7iwFPE0rbeHWdKGASd6w+JrTGfrTN4xanCtbxsdct0M247+2DnjGczLG0HCC4HlB/5Ww7RqGhLxTEtYRa9E+SiiKQlcmTDGt1dLnyIkXqOaIQbw6RZ+8ktljyjEt86DG3cOt/zQL6gFZu5hDFG7zKI+SvyAlPhak5ZXk87QWbSMBbDYYbXqQCTat49wplRYkoUyQ35Mg==
X-Forefront-PRVS: 0903DD1D85
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB0720;
	23:pZMw58sP9HRZvTKVTi59PdczeT2os7LS02pY7rI?=
	=?us-ascii?Q?hk2EriU3XEh9tXwBc0Bh0H0gTrPiRPA4SnBsdJ6ZJOPyy4j/DrON0bWV5lqj?=
	=?us-ascii?Q?Juy/ukOoceOuzRW4VnHK1qHfkzSM3bBpNfxPT0xZiklQ+ab2t0YP/dp1Qg9o?=
	=?us-ascii?Q?3SdB20arp8eujw68PUmdunEuJAoQvTVJNrcVXhaGcBf9d8ME5ZCoh56A/gX/?=
	=?us-ascii?Q?Dhlkd4A3GsbyA73fIt6vdzxRRcz9KK66bFJE1G657Zka6wsmu8/zNKxwBjh6?=
	=?us-ascii?Q?JEqBOIIK0FZLaYvPVNtEMb9CB93zRqtNopJQZWV08iYYCYMqPuxGk1FqmHpm?=
	=?us-ascii?Q?zdbF55vFgiGEg6bo8gQyaRxd1w7CHnaufllDYHbVRwtUyofWTlqCWMznGskE?=
	=?us-ascii?Q?DhpcCCWiPEwQ6jx5aXPvYmeigup8o/0mFdgu2DCLoBcLLWiE3oDw/Hb06Hqj?=
	=?us-ascii?Q?67G/E2iiDJeaWMiuIR5DboBkA9xWuoEF3UWm3lzJ/Kl+VX4beoE+cIGbMa2K?=
	=?us-ascii?Q?NyVKnSV93l0CGChTF0B/9NNreo1vAB7JSlKtZtbAwa3H5pwJvpK2q6dJ9OeL?=
	=?us-ascii?Q?IS12Zxc7u7WUnKPTGrDaMSirtIVvont5/a9+vXF0F12ql2WTdThBag/OuWBf?=
	=?us-ascii?Q?u9GfVpawF7KecUlLlkFvE4XazjKk/Ba9EGVH8IlYr6Ujgp9JTGPMXY4c/rSs?=
	=?us-ascii?Q?US1FS9CBQfZtjdjMoHAXj1uIrR39fPnJf98E83M7nYSPkKs+uzXROEfTmuLx?=
	=?us-ascii?Q?QYm5qWwsxFixm8wwRr0sjktN2yr3rawgwhKDPiUVIG/F2YonYtANsXR1ZpEk?=
	=?us-ascii?Q?rR1UH4HlHPlDkwbVjTCpVHNQh2Q++oOq0VrZ6xISJI5hZOcsj2RlBVPxX8i9?=
	=?us-ascii?Q?R4Ru38fkdzplrve0GamXhWB6mEXP43xTdi1J0JYbRJlSH+sAKej5tOfLqq56?=
	=?us-ascii?Q?ic5dQrMajk6zEPsEzkD1r8lc7zUMIjGfwRqNejTAI3wj7HEiYO1S/+hquTAD?=
	=?us-ascii?Q?tS2eUVQzrYou0NQv88Xu0T2M80diuEH8B/K747kVVlJeC39ef1aX8n7fuGfD?=
	=?us-ascii?Q?ooo2HgingmJAO5qojDf1mRij9XNCFOH/Ghqh/toiIbtpV773QIWpmTNmBWYi?=
	=?us-ascii?Q?B4bjD0/6+IBg=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0720;
	5:lHIS2iCeb26oPU4S63cQz7aTg2INGUVPDtWkNr7VVkHKhoomiPxhHirhRJ8mUF6S6EaSxSuVQ7+X1cEpVzTHQidgArh+zQteOQhs3UxjRjib514Ju8TUF12KoSg++eq522KKF4rPoEzmC85dzwqt4CM9iOJhbU/YXcaiQBPe7aM=;
	24:CXlxNrqyOSK+X2onTkPLts24LOaUS338THjaxdr53MURlZs/vGFOC7nuOD/vAtJmeU5vhezc7ixGcRE6OTvaK0cw+tlVXxhQB/KhAohLgjA=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2016 15:48:34.8874 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB0720
Subject: [PATCH] libvirt: Fix bug in assigning virtio-mmio disks with qemu
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Apr 2016 16:03:48 -0000
Content-Type: text/plain

Patch contains a more detailed description. Basically allows adding virtio-mmio
block device to QEMU guests. Tested on ARM64.

Please apply on jethro branch.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
---
 ...io-mmio-disks-in-qemuAssignDevicePCISlots.patch | 81 ++++++++++++++++++++++
 recipes-extended/libvirt/libvirt_1.2.19.bb         |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch

diff --git a/recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch b/recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch
new file mode 100644
index 0000000..f0b7ab5
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch
@@ -0,0 +1,81 @@
+From d526e37bad2515cf91caa0e4ff3edaf41e45b5c2 Mon Sep 17 00:00:00 2001
+From: Pavel Fedin <p.fedin@samsung.com>
+Date: Wed, 9 Sep 2015 15:02:53 +0300
+Subject: [PATCH] Ignore virtio-mmio disks in qemuAssignDevicePCISlots()
+
+Fixes the following error when attempting to add a disk with bus='virtio'
+to a machine which actually supports virtio-mmio (caught with ARM virt):
+
+virtio disk cannot have an address of type 'virtio-mmio'
+
+The problem has been likely introduced by
+e8d55172544c1fafe31a9e09346bdebca4f0d6f9. Before that
+qemuAssignDevicePCISlots() was never called for ARM "virt" machine.
+
+Upstream-status: Accepted
+[https://libvirt.org/git/?p=libvirt.git;a=commit;h=d526e37bad2515cf91caa0e4ff3edaf41e45b5c2]
+
+Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
+---
+ src/qemu/qemu_command.c | 11 +++++++++--
+ src/qemu/qemu_command.h |  1 +
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/qemu/qemu_command.c b/src/qemu/qemu_command.c
+index b56670c..25f57f2 100644
+--- a/src/qemu/qemu_command.c
++++ b/src/qemu/qemu_command.c
+@@ -2261,7 +2261,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPtr def,
+                 virDomainPCIAddressReserveNextSlot(addrs, &info, flags) < 0)
+                 goto cleanup;
+ 
+-            if (qemuAssignDevicePCISlots(def, addrs) < 0)
++            if (qemuAssignDevicePCISlots(def, qemuCaps, addrs) < 0)
+                 goto cleanup;
+ 
+             for (i = 1; i < addrs->nbuses; i++) {
+@@ -2294,7 +2294,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPtr def,
+             if (qemuValidateDevicePCISlotsChipsets(def, qemuCaps, addrs) < 0)
+                 goto cleanup;
+ 
+-            if (qemuAssignDevicePCISlots(def, addrs) < 0)
++            if (qemuAssignDevicePCISlots(def, qemuCaps, addrs) < 0)
+                 goto cleanup;
+ 
+             for (i = 0; i < def->ncontrollers; i++) {
+@@ -2426,6 +2426,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPtr def,
+  */
+ int
+ qemuAssignDevicePCISlots(virDomainDefPtr def,
++                         virQEMUCapsPtr qemuCaps,
+                          virDomainPCIAddressSetPtr addrs)
+ {
+     size_t i, j;
+@@ -2618,6 +2619,12 @@ qemuAssignDevicePCISlots(virDomainDefPtr def,
+             VIR_DOMAIN_DEVICE_ADDRESS_TYPE_CCW)
+             continue;
+ 
++        /* Also ignore virtio-mmio disks if our machine allows them */
++        if (def->disks[i]->info.type ==
++            VIR_DOMAIN_DEVICE_ADDRESS_TYPE_VIRTIO_MMIO &&
++            virQEMUCapsGet(qemuCaps, QEMU_CAPS_DEVICE_VIRTIO_MMIO))
++            continue;
++
+         if (def->disks[i]->info.type != VIR_DOMAIN_DEVICE_ADDRESS_TYPE_NONE) {
+             virReportError(VIR_ERR_CONFIG_UNSUPPORTED,
+                            _("virtio disk cannot have an address of type '%s'"),
+diff --git a/src/qemu/qemu_command.h b/src/qemu/qemu_command.h
+index 767d31f..4aa7f2d 100644
+--- a/src/qemu/qemu_command.h
++++ b/src/qemu/qemu_command.h
+@@ -284,6 +284,7 @@ virDomainPCIAddressSetPtr qemuDomainPCIAddressSetCreate(virDomainDefPtr def,
+                                                         bool dryRun);
+ 
+ int qemuAssignDevicePCISlots(virDomainDefPtr def,
++                             virQEMUCapsPtr qemuCaps,
+                              virDomainPCIAddressSetPtr addrs);
+ 
+ int qemuAssignDeviceAliases(virDomainDefPtr def, virQEMUCapsPtr qemuCaps);
+-- 
+1.9.1
+
diff --git a/recipes-extended/libvirt/libvirt_1.2.19.bb b/recipes-extended/libvirt/libvirt_1.2.19.bb
index df53d59..774eea4 100644
--- a/recipes-extended/libvirt/libvirt_1.2.19.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.19.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://libvirt-use-pkg-config-to-locate-libcap.patch \
            file://0001-to-fix-build-error.patch \
            file://Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch \
+           file://Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "bc3ab1ba5b6fabd2e4516c70ddd4d97c"
-- 
1.9.1


