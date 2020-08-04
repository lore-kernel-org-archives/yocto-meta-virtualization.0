Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.45])
 by mx.groups.io with SMTP id smtpd.web11.5225.1596547706968090786
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Aug 2020 06:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xcnI7L+J;
 spf=pass (domain: arm.com, ip: 40.107.5.45, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56gRipchoNIHEqt8hnaMJiZcej+Yjs75UvdFgSoKwO8=;
 b=xcnI7L+J57ThLOQw9TWf1H0cVKm26+fxknZj+f/BCqKQ02lMBt8ZePJKLCnwVrtYKlcQjFyuIZfAvmg4EXPqbMv4QgqujPdWTCGrQT6QHAbIqedKbY50QXtV7Gb7Tu+dr4PeAOInuIXXSPPzL3Og5z+Wfw9q+QpcdlLPb5xIf3Y=
Received: from AM4PR0302CA0005.eurprd03.prod.outlook.com (2603:10a6:205:2::18)
 by DBAPR08MB5832.eurprd08.prod.outlook.com (2603:10a6:10:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Tue, 4 Aug
 2020 13:28:24 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:2:cafe::ab) by AM4PR0302CA0005.outlook.office365.com
 (2603:10a6:205:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Tue, 4 Aug 2020 13:28:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Tue, 4 Aug 2020 13:28:23 +0000
Received: ("Tessian outbound d778af23b2f9:v63"); Tue, 04 Aug 2020 13:28:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a915363069436f0
X-CR-MTA-TID: 64aa7808
Received: from 696a677fdf84.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B8F93071-199E-4CB6-B71B-A17E6C33BC87.1;
	Tue, 04 Aug 2020 13:28:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 696a677fdf84.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Aug 2020 13:28:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erIbjAbunRZ4OlaegGFp6mp19OsnVRysZyhd673c4d+ytQW7JFUdLxemHfyyynjVhTN5bFQMb9b7rqSVI9cY3S11EoLOH2pZ4C/jA65VtRJLqtD4x1GwK5hm4Dax7W/R9zkZQFY+ewjzNeG/ERliALSlCfxC1PBV4QlMObUYtrXfzbFj/u8ExLJVa7ja22K5evtuUbFfh7DThZlmNWLir2KupcRfEDcKbUTblIW3EPgg6dXbKEk2A/IyHwoIzswz7c/VQYmcml65U2hzVNSgL0X/IpFnyyIW5pJQ7FJLaot0HtLiYcckNzuHT9PqmxCpVPHbHfjcIejHFhsmsTp00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56gRipchoNIHEqt8hnaMJiZcej+Yjs75UvdFgSoKwO8=;
 b=PuKUVMB+8M5DL9TdYmIH8IJzBd56sha5OXXvF2GP9+9+i8uGig7WEPtgDr3xaBvY0NFDXvuJZLKX0DBox9cqZgvXdjHclaokFm1wDJFgPfqCIIwLeor0Xl1EteySs2qnz4Fr5ORP5XrPAqVCNdmcW+u6vG2W61rm5smSOzJUUsMluBrAe+H8wSFMm8KKk9tqxaS89PilIIMcsM/CXo+Rxej+ZgGZaF0ImkKeaHbZhym9zBqAhuFW1LyFkL23otb8dWLqe8nRQpa1n6g4Vo8AmBK2vJIM8P71PKEpSxfSaMUTQs6p4fIF5GBLGTTU6t0gL+tvfl7BUdFohNqUDosHTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56gRipchoNIHEqt8hnaMJiZcej+Yjs75UvdFgSoKwO8=;
 b=xcnI7L+J57ThLOQw9TWf1H0cVKm26+fxknZj+f/BCqKQ02lMBt8ZePJKLCnwVrtYKlcQjFyuIZfAvmg4EXPqbMv4QgqujPdWTCGrQT6QHAbIqedKbY50QXtV7Gb7Tu+dr4PeAOInuIXXSPPzL3Og5z+Wfw9q+QpcdlLPb5xIf3Y=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3468.eurprd08.prod.outlook.com (2603:10a6:10:4a::11)
 by DB8PR08MB5484.eurprd08.prod.outlook.com (2603:10a6:10:111::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Tue, 4 Aug
 2020 13:28:15 +0000
Received: from DB7PR08MB3468.eurprd08.prod.outlook.com
 ([fe80::49a1:7f1e:47fb:c63e]) by DB7PR08MB3468.eurprd08.prod.outlook.com
 ([fe80::49a1:7f1e:47fb:c63e%5]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 13:28:15 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization][PATCH 2/2] xen: Add support for config fragments and diffconfig
Date: Tue,  4 Aug 2020 14:28:13 +0100
Message-Id: <1596547693-87664-2-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596547693-87664-1-git-send-email-diego.sueiro@arm.com>
References: <1596547693-87664-1-git-send-email-diego.sueiro@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8670c1e8-65bf-4482-73f6-08d8387a4333
X-MS-TrafficTypeDiagnostic: DB8PR08MB5484:|DBAPR08MB5832:
X-Microsoft-Antispam-PRVS: 
	<DBAPR08MB58326CF1CD031C6FC4730DB5924A0@DBAPR08MB5832.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 9zukqzLWK8qbwM4t+J3xPNPJTWT1Jf7uoJ7pMK3ceWRItOxD5oEHU4npEs8v6sR5tWpqKtxrK4yTTTM3414t0Iqxme9mmE4eyTZmfBmK7S5v70t0d/kg+tCruRWnFWODyZoczGyjoDAqSK+6oWqpjdH6c+nxeZsprZ5xaZPXfDTaTOzGSTs6vo68N42jTyHWWVc4pvh1siyniszFioq5uXjQS+qTY4vp5dC/E9tfB5qgylEXI6XmdNHz1iiMs0/p2iiDlWil9LYV3FerM/p2ZRuwBA2XbsM38epoFBhkactxweA0LTnlXAcZU8RmS/AWc7siqJt+Ua9ePrVbFD2wqw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3468.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(478600001)(956004)(2906002)(26005)(44832011)(5660300002)(4326008)(36756003)(86362001)(8936002)(7696005)(8676002)(2616005)(6486002)(52116002)(66476007)(83380400001)(16526019)(6916009)(66946007)(66556008)(186003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 BgenSkl+RvdLRM2i2OceiGm/0KZBjnqT0oV5nzm+AX5jVgjRAFU+TQu2OeEx68L1zZQpn9H4Qssc2Ne8qNOfNQBsBmFGqpQ/HzRadpNM0adx0tvmTYQ8QIDSQ0cJ+Ixe+CwrVZTJiigLpoYSoWZ9POUEaOD/3dmP7+Zx1M+4ybXRHLOGkq4nurkK/Jm61FHT5mQGHee3TR/f72z7l0tgK6ULoy3nhEErV90hoN+BUUNwW7cftLWqZhTjr9NSlVptyREMEezOldlrXjVKdL49H6++WnwWIaNGha4b2MNk3aXqb4JsVw/06UqGKFhALdB0g0xaFyWLBc0uWq3L7uVqdKuAcYzNY9ga1jCv0KF9pjUNHXvUojxXKB3VeSLTgnZ+6jJ1Ud8qM/q7ZGnLZGL7tF3bdnh9wBhKUbT2UgKS4c+AiTxmkMvcLSW05TuQgBRU4BlgdTHQbZbgbXFDfe0EziNEBwNmDteErmH71NDoR3aLdMKYE0a903pFw1Rp8mD3DDf4rdjGxHUEWFFjt+npm0bQ2ZC8Ov6WBzBBW8ANF58zIzDI333thM/r6t88UmwWNJkCTAdvpJK3bx8PF0pX2qmXJB49ihltd0S6R8ZatH1vsObq2RAvuZIArebWWf25nUOHzR2K7W5BZRewhSRN/Q==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5484
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e3e6f4a1-476b-46f5-5772-08d8387a3ddd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X2v1TVBTPkSwG4ceiXPKHhre2LSpTKDbbsYnaOv517vdBb085gDcshsHI5tnNNraRfAPIGczHciFTwm3NVluHlBGcPrl6Rdv4LJfbX88S5U+8yIzM5KhsBfBiw0RqGsfYkkiuVYyFAhbFWwXBmzH9hWXfN6hNAME/T3x6Cv5POhzVtm0E2A0qD2siiwdkMri/zoyGl/BE7usnCHLzvpcOTBUV5ndmTn+yEnLy/QBcvIV3bE5t0Uz4EFryO6KT0P7t0eUYqlipFafmfmqgNV2Qml4VwTlsTDp4yShw23YUgQI1Nw/qLBUlnyvfe8nN/zWZxvVrVZVcTulvPy4Sg9Xiirn7OfAGKrlbcIQOQxs/+ayLhhHL2Q2JXU4pIWGHpzbBqPlpqztOreSKL1Y0iKpOw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966005)(5660300002)(2616005)(478600001)(356005)(7696005)(36756003)(86362001)(36906005)(4326008)(316002)(44832011)(6916009)(956004)(82310400002)(6486002)(81166007)(47076004)(186003)(82740400003)(70206006)(8936002)(26005)(2906002)(83380400001)(16526019)(336012)(70586007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 13:28:23.6406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8670c1e8-65bf-4482-73f6-08d8387a4333
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5832
Content-Type: text/plain

This patch introduces the following changes:

1. By inheriting cml1.bbclass we can drop some environment variables
   settings in xen-hypervisor.inc for the menuconfig task, and also be
   able to search for config fragmens and use the diffconfig task.

2. Change the do_configure to pre-generate the xen/.config in order
   to enable the merge_config.sh to run successfully when config
   fragments are listed in SRC_URI.

3. Copy-and-Paste the do_diffconfig function from meta/classes/cml1.bbclass
   and modify the path of the .config.orig and .config files.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-extended/xen/README             |  3 +++
 recipes-extended/xen/xen-hypervisor.inc | 46 ++++++++++++++++++++++++++-------
 2 files changed, 39 insertions(+), 10 deletions(-)

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
 
diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index 784059b..55effe3 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -31,9 +31,13 @@ FILES_${PN}-efi = " \
     /boot/xen.efi \
     ${exec_prefix}/lib64/efi/xen* \
     "
+inherit cml1
 
 do_configure() {
     do_configure_common
+    cd ${S}/xen; XEN_CONFIG_EXPERT=y make
+    ${S}/xen/tools/kconfig/merge_config.sh -m ${S}/xen/.config ${@" ".join(find_cfgs(d))}
+    cml1_do_configure
 }
 
 do_compile() {
@@ -77,15 +81,11 @@ do_deploy[depends] += "xen-tools:do_populate_sysroot"
 do_deploy[depends] += "xen-tools:do_deploy"
 
 # Enable use of menuconfig directly from bitbake and also within the devshell
-OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO CROSS_CURSES_LIB RECIPE_SYSROOT_NATIVE"
-HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
-HOSTLDFLAGS = "${BUILD_LDFLAGS}"
-TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
+OE_TERMINAL_EXPORTS += "RECIPE_SYSROOT_NATIVE"
 do_devshell[depends] += "ncurses-native:do_populate_sysroot"
 
-CROSS_CURSES_LIB = "-lncurses -L$RECIPE_SYSROOT_NATIVE/usr/lib"
+CROSS_CURSES_LIB += "-L$RECIPE_SYSROOT_NATIVE/usr/lib"
 
-KCONFIG_CONFIG_COMMAND ??= "menuconfig"
 python do_menuconfig() {
     import shutil
 
@@ -107,7 +107,33 @@ python do_menuconfig() {
         bb.note("Configuration changed, recompile will be forced")
         bb.build.write_taint('do_compile', d)
 }
-do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
-do_menuconfig[nostamp] = "1"
-do_menuconfig[dirs] = "${B}"
-addtask menuconfig after do_configure
+
+python do_diffconfig() {
+    import shutil
+    import subprocess
+
+    workdir = d.getVar('WORKDIR')
+    fragment = workdir + '/fragment.cfg'
+    configorig = 'xen/.config.orig'
+    config = 'xen/.config'
+
+    try:
+        md5newconfig = bb.utils.md5_file(configorig)
+        md5config = bb.utils.md5_file(config)
+        isdiff = md5newconfig != md5config
+    except IOError as e:
+        bb.fatal("No config files found. Did you do menuconfig ?\n%s" % e)
+
+    if isdiff:
+        statement = 'diff --unchanged-line-format= --old-line-format= --new-line-format="%L" ' + configorig + ' ' + config + '>' + fragment
+        subprocess.call(statement, shell=True)
+        # No need to check the exit code as we know it's going to be
+        # non-zero, but that's what we expect.
+        shutil.copy(configorig, config)
+
+        bb.plain("Config fragment has been dumped into:\n %s" % fragment)
+    else:
+        if os.path.exists(fragment):
+            os.unlink(fragment)
+}
+
-- 
2.7.4

