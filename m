Return-Path: <haiqing.bai@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99ABC5DF71
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 08:57:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20644.1780390624412385717
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 01:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ykfh4Yqn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=061335ca30=haiqing.bai@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6522kduB706872
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 2 Jun 2026 01:57:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=D4sfx1dvZY2wTnAq7Ld4
	kW2pTwKpABeuhuNgg7m4oKo=; b=Ykfh4YqnVSvhbbiACEXHnCEYkBwUuhDggm3W
	98XUcG84d1PLHDZ0pkVajCTS5GguHVL0JyrjZcLS2aErSjKdwwGj67hmGgGop8bI
	aArXGscR/WEahNE7m1gH8lfXGAFnPFR3lpvmdYu+DuWRbMqMLo4knyIxUp5kzwzC
	HyIOBloxUUtnyTbK4Sl90zHPJMd/wNwfDCd/043giahUFyOMpkFo5d+SwrG5/jXL
	6fs/NnxUt/fPeP4AvnngH9dVAlyenwSvgYWMWJn1yxGyCvscKT/BLFy3XrbCB4Gh
	0dyi+v9CVtgMvwrZbyPBuRHYwtaTDLGRJDxbBtL392Oye7yypg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efydec0tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Jun 2026 01:57:03 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 2 Jun 2026 01:57:03 -0700
Received: from ala-lpd-susbld.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 2 Jun 2026 01:57:03 -0700
From: <haiqing.bai@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [wrynose][PATCH] skopeo: upgrade v1.22.0 -> v1.22.2
Date: Tue, 2 Jun 2026 08:57:03 +0000
Message-ID: <20260602085703.1137209-1-haiqing.bai@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4MyBTYWx0ZWRfX+nEu4KMb9Sfp
 R/ts24EK9nVNYjUHiqLX6h65Gocg8GVIhxWNZS/C+lHjHk+0qal5Li0WRHCIdz7Auk/80yJPK0w
 kUUofmbLB9FJzGuf7KlOk2wAYhlKs5dpTBUIihu1citJMOnZx0Vumg/iOZAZlMElzlYYwusokBg
 99Um1lcg5GyD7JY2rdLTGCQ4bh4kK6v4PhgEtze85OMOdL7Ry01JDTTwd0sVSxAwBIftuWG3uCd
 QaLYQ9J18rQUmOnl8AdeIWwmzyYh5Wwa6fIpwVPVHSRd73OyAPvpUD9JfnKdfSUfBelSqzOglX1
 OxOEq1sNCkB77BXY3IPqNurPazOAjLt6P+b110GakOXtB7Oo7hfrqVaUQtEabmBJKYnoyeDso13
 y4fvj3Oyi24nazQnq84PoVKLVVX+AvbslYFl8Ha5l1exq64QiTc2K8VHQOKvX5JLDG/ZM0u32WH
 m5IW+Vt6trRadKG7Wgg==
X-Proofpoint-GUID: G7wDo4mwucI4xlVEIqQIF8969M7jP8AU
X-Authority-Analysis: v=2.4 cv=Iq0utr/g c=1 sm=1 tr=0 ts=6a1e9adf cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=pM9yUfARAAAA:8 a=NEAV23lmAAAA:8
 a=sSw4IDWua3sdBkaz7BwA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-ORIG-GUID: G7wDo4mwucI4xlVEIqQIF8969M7jP8AU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020083
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Jun 2026 08:57:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9840

From: Haiqing Bai <haiqing.bai@windriver.com>

Bumping skopeo to version v1.22.2, which comprises the following commits:
  267465e1 [release-1.22] Bump Skopeo to 1.22.2
  fefb9971 Merge pull request #2847 from wking/proxy-validate-manifest-too
  f195baca proxy: Verify *either* toplevel or target
  81e67ab5 proxy: Move policycontext into global state
  8fd0e2e6 Merge pull request #2845 from lsm5/backport-packit-post-modifications
  3bb7f313 Packit: fix downstream post-modifications action
  e7d174ba Merge pull request #2842 from TomSweeneyRedHat/dev/tsweeney/skopeo-1.22.1
  ecdbb551 [release-1.22] Bump Skopeo to v1.22.1
  b0b024aa [release-1.20] CVE-2026-34986 gojose v4.1.4
  0bf3b382 [release-1.22] Bump google.golang.org/grpc to v1.79.3
  e5890ebb [release-1.22] Bump c/common to v0.67.1, c/image v5.39.2
  fd3ba47e Merge pull request #2800 from TomSweeneyRedHat/dev/tsweeney/skopeo-v1.22.0-1

Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>
---
 recipes-containers/skopeo/skopeo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index 74b65fe5..57477a1f 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -26,8 +26,8 @@ SRC_URI = " \
     file://0001-makefile-add-GOBUILDFLAGS-to-go-build-call.patch \
 "
 
-SRCREV = "fd3ba47e00ecb495b8eca1594c227fbb6045a8eb"
-PV = "1.22.0+git"
+SRCREV = "267465e170820673de25149378284fb352daa65e"
+PV = "1.22.2+git"
 GO_IMPORT = "import"
 
 S = "${UNPACKDIR}/git/src/github.com/containers/skopeo"
-- 
2.53.0


