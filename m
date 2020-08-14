Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.76])
 by mx.groups.io with SMTP id smtpd.web11.14770.1597399034493407329
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 Aug 2020 02:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zBh9D2oB;
 spf=pass (domain: arm.com, ip: 40.107.6.76, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4xGw9kGln1awa3HNz73sFV8+UqS7R4GdxyqImsoeH4=;
 b=zBh9D2oBbA3QA8feu2oLJPoE1cPYWl4WhMJzwekCfLuMF2qRcn5EsXMa04KdoMatYiGxjVCMw2DB+XSJPMkfJOsn0UQbD7RsOKPWtMQPp8eqFAs3OdqimHIizWnkw9lAHFOjB2xDRp730bgzIH1z9K5VzGTYtkyCehO4nKPpXKk=
Received: from DB6PR0301CA0070.eurprd03.prod.outlook.com (2603:10a6:6:30::17)
 by AM5PR0802MB2545.eurprd08.prod.outlook.com (2603:10a6:203:a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Fri, 14 Aug
 2020 09:57:12 +0000
Received: from DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::ad) by DB6PR0301CA0070.outlook.office365.com
 (2603:10a6:6:30::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Fri, 14 Aug 2020 09:57:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT050.mail.protection.outlook.com (10.152.21.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 09:57:11 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Fri, 14 Aug 2020 09:57:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5bdcfc00ba33c1cb
X-CR-MTA-TID: 64aa7808
Received: from c206c62e7f48.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 754F6286-76C5-4069-A7A5-28E2292F0A49.1;
	Fri, 14 Aug 2020 09:56:55 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c206c62e7f48.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 14 Aug 2020 09:56:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdkbk0InzeQhuleh9RS5+gZMA4wniwNYbUaebZsuhx2eAvzEWANn9sxbBI3EVFlhEloDKT9YiQghJGPJIR6j9b/7oYblGIfb8eTeVf/KbldhuHkfI4paVJQEmZaiOcMNcKEM/GhrhM8WEnvnapDTzl46LSNi+8rL6tAU23Dk7c9CgIfSAlC9TowRwzJdnVxOzLW3rQFqeJryOW8Awo1vPqzzDj1yCRPSx7uVh2b33COxVLExykBOFa78ypnc03PGWO/VcZ/lccUFC0TIZJ2mbw+TtVziPYdp4zg6LD3bnzKHovmm/5/QCqqoMBN5rqfeEZVv4ZgHAxjREXA8wkY8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4xGw9kGln1awa3HNz73sFV8+UqS7R4GdxyqImsoeH4=;
 b=ZvBIqPo9z0ZPkLaOvlMgclUuYqoxg7C+5SS84U7duR5iDlH4pgjBAIHa6ICO3dSkrF2xbcgUHnTwhD+GTjC9q9Syli/VUIWyptMYn+Ylv96g0ybyR/YJhEFVsMYz4KMkEtbtVjPTBDAzXOVbTHIzHvxGzcX3Wxk6howdmBW5qF1sSa8doEbF2gvZ9as8rsCkjD/oUMRPHD+yrqx0kCVqe19aSc6x7ug+ws9em1kNEeIgzGmpcdgGuKVTjLE/32b55eH28zzSJqWKPyKHQxjgG7/CL/won2CINziWRCV4deiUBUNwbrH6QISM/6CtSoVg1wGGFW20I8kw/cm4IihFnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4xGw9kGln1awa3HNz73sFV8+UqS7R4GdxyqImsoeH4=;
 b=zBh9D2oBbA3QA8feu2oLJPoE1cPYWl4WhMJzwekCfLuMF2qRcn5EsXMa04KdoMatYiGxjVCMw2DB+XSJPMkfJOsn0UQbD7RsOKPWtMQPp8eqFAs3OdqimHIizWnkw9lAHFOjB2xDRp730bgzIH1z9K5VzGTYtkyCehO4nKPpXKk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB5541.eurprd08.prod.outlook.com (2603:10a6:20b:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Fri, 14 Aug
 2020 09:56:54 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3283.022; Fri, 14 Aug 2020
 09:56:54 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	cardoe@gentoo.org,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][PATCH v2] xen: Fix menuconfig and add support for config fragments and diffconfig
Date: Fri, 14 Aug 2020 10:56:33 +0100
Message-Id: <1597398993-36660-2-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597398993-36660-1-git-send-email-diego.sueiro@arm.com>
References: <1597398993-36660-1-git-send-email-diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0345.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::21) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LO2P265CA0345.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 09:56:54 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aa20a1eb-1a10-4a18-b747-08d840386a47
X-MS-TrafficTypeDiagnostic: AM6PR08MB5541:|AM5PR0802MB2545:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB25451114614CCCC6AFAE31B692400@AM5PR0802MB2545.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HYHX/6PkDajjE56xLT3CRW3x1NbY4ZhkUzOCs07dqh/+ho9xX6gkzIiek4ZkY+tCVPx5dosLJqZO0lGRR0EDFy9HWJoqx4hG2YAxseJ+ZFQobz0/JKtMPql7tKg/xGN5Gze7UIQb7r5zpDOEd/qx5hs2OrMlgtRbVUgt1nkGKIhmuJSBb1m/pcN/hPbTavAdCtv2T6egHBPBS8YN5GG1AK5Q2N0kiWeUub2Nx82t2qP0cJReUu/VE7/Yk9KehxhHgEqoMyhP2BT5t5gqr0glDexsdKBaxKzvAxnF7Ttfgwub1eqsZRQAJ6dgrWYUwVkosq/7X6EZXkMUevpuV1j0KQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(26005)(6486002)(36756003)(83380400001)(2616005)(5660300002)(16526019)(186003)(44832011)(7696005)(6916009)(86362001)(956004)(52116002)(8936002)(66946007)(4326008)(478600001)(66556008)(8676002)(2906002)(6666004)(316002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 fpLpaPfXFG1Gaa071nz7uMHxn/Xn8m+6hrrhH92QoaIW7eENthPmlab+EGqknmfghXNjsuG24BiMN+49g0ZSPFj8EiSaVN0ovdZiNYkh7OHzty1X/JSYeHW0MXBGaaQesyW1QOHMZGP+WaqjZer71GQSWfUUWxi2RijanT7B4RUN5ynl53bzF+mjdtHQC8AmPeO5m7bkS9ZZzsODE4v8wb8xEv1jyiQcxatYb+jp+YOl7E1rUakBpB/K1SWEJXGeVM2rHTBHQUszE3uQ3xqVSSUkQ0fRZuzOG0nsWNdTBf47jnGb9oaxWdTYoRXoQbesTMm0VQ4vWUQ3Xv0azfhhZwMkzfgxa0SdnXTWsF2ygxjCXMUPpV1B8lmNoyrfCAZ5PR0fgoYI0Z6SiIiP5+Q+Jv9PvfQMIBDzVdwz9LpueVFyQlIEeT6/+YhlJt4nxyAuRai6VMHYHYx9BLoh0D/Qr3OucOxF69wB01DwN46yijsRGVWVCkpZ5bl3PhdMMpgfalT5PzbJWxu8lcJQO/QOUqMNGTDYZoN/GDKfz2Dg8qBP4SdOsjED1/tFJIRW1kR+9UDsecVwOfUeZYiWIUaZg+wTqV/ERcM6dTJQH8EBavdv7JWUHRK22xMexWP0E3l4GBRW6jWJ1egoddyaHEQbXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5541
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c42be972-4be3-4766-25bf-08d840385fe5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KNLSCdlsxGEkPNwDXVwE4JPxWLcXxx1S8K412DSJdZUZuVVbjOY100ptKJSSSwXFVhlTY2/FnwPmuHvxEpOndb2/f8hmMGyTa9I69mh6HuUDb7Aviqd9tBcEAk0lYMmXxIZuFnN+Mc/gx4hOu0WuLZ+pX8YTbWgUlfxlNtd4LtNSo26riq+bTAUSblLpeKLyY9yLRyHQdlbLcFnrfv/aeyvXIBK7ks//RK/PwT36H5zh/b1dV3MBFsgCLVM9m3JTEtFihbWUxITV/YjHvRrWGewseviMZqr8adWY3o84T2f0gl986QbBmrfTldTuFiyv/ztgpuZgXDZ9drZWAdsm9sVsN3b0xwVB912eyMQtBy3wwSeCrORyxw7XhBKET3ooiwh9NKZNKmqJ46KPe2CUfA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966005)(82310400002)(6916009)(5660300002)(47076004)(4326008)(7696005)(6666004)(82740400003)(356005)(6486002)(70586007)(316002)(2616005)(81166007)(16526019)(2906002)(44832011)(478600001)(186003)(70206006)(36756003)(956004)(8676002)(336012)(83380400001)(26005)(8936002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 09:57:11.8276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa20a1eb-1a10-4a18-b747-08d840386a47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2545
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This patch introduces the following changes:

1. When building in OE environment the linker path needs to be passed when
   buildind the Kconfig tool in order to get the menuconfig task properly
   working.

2. By inheriting cml1.bbclass we can drop some environment variables
   settings in xen-hypervisor.inc for the menuconfig task, and also be
   able to search for config fragmens and use the diffconfig task. Also,
   there is no need to have a custom do_menuconfig task anymore.

Change-Id: I8d61ec76d92de7d1613b79edf55b4868fe712334
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-extended/xen/README                        |  3 ++
 ...g-Allow-specification-of-ncurses-location.patch | 49 ++++++++++++++++++=
++++
 recipes-extended/xen/xen-hypervisor.inc            | 49 +++++++++---------=
----
 recipes-extended/xen/xen_4.14.bb                   |  1 +
 recipes-extended/xen/xen_git.bb                    |  1 +
 5 files changed, 73 insertions(+), 30 deletions(-)
 create mode 100644 recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Al=
low-specification-of-ncurses-location.patch

diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
index 34e7977..f286bb5 100644
--- a/recipes-extended/xen/README
+++ b/recipes-extended/xen/README
@@ -25,6 +25,9 @@ Select the config settings that you want and Save the fil=
e. If you save it to
 the default ".config" file when prompted by menuconfig, you can find it in=
 the
 'xen' subdirectory of the build tree.

+Configuration fragments are also supported. To use them you need to list t=
he
+.cfg files in the SRC_URI.
+
 security patches
 ----------------

diff --git a/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-spe=
cification-of-ncurses-location.patch b/recipes-extended/xen/files/0001-menu=
config-mconf-cfg-Allow-specification-of-ncurses-location.patch
new file mode 100644
index 0000000..49999c8
--- /dev/null
+++ b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specificat=
ion-of-ncurses-location.patch
@@ -0,0 +1,49 @@
+Upstream-Status: Xen: Inappropriate [oe specific, cross compile issue]
+Upstream-Status: Kernel: Pending
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+commit e6972e689a980ab28637e94e48c77eeace6abde5
+Author: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date:   Mon Jul 2 23:10:28 2018 -0400
+
+    xen/kconfig,menuconfig,mconf-cfg: Allow specification of ncurses locat=
ion
+
+    In some cross build environments such as the Yocto Project build
+    environment it provides an ncurses library that is compiled
+    differently than the host's version.  This causes display corruption
+    problems when the host's curses includes are used instead of the
+    includes from the provided compiler are overridden.  There is a second
+    case where there is no curses libraries at all on the host system and
+    menuconfig will just fail entirely.
+
+    The solution is simply to allow an override variable in
+    check-lxdialog.sh for environments such as the Yocto Project.  Adding
+    a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
+    compiling and linking against the right headers and libraries.
+
+    Change-Id: Ibe8dfafc90655e3be2671dbbb0cb7f5631fc4d44
+    Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+    cc: Michal Marek <mmarek@suse.cz>
+    cc: linux-kbuild@vger.kernel.org
+    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+
+diff --git a/xen/tools/kconfig/mconf-cfg.sh b/xen/tools/kconfig/mconf-cfg.=
sh
+old mode 100755
+new mode 100644
+index c812872..65a9b9e
+--- a/xen/tools/kconfig/mconf-cfg.sh
++++ b/xen/tools/kconfig/mconf-cfg.sh
+@@ -4,6 +4,14 @@
+ PKG=3D"ncursesw"
+ PKG2=3D"ncurses"
+
++if [ "$CROSS_CURSES_LIB" !=3D "" ]; then
++    echo libs=3D\'$CROSS_CURSES_LIB\'
++    if [ x"$CROSS_CURSES_INC" !=3D x ]; then
++      echo cflags=3D\'$CROSS_CURSES_INC\'
++    fi
++    exit 0
++fi
++
+ if [ -n "$(command -v pkg-config)" ]; then
+       if pkg-config --exists $PKG; then
+               echo cflags=3D\"$(pkg-config --cflags $PKG)\"
diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen=
/xen-hypervisor.inc
index c386917..3bfee8e 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -9,7 +9,7 @@ DESCRIPTION =3D "The Xen hypervisor"
 # The Xen hypervisor has a narrower compatible platform range than the Xen=
 tools
 COMPATIBLE_HOST =3D '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnuea=
bi'

-inherit deploy python3native
+inherit deploy python3native cml1

 PACKAGES =3D " \
     ${PN} \
@@ -34,6 +34,18 @@ FILES_${PN}-efi =3D " \

 do_configure() {
     do_configure_common
+
+    # Handle the config fragments
+    cfgs=3D"${@' '.join(find_cfgs(d))}"
+    if [ -n "${cfgs}" ]; then
+        # If .config is not present generate one in order
+        # to use the merge_config.sh
+        if [ ! -f "${S}/xen/.config" ] ; then
+            oe_runmake -C ${S}/xen defconfig
+        fi
+        ${S}/xen/tools/kconfig/merge_config.sh -m -O \
+            ${S}/xen ${S}/xen/.config "${cfgs}"
+    fi
 }

 do_compile() {
@@ -77,35 +89,12 @@ do_deploy[depends] +=3D "xen-tools:do_populate_sysroot"
 do_deploy[depends] +=3D "xen-tools:do_deploy"

 # Enable use of menuconfig directly from bitbake and also within the devsh=
ell
-OE_TERMINAL_EXPORTS +=3D "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
-HOST_EXTRACFLAGS =3D "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
-HOSTLDFLAGS =3D "${BUILD_LDFLAGS}"
-TERMINFO =3D "${STAGING_DATADIR_NATIVE}/terminfo"
 do_devshell[depends] +=3D "ncurses-native:do_populate_sysroot"

-KCONFIG_CONFIG_COMMAND ??=3D "menuconfig"
-python do_menuconfig() {
-    import shutil
-
-    try:
-        mtime =3D os.path.getmtime("xen/.config")
-        shutil.copy("xen/.config", "xen/.config.orig")
-    except OSError:
-        mtime =3D 0
+# Pass the native library path for kconfig build when running the do_menuc=
onfig
+# task
+CROSS_CURSES_LIB +=3D "-L${STAGING_LIBDIR_NATIVE}"

-    oe_terminal("${SHELL} -c \"cd xen; XEN_CONFIG_EXPERT=3Dy make %s; if [=
 \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continu=
e... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
-        d.getVar('PN') + ' Configuration', d)
-
-    try:
-        newmtime =3D os.path.getmtime("xen/.config")
-    except OSError:
-        newmtime =3D 0
-
-    if newmtime > mtime:
-        bb.note("Configuration changed, recompile will be forced")
-        bb.build.write_taint('do_compile', d)
-}
-do_menuconfig[depends] +=3D "ncurses-native:do_populate_sysroot"
-do_menuconfig[nostamp] =3D "1"
-do_menuconfig[dirs] =3D "${B}"
-addtask menuconfig after do_configure
+# Specify the root dir of the .config file for do_menuconfig and do_diffco=
nfig
+# tasks
+KCONFIG_CONFIG_ROOTDIR =3D "${S}/xen"
diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_4.=
14.bb
index 0413bee..91e8988 100644
--- a/recipes-extended/xen/xen_4.14.bb
+++ b/recipes-extended/xen/xen_4.14.bb
@@ -6,6 +6,7 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
 SRC_URI =3D " \
     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
     file://xen-arm64-implement-atomic-fetch-add.patch \
+    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-locati=
on.patch \
     "

 LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44a4=
e5"
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git=
.bb
index 408bc3b..57791fc 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -6,6 +6,7 @@ XEN_BRANCH ?=3D "master"
 SRC_URI =3D " \
     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
     file://xen-arm64-implement-atomic-fetch-add.patch \
+    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-locati=
on.patch \
     "

 LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44a4=
e5"
--
2.7.4

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
