Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3D2C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 10:04:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7316.1743761076747823795
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Apr 2025 03:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=618979b84a=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5348diis023846
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 4 Apr 2025 03:04:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg1ua31d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Apr 2025 03:04:35 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 4 Apr 2025 03:04:33 -0700
From: yurade <yogita.urade@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][kirkstone][PATCH 1/1] ceph: fix CVE-2023-43040
Date: Fri, 4 Apr 2025 10:04:09 +0000
Message-ID: <20250404100409.3558585-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: a4WHRnep16tnqekNM-D0ZyZ8ZXi88HH5
X-Authority-Analysis: v=2.4 cv=Aqnu3P9P c=1 sm=1 tr=0 ts=67efaeb4 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Ljcx4Z80PikA:10 a=HCiNrPZc1L8A:10 a=XR8D0OoHHMoA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=4u6H09k7AAAA:8
 a=t7CeM3EgAAAA:8 a=KFlg1KZOAAAA:8 a=I6RE4me7PPpNF2afBxEA:9 a=5yerskEF2kbSkDMynNst:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: a4WHRnep16tnqekNM-D0ZyZ8ZXi88HH5
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504040068
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Apr 2025 10:04:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9200

From: Yogita Urade <yogita.urade@windriver.com>

IBM Spectrum Fusion HCI 2.5.2 through 2.7.2 could allow an
attacker to perform unauthorized actions in RGW for Ceph due
to improper bucket access. IBM X-Force ID: 266807.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-43040

Upstream patch:
https://github.com/ceph/ceph/commit/98bfb71cb38899333deb58dd2562037450fd7fa8

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../ceph/ceph/CVE-2023-43040.patch            | 56 +++++++++++++++++++
 recipes-extended/ceph/ceph_15.2.17.bb         |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 recipes-extended/ceph/ceph/CVE-2023-43040.patch

diff --git a/recipes-extended/ceph/ceph/CVE-2023-43040.patch b/recipes-extended/ceph/ceph/CVE-2023-43040.patch
new file mode 100644
index 00000000..18fca583
--- /dev/null
+++ b/recipes-extended/ceph/ceph/CVE-2023-43040.patch
@@ -0,0 +1,56 @@
+From 98bfb71cb38899333deb58dd2562037450fd7fa8 Mon Sep 17 00:00:00 2001
+From: Joshua Baergen <jbaergen@digitalocean.com>
+Date: Wed, 17 May 2023 12:17:09 -0600
+Subject: [PATCH] rgw: Fix bucket validation against POST policies
+
+It's possible that user could provide a form part as a part of a POST
+object upload that uses 'bucket' as a key; in this case, it was
+overriding what was being set in the validation env (which is the real
+bucket being modified). The result of this is that a user could actually
+upload to any bucket accessible by the specified access key by matching
+the bucket in the POST policy in said POST form part.
+
+Fix this simply by setting the bucket to the correct value after the
+POST form parts are processed, ignoring the form part above if
+specified.
+
+Fixes: https://tracker.ceph.com/issues/63004
+
+Signed-off-by: Joshua Baergen <jbaergen@digitalocean.com>
+
+CVE: CVE-2023-43040
+Upstream-Status: Backport [https://github.com/ceph/ceph/commit/98bfb71cb38899333deb58dd2562037450fd7fa8]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/rgw/rgw_rest_s3.cc | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/rgw/rgw_rest_s3.cc b/src/rgw/rgw_rest_s3.cc
+index cb026714..40b4ff92 100644
+--- a/src/rgw/rgw_rest_s3.cc
++++ b/src/rgw/rgw_rest_s3.cc
+@@ -2735,10 +2735,6 @@ int RGWPostObj_ObjStore_S3::get_params()
+
+   map_qs_metadata(s);
+
+-  ldpp_dout(this, 20) << "adding bucket to policy env: " << s->bucket.name
+-		    << dendl;
+-  env.add_var("bucket", s->bucket.name);
+-
+   bool done;
+   do {
+     struct post_form_part part;
+@@ -2789,6 +2785,10 @@ int RGWPostObj_ObjStore_S3::get_params()
+     env.add_var(part.name, part_str);
+   } while (!done);
+
++  ldpp_dout(this, 20) << "adding bucket to policy env: " << s->bucket.name
++                    << dendl;
++  env.add_var("bucket", s->bucket.name);
++
+   string object_str;
+   if (!part_str(parts, "key", &object_str)) {
+     err_msg = "Key not specified";
+--
+2.40.0
diff --git a/recipes-extended/ceph/ceph_15.2.17.bb b/recipes-extended/ceph/ceph_15.2.17.bb
index 9fb2e722..4f32db0e 100644
--- a/recipes-extended/ceph/ceph_15.2.17.bb
+++ b/recipes-extended/ceph/ceph_15.2.17.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://ceph.conf \
            file://0001-cmake-add-support-for-python3.10.patch \
            file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
+           file://CVE-2023-43040.patch \
 "
 
 SRC_URI[sha256sum] = "d8efe4996aeb01dd2f1cc939c5e434e5a7e2aeaf3f659c0510ffd550477a32e2"
-- 
2.40.0


