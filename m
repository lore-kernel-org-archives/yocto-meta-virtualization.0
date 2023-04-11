Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAFCC7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 04:07:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6080.1681186031241797840
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 21:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=phWRJVz9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3465e4339b=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33B3WBk1006442
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Apr 2023 04:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=0IhRnMAqIXmV4ILW9rZcSruwYvigxuWzGqUZfgF1nLQ=;
 b=phWRJVz9M/phsiTwh5oUtgz7ZoCPZvyoj8ccFiNnCNUapO40WCHZlM4bUbELw1lhDmor
 z8C8WqotO8ARXYceZRKWgNwxJ1O9f7CMqVLY8asp79q+cot0uaQa1gcMJWjcwbu80P9u
 jACFjv2BFSlu2/jXp6moiC2S1AQ9O9JI9sE1jkhuSuNUSW/rYz3XnMJouDcMO7nva7ys
 6a9YWpulnf0wKUNTyLql5e9lFSENkjIDiZLfZbx4SS7p36F1fcgjkp3dDjyCFIuwWh/p
 RW9GHX0cBzdCnxU3KBx50vk8aF6qfgBHYno8b3DERt0h3YxfGNENTrMZ/E83HGPT2u2I Aw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ptwg3tpj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Apr 2023 04:07:10 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 21:07:08 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 21:07:07 -0700
From: Soumya <soumya.sambu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Soumya <soumya.sambu@windriver.com>
Subject: [meta-virtualization][kirkstone][PATCH 1/1] fuse: Fix CVE-2023-26253
Date: Tue, 11 Apr 2023 04:07:03 +0000
Message-ID: <20230411040703.3632835-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IJtEAsVJURMKVMuqF4HhMTVpOYNvtxi2
X-Proofpoint-ORIG-GUID: IJtEAsVJURMKVMuqF4HhMTVpOYNvtxi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_18,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304110037
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Apr 2023 04:07:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7982

Resolve asan bug in during receive event notification (#4024)

    The fuse xlator notify function tries to assign data object to graph
    object without checking an event. In case of upcall event data object
    represents upcall object so during access of graph object the process
    crashed for asan build.

    Solution: Access the graph->id only while an event is associated
    specifically to fuse xlator

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 .../glusterfs/files/CVE-2023-26253.patch      | 76 +++++++++++++++++++
 recipes-extended/glusterfs/glusterfs.inc      |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 recipes-extended/glusterfs/files/CVE-2023-26253.patch

diff --git a/recipes-extended/glusterfs/files/CVE-2023-26253.patch b/recipes-extended/glusterfs/files/CVE-2023-26253.patch
new file mode 100644
index 00000000..828c1626
--- /dev/null
+++ b/recipes-extended/glusterfs/files/CVE-2023-26253.patch
@@ -0,0 +1,76 @@
+commit 0cbf51a9827af0e3a35f5cfa823bfa39740bbc58
+Author: mohit84 <moagrawa@redhat.com>
+Date:   Thu Mar 30 13:02:19 2023 +0530
+Subject: [PATCH] fuse: Resolve asan bug in during receive event notification
+ (#4024)
+
+    The fuse xlator notify function tries to assign data object to graph
+    object without checking an event. In case of upcall event data object
+    represents upcall object so during access of graph object the process
+    crashed for asan build.
+
+    Solution: Access the graph->id only while an event is associated
+    specifically to fuse xlator
+
+    > Fixes: #3954
+    > Change-Id: I6b2869256b26d22163879737dcf163510d1cd8bf
+    > Signed-off-by: Mohit Agrawal moagrawa@redhat.com
+    > (Reviewed on upstream link #4019)
+
+    Fixes: #3954
+    Change-Id: I6b2869256b26d22163879737dcf163510d1cd8bf
+
+CVE: CVE-2023-26253
+
+Upstream-Status: Backport [https://github.com/gluster/glusterfs/commit/0cbf51a9827af0e3a35f5cfa823bfa39740bbc58]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ xlators/mount/fuse/src/fuse-bridge.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/xlators/mount/fuse/src/fuse-bridge.c b/xlators/mount/fuse/src/fuse-bridge.c
+index c3945d7..0c01a43 100644
+--- a/xlators/mount/fuse/src/fuse-bridge.c
++++ b/xlators/mount/fuse/src/fuse-bridge.c
+@@ -6198,6 +6198,7 @@ notify(xlator_t *this, int32_t event, void *data, ...)
+     int32_t ret = 0;
+     fuse_private_t *private = NULL;
+     gf_boolean_t start_thread = _gf_false;
++    gf_boolean_t event_graph = _gf_true;
+     glusterfs_graph_t *graph = NULL;
+ 
+    private
+@@ -6205,9 +6206,6 @@ notify(xlator_t *this, int32_t event, void *data, ...)
+ 
+     graph = data;
+ 
+-    gf_log("fuse", GF_LOG_DEBUG, "got event %d on graph %d", event,
+-           ((graph) ? graph->id : 0));
+-
+     switch (event) {
+         case GF_EVENT_GRAPH_NEW:
+             break;
+@@ -6271,9 +6269,19 @@ notify(xlator_t *this, int32_t event, void *data, ...)
+         }
+ 
+         default:
++            /* Set the event_graph to false so that event
++               debug msg would not try to access invalid graph->id
++               while data object is not matched to graph object
++               for ex in case of upcall event data object represents
++               gf_upcall object
++            */
++            event_graph = _gf_false;
+             break;
+     }
+ 
++    gf_log("fuse", GF_LOG_DEBUG, "got event %d on graph %d", event,
++           ((graph && event_graph) ? graph->id : -1));
++
+     return ret;
+ }
+ 
+-- 
+2.35.5
+
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index baa8962b..e5bedca1 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -20,6 +20,7 @@ SRC_URI += "file://glusterd.init \
             file://glusterd-change-port-range.patch \
             file://configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch \
             file://0001-cli-duplicate-defns-of-cli_default_conn_timeout-and-.patch \
+            file://CVE-2023-26253.patch \
            "
 
 LICENSE = "(LGPL-3.0-or-later | GPL-2.0-only) & GPL-3.0-or-later & LGPL-3.0-or-later & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-2.1-or-later & Apache-2.0"
-- 
2.35.5


