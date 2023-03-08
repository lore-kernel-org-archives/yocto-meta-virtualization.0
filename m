Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87816C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 03:42:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14733.1678246973184693916
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Mar 2023 19:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=243191ff2d=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3283M9rL024825
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 7 Mar 2023 19:42:52 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6ffd04mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Mar 2023 19:42:52 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Tue, 7 Mar 2023 19:42:52 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 7 Mar 2023 19:42:51 -0800
From: <mingli.yu@eng.windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH v2] yq: drop {LINKSHARED}
Date: Wed, 8 Mar 2023 11:42:50 +0800
Message-ID: <20230308034250.1882056-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CADkTA4Ooi+Y0Nq=eJY+KwEDVe+jUTht_tpzFqF_wmrf4kj7gBQ@mail.gmail.com>
References: <CADkTA4Ooi+Y0Nq=eJY+KwEDVe+jUTht_tpzFqF_wmrf4kj7gBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-GUID: S-yATJoBu7yXhOi65lRM-l7sMgA5mUlR
X-Proofpoint-ORIG-GUID: S-yATJoBu7yXhOi65lRM-l7sMgA5mUlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_18,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1011 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=820
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080030
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Mar 2023 03:42:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7933

From: Mingli Yu <mingli.yu@windriver.com>

Redefine do_compile logic to drop {LINKSHARED} to fix the
below build failure.
  WARNING: /build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df1=
46f3e2c0f8c765a6ef9e35780ad8cc1-r0/temp/run.do_compile.923432:185 exit 1 fr=
om 'aarch64-wrs-linux-go install -linkshared -p 48 -v -ldflags=3D"-r /usr/l=
ib64/go/pkg/linux_arm64_dynlink  -I /lib64/ld-linux-aarch64.so.1  -extldfla=
gs ' -mcpu=3Dcortex-a53 -march=3Darmv8-a+crc -fstack-protector-strong  -O2 =
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security =
--sysroot=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df=
146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysroot -Wl,-rpath-link=3D/build=
/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6e=
f9e35780ad8cc1-r0/recipe-sysroot/usr/lib64/go/pkg/linux_arm64_dynlink -Wl,-=
O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/build/tmp-g=
libc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e357=
80ad8cc1-r0/yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1=3D/usr/sr=
c/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdebug-p=
refix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df=
146f3e2c0f8c765a6ef9e35780ad8cc1-r0/yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6e=
f9e35780ad8cc1=3D/usr/src/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e3=
5780ad8cc1-r0  -fmacro-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-lin=
ux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/build=3D/usr/sr=
c/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdebug-p=
refix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df=
146f3e2c0f8c765a6ef9e35780ad8cc1-r0/build=3D/usr/src/debug/yq/4.30.8+gitdd6=
cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdebug-prefix-map=3D/build/tmp-g=
libc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e357=
80ad8cc1-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D/build/tmp-glibc/work/c=
ortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0=
/recipe-sysroot=3D  -fdebug-prefix-map=3D/build/tmp-glibc/work/cortexa53-wr=
s-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sys=
root-native=3D  -Wl,-z,relro,-z,now'" -trimpath -buildmode=3Dpie `go_list_p=
ackages`'

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
 recipes-devtools/yq/yq_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index 45f2f970..bd474a79 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -50,7 +50,7 @@ GO_IMPORT =3D "github.com/mikefarah/yq"
=20
 inherit go ptest
=20
-do_compile:prepend() {
+do_compile() {
     # arrange for some of the golang built ins to be found
     (
 	cd ${WORKDIR}/build/src/
@@ -60,6 +60,7 @@ do_compile:prepend() {
     # arrange for the fetched dependencies to be found
     export GOPATH=3D"${GOPATH}:${WORKDIR}/build/vendor/"
     export GO111MODULE=3Doff
+    ${GO} install ${GOBUILDFLAGS} `go_list_packages`
 }
=20
 do_install:append() {
--=20
2.25.1


