Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.25536.1605001618101719179
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 01:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fx6o57RL;
 spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: yanfei.xu@windriver.com)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id D725E38C06E0
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 01:46:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOF5PzKpD8Yv/eNtO3ndE83k2JW/U+jPIv+GX2HfDAcRpmOdLPst9Z60ROD2GBgc27M+Fmt/LF4lHhNBUT0bZaOzZwPFTXXT8mtkrue+NENzfWBwwNJDOSpqji84aOoJURhV5g2SjjEwsf2fCktsezsK2yzEsyM/A5tZ3X+4BW4bONs6qo6FuPhTRQAH3GQkINOpcGZA0J+rANBbRJYbNCtNVzsS6FfhzIMPEHI2yb547t2YaEnd5gnaKrnlPBZ8yXmbEtk51U0L2ZgabmHpncIUq2K6UrNQXXYDWUM/YwvLg92/2cAZhOsLhnT7366gkG1P5uJShLHwdkixJbPr1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b70Esg5qW+3EUTCYk2JGRx48L3O8NNHvp6AXSmm0eUA=;
 b=LZNZETXGh0Yy920QRmznu0+IRaTncvEu6LkdE5EIE2ixtkXajIFk00An1c+siRkN1BuIqjCkwVFVFSuvAmb4UcNrlMDMsCNCgVa9GXzCY9hxmNYPheQqaMYLLNFAimRY01rSFF8cY2/nJU5I6ianndhw/RyBvg+BMyOB1SAfPS6qGtXIUP3fb9eLSGwaCki0TmXNdFyvTJrgZM71WveP01B+yaNGR8iaEPEmcvFNdl/6njMvXrNB7aUZQjGW2UjzOxlQwz0qUR9zjcFkZea67ZcotmIhvMGtMo/cXSeRAGjcULHgMgAyahx4U2UsJQXTixbq5QCrYRGxZ4qs/fHxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b70Esg5qW+3EUTCYk2JGRx48L3O8NNHvp6AXSmm0eUA=;
 b=fx6o57RLgnNLR1PjyeEqXLm3heyMQ5b9UCs0xR9WR4hHwfASPu3vHbzV1rwwalwktmxzXhtSMbkauDBKGCIVGGnjoFguSaPaFgXI9OvNFbVGajMw0VBvSOEhJ/a/+shwEMxGC4GHMkqqfcCYm4cihux5KXtdvYYWaE4A5R2UUEc=
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BY5PR11MB4370.namprd11.prod.outlook.com (2603:10b6:a03:1c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Tue, 10 Nov
 2020 09:46:53 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::adbd:559a:4a78:f09b]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::adbd:559a:4a78:f09b%6]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 09:46:53 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: meta-virtualization@yoctoproject.org
Subject: [PATCH] ceph: add support for python3.9
Date: Tue, 10 Nov 2020 17:46:41 +0800
Message-Id: <20201110094641.11352-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.18.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:203:d0::28) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HKAPR04CA0018.apcprd04.prod.outlook.com (2603:1096:203:d0::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 09:46:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8a988d3-e8f0-437f-3704-08d8855d8dce
X-MS-TrafficTypeDiagnostic: BY5PR11MB4370:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4370B9D2E1A8B02422C3B42AE4E90@BY5PR11MB4370.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nRBVcRX9MEyujzZq2GNc6GaITUTeEFzvUZoLpYrDkRoCJiXt7PTyuE81pl/gT0GKHptIkFL1DbcUxoFx3qj8njoYjh9kksqeqb8VRzqRb1V8fOkOY5xqP8MyRHhl2kMb68jqvFJSQab+Tg5Wee9QLW7sD9IytvR/YLAE840VPA3BzWVRwHC9Wli21+nd+COgLE+hhca9Gsocb8G14mhhsO4pq6aV6Ou7uTkYNh5p2Vid6830WER/NcOe/pEwnUTjqL4w077uRvl/+5ibUfU3kK6gD32ekbcN2l0VwEkjUWhCyzQ7Ug2pyH1DqyKhMA7xPHnaSY0kYUWGP/m6pN3xtFtVvWjC7QyLm4bllsCLhQDMxbFAuBBlLz2NddXUxzseDvqEjIXBSZgWT6FNl16hlA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39850400004)(1076003)(66556008)(66476007)(2616005)(186003)(26005)(6666004)(86362001)(66946007)(6506007)(6916009)(36756003)(8936002)(16526019)(956004)(316002)(52116002)(9686003)(6486002)(478600001)(6512007)(8676002)(2906002)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	OOElGuTyAzPXPf/UkF58YLvgTx+0PCvXEFzdrkHxDaSKlWX99k/a3QfYINitkqq+p3YtXBphbRQnQ1f69FQbThIYnoQF1TZD206z46ejlrZ331uZ5MdzqTV6UC40cP2vH/1kQk4AVg2hwgWiegfXq+IWRAFQs+ebhoLSSjh2LMCVDyWusHIDCwq6jWft8ajgm/nzdkSRhII7gBFuH3PDgEozcYBWZQL7H1fInZGmye1pWOuBA+Yr3mWr7D2+6equelpRPGiycfGst2Gz1h28Qje1V+G4jnQQN3NtGEnBCk8igIBNyvcd8MookfRbkCeTrw+3EARTeIUz4RyzqGMYBV1DVauRZLoqByAiNn/2u/0Sqs4sBdXsAjhRq5OVDD+hTRd49Ug/7wbXqDInPhfG5C1UXDYiaJ7sWHh7YkmN78eWTlWCc6U7/B141ACP43zqEthKoGfjJtRR3+74UUvaGrtKxT3WlnGpoFkRetFv2t+Q7OtlOc7JQ3y7zxwin5slT03llgwe3c9f9GtpoZcG/J6VwBsJVjWLtSvMI9nObTawh8zGbFMHuoCPBRP1jZwZoo7kDpBH05AqF32PBgSHCKbD68WE2Thk2Z6v7EAqK8DgMRJVVzkfRl89Mh1iWW3ffzRVWRBDaN55XLRFO0pqwQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a988d3-e8f0-437f-3704-08d8855d8dce
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 09:46:53.2628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUDmx2B+RVrVL+IIjV3WBCqVqlHQGZD/WM+8tiskknLxNVNncIFAdoZrJSTEc7vB3oVm9b99Qoi+GKXtNtUMmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4370
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

Add support for python3.9, or it will do_configure failed.

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 ...FindPython-add-support-for-python3.9.patch | 30 +++++++++++++++++++
 recipes-extended/ceph/ceph_15.2.0.bb          |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-extended/ceph/ceph/0001-FindPython-add-support-for-python3.9.patch

diff --git a/recipes-extended/ceph/ceph/0001-FindPython-add-support-for-python3.9.patch b/recipes-extended/ceph/ceph/0001-FindPython-add-support-for-python3.9.patch
new file mode 100644
index 0000000..096c9b7
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-FindPython-add-support-for-python3.9.patch
@@ -0,0 +1,30 @@
+From 27ac21526eae33a40edb81aef627aa13719fdaae Mon Sep 17 00:00:00 2001
+From: Yanfei Xu <yanfei.xu@windriver.com>
+Date: Tue, 10 Nov 2020 17:17:30 +0800
+Subject: [PATCH] FindPython: add support for python3.9
+
+Python of oe-core has been upgraded to v3.9, add support for python3.9.
+
+Upstream-Status: Inappropriate [oe specific]
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
index bdc794f..0880a8d 100644
--- a/recipes-extended/ceph/ceph_15.2.0.bb
+++ b/recipes-extended/ceph/ceph_15.2.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch \
            file://0003-PendingReleaseNotes-note-about-security-fix.patch \
            file://0001-add-missing-include-for-atomic-bool.patch \
+           file://0001-FindPython-add-support-for-python3.9.patch \
 "
 
 SRC_URI[md5sum] = "1f9af648b4c6d19975aab2583ab99710"
-- 
2.18.2

