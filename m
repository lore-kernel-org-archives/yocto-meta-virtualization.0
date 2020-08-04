Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.62])
 by mx.groups.io with SMTP id smtpd.web11.5223.1596547706262908756
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Aug 2020 06:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nnVrbK0L;
 spf=pass (domain: arm.com, ip: 40.107.22.62, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq69thDOFjs//3tLlJW2NC1jAIehjhJy1Ihv64j60Ys=;
 b=nnVrbK0LsqUW8gUfF90rQSNyBJhFEU3gPNLzMLL4PX+FMSoFsBoHM8GA5khp3wtRlJESqCPTYKct8swiwxzIlMjWLMK7l77Ty2J2u7TVE7Wg7xsy+BrJrNuCiYF5nmB2ToczBvq5oY3nL6TejpElboKajnqwnE6RiEDawkGwdKs=
Received: from MRXP264CA0010.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::22)
 by DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Tue, 4 Aug
 2020 13:28:22 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::ae) by MRXP264CA0010.outlook.office365.com
 (2603:10a6:500:15::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Tue, 4 Aug 2020 13:28:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Tue, 4 Aug 2020 13:28:22 +0000
Received: ("Tessian outbound d7d79595a1cb:v63"); Tue, 04 Aug 2020 13:28:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f29ac893347b0adc
X-CR-MTA-TID: 64aa7808
Received: from 696a677fdf84.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 52682E71-BBF6-492B-82C9-35B51369659D.1;
	Tue, 04 Aug 2020 13:28:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 696a677fdf84.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Aug 2020 13:28:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iETtc//UZsaD5pPmpKnafI8yVLqQ5SkskwtTmnXiU5KV7rd1DVoH7IOe5HebHpIc+kvjOCvat1fMgijgz8m493ZIWN3UgP2UniQHVI2AI/kdjbAMJgqwljt7YQVReNNSZGxqrTf22yaWcQ8AykeCKzQxnFPe8W55tVuGd2sgIBFC0v9UHECCY1/Lf9yUPB6dFEeYgTHdNkzsT5mPgNWRtwZDAA0Kr7kbNwrxUjfnA1SWFz2fPy5XAdHuSQz3M7bi1ulDeOPHeTykCJ0R/wLkqpDe9Ov9Oasu5firj4aaEUFXeisM6wkiaGFlKLi0ai1EA3A5/uDnRemYcuR3PSTLMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq69thDOFjs//3tLlJW2NC1jAIehjhJy1Ihv64j60Ys=;
 b=d+mb7pnYdFngESDbdwIP2R7jKZj7nb08Y9PI4ObL0iJiAogGQ31/MLn/luxNTFaDAWzlsfk7id0nQ2CIj1fANK4kQyafyP18IwdhJab2WL2ILcrJtZKBP4XhQ69oW2O7zUmVnG2hASqt9HU6DS112seYz14odV/qsxZvRHydpHQiTxwFMj5ksGA5/uYN4gXW8iqnOW+WQVtf69z78bT74fBllY7k6MSVVPExwVQ8DgkYOGyu/6Z7UceyxwjuEC9T9i+Tnt670kTqEm2dhuGdxEYnr0eRRwlrEMvyXFnboKR4s0oUWpNEz/eIZNoA8xUBmjF4m/TdeHRrXLw917RNEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq69thDOFjs//3tLlJW2NC1jAIehjhJy1Ihv64j60Ys=;
 b=nnVrbK0LsqUW8gUfF90rQSNyBJhFEU3gPNLzMLL4PX+FMSoFsBoHM8GA5khp3wtRlJESqCPTYKct8swiwxzIlMjWLMK7l77Ty2J2u7TVE7Wg7xsy+BrJrNuCiYF5nmB2ToczBvq5oY3nL6TejpElboKajnqwnE6RiEDawkGwdKs=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3468.eurprd08.prod.outlook.com (2603:10a6:10:4a::11)
 by DB8PR08MB5484.eurprd08.prod.outlook.com (2603:10a6:10:111::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Tue, 4 Aug
 2020 13:28:14 +0000
Received: from DB7PR08MB3468.eurprd08.prod.outlook.com
 ([fe80::49a1:7f1e:47fb:c63e]) by DB7PR08MB3468.eurprd08.prod.outlook.com
 ([fe80::49a1:7f1e:47fb:c63e%5]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 13:28:14 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization][PATCH 1/2] xen: Fix menuconfig
Date: Tue,  4 Aug 2020 14:28:12 +0100
Message-Id: <1596547693-87664-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: CWLP123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:59::27) To DB7PR08MB3468.eurprd08.prod.outlook.com
 (2603:10a6:10:4a::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.52) by CWLP123CA0063.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:59::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3261.15 via Frontend Transport; Tue, 4 Aug 2020 13:28:14 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5841b450-3a3e-4d77-2d16-08d8387a425b
X-MS-TrafficTypeDiagnostic: DB8PR08MB5484:|DBAPR08MB5590:
X-Microsoft-Antispam-PRVS: 
	<DBAPR08MB5590AD96C46E899FB33343E3924A0@DBAPR08MB5590.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 S1pizEO+bRQ8rIFQsnofdDCjKTasczi5K2YiQA1knvSU2GEB0TjGB0PI2LxFqMFYUDf3BwdZMZlohQ4WcLNiar17BTbkOWlRlD33xRG7YQVNLCd80a9XBu+aHQ4yMShApfAM+bueW2l3E5Xam8vLarIf31c6rgU0LYnkKgDHtbDMSozjsApgQAw3AHlvBAk9jKpBjozqVg5tUDALXzuY8aw5xFVwnYqH0DQd8DBnb9uwZFvqHOf7QVPOEZjka09pmzJyaQcP1kxVUqMw8xbZehv1HTnw5wnPu0KGUYqky7eL9eRDcSai/ZM/JNSQ8XycPzfpaA+/eWGqbJhf7RCTjg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3468.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(478600001)(956004)(2906002)(26005)(44832011)(5660300002)(4326008)(36756003)(86362001)(8936002)(7696005)(8676002)(2616005)(6486002)(52116002)(66476007)(83380400001)(16526019)(6916009)(66946007)(66556008)(186003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Xw4WVfA830ALTtHtKueXgMYpnIlamWYvk+pGl0WyVvczFuzYRY1urFyYBJLD2MMZ+4r0eqwL3WiDB+iAWg6ktwxMIMslfPQ9ThKwgPdgJ/fj6lBu/7xfPJ1iFT6+E/mH9aB4CTzWxrZVccSaFzx2/nH4LAcZmC3+RGOkONsiWE2bI/n9K9QyQsxj8kECDK8vcRXmZcZtBXq0rayQ+Xid4Bk6x1ErzsP9y/lxUhak2+XZbTJDZ+P7EL717cjYCoUlSm4HZKGF4bGKF0spycezOhkIJiknJyHSY3180GjT9IHhHKdHz20NOKZX0lj2K1qwOvQyUl0umPGzWs9g5ZpDDg8+Gf2HDXK0pNJvZ6tFCKo/86CzxmoNX1k2dvOcHIpO+dxWSGqt0LosOdMWX9NJzK2XvOXh+qGOGNmx/zYP2xOl+bhMQAuzF2wuqxX7VegLIKY6kA10JxZmDdX+s3pk2drEEiaO2MyBUVAPmakb0KPVLQ/paOxfqlimgLfkGpLEGjyicwIwYaqaz/N7fxB4sPiKO143VIum8646TkGz/9PNOgCSLpsf9oWgkKeOnKdZ6SB9H+IP35fW2eyF5grpHEWwyZOgGrrLYWqiXwr3FAiNtVAgtDDQzIZuDQxv2fu0krL5dMHR0DEGThnSQ7CtOQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5484
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	90bc60e1-babd-4c19-4194-08d8387a3da1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hpXn0NnEtSc3BgPghZkgvq/qAN56acw61QUpB9uyUdmKJgbSuovuj0gSrlyyu+VzbdT1PsYJ5Gh0opx3VcbEm9aACSmktj85Qg6ee5UAL9ZLRnpl4bXeUa8rDW09pTi0XKy9EKp+pK2It0GyLRrB8YqwJkgTSwPTIrs7ha8qColSqCDSoLG17y0Izc3nCkRMZMk0sBNPQO3lvoLjHFZUEWq0cGLy5K+2jQAiVENy5udLTyAa8s4+45Sp3PqgODpPeC1QwBc+GleNCI4GQNF0jxx57ZFRC08MDnAZEj+MEloRPfxMm46MCorv8jAFkO6XD2rBbDwmtS4hkaV2kYY0huMKMz0YDWpBtAJ6u5sQJEKhA+mTQgX7McjawJZvI+IThNaHutvdQU2es2L/PsyqaQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966005)(8676002)(47076004)(82740400003)(6916009)(2906002)(8936002)(44832011)(83380400001)(6486002)(4326008)(5660300002)(81166007)(2616005)(86362001)(478600001)(336012)(956004)(186003)(36906005)(16526019)(70206006)(356005)(70586007)(316002)(82310400002)(7696005)(36756003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 13:28:22.2222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5841b450-3a3e-4d77-2d16-08d8387a425b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5590
Content-Type: text/plain

When building in OE environment the linker path needs to be passed when
buildind the Kconfig tool in order to get the menuconfig task properly
working.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 ...g-Allow-specification-of-ncurses-location.patch | 55 ++++++++++++++++++++++
 recipes-extended/xen/xen-hypervisor.inc            |  4 +-
 recipes-extended/xen/xen_4.14.bb                   |  1 +
 recipes-extended/xen/xen_git.bb                    |  1 +
 4 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch

diff --git a/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
new file mode 100644
index 0000000..74c9cb0
--- /dev/null
+++ b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
@@ -0,0 +1,55 @@
+Upstream-Status: Inappropriate [oe specific, cross compile issue]
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+
+From d078e29aa31ac3fa4c041bf89c46bc6372c1a02a Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Mon, 2 Jul 2018 23:10:28 -0400
+Subject: menuconfig,mconf-cfg: Allow specification of ncurses location
+
+In some cross build environments such as the Yocto Project build
+environment it provides an ncurses library that is compiled
+differently than the host's version.  This causes display corruption
+problems when the host's curses includes are used instead of the
+includes from the provided compiler are overridden.  There is a second
+case where there is no curses libraries at all on the host system and
+menuconfig will just fail entirely.
+
+The solution is simply to allow an override variable in
+check-lxdialog.sh for environments such as the Yocto Project.  Adding
+a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
+compiling and linking against the right headers and libraries.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+cc: Michal Marek <mmarek@suse.cz>
+cc: linux-kbuild@vger.kernel.org
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ xen/tools/kconfig/mconf-cfg.sh | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+ mode change 100755 => 100644 xen/tools/kconfig/mconf-cfg.sh
+
+(limited to 'xen/tools/kconfig/mconf-cfg.sh')
+
+diff --git a/xen/tools/kconfig/mconf-cfg.sh b/xen/tools/kconfig/mconf-cfg.sh
+old mode 100755
+new mode 100644
+index c812872d7f9d..65a9b9e5b8a6
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
+-- 
+cgit v1.2.2-1-g5e49
diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index c386917..784059b 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -77,12 +77,14 @@ do_deploy[depends] += "xen-tools:do_populate_sysroot"
 do_deploy[depends] += "xen-tools:do_deploy"
 
 # Enable use of menuconfig directly from bitbake and also within the devshell
-OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
+OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO CROSS_CURSES_LIB RECIPE_SYSROOT_NATIVE"
 HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
 HOSTLDFLAGS = "${BUILD_LDFLAGS}"
 TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
 do_devshell[depends] += "ncurses-native:do_populate_sysroot"
 
+CROSS_CURSES_LIB = "-lncurses -L$RECIPE_SYSROOT_NATIVE/usr/lib"
+
 KCONFIG_CONFIG_COMMAND ??= "menuconfig"
 python do_menuconfig() {
     import shutil
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

