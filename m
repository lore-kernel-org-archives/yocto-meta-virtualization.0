Return-Path: <Harish.H@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DB0C83F09
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 05:47:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6347.1751608052760593213
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 03 Jul 2025 22:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92807f8711=harish.h@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5645AnQh019379
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 4 Jul 2025 05:47:31 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9ed40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Jul 2025 05:47:31 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 3 Jul 2025 22:46:35 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 3 Jul 2025 22:46:34 -0700
From: hh <harish.h@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] skopeo.bb: remove GOBUILDFLAGS override in do_compile to fix textrel QA issue
Date: Fri, 4 Jul 2025 11:17:25 +0530
Message-ID: <20250704054725.139511-1-harish.h@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xH_HH3C34qd6nx_1z5oG-Q7s4MkSj3ys
X-Proofpoint-GUID: xH_HH3C34qd6nx_1z5oG-Q7s4MkSj3ys
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=68676af3 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=OldgdYu09Kd6Aqf2qMQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA0MyBTYWx0ZWRfX/EWIAiU/cdY/ Tw742PtQCX4gepoOOvakSTFfZbUdEEGv+4VtinzynNVi83K+VZHCEpm2jVv7k3kt80TbL1BNzrd 7ogBLPZdsfkdqBf8wrvTIzEOOHop+hR5VHjMhNa0MjJDP02gP+IUhRO9IvaS1noyNXTZrOAUZvq
 vp5jYRaAnj0ZKI6eqAzmC7mEzpTtUhi7urH669Nn6hbS3EvWTnxcdqf8vRK/WNEtOc1l7/p7jSB w8Cg82JSiO+tUft27OdiVz+XvsSap4xiq2kk2HfSackcTNfLglBf7YU/AtKKKUwjPPgSzpzDpFF aLsHfW+A1izpl+3eiK6/6V1K1FEEwSQxAgadRMKtjI7FaliI2FjS7ojO4EIbI+1Rr2ADBdLufej
 5Wpdf7yGglEYaCfMKjDM7/QuT6XslWAFgomyIg9sEh2iyJT0C2hHYtV5HZUb3HsLUKzS5qHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507040043
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Jul 2025 05:47:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9295

From: Harish H <harish.h@windriver.com>

The skopeo recipe was explicitly exporting GOBUILDFLAGS="-trimpath" in the
do_compile task, overriding the default settings provided by go.bbclass.

This override causes the resulting Go binary to include relocations in the
.text section, leading to the following QA error during do_package_qa:

  QA Issue: skopeo: ELF binary /usr/sbin/skopeo has relocations in .text [textrel]

Removing the GOBUILDFLAGS assignment in skopeo_git.bb allows the default behavior
from go.bbclass to take effect, resolving the textrel issue and ensuring
the binary passes QA checks.

Signed-off-by: Harish H <harish.h@windriver.com>
---
 recipes-containers/skopeo/skopeo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index 561ef103..165114ef 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -61,7 +61,7 @@ do_compile() {
 	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 
 	export GO111MODULE=off
-	export GOBUILDFLAGS="-trimpath"
+	#export GOBUILDFLAGS="-trimpath"
 	export EXTRA_LDFLAGS="-s -w"
 
 	oe_runmake bin/skopeo
-- 
2.40.0


