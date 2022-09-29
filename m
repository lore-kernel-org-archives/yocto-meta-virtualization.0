Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0051DC04A95
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 08:51:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.8103.1664441507460164148
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 01:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Ua2T7afb;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=727166c06f=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28T6pEb1009042;
	Thu, 29 Sep 2022 08:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=6graXeMqrVPqixYwvDnJj+DGL4TXhewLlbynkZfDVc0=;
 b=Ua2T7afbpDVoSxCS173UQ/9HoE8+2uoQ+qZ6VhtXodOpJ/WcSago1V6TpJu2XmhzU6sy
 NaVM/xI2lroyvjF7bhK7TK2/6cuCAqm1ZxxZyxUAIeP73zL/Ggb7ughQPxvocNdHHOM0
 ZUpB/HF9/sFVLVVrBKnY88y4rxpW0YBId+QVtAh0TZ3/bHKGR7kVihrMvw6zAEudaJxC
 DvMla0zPA4Qm3Fhtj7se5TL2PLypgo0lkxWtkGJgc9V0mHv+GFRcre2e8VVvoXJjrkuQ
 19/THXJUeRCLo8TDNKcQjJG9VUJQPmJQyEZPshIzioPeSq/kiCR/uFTvsC/IXLHWqHvP TQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsq424bqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 29 Sep 2022 08:51:46 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 29 Sep 2022 01:51:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 29 Sep 2022 01:51:44 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 29 Sep 2022 01:51:43 -0700
From: <kai.kang@windriver.com>
To: <bruce.ashfield@gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 0/1] Update criu to 3.17.1
Date: Thu, 29 Sep 2022 16:51:40 +0800
Message-ID: <20220929085141.19781-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: hVU_HKGbddjOJ9J8owJ3fBgZUs8hfqJC
X-Proofpoint-GUID: hVU_HKGbddjOJ9J8owJ3fBgZUs8hfqJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_04,2022-09-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=737
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209290053
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Sep 2022 08:51:54 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7631

From: Kai Kang <kai.kang@windriver.com>

Hi Bruce,

The latest release is 3.17.1 but not include commits to fix for glibc
2.36. So backport them at same time.



Kai Kang (1):
  criu: 3.17 -> 3.17.1

 recipes-containers/criu/criu_git.bb           |  12 +-
 ...u-Change-libraries-install-directory.patch |   6 +-
 .../0004-criu-fix-conflicting-headers.patch   | 288 ++++++++++++++++++
 ...nt-add-definition-for-FSOPEN_CLOEXEC.patch | 110 +++++++
 4 files changed, 411 insertions(+), 5 deletions(-)
 create mode 100644 recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch
 create mode 100644 recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch

-- 
2.17.1


