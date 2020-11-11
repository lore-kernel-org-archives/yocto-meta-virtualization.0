Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.1859.1605064810540956894
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 19:20:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mz0volSv;
 spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: yanfei.xu@windriver.com)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9B79138C046F
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Nov 2020 03:20:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQ5nG8+b7S66816LRc2CzJLoHOoDObmJqgteYVJWd2uF/1CFc2CLTEUYP6nxS9sIM73W5mwGY+inDWAsbXOltRGDnFS/4zk8b09c9o6LduWygB4jeS/Hv9obifewL0LhxPe/ABd0JXSFi8ge65VquOdj2ukDqPk6gN49Om9NEK3kK/AMyryWCAtBpJvTB2bWX8NAqTbIgQiE+obNhtixezCMY2tCcm37pGokBGH/jB1FAJSW9w4wj08kRZj7ru2ZszWVHRKgztBikNY7PdB3wfYKMiwObvSaw8Lcbb1rFY4Fdaq/BEQZ9Y2EmQyR6mS6kFfa39D76tfnzP/HkhIygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KalUJIpzKDw/k3HF0b4ZibP6g0m4Ydc+bYb9lLju6o8=;
 b=I7Kq8h9HqHm0iWRq9r6xCoOwf/frRjGvUsMw4MFPgB7l/fxKCEIcAjNkxlJrTALDaJnPG/zkFPqw1noA2R4dLFQzM3K81LABBjAfYEILwyzDjxGyVO2zXHhVbeeM3psL1mrxqY/YcY2dEBl/YsSrSu9+PnhkPQTI8TQwxQBvHv/ww3i7bjE0a0Y2GJDji9ko/Qeb11SFh4N0dzEQmmhyEXM7G9slUC+sMQxbUQgeLpiYEeMse+1qridDX84S93y0DhtpqSMGyJ/BC7Kz6Da3dFYwj7LBWZTEMiSpZ8DuqTcENqxFgS4oEZ3fFkTcN9GWAULLuWta8WXDP2MfBogYOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KalUJIpzKDw/k3HF0b4ZibP6g0m4Ydc+bYb9lLju6o8=;
 b=mz0volSvgkiPwmg2nlKtAWB6LzaTHL1i4+EoT5dqx//PIzKjiM4U8EX9mFB0/e4JV7qVht3jclNb+HOT2YAuTci+La8EEN62CqqsXfOo5w0e/JbcLBDNBo5+zs+QnYl5P2jq0hHIUwmQgKlxv4xxIizGT70aQ/TkANPm1XzJe8c=
Authentication-Results: konsulko.com; dkim=none (message not signed)
 header.d=none;konsulko.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by SJ0PR11MB5167.namprd11.prod.outlook.com (2603:10b6:a03:2d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 03:20:04 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::adbd:559a:4a78:f09b]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::adbd:559a:4a78:f09b%6]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 03:20:03 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: pbarker@konsulko.com
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH v2] ceph: add support for python3.9
Date: Wed, 11 Nov 2020 11:19:51 +0800
Message-Id: <20201111031951.33998-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.18.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0050.apcprd04.prod.outlook.com
 (2603:1096:202:14::18) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK2PR04CA0050.apcprd04.prod.outlook.com (2603:1096:202:14::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Wed, 11 Nov 2020 03:20:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a73e8ba-7232-445e-6931-08d885f0ae51
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5167:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5167E05B6BFEC94358ABBBB5E4E80@SJ0PR11MB5167.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n4s5nFGLINNzcTI+fkhtwAmFbaaEmqGcU9XgwAvQzdEsjDQmp8irGwSgRehGQcMz924WBJElP+dl2HchRNLfzLAdwztacfgCrgbWuqABXW1dZW7sBHCdxHHW9Iuo2Y57r3wLyZfFLEqUhcegQyTG5BQO1aNrHOYR4/JbSzs/5e13ws0x0gg825X3iK3taMSwuPXnSFHU/UhMOm8AN+4qyIq9RC0ULi9c+ssfSjzRhHiRyq1AeOWbXzxibLYo4wg+qojsDBMhZXrPTzQMsfURs8NFRPTuzW0Sq2+o9XpwqfivCJN1MHUCb5hc17VIY4oKLlcws+6PMaqiWl2jV4z+bkgKFzAdGhzuO0Rh13RcoXvHTwnwt/vRTxjakektLwwdw/6Gaiu4s8uUcK75e7To5w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(39850400004)(396003)(478600001)(16526019)(2616005)(956004)(6512007)(26005)(9686003)(6486002)(8676002)(186003)(83380400001)(6506007)(6916009)(4326008)(2906002)(6666004)(36756003)(86362001)(8936002)(1076003)(52116002)(66476007)(66556008)(66946007)(5660300002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	CL8HeNdlMxuPHUvUULlSEMB+iKkY+75pSBC7DR78Dg9UnxvwveIgOLHpq5Ea/gagiqMqp4QFYhXOfEeuPKR+iL7uJbvIFTDe0ebH8Ld+lhqS8WN+BrthGGb+LG4tXaNTi3HgJ3PyJQAj2d/Hwd4z9GsVkyB4SyKuYYpxYE4dCqmqdfnJL5vJaqVcXgbKw4OL1F0ZsXNtWIQFh0as3hgO/ZPIlKRzbxJ0dC/1My5AZJu97I4CD342f3Yi6pxX+0lfokOyuh94FATE4z1OT1gKULnr/+99EOuW/RjrjcWH+vuBY4BDz8POv4qjNIKbNjLJCaqK4UV8GW+BoXgtbovtLcFQORvvJ4HZGtJAubeWrWeB8OWSrq8Q/n2V6Td20La0wUK9wi4Ju37vHQLKRiKCvCPlCkGCJUYsQXV5za58Yxe3qCgV+saGtxEDPnZR8G1aLNc9Ox0rxl/hkG7j9pZW20PUixw6XEPRn7rCFqfmOU9LN6VCWJGXOt5sdFADK0fXZ+3CyV0AYaDg1YzR3h4YBhqyp+v2WdgQkrltqkU5QWtFte8xWJeCVkBH5TzTibza0KBi7RhuOLrlAXtPbyBRSfmLPQsQTcNo6Xkkmd/AmBj5WD9F3sWf+kE2EeC9AYfyxhZjgq+RJ07qvci1B/iGYA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a73e8ba-7232-445e-6931-08d885f0ae51
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 03:20:03.7970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qTVsxyjaUCQBdcdvce/aD9VArOYvNM5NlfGLZZ+ODzMBeVMakiXO6GCqeecuv7fucjSnlENfo2T1ILr5JnvpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5167
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

Add support for python3.9, or it will do_configure failed.

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
v1->v2: Change the patch's Upstream-Status to 'Pending'.

 ...0001-cmake-add-support-for-python3.9.patch | 30 +++++++++++++++++++
 recipes-extended/ceph/ceph_15.2.0.bb          |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch

diff --git a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
new file mode 100644
index 0000000..d9116c4
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
@@ -0,0 +1,30 @@
+From 1060f2e4362ebd6db23870d442dcd158d219ee92 Mon Sep 17 00:00:00 2001
+From: Yanfei Xu <yanfei.xu@windriver.com>
+Date: Tue, 10 Nov 2020 17:17:30 +0800
+Subject: [PATCH] cmake: add support for python3.9
+
+add support for python3.9.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
+---
+ cmake/modules/FindPython/Support.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/modules/FindPython/Support.cmake b/cmake/modules/FindPython/Support.cmake
+index 6584699b79..c05bbe3306 100644
+--- a/cmake/modules/FindPython/Support.cmake
++++ b/cmake/modules/FindPython/Support.cmake
+@@ -17,7 +17,7 @@ if (NOT DEFINED _${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR)
+   message (FATAL_ERROR "FindPython: INTERNAL ERROR")
+ endif()
+ if (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 3)
+-  set(_${_PYTHON_PREFIX}_VERSIONS 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
++  set(_${_PYTHON_PREFIX}_VERSIONS 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
+ elseif (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 2)
+   set(_${_PYTHON_PREFIX}_VERSIONS 2.7 2.6 2.5 2.4 2.3 2.2 2.1 2.0)
+ else()
+-- 
+2.18.2
+
diff --git a/recipes-extended/ceph/ceph_15.2.0.bb b/recipes-extended/ceph/ceph_15.2.0.bb
index bdc794f..8454a20 100644
--- a/recipes-extended/ceph/ceph_15.2.0.bb
+++ b/recipes-extended/ceph/ceph_15.2.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch \
            file://0003-PendingReleaseNotes-note-about-security-fix.patch \
            file://0001-add-missing-include-for-atomic-bool.patch \
+           file://0001-cmake-add-support-for-python3.9.patch \
 "
 
 SRC_URI[md5sum] = "1f9af648b4c6d19975aab2583ab99710"
-- 
2.18.2

