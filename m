Return-Path: <tanguy.raufflet@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE44CA5FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 14:47:14 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15295.1790779632636139591
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 07:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=OzV4QACb;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: tanguy.raufflet@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 775663D8165B
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Sep 2026 10:47:11 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id FwxG7gnasMuK; Wed, 30 Sep 2026 10:47:10 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D0A313D81663;
	Wed, 30 Sep 2026 10:47:10 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com D0A313D81663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1790779630; bh=flai7bECFjut6tRweI6itY1SOV8WW1emw6dUOPdzUKk=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=OzV4QACbFqtBCSlurJFRSb0H50lTSyNmdbjz/zMrwIbgHTdk7EG9OgWhkAgoOqgvW
	 ra6WQpcxkI8FLVVYxBi+mR7zkpDtC6yCcqfspg1c2BYrw/NiKAy8fy4IefH6rZzAnB
	 HtZpT5rqbHmL0G6ZXnYNx2W2J4JNvXvgjrdlXg0Objx8y4rrspIJiVfq3scs3lM2Is
	 k+IBfo+tW3euAV0Sms0y5LguKAt6EIhrE+tE7uA9BMkB0ZjlXRGLUUOPI9SmnYDcDq
	 IrTLm4LqNmUwGhPC0Dybtm3fQcD5uLQXpVQLD8gZfTAfmI3vW2jsvWPWmHDooE/WfK
	 5M9pcu4dmYfHw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id d159KgJfcfrq; Wed, 30 Sep 2026 10:47:10 -0400 (EDT)
Received: from traufflet.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 3E7133D8160C;
	Wed, 30 Sep 2026 10:47:10 -0400 (EDT)
From: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: enguerrand.de-ribaucourt@savoirfairelinux.com,
	Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
Subject: [meta-virtualization][PATCH 2/2] app-container-oci-bundle.bb: add a new demo recipe using an OCI bundle
Date: Wed, 30 Sep 2026 16:47:05 +0200
Message-ID: <20260930144705.64792-2-tanguy.raufflet@savoirfairelinux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930144705.64792-1-tanguy.raufflet@savoirfairelinux.com>
References: <20260930144705.64792-1-tanguy.raufflet@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Sep 2026 14:47:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10099

This new recipe can be used to generate an OCI runtime bundle.

Signed-off-by: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
---
 recipes-demo/images/app-container-oci-bundle.bb | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 recipes-demo/images/app-container-oci-bundle.bb

diff --git a/recipes-demo/images/app-container-oci-bundle.bb b/recipes-de=
mo/images/app-container-oci-bundle.bb
new file mode 100644
index 00000000..f4b74b27
--- /dev/null
+++ b/recipes-demo/images/app-container-oci-bundle.bb
@@ -0,0 +1,4 @@
+require app-container.bb
+
+SUMMARY =3D "Application OCI runtime bundle demo image"
+OCI_IMAGE_BUNDLE_OUTPUT =3D "1"
--=20
2.55.0


