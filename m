Return-Path: <Haitao.Liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F7BCD6E60
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 09:01:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24242.1780304508849740671
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 02:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IVJtngdu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0612209e35=haitao.liu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6516Ww1d2836487
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 1 Jun 2026 09:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=9ZH4QhqvABAhAfEoLvJn
	wjIiN9yu0royY+IJKBIy9Cw=; b=IVJtngduAJ9x9jZLY8ca+Mk6CEpk8WUtUYri
	bqbGxwx6pCh90fiuiWAaZiM63nVgkLMBc/r0Ev4nFaJzNN+4L3mlab2xKSTzG6fo
	b5HIO8m+J0OaQ4BHOUSTbpMHpsEVXZJr2qaOaA1HzY7/vlxB4Rk/7pJOWiLCnPn9
	6ePGR+UoFimb4Ha/cXP2uLhVxe9tfkiDxkHst8d7eisxWg36iGbK9BcPdV1gCPLN
	jUTcVVhSaxLmmf3YpLyKgUuPyYByeBb4qvTRrVZy4WfTZHWm0yok5ne0yih63TiE
	W8Uo6b0wvInrqazs2dvBZunMRA3ObTkZnKotdQS6fcd/t5Yd0A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efn402tyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Jun 2026 09:01:47 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Jun 2026 02:01:46 -0700
Received: from pek-lpd-susbld.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Jun 2026 02:01:46 -0700
From: Haitao Liu <haitao.liu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][wrynose][PATCH 1/2] openvswitch: update to 3.7.1
Date: Mon, 1 Jun 2026 17:01:44 +0800
Message-ID: <20260601090145.412741-1-haitao.liu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TmdovZ84_PhJrki6NdMnw0rBB2-sty1Q
X-Proofpoint-GUID: TmdovZ84_PhJrki6NdMnw0rBB2-sty1Q
X-Authority-Analysis: v=2.4 cv=GI441ONK c=1 sm=1 tr=0 ts=6a1d4a7b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=8Ad4tvYqdmIA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=qKcERC-KJPmDvOPJjfUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5MCBTYWx0ZWRfX+74EmfxWxHRC
 fuPjrp9eVE3Plb4sTTRPHKijUahxUVsYj4d6lbAD8J+qALGl4+pQtarZZko760udcp+tetna0Nf
 U3ofn9oFBhZlbaF0zTzVGjjQkUPMdH0983f3dv590I+4ZipGKx5e4Uc4n0g8doQ0H2vOIuAAMan
 yxBroAefSE65VuDWhFZyT40gSRotYr7pm3y2xrZWY2Cw6db4Jps4SVbGlEAoFF8Q6Rymv2UW59P
 6HBukOZt7445cOPIGYMqKGkbvtCNGzl8tc/7VfQQHfKyuWa4b8sm9N0XZXpLEiYj/fp3bQ16hmL
 QzBuBMG8ViZKVFih2Qy/0QwL1TKb2NDoWMyP9UdU8A/PT8EPQoxJPQyw5hmCogEjtC+mtQjzxWS
 VmACqolfaoP5Cyh3JWpNaHE4NfRSuwAMXzQM1GW4oSkfv/PQRWU7P36D6dsRwl4Q0Za4XsswWef
 TDKEKti7YLdkCjUgrdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010090
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Jun 2026 09:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9834

pick up the following commits:

    7921d9c69 Set release date for 3.7.1.
    e1b82e9b7 github: Temporarily disable system tests for DPDK and AF_XDP.
    a9785c7e1 conntrack: Fix replace_substring to handle larger packets.
    7dc6fb7ba Update DPDK version for older releases to 23.11.6 and 24.11.4.

Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
---
 recipes-networking/openvswitch/openvswitch_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 87790090..8dcb7ca4 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -13,12 +13,12 @@ RDEPENDS:${PN}-ptest += "\
 	python3-resource findutils which diffutils \
 	"
 
-PV = "3.7.0"
+PV = "3.7.1"
 CVE_VERSION = "3.5.0"
 
 FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "0d4c78e153d2b22ab1b173cd4a4dfff89002666d"
+SRCREV = "7921d9c6924b8934ea1de9481891ac1172649280"
 SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-3.7 \
             file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
             file://run-ptest \
-- 
2.34.1


