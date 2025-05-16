Return-Path: <festevam@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A72C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 12:20:45 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web11.11719.1747398035218217826
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 May 2025 05:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=mx-20241105 header.b=KNq4CAhm;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: festevam@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 4A60D10397281;
	Fri, 16 May 2025 14:20:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1747398031; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VtgTEyOugfIP7IBBStQuloBRyNVyKIGnVVR1xv/rpU0=;
	b=KNq4CAhmTqReaB+3IETSYmaFdmc/nTTklbn3Yp/jLl8UtrXeWkr2+GgaKh4S6flYiOUJ+j
	P1X9gmYzArRB/MldDt83WBHOFCtEydBsEh4+ZNWDJ49h8t0pjukmabm3jiEqgrjluCKV+O
	iCWt5gqioKufMqc7bq89VlVrUoSQsJIy1AvGLiVCfp2D8pbunX7f4cqazjzs7Iy3W6m3nI
	xYZh9ubPtoCXk43u/S9Hy5zLWdCldP4EMJmWLf4EhfCdcu2Y0RzN2cUgRItCTGs2QzBAQe
	VapaKDFEyh+NCcrUQBSQSS0Us6R+SxWG+P5qOstOtvowwVUAhSGSCbEnVhCO2Q==
From: "Fabio Estevam" <festevam@denx.de>
In-Reply-To: <20250514075926.1831264-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset="utf-8"
References: <20250514075926.1831264-1-hongxu.jia@windriver.com>
Date: Fri, 16 May 2025 14:20:25 +0200
Cc: meta-virtualization@lists.yoctoproject.org
To: hongxu.jia@eng.windriver.com
MIME-Version: 1.0
Message-ID: <12d-68272d80-7-7ff59f00@235621152>
Subject: =?utf-8?q?Re=3A?= [meta-virtualization][PATCH] =?utf-8?q?libvirt=3A?= fix 
 compile failure while =?utf-8?q?DEBUG=5FBUILD?==?utf-8?q?_=3D?= 1
User-Agent: SOGoMail 5.12.0
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 16 May 2025 12:20:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9249

Hi Hongxu,

On Wednesday, May 14, 2025 04:59 -03, "hongxu via lists.yoctoproject.or=
g" <hongxu.jia=3Deng.windriver.com@lists.yoctoproject.org> wrote:

> Build libvirt failed while DEBUG=5FBUILD =3D 1
> [snip]
> ../git/src/cpu/cpu=5Fx86.c: In function 'cpuidSetLeaf4':
> ../git/src/cpu/cpu=5Fx86.c:2563:1: error: inlining failed in call to =
'cpuidCall': function not considered for inlining [-Werror=3Dinline]
>  2563 | cpuidCall(virCPUx86CPUID *cpuid)
>       | ^~~~~~~~~
> [snip]
>=20
> Explicitly add -Wno-error=3Dinline to CFLAGS if DEBUG=5FBUILD =3D 1 t=
o workaround

I have sent a fix upstream:

https://lists.libvirt.org/archives/list/devel@lists.libvirt.org/thread/=
AB7ZAE2BCMG7CXIJHOHD3MNLBCSCOOBK/


