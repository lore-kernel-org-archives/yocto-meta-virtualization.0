Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797E4C04FFE
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 02:54:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5718.1715741674999968753
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 May 2024 19:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58658d6849=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44EME6oK018472;
	Wed, 15 May 2024 02:54:34 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yn53n3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 May 2024 02:54:34 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 14 May 2024 19:54:32 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 14 May 2024 19:54:31 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <patrick.wicki@siemens.com>
Subject: [PATCH] netavark: Make ptest run
Date: Wed, 15 May 2024 10:54:30 +0800
Message-ID: <20240515025431.3049144-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <17C92B9B397D8953.1247@lists.yoctoproject.org>
References: <17C92B9B397D8953.1247@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xRdDpL3ho9Foqj7V79IhXwtStD2brjfy
X-Proofpoint-ORIG-GUID: xRdDpL3ho9Foqj7V79IhXwtStD2brjfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_16,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150019
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 May 2024 02:54:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8724

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  # ./run-ptest
  /tmp/bats-run-ELGGaA/bats.18820.src: line 5: To: command not found
  1..1
  not ok 1 bats-gather-tests
  # (in test file test/README.md, line 5)
  #   `To run the tests locally in your sandbox, you can use one of these methods:' failed with status 127

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-containers/netavark/files/run-ptest | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/netavark/files/run-ptest b/recipes-containers/netavark/files/run-ptest
index 7e017ae2..f6f90b15 100644
--- a/recipes-containers/netavark/files/run-ptest
+++ b/recipes-containers/netavark/files/run-ptest
@@ -5,4 +5,10 @@ shopt -s extglob
 # Skip the plugin tests because those example plugins are built only while
 # running cargo test and for this to work as a ptest they would need to be cross
 # compiled and installed as part of the ptest.
-NETAVARK=/usr/libexec/podman/netavark bats test/!(*-plugin.bats)
+for i in `ls test`; do
+     if [ $i == "200-bridge-firewalld.bats" ] || [ $i == "500-plugin.bats" ] ; then
+         continue
+     fi
+     [ ${i: -4 -1} == ".bats" ] && NETAVARK=/usr/libexec/podman/netavark bats test/$i
+done
+
-- 
2.25.1


