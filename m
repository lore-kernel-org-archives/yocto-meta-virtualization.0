Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5F6C61DA4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 02:48:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5908.1678157321383661172
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Mar 2023 18:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2430f38ff6=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 327221fL017545
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 6 Mar 2023 18:48:41 -0800
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p4258tf0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Mar 2023 18:48:40 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 6 Mar 2023 18:48:40 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 6 Mar 2023 18:48:39 -0800
From: <mingli.yu@eng.windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] yq: Drop {LINKSHARED}
Date: Tue, 7 Mar 2023 10:48:39 +0800
Message-ID: <20230307024839.2150555-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-GUID: gsJfMwbWsRsNesfWs6pteONKSMafBvgp
X-Proofpoint-ORIG-GUID: gsJfMwbWsRsNesfWs6pteONKSMafBvgp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=719 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303070023
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Mar 2023 02:48:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7929

From: Mingli Yu <mingli.yu@windriver.com>

Drop {LINKSHARED} to fix the below build failure.
 WARNING: /build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df14=
6f3e2c0f8c765a6ef9e35780ad8cc1-r0/temp/run.do_compile.923432:185 exit 1 fro=
m 'aarch64-wrs-linux-go install -linkshared -p 48 -v -ldflags=3D"-r /usr/li=
b64/go/pkg/linux_arm64_dynlink  -I /lib64/ld-linux-aarch64.so.1  -extldflag=
s ' -mcpu=3Dcortex-a53 -march=3Darmv8-a+crc -fstack-protector-strong  -O2 -=
D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -=
-sysroot=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df1=
46f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysroot -Wl,-rpath-link=3D/build/=
tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef=
9e35780ad8cc1-r0/recipe-sysroot/usr/lib64/go/pkg/linux_arm64_dynlink -Wl,-O=
1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/build/tmp-gl=
ibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e3578=
0ad8cc1-r0/yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1=3D/usr/src=
/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdebug-pr=
efix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df1=
46f3e2c0f8c765a6ef9e35780ad8cc1-r0/yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef=
9e35780ad8cc1=3D/usr/src/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35=
780ad8cc1-r0  -fmacro-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linu=
x/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/build=3D/usr/src=
/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdebug-pr=
efix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df1=
46f3e2c0f8c765a6ef9e35780ad8cc1-r0/build=3D/usr/src/debug/yq/4.30.8+gitdd6c=
f3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdebug-prefix-map=3D/build/tmp-gl=
ibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e3578=
0ad8cc1-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D/build/tmp-glibc/work/co=
rtexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/=
recipe-sysroot=3D  -fdebug-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs=
-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysr=
oot-native=3D  -Wl,-z,relro,-z,now'" -trimpath -buildmode=3Dpie `go_list_pa=
ckages`'

Before the patch:
 # rpm -ql yq
 /usr
 /usr/bin
 /usr/bin/yq

 # du -sh /usr/bin/yq
 5.2M	/usr/bin/yq

After the patch:
 # rpm -ql yq
 /usr
 /usr/bin
 /usr/bin/yq

 # du -sh /usr/bin/yq
 9.0M	/usr/bin/yq

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-devtools/yq/yq_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index 45f2f970..b3e00473 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -50,6 +50,13 @@ GO_IMPORT =3D "github.com/mikefarah/yq"
=20
 inherit go ptest
=20
+go_do_compile() {
+	export TMPDIR=3D"${GOTMPDIR}"
+	if [ -n "${GO_INSTALL}" ]; then
+		${GO} install ${GOBUILDFLAGS} `go_list_packages`
+	fi
+}
+
 do_compile:prepend() {
     # arrange for some of the golang built ins to be found
     (
--=20
2.25.1


