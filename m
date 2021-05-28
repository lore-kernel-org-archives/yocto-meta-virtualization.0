Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15358.1622242267942212934
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 28 May 2021 15:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FXYWbiNL;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1782103349=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14SMiUv3021255
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 28 May 2021 22:51:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
	by mx0a-0064b401.pphosted.com with ESMTP id 38u4ryg6j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 28 May 2021 22:51:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZdm321TxMbUpiUDTg2J8X36CvnDdfXoqqJS05lO/LjepJak0WIMQ10Knbk4Uv5jBo8uVhOgDtwyivH81rRdjDD6cj/8NOazlEsRxfJlnCDmN5++v5ttstI+Yb9MFOChJAi9itiUCs2c7+HhRUmZPiXCfeu1CA+LmVR9hDsKMyLh5VjaTK/I3HROY0xe9q6dP8DcKUxJveb5QcHB5A4hmGjOGhZ+lbmVpxbIE+COOeMeP98e+Omdsy+0QLYdSZiGGUHGpqfejypeRR2My7967qo0RyW2YJtMzSKYf2duBt8F+RTtki3vEmerQO0Bn1niAMyQUdfjNVxtah1SmnS7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqfAighFdBFuCkA3zBNgffJaAlMLxOVlkyTsfv+e3ZA=;
 b=dKKGX5frwrckfWco4eveXZ26j/E6/latOiNtVQcGc0/P8m1pak8Epg5PmOZXLOL7LfuoF7JTMH+p8wFJ2CUGEfEgfd72s2q6Kw14VtHgamUzIysQevWMwSYHUa7dvIFysiR8X72bYx1k8zco+KvwL2AzUrbBOlkrefzbZrLY0kzF0ZgRjYirZTANnsYXRSAZY2z/5LSRgpDMnXheDd7CHXWwfJ9wo3QUOlvDg8kjaVW8vUa73lv3qhsd3+bDoz/msxkA08WPHjhZ4aft+XFv/sFCAip10yvW25U30bVGABhLd/OuSPNPRMJf638isyktlmF9NrkdHHfDyWCa6wgNyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqfAighFdBFuCkA3zBNgffJaAlMLxOVlkyTsfv+e3ZA=;
 b=FXYWbiNLNYqdPMAXQhOyh409M0rPOr/UdXlN5PoMgKP2qUAOWIESR134gK2eA98AkHLa5l76XuPdCiyAx73UKohsXtsohvYzybL1FReghc+C6Ijqms9P7kASEXUMCChPlXeEU6uWpUU80ZrYt5f+oCfo8/v+7JZml047IgxoZFw=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR1101MB2318.namprd11.prod.outlook.com (2603:10b6:301:4e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Fri, 28 May
 2021 22:51:05 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8%8]) with mapi id 15.20.4173.020; Fri, 28 May 2021
 22:51:05 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] ceph: Fix compile error with snappy
Date: Fri, 28 May 2021 15:50:48 -0700
Message-Id: <20210528225048.4137924-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: CO2PR04CA0187.namprd04.prod.outlook.com
 (2603:10b6:104:5::17) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by CO2PR04CA0187.namprd04.prod.outlook.com (2603:10b6:104:5::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 22:51:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0984a516-568d-47ff-ead9-08d9222b12f2
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2318:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2318E56A8C111643FC5C2340EE229@MWHPR1101MB2318.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tLY0h1XHignbn7048SCloPIgMOtjqzo6WM9KHV1onMkgg/dXQ90mbXKUIfzIfU7x3QQc6AWRunvNTQ1C36aiQVdqswwB3ah/tYZVIAuoPm9LgurMlmF7Bckl9H4dEckntiDK/n+OB15AVT1p7p5SGw/KxM/GOlqUKzgPQiVMndljIA1Sklf3ocYAQaH/Rq0UsbwkzvqRkh5J476H3BAC4S7RbIp5BCwE6KBq881p0E1TgS7U12NQYibCRoIDUJpgxnBqaDYMOT+rLWSR+YS4w8nRrPOeovXM7S+T6v9ngReK80/fTAYD4m8yGCmWUjwnUkViDAM1TYoBa0bVFmA6HmC6/d6Z+v3Td96O1kt7cEQQIJw4ZHV621ELx5eOhfPd1Vnc/fG3UE1q52A4MYSifm8lveUsT7G5Zap5X7IfPhxx2ciZFRnPeKjLYWFDLnd+YLAUNf9HNN5cOQV/A6jzDsrhlLfsuOMm0Qu9zSPp1tLVDuK9ALC9EVzyI9hsB2ohdBTIy4daMhz1padW+rCPePFw20C/YVY7h+AuQOme1IlHsVziNdFsZFC4Vx64JWa7wcNADLsFrCdN3GIDkwOQzrYlWcXuBs6RI3mROEc0pbgXVJfDQHsMY83+ESXjZnMEbPiB58PDPp/xWrIPb7FULH2wZMBD7daPBxz4tBOZoOGPsBJNzTJT33L2eZhbVgh9a06MS97EfKITuhTnTb4NLQptz4XI5478zi1jwbKVjRXqbgLjfBR9RuCtEbknJbMZo2RXOMa/ae6lJhPK3+B6KgijTMEAYM++hHTYRLONuy8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39850400004)(396003)(136003)(6506007)(478600001)(186003)(16526019)(1076003)(26005)(83380400001)(86362001)(52116002)(38100700002)(5660300002)(66556008)(6666004)(966005)(66946007)(44832011)(8676002)(2616005)(956004)(6512007)(8936002)(6916009)(2906002)(38350700002)(6486002)(66476007)(36756003)(316002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?MWpu6CgBWACahs5H/hd6S9/4OO424HNQGJCWyNbPlSgQHGvsGx2HgqnJg4Qk?=
 =?us-ascii?Q?5VmWJ1UPNDoJbJR1LbMBAQ59Rqs2SZ+EE3D80NXbMZZroOt+wdQoFMGeA8S1?=
 =?us-ascii?Q?hTEKnOEPOcZB1O3n9wnCEJeh5G35aCRtoGP7GOK8eicNBMlIAtLCb5C9+ZDn?=
 =?us-ascii?Q?xAs0upqtRej6yh1NVW3L2Z7GrtP/+No3LHLSzFJkfXl1P3Xyz8NR/s4QMZPq?=
 =?us-ascii?Q?ywROZORMCeidLJFvl0NbpPLVavZHncEC72gpEt+6CL9Oe9c0fPFe+SSEqoVU?=
 =?us-ascii?Q?28WZmSVGgJEKz78173jdRjgPqHqM6b6dBQtX/gIyR8fgzaeVWWtBu1ffbMR7?=
 =?us-ascii?Q?H+D2zFs1c6K5uIMhiijm+PeFpp5lV1MTZfaC25xS0BWx5d26mx5u62efBXRS?=
 =?us-ascii?Q?3CKBYeyWp0FPXg3VIUX/+t1blM8vuOlu9urPp7RdhnfyG+oZ+XOlX9fXbb5T?=
 =?us-ascii?Q?jGeEnOIuacY4vala2b3XES24A8Y29CIyaETNUtCHImPdP/iDldvbJ5BNN5l8?=
 =?us-ascii?Q?CuvjXJMqifSQ9+bqQX7TJiTvX72u5l3V1+vXB6YjYp/t4o9/Yt+w7TZSxoma?=
 =?us-ascii?Q?MLn9UI6m1KHVVL+FNqpjAhYWuAqTYPnlqK50zH77rxJ56SRjLvlROjQvmQGb?=
 =?us-ascii?Q?Vo72ZtKp+7RFvceyT/qgiUmxnIVvPayF4ri+/la0UUUaEGtdTzjRM6I/LLHW?=
 =?us-ascii?Q?+0uwQyBJJnoidvuipQA9MjSqKdqkuBF9Wgi0q0XfXrXtbh0uF3gHmNhh2Qy4?=
 =?us-ascii?Q?bl8opRUIy7oUViHc9K4CTNp1nieH/wQJip/HhRk+NfhQYYX6zXKbNuWxhiiQ?=
 =?us-ascii?Q?6UCCKIlwBOq2dUXmrgZ+wRFw1fFdJl6KgvpqnP5jHsLvbk1saZBiJ+dsYkx4?=
 =?us-ascii?Q?/X64aVnPn4WqBSIL/abljJc9sRx9Pv1UxZgcrBb0+/Gf8SR/bHEs6VTjc8dt?=
 =?us-ascii?Q?551Ti4B17Vtnrv5nEJb5RringOVykchZhqBfVvVB1wn1B46f3Wb4VE26HbT3?=
 =?us-ascii?Q?CroGIh9Sil+HehFU7QObamk1rli0u+nIYsXpK3R0+w10fx9wJKPVENT840KF?=
 =?us-ascii?Q?ToAUyZuD2tjaqus4jYMj4OtiZustm8gtIysIhs+h+te2uVWzuMjEJ91ZCg8c?=
 =?us-ascii?Q?kj3LnC5YaXMlIWPrTTPx0ot7EuKnLqKFJ+zRMRLCnQp+2D5gHtRn7/+1kyni?=
 =?us-ascii?Q?dFVuG2u+lNNbQeUa174fPU9s8LWPyu1adk0A4NO/8p8InJMK3hPO2P8ougjS?=
 =?us-ascii?Q?paWm2pqf6z3prL/tuVd7JwBtAbiKR+OvIjUKb+wI0IrWvUXVJ258JsfiLXCo?=
 =?us-ascii?Q?ELEAOiq3R5juHdfZrmTEXn9/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0984a516-568d-47ff-ead9-08d9222b12f2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 22:51:04.8893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pX/dVTa1mKJfvkOAYY3GXEG+QP+pj7yVzqiiLXdBhLLY8Ctrpnq6bDk7dUu6lLSibt09fH0ZU40osTeznh3Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2318
X-Proofpoint-ORIG-GUID: pKP6ERMNSdPYpGiKVpRP1tWW6SYmrUVM
X-Proofpoint-GUID: pKP6ERMNSdPYpGiKVpRP1tWW6SYmrUVM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-28_09:2021-05-27,2021-05-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105280151
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

snappy changed a data type in the last update, this is a known
issue in ceph.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 ...mpressor.h-fix-snappy-compiler-error.patch | 30 +++++++++++++++++++
 recipes-extended/ceph/ceph_15.2.12.bb         |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-extended/ceph/ceph/0001-SnappyCompressor.h-fix-snappy-compiler-error.patch

diff --git a/recipes-extended/ceph/ceph/0001-SnappyCompressor.h-fix-snappy-compiler-error.patch b/recipes-extended/ceph/ceph/0001-SnappyCompressor.h-fix-snappy-compiler-error.patch
new file mode 100644
index 0000000..2ebd32d
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-SnappyCompressor.h-fix-snappy-compiler-error.patch
@@ -0,0 +1,30 @@
+From 85bde55627cfbb35d8b4735dec32bf33fa30079f Mon Sep 17 00:00:00 2001
+From: Saul Wold <saul.wold@windriver.com>
+Date: Fri, 28 May 2021 10:16:07 -0700
+Subject: [PATCH] SnappyCompressor.h: fix snappy compiler error
+
+snappy quietly changed public type
+
+Known issue in ceph: https://tracker.ceph.com/issues/50934
+
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <saul.wold@windriver.com>
+
+---
+ src/compressor/snappy/SnappyCompressor.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/compressor/snappy/SnappyCompressor.h b/src/compressor/snappy/SnappyCompressor.h
+index 0cfb819c..2fbe35b7 100644
+--- a/src/compressor/snappy/SnappyCompressor.h
++++ b/src/compressor/snappy/SnappyCompressor.h
+@@ -96,7 +96,7 @@ class SnappyCompressor : public Compressor {
+     if (qat_enabled)
+       return qat_accel.decompress(p, compressed_len, dst);
+ #endif
+-    snappy::uint32 res_len = 0;
++    uint32_t res_len = 0;
+     BufferlistSource source_1(p, compressed_len);
+     if (!snappy::GetUncompressedLength(&source_1, &res_len)) {
+       return -1;
diff --git a/recipes-extended/ceph/ceph_15.2.12.bb b/recipes-extended/ceph/ceph_15.2.12.bb
index 9ba72b4..3c2e1c6 100644
--- a/recipes-extended/ceph/ceph_15.2.12.bb
+++ b/recipes-extended/ceph/ceph_15.2.12.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://ceph.conf \
            file://0001-add-missing-include-for-atomic-bool.patch \
            file://0001-cmake-add-support-for-python3.9.patch \
+           file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
 "
 
 SRC_URI[sha1sum] = "9c76b298e1e659b9c5501003ac77fb28aab7823d"
-- 
2.25.1

