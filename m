Return-Path: <matt@mattfischer.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4D7CEE35A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 20:50:31 +0000 (UTC)
Received: from outbound.mr.icloud.com (outbound.mr.icloud.com [57.103.69.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7157.1763499023520580729
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 12:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mattfischer.com header.s=sig1 header.b=JpukMkwk;
 spf=pass (domain: mattfischer.com, ip: 57.103.69.151, mailfrom: matt@mattfischer.com)
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-11 (Postfix) with ESMTPS id B218D18000B0;
	Tue, 18 Nov 2025 20:50:22 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattfischer.com; s=sig1; bh=j1KvQzXcz0eedprrj0XB035IS4p7vLfOI0t3ePAGiaQ=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=JpukMkwkDYg1TGgP927gqXzi67aq6+aMBxE5z1e8oV3SbD+ybBluW4k6USnt2NwaJ2PndMAtz+wbYfgdLTr8DKuKecQ+3fmTcRLL1dv5B2Lb3UQHQ/IbEL75NABczKMYCNU96udcranPBczd0KUczdnMiJM3a6Ca92uc4nP/icsMgbwwv22p4GiMFijCioqz3Mpwfe9ak897kew8/keH3+zajnvnnxmtQp7doem58CjMX92/MuW9tfMHDG4Vs+GkRn6emgtb/0mgfF0BlmbQS14R9bfLCc2NkkUUcKCRVwZ0kq3eGwbjK3O8IlC0WZPrzietbmM33Fp58bAY85PZ5Q==
mail-alias-created-date: 1360949849000
Received: from localhost.localdomain (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-11 (Postfix) with ESMTPSA id 32E881800104;
	Tue, 18 Nov 2025 20:50:22 +0000 (UTC)
From: Matt Fischer <matt@mattfischer.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Matt Fischer <matt@mattfischer.com>
Subject: [meta-virtualization][PATCH] Add gpgme as a RDEPENDS for podman
Date: Tue, 18 Nov 2025 13:50:20 -0700
Message-ID: <20251118205020.50459-1-matt@mattfischer.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE2OCBTYWx0ZWRfX2BdBH0xa/tip
 VSiCEWNF4hSC5r7vT0loDRVhKaOR/r+hh0Sc312TI3HyitNDx7YPEwKvW2sssluumhYNh6bi4Bl
 FxHAWrcTv5FSuQ0LCQ1ghfULyzZnoNX44Iw1/uYVMQ1xqxmg2jqPwzQSqH0FmVlq42FjzG04uFr
 /dg5s8JYr5bB2zqv2nhyHJLJLTD1LQV3tX/xhdax5FUNzBPiWE/4jIoUZoxdlErxANDhPKCanH3
 A/Ld89Wt1N/EeI6+hv811r7IwDWLqja0NE3X1Lkgs9zAr55snzyVu+IkdJNpn+VMMu09Ax6Va14
 0TpZg/chhf9mnu7A61h
X-Proofpoint-ORIG-GUID: bPBddf4mCJIGjKme4bB7IVE2vRc7w6gq
X-Proofpoint-GUID: bPBddf4mCJIGjKme4bB7IVE2vRc7w6gq
X-Authority-Info: v=2.4 cv=TbqbdBQh c=1 sm=1 tr=0 ts=691cdc0e cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=JUVG3O__--Zh8yaqAgkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1030 phishscore=0 mlxscore=0
 mlxlogscore=749 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180168
X-JNJ: AAAAAAABy08w/TJX1QpMsnfM76bnBOn8Pt0bRQQxs8y6x5OOGRBS2nMaD+vhjevJVPVs0AnZHsYnriOpQFVH78iAnAunq4hKYRApT+k7DE/2+5sKwws6oR5P0CMhn9aCTuSq9iT9viKLzcFOUTy+zbzW+P4CUqIBS09hNlT0dzSnuZj52u2mBVVSgtvY8lNRzpMBTqtxeVh22jroHvLVFb/PBxwUvOu2HVbbs6YKOQkdhDSYkVY1f4u+quKC0uLNfJO/boxAqIOHA2oK2vI/b5IVDkgdDFKRM0jB6OgnpwM11StY4sOpsPZI7dQEYx+H/kkT332+2zZPXTXG6zQiNnvKhZg1AH2TCPqUk+9NMOkkxFLzCot+J+Z2WPM+aF3QfN7ZieL+9BbNU+Iaw63N1VXGYWX+5Rda6eRZhf2RZLV6q+0o732dnTk8wVlIOHaD3fxfUaoLMbFCOzNFwVLE8XL7PKmmvSX81xQazNXMPpn95xqW8XCFN/uwxuH+qqgUazTYKbtnl4DAjRY6L8Zjcbe/PX49HWfwvj5Tj1ITIYIDPXl4sVs6tEOAY8qgf2NIFYm7Kw6Tq8xdnFqqBLLp4fDfOqED0RX3s58icUVXkK91/eQik9klDx+5QdlI3u1qEp8=
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 18 Nov 2025 20:50:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9442

podman needs gpgme in order to run. In some usages, this
is being pulled in transitively by skopeo, but since skopeo
was removed as a podman dependency last year, it now needs to be
direct.
---
 recipes-containers/podman/podman_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
index f20022bb..f09e01f8 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -143,7 +143,7 @@ VIRTUAL-RUNTIME_base-utils-nsenter ?=3D "util-linux-n=
senter"
 COMPATIBLE_HOST =3D "^(?!mips).*"
=20
 RDEPENDS:${PN} +=3D "\
-	catatonit conmon ${VIRTUAL-RUNTIME_container_runtime} iptables libdevma=
pper \
+	catatonit conmon ${VIRTUAL-RUNTIME_container_runtime} gpgme iptables li=
bdevmapper \
 	${VIRTUAL-RUNTIME_container_dns} ${VIRTUAL-RUNTIME_container_networking=
} ${VIRTUAL-RUNTIME_base-utils-nsenter} \
 "
 RRECOMMENDS:${PN} +=3D "slirp4netns \
--=20
2.50.1 (Apple Git-155)


