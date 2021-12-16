Return-Path: <kristian@klausen.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0841C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 12:03:32 +0000 (UTC)
Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web12.9709.1639656210489728725
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 04:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@klausen.dk
 header.s=dkim header.b=XrR51hGV;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29,
 mailfrom: kristian@klausen.dk)
From: Kristian Klausen <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1639656208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2C83c0O6WpmlvugDuuvnYvxN+rLJFvvCLjfMMMgeUW8=;
	b=XrR51hGVMi/w1dqslFFRssLSQ81zRipCZd0vohSV0919QxT9r5ohl0SKBn0FuQPFVISBQt
	omd+vR6dBqJtQZfdVknFMBUxrzKqVA9rcLyZzoixnJK5gOD7iQLAJV7cbpTkvmOug/vfRR
	p8mo5OmdVKSigQToprQQJWXCXVN8LDY=
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][honister][PATCH] cri-o: switch from master ->
 main
Date: Thu, 16 Dec 2021 13:03:00 +0100
Message-Id: <20211216120300.198575-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Dec 2021 12:03:32 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6979

From: Bruce Ashfield <bruce.ashfield@gmail.com>

cri-o has joined the projects switching their default branch to
main (and removing the old one).

We update our recipe to avoid fetcher errors.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/c=
ri-o/cri-o_git.bb
index 41b8625..b93c3de 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -16,7 +16,7 @@ At a high level, we expect the scope of cri-o to be res=
tricted to the following
=20
 SRCREV_cri-o =3D "1d447191ee73ead59f344f354edac5d64f377e15"
 SRC_URI =3D "\
-	git://github.com/kubernetes-sigs/cri-o.git;branch=3Dmaster;name=3Dcri-o=
;protocol=3Dhttps \
+	git://github.com/kubernetes-sigs/cri-o.git;branch=3Dmain;name=3Dcri-o;p=
rotocol=3Dhttps \
 	file://0001-Makefile-force-symlinks.patch \
         file://crio.conf \
 	"
--=20
2.34.1


