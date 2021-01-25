Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.81])
 by mx.groups.io with SMTP id smtpd.web09.31591.1611545665957279506
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 24 Jan 2021 19:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=H0SKPDnd;
 spf=pass (domain: windriver.com, ip: 40.107.70.81, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dK5zUNDNTuYglbzk4g4B5WC6WeFLCP302Oj2+pPLHZ5lfu0cOaUMVPHpOCicgjBNs2oAa/xu8S+b3z9Uq19M4Gz1LtbLkGDt2iVtNmRQWAs10/Joe9G1AiFZbKdXswJgZ2p3op1xLxUmJGWjiPAgFghWqAPoLy9em2TKWYwUfxowsFKUbYhwDKlDh0xK73BRawGoXmu57udzxNuyGyTL7hl/ssL6FJL/N5Sqpc0nCDfgQsfngHaghLXuL6Rn7Ii6KpyxrB2zpJ8BX2x0gF8sIn/hCuNWVq8ihs0KVFHdDo8z2qMgaHXi+f/bBa1b2vI7xWKXvcbJjIyIxrmZoJUiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEYJCfwATaRkSGoLliI8hwqtmjHEGRpVwnfJ9bceCKc=;
 b=eSs0GnPPvQH76SUcM0IFWjYFzqLpz+h2ID4KXr+JeyhG6LxJvO8HUPHgEJ17Rele8h6MltGH9Ul0+Va74OISOl3g68MfScD9sugmK/RXRw9jtf3cROvwoGjBfZkeVidnIHnSnSPbo1wqpn8N7v4+upHnC4xsR76Yfa9wTEehQpYEHh9Jb73DAiQlWSgSTN9rbODQdFdSEJpfwlI0wrB6WeAyJn5smnQBHdb2iJIEf0Fs1k/Pl5uVMWznu//o5+OFvc7rdfqG4ufpxyPThIsmnEaw7ob99jgZz2dAirA9rd6n0zSoeyTtnmV4sO8Qo4B5NsnjlvZoXb/Ow0VlvuaLfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEYJCfwATaRkSGoLliI8hwqtmjHEGRpVwnfJ9bceCKc=;
 b=H0SKPDndplanqciJ16sLnvpFWvDkJ2iYoDe3vjtW3QZmSWW1kkXbHqROMyimQFp9/Gn2QMxCkIGQ+DQ2+QVGw6DYwSu+/pNOmXjrmWgyRRtMC9/N1H5YgCGvrw0dDW0ViTI0Y/QvLOPELlw8eGjIr5fTAPSfJpDAh2zBRHzNZFQ=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1902.namprd11.prod.outlook.com (2603:10b6:300:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Mon, 25 Jan
 2021 03:34:24 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c888:52a9:d69:3859]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c888:52a9:d69:3859%5]) with mapi id 15.20.3784.017; Mon, 25 Jan 2021
 03:34:24 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] lxc: upgrade to 4.0.5
Date: Mon, 25 Jan 2021 11:34:03 +0800
Message-Id: <20210125033403.46162-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SL2P216CA0004.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:18::14) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by SL2P216CA0004.KORP216.PROD.OUTLOOK.COM (2603:1096:100:18::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Mon, 25 Jan 2021 03:34:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab9ec6b0-08aa-4c6d-61d6-08d8c0e21bf4
X-MS-TrafficTypeDiagnostic: MWHPR11MB1902:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1902C88E3A07EA9061729D10F1BD9@MWHPR11MB1902.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+dx2naBkBgxAp45u/rHb4RFIDFjeMaxKJTGzd+eA+GWS9juol4qyaeAOFZbPqj3N4Woak5bNoTaiocE9y/7nTgYA2W5xVpcoHMf8uECVk9yLsUzRH6aYdclQFK/wx3N46Bfqioblpw5z1pBLa1GeysptNS4rJ5/8YZKUesFt/fhHWfpwO2DVvHEDnKzFaUrDI3+Q1jNbWEMM+YbjeS2x8ME5X6sfuPpLz1xN0z8CzBhH07vLMyUNcAa6aGmorpwLhz9+Ofo26HGR83GDNFFOqLvG+RleUJJccRGP4Zy2oeP8CvpqNkQCsNNmg8UqQjyb4FgDAU9QCQEzLBUpPu0FOpIyzm7EcLnJHH7gar1hxqHJboePW0QpXHwhEIF2f2zyD5yeJAePDJHkYokStOZcPuVxsfBjWcqCj4/WacFJD+k27T6hOBCGh3lGeaoxW4RVC6Cwtrfrv8l7HWqtsFGZCA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(376002)(396003)(346002)(136003)(366004)(86362001)(26005)(36756003)(316002)(186003)(2616005)(956004)(8676002)(966005)(66946007)(66476007)(66556008)(16526019)(2906002)(478600001)(6666004)(52116002)(5660300002)(8936002)(6916009)(1076003)(6486002)(6512007)(9686003)(83380400001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?PfzPJ4t1Gy8wt+0YmHjS1kCXmIveRcEq1UU4VkwiwnH3uNiTFN9eu2PwLByk?=
 =?us-ascii?Q?KlKXUdN9RJpIm7jLWg5D3tC/KewzIlkSEadvAxXoiFaHsvmukv7S3h4xFrRX?=
 =?us-ascii?Q?sewPEqaaBsqAgGlkHZw5/m9VbHD6AZgkremH2Bw6dwoRsNhvMgwGOl1N9I+D?=
 =?us-ascii?Q?Kw0RH/Q0SVnLuHck3yOe03w9Sp3VXlYIpyezod7MfvJoc7s6NVziUigOs56m?=
 =?us-ascii?Q?6c1qeoe8R0uxPRJrltTtRuen2qH5+peqVG787ySJ4akXkOoll7SqLkxlMrMk?=
 =?us-ascii?Q?PxRtgj1dOxhJmJH+bI8nK22wtUa9T7kBn6koseceBPHkWT6jfzoLCaQI9CcN?=
 =?us-ascii?Q?V65MdhGbhYKsUH0PNDk8jEOejazlJU7E4YTw+o7gEzyuGa5z33ZV6bNaML38?=
 =?us-ascii?Q?vBgcoYU95ufFDVvdopa3frLp+hN5w1CvrMssLCIhqc2541CNvAbkxusAFo9h?=
 =?us-ascii?Q?OL0BqoiaBWFP7mRP4U9SWr/xx718Y9j+J04PDeFqpU/se1+iy8c8pVx96lQc?=
 =?us-ascii?Q?kitNqR3YyoWrOv45EoJw6OlEHXgPXoRS9wsasgQNlAJLfsZ6N3O9yHPsydLM?=
 =?us-ascii?Q?5T42SXAEz3+yEJA49CB2O60Pr4kURONXy5GoT+U3k8Madb/M198YaWqp2pC0?=
 =?us-ascii?Q?P1BWDmB/BDiLXT/C2xuYwUBb4SfdAkqGRP3m/IdV/HvrgELfvJhE7lJc6WL5?=
 =?us-ascii?Q?gnwWBO55uDxrBjUuACYp+PHs9byOvIyIBr8XFDxkHgXEpIJr768k6iwzMuLV?=
 =?us-ascii?Q?P4FQDnp7M5l7xwHuIGojHNwLUPL6huoZzoN05WB6yGwdLGE2LuZK0NJYDRRW?=
 =?us-ascii?Q?327qHVspujnQl4Vi2pWPSYBTs6qUbu+YIJX8SDhwOoSCIPblbM7HpZzkBlgU?=
 =?us-ascii?Q?danuyL4EYxncWzByLdxqlq4Ge7+iQFmHA0sl3rOzXmQhsnxUy75HB2OTbE5n?=
 =?us-ascii?Q?JW4gUWUqapcVfnNzFKHK3Qyp/jbEa1Yr/qkVHMC9FZFzrmLZerEPmNyzRUoN?=
 =?us-ascii?Q?Y/NsonBgIj6yKbvDEztoo8jz4L4iOcMFBAUXqcqFazncIbqc4mot4/f/HCMW?=
 =?us-ascii?Q?JP6I6NAO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9ec6b0-08aa-4c6d-61d6-08d8c0e21bf4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 03:34:23.9138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFyDwLE6vepIU5t8ceC0cfxsMHqlGccNCeWiGXNfxIo4/iBOlxqst8baK7Id9IlVd3pdRVyoIAK+v68suBj6Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1902
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Remove 2 backported patches.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...setting-regarding-the-Standard-Outpu.patch | 35 -------------------
 ...ed-options-in-lxc.service-fixes-3527.patch | 31 ----------------
 .../lxc/{lxc_4.0.4.bb => lxc_4.0.5.bb}        |  5 +--
 3 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
 delete mode 100644 recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
 rename recipes-containers/lxc/{lxc_4.0.4.bb => lxc_4.0.5.bb} (95%)

diff --git a/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
deleted file mode 100644
index ab97422..0000000
--- a/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a7a92a06a47322dee45664db5c7bfa68b2b95edb Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 23 Sep 2020 07:03:02 +0000
-Subject: [PATCH] Remove obsolete setting regarding the Standard Output
-
-The Standard output type "syslog" is obsolete, causing a warning since systemd
-version 246 [1].
-
-Please consider using "journal" or "journal+console"
-
-[1] https://github.com/systemd/systemd/blob/master/NEWS#L202
-
-Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/3541]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- config/init/systemd/lxc@.service.in         | 2 --
- 1 files changed, 2 deletions(-)
-
-diff --git a/config/init/systemd/lxc@.service.in b/config/init/systemd/lxc@.service.in
-index a2aa2211f..21ce64aef 100644
---- a/config/init/systemd/lxc@.service.in
-+++ b/config/init/systemd/lxc@.service.in
-@@ -14,8 +14,6 @@ ExecStop=@BINDIR@/lxc-stop -n %i
- # Environment=BOOTUP=serial
- # Environment=CONSOLETYPE=serial
- Delegate=yes
--StandardOutput=syslog
--StandardError=syslog
- 
- [Install]
- WantedBy=multi-user.target
--- 
-2.26.2
-
diff --git a/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
deleted file mode 100644
index 2957680..0000000
--- a/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0c4cd88d4a19d27ba9b5d2c8fa4d482d78211c35 Mon Sep 17 00:00:00 2001
-From: graysky <graysky@archlinux.us>
-Date: Fri, 21 Aug 2020 06:33:49 -0400
-Subject: [PATCH] remove deprecated options in lxc.service fixes #3527
-
-Remove deprecated options in lxc.service fixes #3527
-
-Upstream-Status: Backport
-
-Signed-off-by: graysky <graysky@archlinux.us>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- config/init/systemd/lxc.service.in | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/config/init/systemd/lxc.service.in b/config/init/systemd/lxc.service.in
-index e3745dc2d..397a6c4d0 100644
---- a/config/init/systemd/lxc.service.in
-+++ b/config/init/systemd/lxc.service.in
-@@ -14,8 +14,6 @@ ExecReload=@LIBEXECDIR@/lxc/lxc-apparmor-load
- # Environment=BOOTUP=serial
- # Environment=CONSOLETYPE=serial
- Delegate=yes
--StandardOutput=syslog
--StandardError=syslog
- 
- [Install]
- WantedBy=multi-user.target
--- 
-2.26.2
-
diff --git a/recipes-containers/lxc/lxc_4.0.4.bb b/recipes-containers/lxc/lxc_4.0.5.bb
similarity index 95%
rename from recipes-containers/lxc/lxc_4.0.4.bb
rename to recipes-containers/lxc/lxc_4.0.5.bb
index 19b40f6..384736b 100644
--- a/recipes-containers/lxc/lxc_4.0.4.bb
+++ b/recipes-containers/lxc/lxc_4.0.5.bb
@@ -47,14 +47,11 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://templates-use-curl-instead-of-wget.patch \
 	file://tests-our-init-is-not-busybox.patch \
 	file://tests-add-no-validate-when-using-download-template.patch \
-	file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch \
-	file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
 	"
 
-SRC_URI[md5sum] = "6197096cf11da286b9f9ee02dee9dc50"
-SRC_URI[sha256sum] = "3c65a8ba20ed2b66c2075dc914aa632f76d0137af707b851b62b5555fed7d995"
+SRC_URI[sha256sum] = "af2cd616d5ab689e5d2305361c6571b5e632afd7eaab1754cca1670446a2e6a4"
 
 
 
-- 
2.17.1

