Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.54])
 by mx.groups.io with SMTP id smtpd.web12.19030.1597251231691131245
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 Aug 2020 09:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MNb8vv9v;
 spf=pass (domain: arm.com, ip: 40.107.22.54, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zd3OG1mia5s1EK7+v0/7A6v6eNSTmctM3o9RK726aY=;
 b=MNb8vv9vjYaw+QMid9MbR33K4oduoD9HDZchipvzdFFy/i0k3QzE6dZ2FQW5Y7/yB5o+tA7K47VHVZ6MfPe9Zd4uiUFmvohzhpkUz7FiP8YKzWRyIUu8NctMtDr0ge5DSgob5em4nZ8vMtwMitj88l6VlvJHjgKrU8mE+H586sE=
Received: from AM5PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::26) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Wed, 12 Aug
 2020 16:53:48 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::b2) by AM5PR0602CA0016.outlook.office365.com
 (2603:10a6:203:a3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Wed, 12 Aug 2020 16:53:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Wed, 12 Aug 2020 16:53:48 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Wed, 12 Aug 2020 16:53:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d8e9340f232d6e4f
X-CR-MTA-TID: 64aa7808
Received: from 025320b52448.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A0A8F930-0711-4972-B4AE-1D8821B93E3C.1;
	Wed, 12 Aug 2020 16:53:42 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 025320b52448.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Aug 2020 16:53:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQ45KUdLoWeD1JVxZs+C5OxGlKftqkRLfA5gdcRXlHJ1URHmoxXQS9wl4zxYxvOVfZJN6KduVRXNxt35RqSOSMycP9vSbLqmyQDgVgrT6zwyrs0Z8W83y6qDh1cCiNpEcwHC0iCIItQ6u+4TQEqPuTrgjonLnjiAK4menmGXQeU94CaoFdHTtVEA3bM1H7Wzwpn7zkBiByxxmeV0vh+9AIwTqjOkDlhKRJukQHaUUKlx6C5pYuvRteDWL6f15/2BqVYiVr12FYY2d/sAn87ZCHRE5mQycMmbJAv70DhVQ/NJyap90TGJ5uhYwf6yTAwRU/ZBjF1XmJDtWwytXNpLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zd3OG1mia5s1EK7+v0/7A6v6eNSTmctM3o9RK726aY=;
 b=jCNuvJFEuvicwwgcSsv+9BaKI8ZDMOYmstQL5k+nRopPxHbsqoHQy/upVCk0TjtswiKUiRCqjAyg9JzxJs8p5Q7QhxXVvCmpb0XOc0fUpyYxy2D5m4rgeULfr4JWdnEwspzyQWlPDHdmGrBbLPIsVCNLAGqkPUBgBZ9au5oOcYJYBwFfCm84ODvw8Ud+RyB9VpOG+0FpCqz6Gtg3YLJdeBAD01Ool5vthchPw24tOEOxnY0Stg5Soll2EtvJYSRGA8paszGcJi1SolXWHwNDj1VOqJcO+5SocOx6Q9P1kl3HNe4NAiYq7TzolPXvMulg7Mu1zfgHcIEikgiNqiNXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zd3OG1mia5s1EK7+v0/7A6v6eNSTmctM3o9RK726aY=;
 b=MNb8vv9vjYaw+QMid9MbR33K4oduoD9HDZchipvzdFFy/i0k3QzE6dZ2FQW5Y7/yB5o+tA7K47VHVZ6MfPe9Zd4uiUFmvohzhpkUz7FiP8YKzWRyIUu8NctMtDr0ge5DSgob5em4nZ8vMtwMitj88l6VlvJHjgKrU8mE+H586sE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3302.eurprd08.prod.outlook.com (2603:10a6:209:41::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Wed, 12 Aug
 2020 16:53:41 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3261.025; Wed, 12 Aug 2020
 16:53:41 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization][PATCH] xen: Fix menuconfig and add support for config fragments and diffconfig
Date: Wed, 12 Aug 2020 17:53:40 +0100
Message-Id: <1597251220-21873-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P123CA0060.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::24) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.50) by LO2P123CA0060.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3283.15 via Frontend Transport; Wed, 12 Aug 2020 16:53:40 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dbd99106-e7d7-4a2d-9664-08d83ee0488e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3302:|VI1PR0801MB2125:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB21256EC186B028F1999FD4F192420@VI1PR0801MB2125.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JPNkW4nxLDZh5Ra8wve0bZP07tYiJoFYfUk2gJJiv0ZRzohxLayQAqAt209PimFhVr26msjpc/sH8iXWP43eCbMt+T3Upj/xwe4fPRVeLYX+1QfSTuYRMOtyQ4dNu79ChJ4WiB8Lnk0oMD7nmsqtGJfemBMdREj018aXBNGyRy3Mn7dUJ8wH+00Xsh66hk/FSGcS37S3difUYZExs9221XWmm7Z48p12t6T15MiWsiu3LIg6vfs8p/wbwL5GhoxtdqtXxCwhzxwYQTmAka5OrMXzlAa+FeJyjUDt/Cwq0gn5ujvmOAEmy+evk3DSMRKo9bl8aIfRmwBxfHU/LMtONg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(6486002)(66476007)(66556008)(36756003)(5660300002)(7696005)(8936002)(86362001)(4326008)(83380400001)(66946007)(52116002)(6916009)(8676002)(186003)(316002)(26005)(16526019)(2906002)(956004)(2616005)(478600001)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Xn14/ckoVy8n7C5n9xChoOReQeJb5oBm+16QhtMSrL7om9sqnSSl0TMfCBSUDpHyHqNguP974rS9TteRn1eZoTiDKW/hfDWb77bIjjMcU5VaAzx7rZnY5oQ9+yTTQLHj+TuS2towOqmO6XPNuAw5KmoLzDMxg+xPfL25Nb+4ZmERTWtXaNT3PlLAYtH56aNs4h4I4FMGIJqOHajVkKXf+myMfsxvTJBuEFJ344JBelN0sEEnTGgzPaz2CiJD3sL9lfS46RduMJ2cob0qDKBa+8ZYvMbOqB2qwLItHatIL+YtxrusfdNz9oU4gnyMJtqogifLCPyzpBsZ0icFH1qQAO/l+EzU/rIWq1JDbkSnU/5FRLaUBULMj5eA2U5T1le0e7d7LEwWlDFaUWpcuv3VRSC6Kx7QGW4Oqs8XA+7y4ws5KGpTb5Koz61Fbg9mTV0fW/zbylz7WBfuetTn0gPNUejb9LMPAzdoHZ3CCq7OCExq1UWj2G/+JyBn983mU2HYIXV0WE3EP754GIgb4O4qAn4fp/PEEihpMknOV1Gn1AHLwvKQWB382rU3Y2xRW/+SOCltgDhkWji6jnvl7EDErdxrNLdz8JzJEUoJzj0m63eqwE53Ewy9LsSSpSWbhtVCo0MuB4O/TVAPpvwZ2MmQEw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3302
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1332a741-f3fa-4607-f0ee-08d83ee04404
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pbn4ZrnP7v5oOyHySBg3Snltm8eKbF1vKn5I0EZc8rj4bxTkt+Il9EU5rO79dSbcSYcGN0+4GaY7+TBursfEu7TzGGhtvcPHkw3WzjAyOXk3su/fhIc6Nk9afcqvwNDBNrUUl05vME2MlIe7xcIOrpSZpgEE3Rz8tvqDOcQZ1+B8XMWMCuRVOt4vPVpUka7WpZ32EYeaNdav/2oS13tR/ae1w9EOge5JXZJ7n6oH8svlKbljUZzQ3ENpx8ithXDL0C8YfY9qkOj3Guj60YkLX5nOjvOKQOVQ8OJRW9DLm26ifctOYFauO7LifTLNE2yckxA0+wY0iIpLMgp0tGBDyjOetUlin5AEcFXL/6KBmB3TwvMraz/5aMY7ftXm94eKRSb+s4m5CrrHUIaOLRPWkA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(7696005)(70586007)(8936002)(83380400001)(26005)(336012)(36756003)(70206006)(44832011)(82310400002)(6486002)(956004)(2616005)(86362001)(82740400003)(2906002)(6916009)(36906005)(356005)(8676002)(4326008)(81166007)(5660300002)(478600001)(16526019)(186003)(316002)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2020 16:53:48.3006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd99106-e7d7-4a2d-9664-08d83ee0488e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2125
Content-Type: text/plain

This patch introduces the following changes:

1. When building in OE environment the linker path needs to be passed when
   buildind the Kconfig tool in order to get the menuconfig task properly
   working.

2. By inheriting cml1.bbclass we can drop some environment variables
   settings in xen-hypervisor.inc for the menuconfig task, and also be
   able to search for config fragmens and use the diffconfig task. Also,
   there is no need to have a custom do_menuconfig task anymore.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-extended/xen/README                        |  3 +
 ...g-Allow-specification-of-ncurses-location.patch | 64 ++++++++++++++++++++++
 recipes-extended/xen/xen-hypervisor.inc            | 48 ++++++----------
 recipes-extended/xen/xen_4.14.bb                   |  1 +
 recipes-extended/xen/xen_git.bb                    |  1 +
 5 files changed, 87 insertions(+), 30 deletions(-)
 create mode 100644 recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch

diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
index 34e7977..f86d269 100644
--- a/recipes-extended/xen/README
+++ b/recipes-extended/xen/README
@@ -25,6 +25,9 @@ Select the config settings that you want and Save the file. If you save it to
 the default ".config" file when prompted by menuconfig, you can find it in the
 'xen' subdirectory of the build tree.
 
+Configurarion fragments are also supported. To use them you need to list the
+.cfg files in the SRC_URI.
+
 security patches
 ----------------
 
diff --git a/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
new file mode 100644
index 0000000..64319d6
--- /dev/null
+++ b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
@@ -0,0 +1,64 @@
+Upstream-Status: Inappropriate [oe specific, cross compile issue]
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+commit e6972e689a980ab28637e94e48c77eeace6abde5
+Author: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date:   Mon Jul 2 23:10:28 2018 -0400
+
+    xen/kconfig,menuconfig,mconf-cfg: Allow specification of ncurses location
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
+    Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+
+diff --git a/INSTALL b/INSTALL
+index 0d3eb89..9dcda8f 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -33,6 +33,10 @@ small subset of the options.  Attempts to change other options will be
+ silently overridden.  The only way to find which configuration options
+ are available is to run `make menuconfig' or the like.
+ 
++To use the menuconfig in cross build environments, e.g. openembedded,
++set the CROSS_CURSES_LIB and CROSS_CURSES_INC environment variables with
++the proper values required for libs and cflags compilation settings.
++
+ You can counter-override this behaviour by setting XEN_CONFIG_EXPERT=y
+ in your environment.  However, doing this is not supported and the
+ resulting configurations do not receive security support.  If you set
+diff --git a/xen/tools/kconfig/mconf-cfg.sh b/xen/tools/kconfig/mconf-cfg.sh
+old mode 100755
+new mode 100644
+index c812872..65a9b9e
+--- a/xen/tools/kconfig/mconf-cfg.sh
++++ b/xen/tools/kconfig/mconf-cfg.sh
+@@ -4,6 +4,14 @@
+ PKG="ncursesw"
+ PKG2="ncurses"
+ 
++if [ "$CROSS_CURSES_LIB" != "" ]; then
++    echo libs=\'$CROSS_CURSES_LIB\'
++    if [ x"$CROSS_CURSES_INC" != x ]; then
++	echo cflags=\'$CROSS_CURSES_INC\'
++    fi
++    exit 0
++fi
++
+ if [ -n "$(command -v pkg-config)" ]; then
+ 	if pkg-config --exists $PKG; then
+ 		echo cflags=\"$(pkg-config --cflags $PKG)\"
diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index c386917..28d64c5 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -9,7 +9,7 @@ DESCRIPTION = "The Xen hypervisor"
 # The Xen hypervisor has a narrower compatible platform range than the Xen tools
 COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
 
-inherit deploy python3native
+inherit deploy python3native cml1
 
 PACKAGES = " \
     ${PN} \
@@ -34,6 +34,17 @@ FILES_${PN}-efi = " \
 
 do_configure() {
     do_configure_common
+
+    # Handle the config fragments
+    if [ -n "${@' '.join(find_cfgs(d))}" ]; then
+        # If .config is not present generate one in order
+        # to use the merge_config.sh
+        if [ ! -f "${S}/xen/.config" ] ; then
+            oe_runmake -C ${S}/xen defconfig
+        fi
+        ${S}/xen/tools/kconfig/merge_config.sh -m -O \
+            ${S}/xen ${S}/xen/.config ${@" ".join(find_cfgs(d))}
+    fi
 }
 
 do_compile() {
@@ -77,35 +88,12 @@ do_deploy[depends] += "xen-tools:do_populate_sysroot"
 do_deploy[depends] += "xen-tools:do_deploy"
 
 # Enable use of menuconfig directly from bitbake and also within the devshell
-OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
-HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
-HOSTLDFLAGS = "${BUILD_LDFLAGS}"
-TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
 do_devshell[depends] += "ncurses-native:do_populate_sysroot"
 
-KCONFIG_CONFIG_COMMAND ??= "menuconfig"
-python do_menuconfig() {
-    import shutil
-
-    try:
-        mtime = os.path.getmtime("xen/.config")
-        shutil.copy("xen/.config", "xen/.config.orig")
-    except OSError:
-        mtime = 0
+# Pass the native library path for kconfig build when running the do_menuconfig
+# task
+CROSS_CURSES_LIB += "-L${STAGING_LIBDIR_NATIVE}"
 
-    oe_terminal("${SHELL} -c \"cd xen; XEN_CONFIG_EXPERT=y make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
-        d.getVar('PN') + ' Configuration', d)
-
-    try:
-        newmtime = os.path.getmtime("xen/.config")
-    except OSError:
-        newmtime = 0
-
-    if newmtime > mtime:
-        bb.note("Configuration changed, recompile will be forced")
-        bb.build.write_taint('do_compile', d)
-}
-do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
-do_menuconfig[nostamp] = "1"
-do_menuconfig[dirs] = "${B}"
-addtask menuconfig after do_configure
+# Specify the root dir of the .config file for do_menuconfig and do_diffconfig
+# tasks
+KCONFIG_CONFIG_ROOTDIR = "${S}/xen"
diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_4.14.bb
index 0413bee..91e8988 100644
--- a/recipes-extended/xen/xen_4.14.bb
+++ b/recipes-extended/xen/xen_4.14.bb
@@ -6,6 +6,7 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://xen-arm64-implement-atomic-fetch-add.patch \
+    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index 408bc3b..57791fc 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -6,6 +6,7 @@ XEN_BRANCH ?= "master"
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://xen-arm64-implement-atomic-fetch-add.patch \
+    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
-- 
2.7.4

