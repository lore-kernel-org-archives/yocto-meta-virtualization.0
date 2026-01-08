Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D00DD148A7
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.935.1767853592886972171
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hdQHcx8C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084viFJ2258636
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=7ADGOtmolFswYC0LSKrw
	7n1p8GlRxWPiqBhrkPkU+/c=; b=hdQHcx8C6J5C9fLIW6vPcdB5bwWyS6iq3pmh
	La5DmRatIfwe02p47TxHQ+9sZ9x0H76d1B/KK5DDqw/MeUGaPJx/t7ImNwwiFs1H
	P9Zm7etpIQPzB9PEek40+XNmLhupNl5SC8JsLEaP/OqqRzoUWYcS+E+34JhWWabf
	ES0XhMMpdw2FS52pBYPjfdxceb+zBHsevYmlZRpCjER0PL4gCHKp6dqP3VU9V09N
	f86ZQBoH5KRuQZXLz8ahmcf/eF/Cm9E6nuDMZzP4L/hDZleOoMoIaPX+LHUnDKxm
	MtacVAbjIUiguNXUXjYC+JM01vNs/cqFDNRrImKEl8FUIueirQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4beravd29m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:31 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:30 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:29 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 00/15] set go buildid to empty for improving reproducibility
Date: Thu, 8 Jan 2026 14:26:13 +0800
Message-ID: <20260108062628.3636344-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfX8tx1q8y5Sqm9
 sx43O2lTrFdRbQiyXMxG7rVeoLx1I8C4tZveS++PapvTzYybfRKlWE/aI+oZq7PvPOpsbgeRWo8
 0BmhhWCzLHaAM9V+Dydg0pzVuVCcVjvSWijDGwqx6zHmYQmFjVV8Z3IgXXde/LMkzSkrFswQaPw
 Q0oJMcFlSAZmIbrBZSxpMe/dA3RUHEQEheUYezVwsujHs8TujKEMHZRLA7RoVsvyM4Cd7336NaW
 MbO+aCiQKFuQWsEaLqxvOa7ws553mL85Fhbz1koBuHQjp8ir5FeZ21logj9rI4S9O6G/6616nLm
 2d1xGGGOATEdIQ0m/ufocwuzVABVkPt4as1bl43kV4JEEZeBG+x1J1LagmG0xHJ4Bd1KNI7fROK
 2CcTyzfqY0YrkNgCLyCGJqxRuQxJgT3b2wmYotCdkLTFFYD+rGIIYyOOEFy550U1+5mVBQHWXGI
 IHfZz6MKENDQCRUGx4w==
X-Proofpoint-GUID: YOiWGFhjKlq4YdcDdPPnLT2J7UiV70dL
X-Proofpoint-ORIG-GUID: YOiWGFhjKlq4YdcDdPPnLT2J7UiV70dL
X-Authority-Analysis: v=2.4 cv=PZjyRyhd c=1 sm=1 tr=0 ts=695f4e17 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=R_0Yjfb5h9xnYQY4wU8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9531

From: Changqing Li <changqing.li@windriver.com>

These series of patches are mostly set buildid to empty for improving
reproducibility, I also send a patch to oe-core with subject: 
[PATCH V3] go.bbclass: set buildid to empty string to improve reproducibility

which add -buildid= in default GO_LDFLAGS, but since packages compiled
with go may not use GO_LDFLAGS in go.bbclass, they can have their own
Makefiles, define their own variables for passing ldflags, so change
them one by one.

podman also disable buildvcs

Changqing Li (15):
  docker-compose: set go buildid to empty for improving reproducibility
  docker: set go buildid to empty for improving reproducibility
  kubernetes: set go buildid to empty for improving reproducibility
  nerdctl: set go buildid to empty for improving reproducibility
  runc: set go buildid to empty for improving reproducibility
  skopeo: set go buildid to empty for improving reproducibility
  umoci: set go buildid to empty for improving reproducibility
  cni: update GO_EXTRA_LDFLAGS
  oci-image-tools: set go buildid to empty for improving reproducibility
  docker-distribution: set go buildid to empty for improving
    reproducibility
  containerd: set go buildid to empty for improving reproducibility
  cri-o: set go buildid to empty for improving reproducibility
  cri-tools: set go buildid to empty for improving reproducibility
  oci-runtime-tools: set go buildid to empty for improving
    reproducibility
  podman: improve reproducibility

 .../containerd/containerd_git.bb              |  1 +
 recipes-containers/cri-o/cri-o_git.bb         |  1 +
 recipes-containers/cri-tools/cri-tools_git.bb |  2 +-
 .../docker-compose/docker-compose_git.bb      |  4 +-
 .../docker-distribution_git.bb                |  2 +
 ...01-Makefile-remove-duplicate-ldflags.patch | 39 +++++++++++++++++++
 recipes-containers/docker/docker.inc          |  2 +
 .../kubernetes/kubernetes_git.bb              |  2 +-
 recipes-containers/nerdctl/nerdctl_git.bb     |  1 +
 .../0001-Makefile-add-EXTRA_LDFLAGS.patch     | 39 +++++++++++++++++++
 .../oci-image-tools/oci-image-tools_git.bb    |  5 ++-
 .../0001-Makefile-add-EXTRA_LDFLAGS.patch     | 33 ++++++++++++++++
 .../oci-runtime-tools_git.bb                  |  2 +
 recipes-containers/podman/podman_git.bb       |  4 +-
 recipes-containers/runc/runc.inc              |  1 +
 recipes-containers/skopeo/skopeo_git.bb       |  2 +-
 recipes-containers/umoci/umoci_git.bb         |  4 +-
 recipes-networking/cni/cni_git.bb             |  4 +-
 18 files changed, 138 insertions(+), 10 deletions(-)
 create mode 100644 recipes-containers/docker-distribution/files/0001-Makefile-remove-duplicate-ldflags.patch
 create mode 100644 recipes-containers/oci-image-tools/files/0001-Makefile-add-EXTRA_LDFLAGS.patch
 create mode 100644 recipes-containers/oci-runtime-tools/files/0001-Makefile-add-EXTRA_LDFLAGS.patch

-- 
2.34.1


