Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87823C5479D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 10:12:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10775.1672999972888358661
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Jan 2023 02:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0370ea45eb=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 306A0uhC022563;
	Fri, 6 Jan 2023 10:12:51 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mxa0507k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 06 Jan 2023 10:12:51 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 02:12:50 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Fri, 6 Jan 2023 02:12:49 -0800
From: <mingli.yu@eng.windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [PATCH] libslirp: remove the recipe
Date: Fri, 6 Jan 2023 18:12:48 +0800
Message-ID: <20230106101248.852370-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xcZ8waqK3Epg7wYmbU0n1mgZtcWONGhu
X-Proofpoint-GUID: xcZ8waqK3Epg7wYmbU0n1mgZtcWONGhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_05,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 clxscore=1011 spamscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=974
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060080
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Jan 2023 10:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7796

From: Mingli Yu <mingli.yu@windriver.com>

The libslirp recipe is added in openembedded-core [1], so remove the
recipe in meta-virtualization to fix the below yocto compliance issue.

INFO: ======================================================================
INFO: FAIL: test_signatures (common.CommonCheckLayer)
INFO: ----------------------------------------------------------------------
INFO: Traceback (most recent call last):
  File "/build/layers/oe-core/scripts/lib/checklayer/cases/common.py", line 84, in test_signatures
    self.fail('Adding layer %s changed signatures.\n%s' % (self.tc.layer['name'], msg))
AssertionError: Adding layer meta-virtualization changed signatures.
26 signatures changed, initial differences (first hash before, second after):
   libslirp:do_fetch: ddef7cb42fde46edfd7be943eae54ddc2b27bc0af62f8cb6b31593cabb0d5925 -> b71e325b62905059e0cf07b61ee0a4db192d212ff56395d0d93702e525ef8d4a
      bitbake-diffsigs --task libslirp do_fetch --signature ddef7cb42fde46edfd7be943eae54ddc2b27bc0af62f8cb6b31593cabb0d5925 b71e325b62905059e0cf07b61ee0a4db192d212ff56395d0d93702e525ef8d4a
      NOTE: Starting bitbake server...
      basehash changed from 50c45a6065da00132b899786d818a66f056190f6664fc4bfe974e8a9f70c7f78 to 3b4e51c0058462af0c141c974b2ea19a9efc51cb61ef26bc2b4367c1066ad8f9
      Variable SRCREV value changed from '3ad1710a96678fe79066b1469cead4058713a1d9' to '888ddad6bde1dc6d7dbfc8daa7d015251b72e02c'

   libslirp:do_write_config: 8a3791774ea0f5793d1c14d0f3521582814420a057a2ee34488c8f868c7aacbb -> bdebe27987ebfdfdac9cf4c1af489f7aa674ef19454f7bf983549ae8ee2baf69
      bitbake-diffsigs --task libslirp do_write_config --signature 8a3791774ea0f5793d1c14d0f3521582814420a057a2ee34488c8f868c7aacbb bdebe27987ebfdfdac9cf4c1af489f7aa674ef19454f7bf983549ae8ee2baf69
      NOTE: Starting bitbake server...
      basehash changed from 8e5d9803b05d9999dbd18f4dce549312dc908f475362e236db785c94c99c8d5d to 0870fb4d535f92b666ed5a78d46ef69acc292888399961a24547b22d82b26d84
      Variable PV value changed from '4.7.0' to '4.6.1+gitAUTOINC+888ddad6bd'

[1] https://git.openembedded.org/openembedded-core/commit/?id=a4409583e0f8187b0c0cbf92fbddeffef12fd8f5

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-networking/slirp/libslirp_git.bb | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 recipes-networking/slirp/libslirp_git.bb

diff --git a/recipes-networking/slirp/libslirp_git.bb b/recipes-networking/slirp/libslirp_git.bb
deleted file mode 100644
index aeb61f63..00000000
--- a/recipes-networking/slirp/libslirp_git.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "A general purpose TCP-IP emulator"
-LICENSE = "BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
-
-SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
-SRCREV = "888ddad6bde1dc6d7dbfc8daa7d015251b72e02c"
-PV = "4.6.1+git${SRCPV}"
-S = "${WORKDIR}/git"
-
-DEPENDS = " \
-    glib-2.0 \
-"
-
-inherit meson pkgconfig
-- 
2.25.1


