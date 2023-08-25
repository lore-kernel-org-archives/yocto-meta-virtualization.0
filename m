Return-Path: <patrick@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E708C71133
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 14:52:06 +0000 (UTC)
Received: from st43p00im-zteg10062001.me.com (st43p00im-zteg10062001.me.com [17.58.63.166])
 by mx.groups.io with SMTP id smtpd.web11.15462.1692975121463022010
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Aug 2023 07:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=jq2OAHIk;
 spf=pass (domain: subset.ch, ip: 17.58.63.166, mailfrom: patrick@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1692975120; bh=cPkCymwELZaSLTqUR+bp3jJKareIeQP5LLstrxM57YI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=jq2OAHIkG8c8Ko1rWRbDLmugIwlbe5RBBAdCvaynfjNUe0CRqCX6zzXr4Z4cW4jlV
	 wXjVk2VENVCHIOvUEySNVQ8Hm37i82pLd80aYYQxQgOr6mGKZ69avwohrwbEF1JoPK
	 BxR4WmT7jPM1aTVZFOFqripjb12UndENpsHc+Hg2hesKobj7hOTMJe5LznW3KSGdkv
	 pWqqkdXyGswEUd88S7fzedEzlI1BcwOG11u5j3UE/ybbbgyVcpj5tZUdkA3aNMHDd0
	 NJMACeRC8/Dx+8ufnc8OmvpZefg3UCgg+27akeQFh+lUBzaqj533+TExsbEXqO2G0I
	 bAQ6iXriEOiPQ==
Received: from localhost.localdomain (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
	by st43p00im-zteg10062001.me.com (Postfix) with ESMTPSA id 9EF25800567;
	Fri, 25 Aug 2023 14:51:59 +0000 (UTC)
From: patrick@subset.ch
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-virtualization][PATCH 1/2] netavark: require iputils for ptest
Date: Fri, 25 Aug 2023 16:51:47 +0200
Message-ID: <20230825145148.234559-1-patrick@subset.ch>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Proofpoint-GUID: IrOUfuLbY4mBJm9UYJF6jGlUgXoq3haE
X-Proofpoint-ORIG-GUID: IrOUfuLbY4mBJm9UYJF6jGlUgXoq3haE
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.957,17.11.170.22.0000000_definitions?=
 =?UTF-8?Q?=3D2023-05-18=5F15:2020-02-14=5F02,2023-05-18=5F15,2023-02-09?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 clxscore=1030 spamscore=0
 mlxlogscore=826 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2308250132
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Aug 2023 14:52:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8231

From: Patrick Wicki <patrick.wicki@siemens.com>

Fixes ptest not working on systems using busybox ping.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 recipes-containers/netavark/netavark_1.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/netavark/netavark_1.7.0.bb b/recipes-cont=
ainers/netavark/netavark_1.7.0.bb
index 43c3ee5f..490d8762 100644
--- a/recipes-containers/netavark/netavark_1.7.0.bb
+++ b/recipes-containers/netavark/netavark_1.7.0.bb
@@ -44,6 +44,7 @@ DEPENDS +=3D "protobuf-c-native protobuf-c"
 # bind-utils is used to install dig
 # procps-ps is necessary because the ps from busybox is
 # not having the same behavior
+# iputils is used because busybox ping behaves differently
 RDEPENDS:${PN}-ptest +=3D " \
     bash \
     bats \
@@ -51,6 +52,7 @@ RDEPENDS:${PN}-ptest +=3D " \
     coreutils \
     dbus-daemon-proxy \
     iproute2 \
+    iputils \
     jq \
     nmap \
     procps-ps \
--=20
2.41.0


