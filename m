Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3391D148B3
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.943.1767853600509833991
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BzvWJIib;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084A1oV410522
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=6Z1AEb48qtE8RwMuIaYw52/OF/DoV+Wl9x4WE+HOLv4=; b=BzvWJIibmI3n
	3OipTQzYWPlD/ZeTqnAI91uTdBxGhAeqIV6GhKEFQAjucpSgsldgZq53ZdQPRbEb
	dI2eVLXSnBvCNskFl9zSkCvT8MFJcYJkKjmSRSWbxzXAMlZVgr1njPGE9ryQRo24
	L4EBL+EL0BbzrLP37JTRHAFIAhgJ732au+9O7X7H3SgAJZTpuYj1O552YBXLnukS
	IPPUnL8X4xpHNYqm83dZ0z5nKf72KwqZ7WHXly+GcEEDcaSMDeuBbjmcbLHq7GVn
	mXrAPzrDp7Vsprma+Dtv7MDcg43930PoS8XrKfvlZ380KRFW6Slmm87Vn/lC67xO
	pV7yyZxwWQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bet33d0g6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:39 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:38 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:38 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 08/15] cni: update GO_EXTRA_LDFLAGS
Date: Thu, 8 Jan 2026 14:26:21 +0800
Message-ID: <20260108062628.3636344-9-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=695f4e1f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=ye4xXLAZegm40nhT_REA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: cWbJtnnDDB3ESEMUmosN19LywuY_vw-1
X-Proofpoint-ORIG-GUID: cWbJtnnDDB3ESEMUmosN19LywuY_vw-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfX1PKCva3gyPxi
 xSa2hN2Nyl5l+JaZIWCoQ9/Wsk82zpHZbhYICMNxbez9DcVGELXTjVYcvNp7aN1XtIwU++SQxGi
 ZLT9WsLKD+WZQ9IxjHW6eopbterbgFuJgsw/3FJPp/6vn31QaPJU/G8o+Smis3123eLxcRgwjkE
 Fpzi40UU2QSwnO+YcAzX1YbMLY0FLscSP9e0LalDH5Y1RdGy7uFJp6Z3L2RcmuYvhQsaWD9RD0N
 RkRE7ib9qCa9fqi4rSmQzu9z4henF7okx23zWsW9DeLaU0mGfdrbD6FcZs0iiYFgoIj2/ni1mjH
 f6VbAAZievAT5qs9TtAVVUsUqTeHm8hsGZHzYWvlgZ3qj+eb6XDuRDYLIINkuc9ys2rOnSE25X7
 XF10KTRzP4rAOH80d9ptIKI7LbxYADXfn7Ylt0d4lI/2aA7BbJN9WQYhz9y6Mdtpt8hvHb/KPcd
 5A7e8nGe9ceC6yF6AOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9539

From: Changqing Li <changqing.li@windriver.com>

Using GO_EXTRA_LDFLAGS to set BuildVersion, pass another -ldflags will
overrides -ldflags set in GOBUILDFLAGS(set in go.bbclass)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-networking/cni/cni_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index 88f9b483..ca7b17a2 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -55,6 +55,8 @@ BB_GIT_SHALLOW = "1"
 # https://github.com/llvm/llvm-project/issues/53999
 TOOLCHAIN = "gcc"
 
+GO_EXTRA_LDFLAGS += '-X github.com/containernetworking/plugins/pkg/utils/buildversion.BuildVersion=${CNI_VERSION}'
+
 do_compile() {
 	mkdir -p ${S}/src/github.com/containernetworking
 	ln -sfr ${S}/src/import ${S}/src/github.com/containernetworking/cni
@@ -91,7 +93,7 @@ do_compile() {
 	for p in $PLUGINS; do
 	    plugin="$(basename "$p")"
 	    echo "building: $p"
-	    ${GO} build -trimpath ${GOBUILDFLAGS} -ldflags '-X github.com/containernetworking/plugins/pkg/utils/buildversion.BuildVersion=${CNI_VERSION}' -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
+	    ${GO} build -trimpath ${GOBUILDFLAGS} -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
 	done
 
 	# Build flannel separately - it's from flannel-io/cni-plugin repo with its own module
-- 
2.34.1


