Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA92C8303C
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 11:37:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11832.1752233848609724938
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 04:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9287d3c5d5=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAfLAj019156
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Jul 2025 11:37:27 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pu19pegx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Jul 2025 11:37:27 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 11 Jul 2025 04:36:54 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 11 Jul 2025 04:37:24 -0700
From: <archana.polampalli@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][kirkstone][PATCH 1/1] cri-o: fix CVE-2023-6476
Date: Fri, 11 Jul 2025 17:07:22 +0530
Message-ID: <20250711113722.3012181-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: x0xknK_bk83_Iq3BVbmgKjETx7BJ8A_x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX0QQ7eUtNZC5M FI5Ekf1c+BkcFjjgr93vRHErta0YO9hehF/EVAByURYfW8eWk+avtNMPOd1kg9NbL9eEbsyd60f 9uEOHdjBJ5/2gHA42JiExf6+T79jKJUtjC5WHl7COdFN+iz5DPAG99NaFSUA3r3j3RYoNs43cbz
 0l7RLUJnU1+asxXtrcph45uxy2H9X0oeVgfrEXWKJ9MULherpj3x9eOrq0S8LI58I7VSzfeh3ld 9xCW70TgekVG3x2mTOieiIWIBEPfzHgwL3FzEN0d3UarS1hRWv1aVrlbuLPk8ViG+pM7OaV+0L5 FEzdlJgImRThwtYnH+mvnIvFtZCq8AYInsjal18vyOBn5EZ6HL0abLECU7dYrWS27+v9oCGH7mj ZVlFEvhg
X-Authority-Analysis: v=2.4 cv=ZrntK87G c=1 sm=1 tr=0 ts=6870f777 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Ljcx4Z80PikA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=MN1ovHSWzmgJSW-8GT0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: x0xknK_bk83_Iq3BVbmgKjETx7BJ8A_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1011 adultscore=0
 phishscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Jul 2025 11:37:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9306

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in CRI-O that involves an experimental annotation leading to a
container being unconfined. This may allow a pod to specify and get any amount
of memory/cpu, circumventing the kubernetes scheduler and potentially resulting
in a denial of service in the node.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb         |  1 +
 .../cri-o/files/CVE-2023-6476.patch           | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 recipes-containers/cri-o/files/CVE-2023-6476.patch

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 429c49a7..1e8353f8 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -20,6 +20,7 @@ SRC_URI = "\
 	file://0001-Makefile-force-symlinks.patch \
         file://crio.conf \
         file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage \
+        file://CVE-2023-6476.patch;patchdir=src/import \
 	"
 
 # Apache-2.0 for docker
diff --git a/recipes-containers/cri-o/files/CVE-2023-6476.patch b/recipes-containers/cri-o/files/CVE-2023-6476.patch
new file mode 100644
index 00000000..baa3bb54
--- /dev/null
+++ b/recipes-containers/cri-o/files/CVE-2023-6476.patch
@@ -0,0 +1,61 @@
+From 5faee5d82556a6bf4dd1144d2a86e70d097ab200 Mon Sep 17 00:00:00 2001
+From: Peter Hunt <pehunt@redhat.com>
+Date: Thu, 7 Dec 2023 16:07:12 -0500
+Subject: [PATCH] allowed annotations: correctly filter prefixed annotations
+
+without this fix, a pod is able to gain access to experimental annotations that are prefixes of container names.
+The most problematic of these is io.kubernetes.cri-o.UnifiedCgroup, which allows a user to arbitrarily
+change the resources of the pod, potentially leading to OOM.
+
+Fixes CVE-2023-6476
+
+Signed-off-by: Peter Hunt <pehunt@redhat.com>
+
+CVE: CVE-2023-6476
+
+Upstream-Status: Backport [https://github.com/cri-o/cri-o/commit/5faee5d82556a6bf4dd1144d2a86e70d097ab200]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ pkg/config/workloads.go |  2 +-
+ test/workloads.bats     | 15 +++++++++++++++
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/pkg/config/workloads.go b/pkg/config/workloads.go
+index d5eeaf1ef..37a22fe76 100644
+--- a/pkg/config/workloads.go
++++ b/pkg/config/workloads.go
+@@ -102,7 +102,7 @@ func (w Workloads) FilterDisallowedAnnotations(allowed []string, toFilter map[st
+	for ann := range toFilter {
+		for _, d := range disallowed {
+			if strings.HasPrefix(ann, d) {
+-				delete(toFilter, d)
++				delete(toFilter, ann)
+			}
+		}
+	}
+diff --git a/test/workloads.bats b/test/workloads.bats
+index 6102d6326..0f4d6e4f0 100644
+--- a/test/workloads.bats
++++ b/test/workloads.bats
+@@ -327,3 +327,18 @@ function check_conmon_fields() {
+	df=$(crictl exec --sync "$ctr_id" df | grep /dev/shm)
+	[[ "$df" == *'16384'* ]]
+ }
++
++@test "test workload pod should not be set if annotation not specified even if prefix" {
++	start_crio
++
++	jq '   .annotations["io.kubernetes.cri-o.UnifiedCgroup.podsandbox-sleep"] = "memory.max=4294967296" |
++	  .labels["io.kubernetes.container.name"] = "podsandbox-sleep"' \
++	"$TESTDATA"/sandbox_config.json > "$sboxconfig"
++
++	jq '   .annotations["io.kubernetes.cri-o.UnifiedCgroup.podsandbox-sleep"] = "memory.max=4294967296" |
++	  .labels["io.kubernetes.container.name"] = "podsandbox-sleep"' \
++	"$TESTDATA"/container_sleep.json > "$ctrconfig"
++
++	ctr_id=$(crictl run "$ctrconfig" "$sboxconfig")
++	[[ $(crictl exec "$ctr_id" cat /sys/fs/cgroup/memory.max) != 4294967296 ]]
++}
+--
+2.40.0
-- 
2.40.0


