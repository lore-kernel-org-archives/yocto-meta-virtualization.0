Return-Path: <festevam@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5AFFC54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 13:26:09 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web10.23699.1747920360613407110
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 May 2025 06:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=mx-20241105 header.b=RBZpvn2l;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: festevam@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 32B441039728C;
	Thu, 22 May 2025 15:25:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1747920358; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CEImPIHherBmbGl2sQaKur/fvIVfRCZnzgDNAJ3mMGo=;
	b=RBZpvn2lnRlz3sNNn9K8Q1lbYEru1Ve5UQ9s+mC2qdVF1qopcbYflcb18eIqONfuD2rpD2
	VZ8tCsqrdJgy9Ki2Km2o+uf1VGy3AsDYvZZsgcWZOQjb9KsGidgPnHkXpYj4ElIryRnJ74
	Kah5ewEPlDV4+/L+SWp+++ZALp/OvQLfrxWM2ya+uBQlVNIGhC6DS/4YYPHqg/jCsvVH1N
	6WSnOLIwCX7uoAE4twPSWTLFKU82VOE+4VYKcsQ7SHX/RhktmD+Whr9YqYhSRApyiHNLg7
	jybqhWcD7CXAEDUUtaiBiQCpi6GYn96QCKRX5Lu++s2FoSYDSK0Z1fEgnrZVQw==
From: "Fabio Estevam" <festevam@denx.de>
In-Reply-To: <aCvvsI8ho1QBJxzV@gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <20250514075926.1831264-1-hongxu.jia@windriver.com>
 <12d-68272d80-7-7ff59f00@235621152> <aCvvsI8ho1QBJxzV@gmail.com>
Date: Thu, 22 May 2025 15:25:52 +0200
Cc: hongxu.jia@eng.windriver.com, meta-virtualization@lists.yoctoproject.org
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
MIME-Version: 1.0
Message-ID: <129-682f2600-13-1bef5560@16572744>
Subject: =?utf-8?q?Re=3A?= [meta-virtualization][PATCH] =?utf-8?q?libvirt=3A?= fix 
 compile failure while =?utf-8?q?DEBUG=5FBUILD?=
 =?utf-8?q?_=3Futf-8=3Fq=3F=5F=3D3D=3F=3D?= 1
User-Agent: SOGoMail 5.12.0
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 May 2025 13:26:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9255

Hi Bruce,

On Monday, May 19, 2025 23:57 -03, Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
=20
> I don't see any replies to the patch, but I'll be updating libvirt in=
 the next
> couple of weeks, so I'll check to see if anything merged then.
>=20
> In the meantime, I've merged the original patch.

The patch I sent has been applied to libvirt master:

https://gitlab.com/libvirt/libvirt/-/commit/bf79a021a6437b4f85469a53f65=
0bff62db5f674


