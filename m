Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6865DC28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 10:24:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.16462.1661163857910995685
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Aug 2022 03:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SP+8JWAi;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=523309f7cb=zhe.he@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27MA95xI003185;
	Mon, 22 Aug 2022 03:24:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=0EGSNZ32mAif+vfRcRuMKieA/VBkYpj5a+CkNqCsSRE=;
 b=SP+8JWAi9WfPmd4iyAKN49eOV3e57ZUPSUWx1h+8Xfw35PExd3KTTzn5WEQJid9qFffr
 f9QCLTFFf9RPNRi1OLkLuJYKCSDhYAMe5fbLUuCcDUtqzdbpNQJtEZRu8FjcJNAuc8RG
 /GVRDmJ9thi1NC/+nzaToMRU/qBJYeljaY89ZRE9sDh1kQducaJ7xbizcV/fkP9l8EZI
 kT8VeOoqYK9Ha7BbQclUUmA797/V028SKKXSgwZs6IrR1F/xlcb5WzBwMFnhnyF4ke2X
 wzGmF1pfpHOw3AUdNXJS/TV9KoeX0t4+esrSV0vSS+mg6j9Uq4Z9DvMZqKmpbo3jl6YN ig==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j2w11stew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Aug 2022 03:24:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdMpCVcYg+jGaT5yT/XNUVi+QD+HmzIxa/1l43x4QrZ2Dwx8CbVmlZep+d6BwF1ZTVF4cXH26GS7x70d0Mlv5ZyUFyW1Zj9zLac9pqf25OF7+qI+K3Vi5rwziKHa7RM13ErQMMKm8cJACnb4/FJzhzPmIe7a5bV+sEHATV+384tHUxKTfcaq8fW1ZTnjuv5mBJySLrlD8Ow3JcaKFM5LtSPS1GeAvfSqzb5DQ/2EjQjoOfsIY4zxrA17XFl28fotggdsh6hxe3PrYVKQFqAOw74t0q3Rlnv8hsf0kj+Z4v77T6IQZADNyLhsAmnD2MXLLPD25HEAJAay2IALIbXULA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EGSNZ32mAif+vfRcRuMKieA/VBkYpj5a+CkNqCsSRE=;
 b=ayI2klmcotDZYyb8JbxNyZjwcflBm3RaNGH3mY5xRT5ugf3cUV4qm8h6+kgL4Kas3HhPS15udZ4cQcr3CSNe/564BCSBzW74ZaDnIz4/k0wlKpSYnTir8I+QjY93BxpFZy8YasuRimtl4c0YIoQr61JzDtNsu+d93T34eiGoaMufRU6QqYmeYd3q/Rn+SCZdnGhEtzrEO3XkA7cgzd0nn4ENio4MTJIoGQFc9CTMFwUkvV2psaV1lJ1WZQpjkcxWNL8bZJnIpOmv1eKgCwDiJ45H4d8Sii/UFkAn8i5cBZTJ/nkFrFSGiHcbV+SxaYz1G9QpzmwizE/eMzn7HrJj+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by BN6PR1101MB2148.namprd11.prod.outlook.com (2603:10b6:405:52::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Mon, 22 Aug
 2022 10:24:14 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::dcdb:b6b6:2301:47ce]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::dcdb:b6b6:2301:47ce%10]) with mapi id 15.20.5546.022; Mon, 22 Aug
 2022 10:24:14 +0000
From: He Zhe <zhe.he@windriver.com>
To: bruce.ashfield@gmail.com, meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] irqbalance: Use built-in
 irqbalance.service instead of local one
Date: Mon, 22 Aug 2022 18:23:56 +0800
Message-Id: <20220822102356.1196575-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0109.KORP216.PROD.OUTLOOK.COM (2603:1096:101::6)
 To MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1d996fc-0c46-49f2-9fe4-08da842875f3
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2148:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i/zOJhVaQou52nc7H96I7lwHH7KQgB4jbJOKw5EjK/nXFGofIHcOH1fa+64rcreB+4hVDhb13Ym4MU7gUQLuQJNIiiESbgpP5BhbjGgWzU4U3kpkgYGPB80yO3XCPpa5lAnRG2GtxMV9T9v2hQR8iMW4EeGqdI0bmBrIlLiECMZgg8+5Xo2rkXXKYSmvQ9kfVWAbmAPZajjEqCIK37ddM7DxVwHuPCn/PTm1tLuU5H22+2CTOoYkxEBUE46u5UEd3xRZF1s/dB+WWkMKcUY64q1KeI4jvZ5RqRpUg0O1SOddNERRa82PzRP1rhkoaKU+iWcUwDk29hIxEm4KgtyjxhZU4UeFyP6cHan7YZczxOm8UNKJ6e4nwf06Y38nfwpM1iD/2KPaT/Q5uyhhnp4zdmJWG5eabrivcYuFsBJvIK8J6alWKNxk5FKlK5udPQ3Bfh6ekASKWAP3ZFnqtVwb35hunrbbnGGE/F/J0h6EDXQaABNMmDHBtoJjptrEXHUV4GPxuOZg6lTK83E0voxAdS8Bx45XmgG9HltfQ9O7BEh9uj8UqcJgV1y9Ra/vKJBiypYNkbfCFS163pMxCNAWrZqCPQuR/sujC6bk33rHBm4OmQZtMZ7olH8Omq7IOgBl5FXHySWVLDSF+GXv65EWEaqo0g7plTpB6HlHvGfaZ6RfMyte31A+1Z6vWIp5z/FALXMhH2S14IdgKzM77EfTQVzNcM3rvKgYUoE1Ep3ZOla9HzwODzEQgIFEg/8TK3HLAyLUK8b0CrUYUtbGHmTdeg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(366004)(376002)(39840400004)(346002)(966005)(316002)(6486002)(66946007)(66556008)(66476007)(8676002)(5660300002)(8936002)(6666004)(41300700001)(2906002)(6506007)(52116002)(83380400001)(26005)(6512007)(478600001)(36756003)(186003)(2616005)(1076003)(86362001)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xe6DgBSgMHSJdRxiG2FktWFuENH25lpSK2Yrmn6rjd5TotOqvteSWnzRj4Gt?=
 =?us-ascii?Q?5AhbI/oftqMknPMlqjpzFDbDeb2xxLrpo0wMQe1237Wm8vOnQxlVMMSAqgQu?=
 =?us-ascii?Q?sI9+vd40ihBOKnDhDU3FTBcBtvnyfUPrGT0FFZaR8QrpL+bxrPy6wHcFhpYt?=
 =?us-ascii?Q?5dTwWj9QRarF5i/13lPmrMTA14cYiQTtLWOgqmbjEHTq7r76bWc7RLiTQQ2v?=
 =?us-ascii?Q?Da50OzQ4nJ/hzyB94NqzNPId19QOrwyoeD4pNp0dAYpmrkxlb3plhLTZZyaj?=
 =?us-ascii?Q?ISMKXZeryCsNvMSSJeuMFs/91oJdGcFQ23QYTtN7tjLmw169ceWFUheeJ0hA?=
 =?us-ascii?Q?5n30eUCAE8kcLsMty5LoCpxVXReZtwGacFNj2RiwYLnZd0nvhKweYllyhWy/?=
 =?us-ascii?Q?hofKJgISbeRnAF0fo96b5gZJDX/XTJ+2lmWnWGeRem3JCdCVMfqBMEXYmat3?=
 =?us-ascii?Q?L+zFuDqtfYusC9Ig1Nspsmnv4hayrIfS8yulwzFqQ1ub+WV+kHJ7tDU1Ekz6?=
 =?us-ascii?Q?BKugVYKC633LozvYLte6mcbLLUDYcU8+Hd/ukoX81M9kI0NMRgvJPZkusW6R?=
 =?us-ascii?Q?Yo4Bjnf5xFYYZ/rUktjXbHkFKhWvLvvHbkiPPhdYxWmujQmqSaqZOwMkbwDc?=
 =?us-ascii?Q?VdshMuVa6KsH3VvAztotQJgXsy2LGgl5EEwcp6XsvMnaG0bDWM2XHqlWAL3l?=
 =?us-ascii?Q?vDPrNg1PUcrVLMBF6qLnj9zFn86AwKQyg/Y205oGHaIpCpivbdZlhMtBHCWu?=
 =?us-ascii?Q?dqy3EnwUizs4y9BjE1D9Kh8lizWXJ3Si5FHJ+4Zegbh5NvWZBHvoXH71Z15T?=
 =?us-ascii?Q?ZJtwGNwy0SygugNWjrhjEdXLUuSV5jRf/QOC93rrgKM3kt6IpD4DLpVEgVlP?=
 =?us-ascii?Q?y8t9XAY3ySfKT/0bfSlQuHM3chxwCSoDlBHI0n875PZnA2ns/3fi40FVM17B?=
 =?us-ascii?Q?/xrWAgPZ+LZzb9/07GBy2ekqmOlGYD7ZPsWynepVnJtJ6NPDxb1/uV1Yvv47?=
 =?us-ascii?Q?KuCC2nFcG66OsACyTKVMoDRi4GS5upaPY/ITjP5uNlTz4roCZbTRbmJEL/Ur?=
 =?us-ascii?Q?ZrN8d4PLvSErPk15H4UlhrN0eanDfuymXVsN4IGlIejAzK/4JY9m1+tXLV+I?=
 =?us-ascii?Q?msuKwvH+qs69pYyT2Jnfi9Bx+Oz1LHC9Jx6u3QCC30bg3/RKbmRB7IqbUACR?=
 =?us-ascii?Q?/GchEqREx49c4TxrTrVUEYcj3WOljLSMi93Wulx2kMzDwBdbpu5aEtFDqdrW?=
 =?us-ascii?Q?ZrVmyT3f09VajVVg7Rwwoqgqk+xw5FQrVAAZSMk3jcK1MdWPu4g+RrhQ5Xjn?=
 =?us-ascii?Q?4gNainLr+fgdGntCsqRnHQpSjI9yKLqFduMGpetJRGiaXPauIZMaVqzW+358?=
 =?us-ascii?Q?Chvag/iM+T6aX74IAIwQoz9U8j0BuKwL73xdDTOZ39HrIe3KRXqP+IsgeDya?=
 =?us-ascii?Q?+klQRGNiCwktsVo2Uge6KovNFI3lGdbi+9vtqOtm0hRYtcFC3mscrgmdHxhF?=
 =?us-ascii?Q?PZ1nraZlLPQOnTQ7M14QtqhremUXAylN+Z7KahlSu77Lx50iijJ/rt8n1pNY?=
 =?us-ascii?Q?09ygIoHC1+eSxSfq5lelH/A9D4tVrRKL1eTTfDqc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b1d996fc-0c46-49f2-9fe4-08da842875f3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 10:24:14.0992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eaRQQk5BmfLN7kkrRN4lmIyEhWl168tExTA+JqH5CwBADnV9V2jzHBRuJVberU6Fn8ci3uKTH+J4MghNcwgnKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2148
X-Proofpoint-ORIG-GUID: CZYLl-cQeMpyyg2nlvGI9bIV-cJwaU3g
X-Proofpoint-GUID: CZYLl-cQeMpyyg2nlvGI9bIV-cJwaU3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_05,2022-08-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1011 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220044
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Aug 2022 10:24:24 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7553

The local irqbalanced.service was written long before when there wasn't one in
upstream. Then upstream created temporary runtime directory /run/irqbalance in
its irqbalanced.service, but no one did this for this recipe. Which renders the
following error.

/usr/sbin/irqbalance[314]: Daemon couldn't be bound to the file-based socket.

This patch starts to use upstream irqbalance.service instead and remove the
local one.

root@qemux86-64:~# systemctl status irqbalanced
* irqbalanced.service - irqbalance daemon
     Loaded: loaded (/lib/systemd/system/irqbalanced.service; enabled; preset: enabled)
     Active: active (running) since Mon 2022-08-22 10:10:22 UTC; 3s ago
       Docs: man:irqbalance(1)
             https://github.com/Irqbalance/irqbalance
   Main PID: 208 (irqbalance)
      Tasks: 2 (limit: 263)
     Memory: 1.4M
     CGroup: /system.slice/irqbalanced.service
             `-208 /usr/sbin/irqbalance --foreground

Aug 22 10:10:22 qemux86-64 systemd[1]: Started irqbalance daemon.
root@qemux86-64:~# ls -l /run/irqbalance/irqbalance208.sock
srwxr-xr-x 1 root root 0 Aug 22 10:10 /run/irqbalance/irqbalance208.sock

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-extended/irqbalance/irqbalance.inc               | 3 +--
 .../irqbalance/irqbalance/irqbalanced.service            | 9 ---------
 recipes-extended/irqbalance/irqbalance_git.bb            | 1 -
 3 files changed, 1 insertion(+), 12 deletions(-)
 delete mode 100644 recipes-extended/irqbalance/irqbalance/irqbalanced.service

diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
index c69b74ec..038cbae3 100644
--- a/recipes-extended/irqbalance/irqbalance.inc
+++ b/recipes-extended/irqbalance/irqbalance.inc
@@ -42,6 +42,5 @@ do_install () {
         chmod 755 ${D}${sysconfdir}/init.d/irqbalanced
 
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/irqbalanced.service ${D}${systemd_unitdir}/system
-        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/irqbalanced.service
+        install -m 0644 ${S}/misc/irqbalance.service ${D}${systemd_unitdir}/system/irqbalanced.service
 }
diff --git a/recipes-extended/irqbalance/irqbalance/irqbalanced.service b/recipes-extended/irqbalance/irqbalance/irqbalanced.service
deleted file mode 100644
index 5b284faa..00000000
--- a/recipes-extended/irqbalance/irqbalance/irqbalanced.service
+++ /dev/null
@@ -1,9 +0,0 @@
-[Unit]
-Description=irqbalance daemon
-After=syslog.target
-
-[Service]
-ExecStart=@SBINDIR@/irqbalance --foreground
-
-[Install]
-WantedBy=multi-user.target
diff --git a/recipes-extended/irqbalance/irqbalance_git.bb b/recipes-extended/irqbalance/irqbalance_git.bb
index 48774889..a944c2f1 100644
--- a/recipes-extended/irqbalance/irqbalance_git.bb
+++ b/recipes-extended/irqbalance/irqbalance_git.bb
@@ -10,7 +10,6 @@ PV = "1.8.0+git${SRCPV}"
 SRC_URI = "git://github.com/Irqbalance/irqbalance;branch=master;protocol=https \
            file://add-initscript.patch \
            file://irqbalance-Add-status-and-reload-commands.patch \
-           file://irqbalanced.service \
           "
 
 S = "${WORKDIR}/git"
-- 
2.32.0


