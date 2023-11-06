Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2486EC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 14:51:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.56480.1699282291521774109
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 06:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DzffrMK8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96743c33b2=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A6BXnD0005594
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 6 Nov 2023 14:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=/uWyUEUl2/R4SRpjiKEdz9xXVTTcKEJMcFu5BavJANc=; b=
	DzffrMK8Xdlt0KpcuJs49Kv/ruxjPEmSWPZ6hOkolhgSXWShSIxNTxxIDluOxjyM
	7/EVCNHdHjCNFwLX2rYdwkgco5Q+RefTeZcLDXZ3cLRPnQCVZDVSi8bMBiKMS1hq
	tsG1E2Q559gx6+yWcx0q/mcmTL0mjNCw9ZzRGrK6DASnR0NcCnVrscPMmmNKlmIj
	DDgiX2MGbP8XRl6C2fPKDo4yIZJ6TQrmm9ZBaiNKqhruvYfCDhdjTardXiJGAREQ
	VpdCXbKQwlDI82OpNF36dLfwxSEDJyCMRQrECtDXaHrJYT4Mrc9i4b0WQuLT2q3x
	B3/aspX6DwLiyFnbF5ZLHg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u5cx69q0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Nov 2023 14:51:30 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 06:51:31 -0800
From: nmali <narpat.mali@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][kirkstone][PATCH 2/2] python3-ansible: Add locale-base-en-us to RDEPENDS
Date: Mon, 6 Nov 2023 14:51:06 +0000
Message-ID: <20231106145106.2671320-2-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231106145106.2671320-1-narpat.mali@windriver.com>
References: <20231106145106.2671320-1-narpat.mali@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: XMAWjZ4PpzrKzev1gcJaEpckQmI_wDcz
X-Proofpoint-ORIG-GUID: XMAWjZ4PpzrKzev1gcJaEpckQmI_wDcz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_12,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=967 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2310240000 definitions=main-2311060119
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Nov 2023 14:51:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8427

From: Narpat Mali <narpat.mali@windriver.com>

Fixes:
   # export LANG='en_US.UTF-8'
   # ansible --version
   ERROR: Ansible requires the locale encoding to be UTF-8; Detected None.

  #  python3
  Python 3.10.9 (main, Dec  6 2022, 18:44:57) [GCC 11.3.0] on linux
  Type "help", "copyright", "credits" or "license" for more information.
  >>> import locale
  >>> locale.setlocale(locale.LC_CTYPE, ("en_US", "UTF-8"))
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
    File "/usr/lib64/python3.10/locale.py", line 620, in setlocale
      return _setlocale(category, locale)
  locale.Error: unsupported locale setting
  >>>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Upstream master commit:
https://git.yoctoproject.org/meta-cloud-services/commit/?id=cd048e11c4600636714051c787264a52be19c3f8

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 recipes-devtools/python/python3-ansible_2.14.11.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python3-ansible_2.14.11.bb b/recipes-devtools/python/python3-ansible_2.14.11.bb
index ea0fdbe5..f3ab2377 100644
--- a/recipes-devtools/python/python3-ansible_2.14.11.bb
+++ b/recipes-devtools/python/python3-ansible_2.14.11.bb
@@ -1,7 +1,11 @@
 inherit setuptools3
 require python-ansible.inc
 
-RDEPENDS:${PN} += "python3-pyyaml python3-jinja2 python3-modules"
+RDEPENDS:${PN} += "python3-pyyaml \
+    python3-jinja2 \
+    python3-modules \
+    locale-base-en-us \
+"
 
 SRC_URI += " \
     file://python3-ensure-py-scripts-use-py3-for-shebang.patch \
-- 
2.40.0


