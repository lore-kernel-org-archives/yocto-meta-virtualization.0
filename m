Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6BBC77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:12:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5653.1684995124471244364
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 May 2023 23:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4509f271df=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34P5pfUo003694
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 25 May 2023 06:12:03 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpkn1mtfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 25 May 2023 06:12:03 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 23:12:02 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 23:12:01 -0700
From: <mingli.yu@eng.windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-cloud-services][PATCH] python3-ansible: Add locale-base-en-us to RDEPENDS
Date: Thu, 25 May 2023 14:12:00 +0800
Message-ID: <20230525061200.2272893-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: MkyK51YgF8_UUYKS4OYf4Dgq3oCuAwUt
X-Proofpoint-GUID: MkyK51YgF8_UUYKS4OYf4Dgq3oCuAwUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_02,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=843 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305250049
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 25 May 2023 06:12:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8075

From: Mingli Yu <mingli.yu@windriver.com>

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
---
 recipes-devtools/python/python3-ansible_2.14.5.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python3-ansible_2.14.5.bb b/recipes-devtools/python/python3-ansible_2.14.5.bb
index ea0fdbe5..f3ab2377 100644
--- a/recipes-devtools/python/python3-ansible_2.14.5.bb
+++ b/recipes-devtools/python/python3-ansible_2.14.5.bb
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
2.25.1


