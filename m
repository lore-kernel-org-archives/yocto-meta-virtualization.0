Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D685CDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 15:19:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.66133.1697296795390602126
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 14 Oct 2023 08:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WCNwmOl1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8651448696=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39EFJt9g021858;
	Sat, 14 Oct 2023 08:19:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=naNSu3DVj2Mr324++Q
	98qkwg3t0oDuZwEpEtfgtOx24=; b=WCNwmOl1+iHc6cbmhRIufGtW/tfF9XVLSX
	PS3s40y8f8JqrRuv8pB5MyPyms6EGZ/0gye+I8iEpmuzOO+G3KZ87vqesrrLiAzS
	RUXnL34OjV/s03nhgIO9lAOpJGknoCa2kjswMW2V01VN4rkC1hnrhg33dl0x32+3
	KkfLKqxNU0E7vD42VufPVXeYLUlf2t5eJ2LVvAqvwBrpGYr6H6mRs3g22crlId3R
	vYxiVTOYDej6Ex1norWecJAq4HjwEP8pIPmPr2RIzfV/a2p0KjkyWAP4PS4cae16
	RTAmUXXZ/sqqAkWvBGQvL3Yf+N1JwcM0e3VEfU+wAAMG/XQMOFLw==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tqp90r7ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Oct 2023 08:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2wL0s3uT0YF24Em6hX9t3UtP+qFX9sSUiwA9PF/mCoKWi8jU+/9bejPiZmziNVqPtruyxPSjnRCs4EicUNnV1Di/mgxKHFOMUfrnm44R+5hhaL0r+paE79dL72vNQZIADYXPbwOZqKWn6vDc8HQMvxL6EE/irQ5TnNQeLtgfkOe9khbJC/Joj03QzNztBML0u2aAXNU9pECitCexDrxdxB/frYLpZRnWMo5LaP0RPYicOpNNWv13/mOOgGJVK0xx9WQ16qzs6+Ef2bZNit7AK4dHfVDJ9mRxNds9SYgH9AZO2eWMyZpHDen3wKVJNPEiu+1EbpQvSwi1p9bY6czjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naNSu3DVj2Mr324++Q98qkwg3t0oDuZwEpEtfgtOx24=;
 b=GOMmlEJA2fTAeGtdzN3PQjwIeJd4bZxbSzIAWXiaii74arvijtTW4Yr0WgergSgK9sAqQJnajUtfx4mPFk6SbjWUgyR1LFp0eCsizQ6Qpj+EKsjVf24gkx7CZymDbHR58XtRKDE3xKd0yOX3e2gJsJa6Oc9xlQPi+ZEP0qb9nwXbF4Td3ed/VTcC51Yl4VCyh5oczYX1JaaoIAPhRxPr5ohRMpH37SwUEW1hdW+qBrpoHSgBifAGifEPnrJ+11NwezcCs82oxWMXq0O5bCvXDhlMQWSHvIhp/uFabqohjjdh6iGJtSO8HOsjbkWvUU6g94Mo7sjkt6IVQ4ezQYtiKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM4PR11MB5328.namprd11.prod.outlook.com (2603:10b6:5:393::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Sat, 14 Oct
 2023 15:19:53 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957%6]) with mapi id 15.20.6863.043; Sat, 14 Oct 2023
 15:19:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [m-c-s][master][mickledore]kirkstone[][PATCH] nss-pam-ldapd: upgrade 0.9.8 -> 0.9.12
Date: Sat, 14 Oct 2023 23:19:43 +0800
Message-Id: <20231014151943.1678111-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::21) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DM4PR11MB5328:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba06935-fca8-475e-2f73-08dbccc903be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QGmNb/d+aPZqsQMYV5MHtzoL7cdFMbsSVzmADvF1tqMkNaH3rMdyyx4nRuukM8moydTZeJw13Gk+iUn9GP9z8HM+zQsQAyaQAjtwk6ZPh7dCLA11sQGhfCraZUPdIpV3pjkgZMCU0xUxw1KZxqvGLq/ZN8f+CHrc6ZN8h3CSprMP+SIqqnd3hra16nFcMuF8Tqmg3281hky+QL2oS5en47jbHWcj+e/rH6xFWuGFnh91d9rGsO4NzGOkGG+f0db5LyGVPal9l4oh2xqix5LoR3tEoJYx7NMKWRlorHlSLJjGTo+SzMtPyULOCb14DQGdC2xRgmyCVpRhVIQHQ/BqczdlX4oe8p76LZ93mqSaAAofFIwo3b1nRmmsJshIsdflU6sQQongLNVcb1RVZk2n8NhSA1OKX8LjGb8MQisBK5GXTYZotmLwi3bAl3ct0HYk8jfJdDBOd+TbWjxMlkf6sJplfNfj+JRZSP/YaaioMV6QlwdmSp9bmAeiY/cQXh8QwetppHJw2Pr709827su0WyRDUpEg5EvJlK5BHp5FAi2tCmpcyzy7mbPdyUsKSYAAbu23LSRehsoYU+4Fwv5PKmrf7J4FAjJX5kyEuZM+fYI2JrptkMBiql4Db5V+R0Ey6f4hUowfBygzYYBR+yjlPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(39840400004)(396003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(38350700005)(6666004)(6506007)(2906002)(966005)(6486002)(478600001)(8936002)(8676002)(5660300002)(44832011)(316002)(66946007)(6916009)(66556008)(66476007)(41300700001)(83380400001)(36756003)(26005)(6512007)(38100700002)(52116002)(86362001)(2616005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zodi9fVnveKaqCx8Ng3UpBRSqT3zg2rV8hvCDXvMq5DTBl7A1aHROBlnU9v3?=
 =?us-ascii?Q?nsJt+tyVp3blrjS+h78orLdYliAuItIG93I8jh8k1MBteYCCWJrjbq7WhmwY?=
 =?us-ascii?Q?Ouorx11C4fEicfu95uKOsA+rTrVcbgrwTZ43kWMu+AHRXhb56l1Yx/uwzP4+?=
 =?us-ascii?Q?s5vv2/z4t3RR+4z9nZEdrM6q586Ig9Iioo4CNb1kDPHrKXcS9hoBHUHwoZMv?=
 =?us-ascii?Q?+No03bQvTb1yUZghsfgAmyAFwUFNp7IW930lblLYNHS4d2ZD3152LvYbb8hH?=
 =?us-ascii?Q?5aypqRwz6hepUTnKsXCAg0zbnE3OolRoS1tmXCNtUGM5vMemorYfwL47HIX6?=
 =?us-ascii?Q?iYVR97BUePGG/MQHLxYfnGB4k8Y6xUuF0/g8c6vcyxzhQmiAC/gX8yehfDAi?=
 =?us-ascii?Q?klbMfSiw8d1G3Q0WpaOJis5rfVWi4ol+cIQZ6UuVnV7pAOjRB0ts4ayKRLGP?=
 =?us-ascii?Q?k9Jnb49SlfuxT7ylym/A5sFopLocfPQzG2ALzdjV5v0+p7rz6Ne/3IxozJEK?=
 =?us-ascii?Q?IcU/hM2GbeDy/PNrHnN8iqtWq1QhGClQUO8SiTIu0YwlRIOzGUP3+EjFSQed?=
 =?us-ascii?Q?3NQHyRq2Yt7XUfHF9ZA5KAzBiiNciXvNoMJ/M8rbgjCGN0IxBC7fhas9m4o8?=
 =?us-ascii?Q?+apmstfg+fuP9Udk5+Lvc9LDZj10lsra2wFETKbSU8fvT3At+zAyH3oq5rEo?=
 =?us-ascii?Q?VnhTK1AucK8uUdMXJ11Ow7+0S06szmNXs2bZGGBEGAJ+zjWmWB51Tvp9sPV7?=
 =?us-ascii?Q?Mh9T1JHhjMwyBmqDLG4nNVkhY5jT6lDEOC9I+ODz0pID4qeqAELP24RKJ9eE?=
 =?us-ascii?Q?B/AXA8wGmwpKgmiTKez6lmRtyjdx+iXnm6/N6ScuR/uexwd6vVEdbtiOt2Mf?=
 =?us-ascii?Q?h4bidD9BwrAmaw8NWXRNHRfLLnYI/ZOXtPhXGYmtzglZ/7H7TIf2882N8vHt?=
 =?us-ascii?Q?kEvOWg9c2eaCqARy2iIlcqWGdO9G9nunZi1HGu5w3zGgFJt3uWlMkkNvFXdl?=
 =?us-ascii?Q?MXGhs9A+gwWy9KUMK9CE7cXDvXoJB8tSO+gB9RUDq5EMzlxz06PuG605Ne+t?=
 =?us-ascii?Q?SDmMZO2jENSf3h05P8kM1mJ9mwsnWX1OzRxJtSjvMyPH3Flo7uqcbjN1GeFc?=
 =?us-ascii?Q?dS2BhCc5obu3BLmXAc3xsDkpayNBnhtt0bar8Sk3t6NiwPAaeYAo2aQCc1Qi?=
 =?us-ascii?Q?zB+AJxoJZuRetNSw735xce7B2t0cc245u/JtmwoT4XpVMBhvUCahPjc/zorT?=
 =?us-ascii?Q?BdRAebjiwCsUJtUDZaqjOBIHq71TWQbJyR7+XcmQYSq77hip1aPsfAwmKE/G?=
 =?us-ascii?Q?08jjIXi9MA18RKVqc9FiXrg7r7sGEGiex20dNwvS5c7UC/GfE21/hKs/uK8Y?=
 =?us-ascii?Q?48mdbj1pFS9Gbm3Kb3E2xq1KfbZEAuAKRkkm5YlB3dUITG4O5Pxbu6yxULKp?=
 =?us-ascii?Q?e2AwPbzj00L8/wwSIBOGgBCpvz47lucJn3V6ENjj5CrbF0JIu6SlxKOWYmGx?=
 =?us-ascii?Q?RlWMWoX3xg5fd0pKZhGJYB4xHguB0SobI4ozNGQIdoCunT0pRqwlnz16P5Em?=
 =?us-ascii?Q?4IhWg8ScoR/gyOEr9IZU3M0UXrtZv4cyDFAtZMHI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba06935-fca8-475e-2f73-08dbccc903be
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 15:19:52.7887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzg7nNKSuLF7znVbKPZSNcVlMfgTU7Xuxd4VsN7u3U601LMnDbay0iAEctWjgqXTpzFYFEVWy0LoK1pypAOT9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5328
X-Proofpoint-GUID: rxZjiAp68zUyKZiXKmfq4r0zNkpIjX-9
X-Proofpoint-ORIG-GUID: rxZjiAp68zUyKZiXKmfq4r0zNkpIjX-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_12,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310140137
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Oct 2023 15:19:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8366

Changelog:
https://arthurdejong.org/nss-pam-ldapd/release-0-9-12

Add a patch to fix shebang to python3 for getent.py and chsh.py.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...m-fix-shebang-for-chsh.py-and-getent.patch | 34 +++++++++++++++++++
 ...ldapd_0.9.8.bb => nss-pam-ldapd_0.9.12.bb} |  5 +--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 recipes-support/nss-pam-ldapd/files/0001-utils-Makefile.am-fix-shebang-for-chsh.py-and-getent.patch
 rename recipes-support/nss-pam-ldapd/{nss-pam-ldapd_0.9.8.bb => nss-pam-ldapd_0.9.12.bb} (88%)

diff --git a/recipes-support/nss-pam-ldapd/files/0001-utils-Makefile.am-fix-shebang-for-chsh.py-and-getent.patch b/recipes-support/nss-pam-ldapd/files/0001-utils-Makefile.am-fix-shebang-for-chsh.py-and-getent.patch
new file mode 100644
index 0000000..86e9f7b
--- /dev/null
+++ b/recipes-support/nss-pam-ldapd/files/0001-utils-Makefile.am-fix-shebang-for-chsh.py-and-getent.patch
@@ -0,0 +1,34 @@
+From fb9c5b955da462695e0a662aebfa13493eaf3978 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 13 Oct 2023 22:28:25 +0800
+Subject: [PATCH] utils/Makefile.am: fix shebang for chsh.py and getent.py
+
+Update shebang to python3 for chsh.py and getent.py to fix QA issue:
+
+WARNING: nss-pam-ldapd-0.9.12-r0 do_package_qa: QA Issue: File
+/usr/share/nslcd-utils/chsh.py in package nss-pam-ldapd contains
+reference to TMPDIR
+File /usr/share/nslcd-utils/getent.py in package nss-pam-ldapd contains
+reference to TMPDIR [buildpaths]
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ utils/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/Makefile.am b/utils/Makefile.am
+index a6bccd3..22a50d8 100644
+--- a/utils/Makefile.am
++++ b/utils/Makefile.am
+@@ -39,5 +39,5 @@ install-data-hook:
+ 	set -ex; for cmd in getent chsh ; do \
+ 	  [ -L $(DESTDIR)$(bindir)/$$cmd.$(MODULE_NAME) ] || $(LN_S) $(utilsdir)/$$cmd.py $(DESTDIR)$(bindir)/$$cmd.$(MODULE_NAME) ; \
+ 	  chmod a+rx $(DESTDIR)$(utilsdir)/$$cmd.py ; \
+-	  sed -i -e '1 s|^#!.*|#! $(PYTHON)|;1 s|^#! \([^/].*\)|#! /usr/bin/env \1|' $(DESTDIR)$(utilsdir)/$$cmd.py ; \
++	  sed -i -e '1 s|/usr/bin/env python|/usr/bin/env python3|' $(DESTDIR)$(utilsdir)/$$cmd.py ; \
+ 	done
+-- 
+2.25.1
+
diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
similarity index 88%
rename from recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
rename to recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
index d7354c4..7f3b9e3 100644
--- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
+++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
@@ -16,6 +16,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
 SRC_URI = "\
 	http://arthurdejong.org/nss-pam-ldapd/${BPN}-${PV}.tar.gz \
+	file://0001-utils-Makefile.am-fix-shebang-for-chsh.py-and-getent.patch \
 	file://nslcd.init \
 	file://nslcd.service \
 	"
@@ -23,8 +24,8 @@ SRC_URI = "\
 inherit autotools features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRC_URI[md5sum] = "8c99fdc54f4bf9aca8c5f53fdb1403ff"
-SRC_URI[sha256sum] = "ef7362e7f2003da8c7beb7bcc03c30494acf712625aaac8badc6e7eb16f3453f"
+SRC_URI[md5sum] = "cc30ee0ab91d6c94b7a343ae09b5dc69"
+SRC_URI[sha256sum] = "c6d661e74693cbf531a790631ca93b73f291fb23cc39465b09deb8da2bfb0e14"
 
 DEPENDS += "libpam openldap krb5"
 
-- 
2.25.1


