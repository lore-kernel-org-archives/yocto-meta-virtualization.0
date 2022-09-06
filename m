Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA695ECAAA1
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 22:07:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.669.1662502047812589702
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 15:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pDajPdZy;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6248b16c11=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 286CoNTO003595
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 6 Sep 2022 22:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=nVeFlK7pI6i3dUt8iKmGcAHo58XV+ayYeztAnqp3eLo=;
 b=pDajPdZyEQQAC5oUAT0ObAvgoqlHE/eUzpNzgbZ1G/XqpzAe1yAMQFtvqEXcs/2MKBdC
 h8eOUo4K7/6LlKxYnee6+Vn+KS1gYrdqk8+2D/PMlL95CKay6X9DKFK3cej8l4fWLIeC
 gOmSG2n2CQZvJvBhFIhGA0UWWmt0ruhhetfczsAvBSsydIVdsMlm+kHzZgJPUgrAUo2V
 1ieL0hk8GYU+E/orG8IPOuY8XEV1dXDkyx5vDL4fAqhDu/zvGAsXNIywAbDFPtu7YjLy
 ZL1Q2G7fqgUiBxYyJ6mYxYRaJ8E8XJWheEilpXS0vd4EWgaKPFRcGZDk+HL4TRBRhHMP qQ==
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jbww7b1nk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 22:07:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1p5o5jiWgljMK/2X5DG4mBKZBwerPdLIRI1QyS3/M9geAtwCGKtDs6JVa+q81W6Gx5aGeR/K/diyrrHu/DlXx3mcU79O5jBHlnTVAn2cZE8SPlng88CqIPkgoWzcwrC7J96iqKXYwuhrJMJfkPS2QDlmoeRpjYmnFlLo3SF+aFePX9Hi5JZUFPjMiLyf+eiwHeyW5HYKZVXwjS6aiBfihU1RcM25l5MPSqg/m8o4/w8m6rSRhBNRSQMV6kUC7pSuFv1CIQC75VfYmGLC5ivZpYnLqHhsBq800C2Fp8CA46vkR0dJC8TPTjFlENHcxZwlz12qj1CZet0vmB1kxnTJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVeFlK7pI6i3dUt8iKmGcAHo58XV+ayYeztAnqp3eLo=;
 b=Vm/efhzz30l8edaVqVjgY9ixfvTVvAN25lNJFknzXJk/QkXJFgb9QnLbvBt2LLFkwOkX3ttj3eFTI4/an2wXkKvYRX8cMIxKu7LqMfmTa3c8G/Yqs2q9caNaMgP1tIb299uiqPiABhxnH9P2F38If6c9lTGpPOnIhhXTvx6yVugz2DLwlCDGIAYZJjH6jQLDopgJvG/7A3HztRLJiR8SGMWoLrRhytKVAK65WQs9iGcWQr6MJmQfKDeRpYDwCaPrAzzH6woI47khWvLbyBmcSRzWFeducG3qopzvfXCzkBiY3uu02/S5uIxAWjDxGPMC8RxOiri8zfBSZevJOV8HfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB4459.namprd11.prod.outlook.com (2603:10b6:5:1de::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.17; Tue, 6 Sep 2022 22:07:22 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2%5]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 22:07:22 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] ceph: fix CVE-2022-0670
Date: Tue,  6 Sep 2022 18:07:10 -0400
Message-Id: <20220906220710.38267-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::10) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fd0c1ab-76a0-444a-ab59-08da90542c85
X-MS-TrafficTypeDiagnostic: DM6PR11MB4459:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sfd80g38FDDBvCcvADDd/3WyuSFglPyfAvHPUZSrczzH9RQyvsMK3MvzpWK0qD6df17DD22gUtLYgUkFYj7YnoHHc6AmiWWUrGOApzc8ncFbcwcgz+k/zN8NNFTKvkqxoSNDy+AyyT8NLM4LxVP0g/Fx108A3n5r3rSod9JZDxM1Jb6Bc/6kl2nWUb1nXCtvHr2G+ra9qogZBKaaYBmpaO8IRf1noxYk8VAaZxBYytZDzLtcUi2s6wQPwlXwYgor+GQ1agb0VtsJabXOKQFWTx7oDaPRUaBECLpXEXRrvZu0GuYOP3Ja9RFk3Ogo/fgM5IzgG85Qbcr+Da3jT9ZGLr26+MDeAmCPFdAsTAfVR1N9rQpkNdJ2unm5qj+FQwGLEq7Ws1US9/EB6rFjBPcjzUg/x+rEgl5w98otMaut71P05ZA00K1BnUNmwWmy0raAZeEdUY/lF+6G4zdttxOnVqmsgjh8iGHw5hlhPonSsoquvskXlAhQNJVNzH5/IaoRYYhV5SdK+wW4e0cJKmAr6r4/yCBzs9Z1m70VhQYSzWzs2Kx4/LkqbrY18PL+jyLLKaYd+u7HFRbDOkwDnjlAHg1xwrFYdwA9QDOxK8wkFep9mkEZzVwTF8FtSNrM4FGWY1LZN2jwdffkFtluuUjHt/y5OH9n+LmUgd7+9eIvUJzfjMiYRfnvtjYUCkZEHGL9p1OWclzCyFboyERrRMZYZgoYCucRWbkiU19lTgWYP2xNjV2GJKGouNzIOnjBqeJ7ZTJJg7CGX6lEjicDR7dfUR7aFMMS2MjiFz+MRBSD9c4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39850400004)(366004)(346002)(376002)(6916009)(83380400001)(26005)(6506007)(6666004)(6512007)(52116002)(316002)(36756003)(8936002)(5660300002)(478600001)(86362001)(44832011)(2906002)(66476007)(66556008)(8676002)(66946007)(186003)(41300700001)(38350700002)(1076003)(2616005)(6486002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5Kir2SXLKtBcRhiuiDtvfm7UUsFla5oA6BdX/cTEeHglf0D+XG/JSrjikcfT?=
 =?us-ascii?Q?ewcdVK/G3jw8OyLQ1z9iqZZpcXG/tE1fU7ClcsGYnEpbe6fyi3/qTBPg+Wvn?=
 =?us-ascii?Q?NRk626OKZnpPMIweZWZYH4Rex6z/BjwMQ+db0zuTTCVun1lUfIMqxK28uc82?=
 =?us-ascii?Q?NshaVDpxmAwwy+fbVxk5HRCyMbymnyO960gvA4YuKBAWB3R0rK+CbGY60Dkh?=
 =?us-ascii?Q?zEEEufJ5bBxlDl+Uc+3wRSd76c/WJGUFUuqO2/7US4wtbrJ/2nQpNYCPq8gh?=
 =?us-ascii?Q?0AQi6TTVFnmKSSJug21VK+XDJuADtTix/hmOR4lSxqdYu0Y/b1ISVh4lCjN5?=
 =?us-ascii?Q?ImlNup92ikcdk/VyZjANHRDHNAEjhECXgtDmIYBbetxQTMy4eTG21O4dae62?=
 =?us-ascii?Q?RjQGOAGlFfnlJT3JcGfIMbCO4xkc0Pg5tumyIHjVkyTOQO7eJhtTu4GuKmn9?=
 =?us-ascii?Q?GF1G2BFufXVjRwuCMEowyzOE240HnFhTegerzmpmIAvT5nul16HkVPeyNFop?=
 =?us-ascii?Q?m4bFNtB5+wDEJHLwiJb75ggVwKGGkxUjjo1iOYVuXNOBVs2YkSbnQPZ+DJHp?=
 =?us-ascii?Q?734uaVDqHmyogRVgfrqmR9lAr8Nw68+aXIbUijfVBa8s6sfGv3CYZCrXytmf?=
 =?us-ascii?Q?J/q3gUmYkym/GQsy5zj/nA2211wvnh9i0KDiiSuVvpMM1L1dDI5H774wC38E?=
 =?us-ascii?Q?58hgswLMl1pCNS7PCKl/qrJqyXntX3j+aQ45mMk5E5PN438Aq20TNZWEH7l/?=
 =?us-ascii?Q?2mN7BaeyjLAmWUVc4UwsTBLfRwkTLnuQH9vvkcznIFgnHjI/+74cBWgsq/Tk?=
 =?us-ascii?Q?BhXPPemp0oU6SL5oiZExCg0BFUJkDTeNmyT4upTQY9G8AK3/u1SMrvC4tdtA?=
 =?us-ascii?Q?KAiMkMaKMAn1+bJzG2uE9qBEzmMlZSZU54zQw+MJptd+OWAF+7mp/VxTfeqB?=
 =?us-ascii?Q?027nX+XtEGFAITbcDwY0x+juN7qyikFtDKrl8iq2xGOa/NHFdupx13knJ8LD?=
 =?us-ascii?Q?DAwoh01+um0YFo27uRYpQ1OcMLcTyOf6wv5ruIH7KloMkxCD7YzVZwKZQF48?=
 =?us-ascii?Q?8VFADbHeA+smBi0qKzoP9x/Zx/OmYXKX3KjmoNl2hw8YU7g23O9dLAxNQHI9?=
 =?us-ascii?Q?HJ9xMvNU49AAZm19XZYqdMlDvCrwXHx8DpmZ/kLfHnGn+8/Ir+sgd7X+EOAh?=
 =?us-ascii?Q?TdE4Vrv0LeQ++GlD0f2C9Lib1CAM0kKdI8Bm+cAWpLx1gJl7Rkn3bn/GAyaC?=
 =?us-ascii?Q?broYYIyP4IcDFdGRjhQSlLS5xAEbMCVqqslEED5o49WqA7aso8xMLgL1/LGZ?=
 =?us-ascii?Q?O+xpEOYGr2r5dx2rJcHYAlz48ONTZGtRUX2PT7Yl0SKtwbngVLrDLqZ2zbEq?=
 =?us-ascii?Q?e2Z6cRtoVfxLu4l2B3zKdibPSt2Wpz6yVAkz6PcKlcJCZfZGWMQL/i1yQzTj?=
 =?us-ascii?Q?BwBmHGNOK6nDaPI0GOgG5Xl1xZzC6jB/bPlBBTWZen5/VmTZ4BSKqr38M+4V?=
 =?us-ascii?Q?SfwzKV/bkMN7GJgx76MyAroj8tQ3GfGe4ort7LzN6pYJQzxpy6Xi5DNDpPYt?=
 =?us-ascii?Q?mS1P/nrOpCDLtUP7wD/hm17kb7KMwJ1dDaX10h9OAsZ/oTZBM0a35j/jgI54?=
 =?us-ascii?Q?CQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0fd0c1ab-76a0-444a-ab59-08da90542c85
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 22:07:22.6519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 D4me3n8zRqfUL4j8ezbk5hVWH7p/Kq+dP9TUlSFfM1Nqzw4A/9DTEUrQAshskoF8siTjRKxAV3EQ5t64K1nDqzfTdw6clAYhmtWxaPs+LY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4459
X-Proofpoint-GUID: 5MNE5HCSm2fKAbChXIbpF0ifSTIN6YhT
X-Proofpoint-ORIG-GUID: 5MNE5HCSm2fKAbChXIbpF0ifSTIN6YhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_09,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209060103
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Sep 2022 22:07:30 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7601

Backport required patches to fix CVE-2022-0670.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../ceph/ceph/CVE-2022-0670_1.patch           | 114 ++++++++++++++++++
 .../ceph/ceph/CVE-2022-0670_2.patch           |  67 ++++++++++
 recipes-extended/ceph/ceph_15.2.15.bb         |   2 +
 3 files changed, 183 insertions(+)
 create mode 100644 recipes-extended/ceph/ceph/CVE-2022-0670_1.patch
 create mode 100644 recipes-extended/ceph/ceph/CVE-2022-0670_2.patch

diff --git a/recipes-extended/ceph/ceph/CVE-2022-0670_1.patch b/recipes-extended/ceph/ceph/CVE-2022-0670_1.patch
new file mode 100644
index 0000000..ea790d3
--- /dev/null
+++ b/recipes-extended/ceph/ceph/CVE-2022-0670_1.patch
@@ -0,0 +1,114 @@
+From 0cd1d8aa5ac935f738365ba38b397cae0fc9179c Mon Sep 17 00:00:00 2001
+From: Kotresh HR <khiremat@redhat.com>
+Date: Fri, 4 Feb 2022 14:55:03 +0530
+Subject: [PATCH] mgr/volumes: Fix subvolume discover during upgrade
+
+Fixes the subvolume discover to use the correct
+metadata file after an upgrade from legacy subvolume
+to v1. The fix makes sure, it doesn't use the
+handcrafted metadata file placed in the subvolume
+root of legacy subvolume.
+
+Co-authored-by: Arthur Outhenin-Chalandre <arthur.outhenin-chalandre@cern.ch>
+Co-authored-by: Dan van der Ster <daniel.vanderster@cern.ch>
+Co-authored-by: Ramana Raja <rraja@redhat.com>
+Signed-off-by: Kotresh HR <khiremat@redhat.com>
+(cherry picked from commit 7eba9cab6cfb9a13a84062177d7a0fa228311e13)
+
+Upstream-Status: Backport [0cd1d8aa5ac935f738365ba38b397cae0fc9179c]
+CVE: CVE-2022-0670
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ .../fs/operations/versions/metadata_manager.py  | 17 ++++++++++++++---
+ .../fs/operations/versions/subvolume_base.py    | 17 ++++++++++++++++-
+ 2 files changed, 30 insertions(+), 4 deletions(-)
+
+diff --git a/src/pybind/mgr/volumes/fs/operations/versions/metadata_manager.py b/src/pybind/mgr/volumes/fs/operations/versions/metadata_manager.py
+index 1b6c4327837..cb3059e5653 100644
+--- a/src/pybind/mgr/volumes/fs/operations/versions/metadata_manager.py
++++ b/src/pybind/mgr/volumes/fs/operations/versions/metadata_manager.py
+@@ -40,16 +40,17 @@ class MetadataManager(object):
+     def refresh(self):
+         fd = None
+         conf_data = StringIO()
++        log.debug("opening config {0}".format(self.config_path))
+         try:
+-            log.debug("opening config {0}".format(self.config_path))
+             fd = self.fs.open(self.config_path, os.O_RDONLY)
+             while True:
+                 data = self.fs.read(fd, -1, MetadataManager.MAX_IO_BYTES)
+                 if not len(data):
+                     break
+                 conf_data.write(data.decode('utf-8'))
+-            conf_data.seek(0)
+-            self.config.readfp(conf_data)
++        except UnicodeDecodeError:
++            raise MetadataMgrException(-errno.EINVAL,
++                    "failed to decode, erroneous metadata config '{0}'".format(self.config_path))
+         except cephfs.ObjectNotFound:
+             raise MetadataMgrException(-errno.ENOENT, "metadata config '{0}' not found".format(self.config_path))
+         except cephfs.Error as e:
+@@ -58,6 +59,16 @@ class MetadataManager(object):
+             if fd is not None:
+                 self.fs.close(fd)
+ 
++        conf_data.seek(0)
++        try:
++            if sys.version_info >= (3, 2):
++                self.config.read_file(conf_data)
++            else:
++                self.config.readfp(conf_data)
++        except configparser.Error:
++            raise MetadataMgrException(-errno.EINVAL, "failed to parse, erroneous metadata config "
++                    "'{0}'".format(self.config_path))
++
+     def flush(self):
+         # cull empty sections
+         for section in list(self.config.sections()):
+diff --git a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
+index 2840a9f2ea3..b499d242e3b 100644
+--- a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
++++ b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
+@@ -5,6 +5,7 @@ import errno
+ import logging
+ from hashlib import md5
+ from typing import Dict, Union
++from pathlib import Path
+ 
+ import cephfs
+ 
+@@ -123,6 +124,15 @@ class SubvolumeBase(object):
+         raise NotImplementedError
+ 
+     def load_config(self):
++        try:
++            self.fs.stat(self.legacy_config_path)
++            self.legacy_mode = True
++        except cephfs.Error as e:
++            pass
++
++        log.debug("loading config "
++                  "'{0}' [mode: {1}]".format(self.subvolname, "legacy"
++                                             if self.legacy_mode else "new"))
+         if self.legacy_mode:
+             self.metadata_mgr = MetadataManager(self.fs, self.legacy_config_path, 0o640)
+         else:
+@@ -271,8 +281,13 @@ class SubvolumeBase(object):
+             self.fs.stat(self.base_path)
+             self.metadata_mgr.refresh()
+             log.debug("loaded subvolume '{0}'".format(self.subvolname))
++            subvolpath = self.metadata_mgr.get_global_option(MetadataManager.GLOBAL_META_KEY_PATH)
++            if not self.legacy_mode and self.base_path.decode('utf-8') != str(Path(subvolpath).parent):
++                raise MetadataMgrException(-errno.ENOENT, 'fabricated .meta')
+         except MetadataMgrException as me:
+-            if me.errno == -errno.ENOENT and not self.legacy_mode:
++            if me.errno in (-errno.ENOENT, -errno.EINVAL) and not self.legacy_mode:
++                log.warn("subvolume '{0}', {1}, "
++                          "assuming legacy_mode".format(self.subvolname, me.error_str))
+                 self.legacy_mode = True
+                 self.load_config()
+                 self.discover()
+-- 
+2.25.1
+
diff --git a/recipes-extended/ceph/ceph/CVE-2022-0670_2.patch b/recipes-extended/ceph/ceph/CVE-2022-0670_2.patch
new file mode 100644
index 0000000..dad466b
--- /dev/null
+++ b/recipes-extended/ceph/ceph/CVE-2022-0670_2.patch
@@ -0,0 +1,67 @@
+From c774e03c29955f0fb668af6190a9750d03bb09b8 Mon Sep 17 00:00:00 2001
+From: Kotresh HR <khiremat@redhat.com>
+Date: Thu, 9 Jun 2022 13:30:59 +0530
+Subject: [PATCH] mgr/volumes: V2 Fix for
+ test_subvolume_retain_snapshot_invalid_recreate
+
+Signed-off-by: Kotresh HR <khiremat@redhat.com>
+
+Upstream-Status: Backport [c774e03c29955f0fb668af6190a9750d03bb09b8]
+CVE: CVE-2022-0670
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+
+---
+ .../mgr/volumes/fs/operations/versions/subvolume_base.py  | 8 ++++++--
+ .../mgr/volumes/fs/operations/versions/subvolume_v1.py    | 2 +-
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
+index b499d242e3b..aba8c90cf67 100644
+--- a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
++++ b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
+@@ -17,6 +17,7 @@ from ...fs_util import get_ancestor_xattr
+ from ...exception import MetadataMgrException, VolumeException
+ from .op_sm import SubvolumeOpSm
+ from .auth_metadata import AuthMetadataManager
++from .subvolume_attrs import SubvolumeStates
+ 
+ log = logging.getLogger(__name__)
+ 
+@@ -112,7 +113,7 @@ class SubvolumeBase(object):
+     @property
+     def state(self):
+         """ Subvolume state, one of SubvolumeStates """
+-        raise NotImplementedError
++        return SubvolumeStates.from_value(self.metadata_mgr.get_global_option(MetadataManager.GLOBAL_META_KEY_STATE))
+ 
+     @property
+     def subvol_type(self):
+@@ -282,7 +283,10 @@ class SubvolumeBase(object):
+             self.metadata_mgr.refresh()
+             log.debug("loaded subvolume '{0}'".format(self.subvolname))
+             subvolpath = self.metadata_mgr.get_global_option(MetadataManager.GLOBAL_META_KEY_PATH)
+-            if not self.legacy_mode and self.base_path.decode('utf-8') != str(Path(subvolpath).parent):
++            # subvolume with retained snapshots has empty path, don't mistake it for
++            # fabricated metadata.
++            if (not self.legacy_mode and self.state != SubvolumeStates.STATE_RETAINED and
++                self.base_path.decode('utf-8') != str(Path(subvolpath).parent)):
+                 raise MetadataMgrException(-errno.ENOENT, 'fabricated .meta')
+         except MetadataMgrException as me:
+             if me.errno in (-errno.ENOENT, -errno.EINVAL) and not self.legacy_mode:
+diff --git a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_v1.py b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_v1.py
+index f7b13f17c77..9e772653ba5 100644
+--- a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_v1.py
++++ b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_v1.py
+@@ -673,7 +673,7 @@ class SubvolumeV1(SubvolumeBase, SubvolumeTemplate):
+ 
+     @property
+     def state(self):
+-        return SubvolumeStates.from_value(self.metadata_mgr.get_global_option(MetadataManager.GLOBAL_META_KEY_STATE))
++        return super(SubvolumeV1, self).state
+ 
+     @state.setter
+     def state(self, val):
+-- 
+2.25.1
+
diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.15.bb
index f2ece8c..d63051c 100644
--- a/recipes-extended/ceph/ceph_15.2.15.bb
+++ b/recipes-extended/ceph/ceph_15.2.15.bb
@@ -17,6 +17,8 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch \
            file://0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch \
            file://CVE-2021-3979.patch \
+           file://CVE-2022-0670_1.patch \
+           file://CVE-2022-0670_2.patch \
 "
 
 SRC_URI[sha256sum] = "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
-- 
2.33.0


