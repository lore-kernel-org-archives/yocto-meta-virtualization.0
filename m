Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4C4D0E6F4
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 11:23:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.44042.1729509826091670302
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Oct 2024 04:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00248022cd=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L5shdY024309
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Oct 2024 04:23:45 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42cc9kskn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Oct 2024 04:23:45 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 04:23:44 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.43) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 04:23:44 -0700
From: Bin Lan <bin.lan.cn@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <bin.lan.cn@windriver.com>
Subject: [master][PATCH] openvswitch: fix ptest contains reference to TMPDIR [buildpaths]
Date: Mon, 21 Oct 2024 19:23:43 +0800
Message-ID: <20241021112343.2793593-1-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ZYlPNdVA c=1 sm=1 tr=0 ts=671639c1 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=hnRdJ6PsVTKlZm_PyUUA:9 a=sW1p7kEjCT4jo0F3RiTX:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: qoPq45DSu_hKA12_i5ks7diNeNlOuFQA
X-Proofpoint-ORIG-GUID: qoPq45DSu_hKA12_i5ks7diNeNlOuFQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-21_08,2024-10-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 adultscore=0 impostorscore=0 mlxlogscore=862
 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410210081
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Oct 2024 11:23:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8933

The EGREP in ptest/tests/atlocal contains the build paths.
The CFLAGS in ptest/tests/atlocal contains the build paths.
This change set fixs:
 - set EGREP to "grep -E" in ptest/tests/atlocal
 - set CFLAGS to " " in ptest/tests/atlocal
by updating the patch
openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch.

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
---
 ...est-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
index 571753a5..abad1458 100644
--- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
@@ -16,6 +16,13 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
 refresh patch to fix patch-fuzz warning
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
+Refresh patch to fix file ptest/tests/atlocal 
+contains reference to TMPDIR [buildpaths]. The fix is:
+ - set EGREP to "grep -E" in ptest/tests/atlocal
+ - set CFLAGS to " " in ptest/tests/atlocal
+
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+
 Upstream-Status: Inappropriate [embedded specific]
 ---
  Makefile.am |  1 +
@@ -37,7 +44,7 @@ new file mode 100644
 index 0000000..0b4587c
 --- /dev/null
 +++ b/test.mk
-@@ -0,0 +1,74 @@
+@@ -0,0 +1,76 @@
 +TEST_DEST ?= ${prefix}/lib/openvswitch
 +TEST_ROOT ?= ${prefix}/lib/openvswitch
 +TEST_DEPEND =
@@ -112,3 +119,5 @@ index 0000000..0b4587c
 +	sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
 +	sed -i 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
 +	sed -i 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
++	sed -i 's|EGREP=.*|EGREP='"'"'grep -E'"'"'|g' $(TEST_DEST)/tests/atlocal
++	sed -i 's|CFLAGS=.*|CFLAGS='"'"' '"'"'|g' $(TEST_DEST)/tests/atlocal
-- 
2.34.1


