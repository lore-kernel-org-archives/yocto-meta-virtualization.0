Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1E1C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 11:43:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.68395.1698320631841017611
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 04:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ceAyoAmG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86632b9267=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39QBQCdf003490
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Oct 2023 04:43:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=4n48+
	1t8kyalHkjmLzrVSq7JM8hAX7soohmpPFZ23D4=; b=ceAyoAmGdQ1KFDFtgR7zm
	L1JZuicaIcjnSjwBsxGRoVztM2qsu6eLiDGVu0N/J8cVaZPVjrEtyfUUsdLA25bh
	8EVcJkJO52Y1ob60/jijHtiMSzChLatM1FcD2RDo63oGyDFzlzDcGfM/y73yDBX4
	OspfZEhKaVMIHirVvAbrYVGQcu+NayPy3WqP05tcahJ2Syx2LfVaR9ga7D78rI6i
	qLIbFWMoZl80g4WJp1Tl8FTVYbLoyUA4cco2K/3Q286bwD0xa7NZbeutkRSMLrsT
	n0Gb5mZVr7CgUt8M38givqHgv72W1nk2iwZA1x0B6ho8CQ+LbAubW2QUh3elD0Yl
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tv9x05ft4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Oct 2023 04:43:51 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 04:43:51 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 04:43:51 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [mickledore][master][PATCH] cni: clean dir ${B}/plugins before do_compile
Date: Thu, 26 Oct 2023 19:43:49 +0800
Message-ID: <20231026114349.57798-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: QZjVSduDbkQf4F5eELzWl5ocER3ZDgby
X-Proofpoint-GUID: QZjVSduDbkQf4F5eELzWl5ocER3ZDgby
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_09,2023-10-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=400
 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310260099
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Oct 2023 11:43:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8399

From: Changqing Li <changqing.li@windriver.com>

Clean dir ${B}/plugins before do_compile to avoid cni generated binaries
like /usr/libexec/cni/bridge has wrong dynamic linker path and reports
error like: /usr/libexec/cni/bridge: no such file or directory".

Reproduce steps:
1. bitbake cni
2. enable usrmerge feature in local.conf
3. bitbake cni

After step 2, GOBUILDFLAGS changed,
"-I /lib64/ld-linux-aarch64.so.1" -> "/usr/lib/ld-linux-aarch64.so.1"

But "go build" seems only check if the cached packagefile changed, since
all not changed, the dynamic linker still use the old one, maybe go
build should improve this.

Clean dir ${B}/plugins to trigger rebuild of the binaries here.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-networking/cni/cni_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index 71880cd1..a1a31f2d 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -53,6 +53,8 @@ do_compile() {
 	done
 }
 
+do_compile[cleandirs] = "${B}/plugins"
+
 do_install() {
     localbindir="${libexecdir}/cni/"
 
-- 
2.25.1


