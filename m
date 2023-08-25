Return-Path: <patrick@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D756C3DA66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 14:52:06 +0000 (UTC)
Received: from st43p00im-zteg10062001.me.com (st43p00im-zteg10062001.me.com [17.58.63.166])
 by mx.groups.io with SMTP id smtpd.web10.15343.1692975122400244754
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Aug 2023 07:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=XZ+HpMwR;
 spf=pass (domain: subset.ch, ip: 17.58.63.166, mailfrom: patrick@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1692975121; bh=uo/U9BjfqvZ5hjNMmwn+SLMeTRBw1YI5zw4TiG8Bndw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XZ+HpMwRq1CKGUF+jIpK7ij7DoeOLP7xSv+UlN1optKGyzWziK8OXaK8z2zIu9x/R
	 H244j8XB5lGEfCucCEYD8kK37mv+ggePvv8lWeNH3DAlPZOZNrjXd1jhbjPNAUqB8j
	 YM+rK8glwcfcexnChJY8r6MV29mJ15EaqZvILai/8IFRgubOwfieyfGF9WioD1cJle
	 Oh4e3sFmw+7/kswlcyz5QNoRTQqBHeuDVWkXMse0j5jMFvSOX/yHkyU4T2sik7qqvC
	 Us+ysxYR8syiGuHFTHzhpqC4Z3+1zIvGmQPJfbtRRn8ZuD7eVVTZUzXwelf6f+yusO
	 +0N3DrNrng33Q==
Received: from localhost.localdomain (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
	by st43p00im-zteg10062001.me.com (Postfix) with ESMTPSA id 04DF5800592;
	Fri, 25 Aug 2023 14:52:00 +0000 (UTC)
From: patrick@subset.ch
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-virtualization][PATCH 2/2] netavark: skip plugins in ptest
Date: Fri, 25 Aug 2023 16:51:48 +0200
Message-ID: <20230825145148.234559-2-patrick@subset.ch>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825145148.234559-1-patrick@subset.ch>
References: <20230825145148.234559-1-patrick@subset.ch>
MIME-Version: 1.0
X-Proofpoint-GUID: 21M8Ru_Xit4aCw8UFmX5RHi7XkzDHF3E
X-Proofpoint-ORIG-GUID: 21M8Ru_Xit4aCw8UFmX5RHi7XkzDHF3E
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.957,17.11.170.22.0000000_definitions?=
 =?UTF-8?Q?=3D2023-05-18=5F15:2020-02-14=5F02,2023-05-18=5F15,2023-02-09?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 clxscore=1030 spamscore=0
 mlxlogscore=989 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2308250132
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Aug 2023 14:52:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8232

From: Patrick Wicki <patrick.wicki@siemens.com>

Skip the plugin tests that were introduced in 1.6.0 and lead to ptest
failure.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 recipes-containers/netavark/files/run-ptest | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/netavark/files/run-ptest b/recipes-contai=
ners/netavark/files/run-ptest
index 41a37dce..7e017ae2 100644
--- a/recipes-containers/netavark/files/run-ptest
+++ b/recipes-containers/netavark/files/run-ptest
@@ -1,3 +1,8 @@
 #!/bin/bash
=20
-NETAVARK=3D/usr/libexec/podman/netavark bats ./test/
+shopt -s extglob
+
+# Skip the plugin tests because those example plugins are built only whi=
le
+# running cargo test and for this to work as a ptest they would need to =
be cross
+# compiled and installed as part of the ptest.
+NETAVARK=3D/usr/libexec/podman/netavark bats test/!(*-plugin.bats)
--=20
2.41.0


