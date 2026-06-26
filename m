Return-Path: <Sandeep.J@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9A2CDE010
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 05:01:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28806.1782450100952963053
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 22:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=K4y6B1vL;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild12.wrs.com, ip: 205.220.166.238, mailfrom: prvs=06372738ae=sj10@oak-lpgbuild12.wrs.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q4SqZv2913851
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Jun 2026 22:01:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=hSMw/xJdD
	w4Ck0VWe2J4YHPi85BSxXMtlqZxvDu1X7k=; b=K4y6B1vLGv37zx0PB9olFwNHt
	8L4ZjxaC7orDuXKamIqV4i4MAM9pSS3ZFq03SHazuvLfxgv//0mE0CKmm0bumJKE
	g99+dqTo7hyJfs7bjQ6WjEF6SJarpoyTFkfpVOdzDAXmAH10kricH/h7T1QUCZ5I
	A2OD3OTx3o/n33ryTY6yoFIP3sVfzWJVrY3bjah4Jv0VW/yaTavuV9UUtiiJyUpT
	IYY3kDUvKpZ84iJKlh1BLp8fxVEvdxDwyL4kBxbxmfB2B9/UOJ+zvLuLqAS6+LX4
	xj+KLSwD0tasu+zgoZXNE7nVXb3p27GZgC4m9ok4xrMYzZyFRLtVlq4B6xfvg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f1exk85rt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Jun 2026 22:01:40 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 25 Jun 2026 22:01:39 -0700
Received: from oak-lpgbuild12.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 25 Jun 2026 22:01:39 -0700
Received: by oak-lpgbuild12.wrs.com (Postfix, from userid 1762445396)
	id 8D1983900BBB; Fri, 26 Jun 2026 05:01:39 +0000 (UTC)
From: Sandeep J <Sandeep.J@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <Shiva.Komati@windriver.com>, <Randy.MacLeod@windriver.com>,
        Sandeep J
	<Sandeep.J@windriver.com>
Subject: [meta-virtualization][m-c-s][PATCH] Documentation/README: fix broken URLs in meta-openstack and puppet
Date: Fri, 26 Jun 2026 05:01:39 +0000
Message-ID: <20260626050139.3401173-1-Sandeep.J@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: sS0oJON3FTTdeRTeBg33KzIp8gAD0oX1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAzNyBTYWx0ZWRfX0NZMB7lsbqR9
 hls/EOJ8uNBA2pJILZIKXQR/Ghn6pjYo+anzx0IUZZxE4GVvJEHQg3SPGUetOROKzgAr56eUYWv
 vCVj85KzTmPQctDRG6Su86gHrYSlOUFn7Sg/rhXwBBG1lITvVVlj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAzNyBTYWx0ZWRfX0wKnSgIWsWsB
 DckpmYuI699J3OT4/A/hRD3nPnBQ/gIkP4a2+YQHNrRMFBDLgu5iuGmLvrBpY4G4DV8LuwoJlNz
 Tt0xur9An3AjH+fkADLWsi2wi1Ir36HCI0tenmSLArWazK3gXXy3f8EKylGEZ4SD2s2NHS3u0pG
 tZrvpUIJsDw1lGrfTF5/QpriA4o5IH2XSOIWdvW+G3mQFX0Mqe02wSDZrdTJEVXazDsqWMdD31q
 nPdM3LSRC/UoAyaEFctjNirSeybpkVImysS7dWdijyTtpH2VQdOt7rsPQVPntNdwGaM3hJl966/
 KHLgrNypNzKI1N7yL8LGGfRl5a92xC0gzjEkSmVdyaN1UShmmKRNGwNyiZxHsGNZpWCNxolJ6D5
 lp+01oWWJGFH4qrzba4veD6KlJ3Xb3rYdJbU++dn3FWwlYP5LaVbwr84AvUUphqsg8x3ANpErGI
 UD7S1IPELJihtuNBVdQ==
X-Proofpoint-GUID: sS0oJON3FTTdeRTeBg33KzIp8gAD0oX1
X-Authority-Analysis: v=2.4 cv=NLLlPU6g c=1 sm=1 tr=0 ts=6a3e07b4 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=4u6H09k7AAAA:8 a=B_olCF5PAAAA:8 a=qjkT5h8hAAAA:8
 a=rxDX-_zBAAAA:8 a=NEAV23lmAAAA:8 a=_11zgxYGAAAA:8 a=t7CeM3EgAAAA:8
 a=-AMOOKU90ICpl4cWuI4A:9 a=5yerskEF2kbSkDMynNst:22 a=bKotK0tb0Zdhfv-iQwbr:22
 a=Ksf4zlvzGq4cKnU86lR1:22 a=4eVTqFGykFGrGitcmxkL:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260037
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jun 2026 05:01:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9905

Replace dead/moved URLs in README.trove, README.swift,
README.networking_flat, README.networking_vlan, README.ceph-openstack,
and puppet/README with current working links.

Signed-off-by: Sandeep J <Sandeep.J@windriver.com>
---
 meta-openstack/Documentation/README.ceph-openstack  | 2 +-
 meta-openstack/Documentation/README.networking_flat | 2 +-
 meta-openstack/Documentation/README.networking_vlan | 2 +-
 meta-openstack/Documentation/README.swift           | 4 ++--
 meta-openstack/Documentation/README.trove           | 2 +-
 recipes-support/puppet/README                       | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-openstack/Documentation/README.ceph-openstack b/meta-openstack/Documentation/README.ceph-openstack
index 11348375..44d24f57 100644
--- a/meta-openstack/Documentation/README.ceph-openstack
+++ b/meta-openstack/Documentation/README.ceph-openstack
@@ -572,4 +572,4 @@ Hello World
 Additional References
 =====================
 
-* https://ceph.com/docs/master/rbd/rbd-openstack/
+* https://docs.ceph.com/en/latest/rbd/rbd-openstack/
\ No newline at end of file
diff --git a/meta-openstack/Documentation/README.networking_flat b/meta-openstack/Documentation/README.networking_flat
index ab18f6f5..c44968c6 100644
--- a/meta-openstack/Documentation/README.networking_flat
+++ b/meta-openstack/Documentation/README.networking_flat
@@ -246,4 +246,4 @@ root@compute:~# ovs-vsctl show
 
 References
 ----------
-http://developer.rackspace.com/blog/neutron-networking-simple-flat-network.html
\ No newline at end of file
+http://docs.openstack.org/neutron/latest/admin/intro-basic-networking.html
\ No newline at end of file
diff --git a/meta-openstack/Documentation/README.networking_vlan b/meta-openstack/Documentation/README.networking_vlan
index 6d48e2b6..afb93436 100644
--- a/meta-openstack/Documentation/README.networking_vlan
+++ b/meta-openstack/Documentation/README.networking_vlan
@@ -379,4 +379,4 @@ root@compute:~# ovs-vsctl show
 
 References
 ----------
-http://developer.rackspace.com/blog/neutron-networking-vlan-provider-networks.html
\ No newline at end of file
+http://docs.openstack.org/neutron/latest/admin/intro-basic-networking.html
\ No newline at end of file
diff --git a/meta-openstack/Documentation/README.swift b/meta-openstack/Documentation/README.swift
index 0945ed30..af333c83 100644
--- a/meta-openstack/Documentation/README.swift
+++ b/meta-openstack/Documentation/README.swift
@@ -428,5 +428,5 @@ References
 ==========
 
 * http://docs.openstack.org/developer/swift/deployment_guide.html
-* http://docs.openstack.org/grizzly/openstack-compute/install/yum/content/ch_installing-openstack-object-storage.html
-* https://swiftstack.com/openstack-swift/architecture/
+* https://docs.openstack.org/swift/rocky/install/index.html
+* https://docs.openstack.org/swift/latest/install/index.html
\ No newline at end of file
diff --git a/meta-openstack/Documentation/README.trove b/meta-openstack/Documentation/README.trove
index cdbfb583..ce7d2a99 100644
--- a/meta-openstack/Documentation/README.trove
+++ b/meta-openstack/Documentation/README.trove
@@ -72,5 +72,5 @@ References
 
  * https://github.com/openstack/python-troveclient
  * https://github.com/openstack/trove
- * https://wiki.openstack.org/wiki/TrovArchitecture
+ * https://wiki.openstack.org/wiki/TroveArchitecture
  * https://wiki.openstack.org/wiki/Trove
diff --git a/recipes-support/puppet/README b/recipes-support/puppet/README
index 8befb157..bff0c8b7 100644
--- a/recipes-support/puppet/README
+++ b/recipes-support/puppet/README
@@ -16,7 +16,7 @@ The json gem (any modern version)
     Over time, it became a requirement and was even included in the
     puppet-agent package, but it was limited by its original design.
 
-    https://puppet.com/docs/puppet/4.10/hiera_intro.html
+    https://help.puppet.com/core/current/Content/PuppetCore/hiera_intro.htm
 
 Simple Demo
 ------------------------

