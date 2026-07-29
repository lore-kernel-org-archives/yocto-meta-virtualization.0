Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0EAC53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:30:27 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2823.1785292223330164307
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 19:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MLzG1K6t;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5283e3eff60so2997271cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 19:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785292222; x=1785897022; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQg2CRmRPZos1umAeqlIIl7/nBa5RGQWJ1rET1Q4W6I=;
        b=MLzG1K6tB/ZdtmrUd1Ss0oE8wrrUVlW4f/J4aA/njXQKx4AVWWN/HnCq3vAoytUbHd
         +v4Rt3kHqozGCOfXQtkMFA5Pdvzas4FceVx90qtUNG1oQ6Ht1nP1jgvJRDYVtVl5fII7
         kjoR2zgxiy16uGqBFhz9k2z8c4StzY+/ylx0+VbRh3Xfuxr/tkOHf4szmjR48YzMtDHc
         Rsipgwvg1tGxCSybe0QcJjZnTDjue9MbpOG2AcEJhNs3aIsa9YQKOZe//Bl4kNcLy6fe
         Hqtijjcz+epTq5CDH3XVSRty39VsrqlMjORnplfMS0nl64ivczOr3vWe0sw3Wlj6v9RX
         N/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292222; x=1785897022;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQg2CRmRPZos1umAeqlIIl7/nBa5RGQWJ1rET1Q4W6I=;
        b=N7G1YXjKkw51UzHAmkey6Rpn6MaMqQXcP2ZjgdlOwaZihWskNI2E5mhJNvO+TnaxqA
         tJgpPlVQoGxXAGQaNUD6v6/kNo5Rzed7ua4lJpN6j3D7PHBJVlmkgJVVJso5o3Ps0FhS
         mbEjTJJPk+0JdY16G74vs9c9/Mtq8Zwy9P8WMcObdjcVxr60pNJnbwzakeYQwfG5nO0y
         +zLPBrhJgL+KRb38+JwpkVqH+tGeAgWPQplCHWNuWYyqkqXWgWlZb3UbKRlrH409uoBP
         wbtWP7sOkoRJFZ9CAN2eEsmOeXKVHrvrMAMBlSC5ZpzWqAkgzgdmhjg0V/3n6xMR1ynm
         /ctQ==
X-Gm-Message-State: AOJu0YwR6iDX9zsi3Yp7OO9RG3sGutPhPLvXHTmR8e9D3wAmrCodAqsL
	U1LKqC+VrtDxA5JRP3KavAI9mL3yQgaYMGjXT5hRUGiUhpE+oaJHs1+9op98hVC3
X-Gm-Gg: AR+sD12hTvdxtKOm9f7Aqw1zCy47r5QpXocqFpv6GH5kF1g4WWV96/oa+MW4E5BqzIb
	sbDT68lRBqxAZwrQsub+CNNOQXQwd0Ct0+gBbE4XtVMDKn6qpxh7hXHi4lNYhFRwDq/eHYzqclU
	27ytEAmW7mTx9IMX278O49JH9HMqdxpL3DPQRr3LrZcsm7OqegrEoxyap8RLS56/aDWR0ZA0M76
	9sJYt4KEsDcCRINNjuizeH7hadsi+/du4o+PVEfsir8HR4KyDLoWJ7V/qpxAeW0PrN8v/W4islS
	RchTwIQNhM5oQDsq43gAyNhAvTwls5lNuM2Qf+JRcj2piTqKgR7NK34u7QGwmgytiqTpU2oCExU
	4syIC3cPaLMOAll1wAoRu1GddOLExoj9fU1Pu52wkWB78ZPf5FX1kH4QSpDGv724CVL57HGd7P8
	zt07cMM6bLYr/EEuHZfhXuWbEs5sK8SbM9/GFcllxazghhfG2PSalzkSFOeIdZjXqRhOHVzsJK6
	uS023P3yJ1b+IfR+qd3PK63bLlSRRZ8WOKPaGRXe0LU334tRdmYqgPtDH9GvknIeTpkp/nR/uY9
	3r/amDvH6Yz80VzOBWeGKmF3aFDaB5TCzEL2gZNAiwH8QrvjW3XNTSR3rjojeQ==
X-Received: by 2002:a05:622a:14c:b0:517:78c7:d93a with SMTP id d75a77b69052e-529d6fafacemr45052671cf.16.1785292221990;
        Tue, 28 Jul 2026 19:30:21 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2b63008sm10595391cf.10.2026.07.28.19.30.21
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:30:21 -0700 (PDT)
Message-ID: <6a6965bd.403c09ca.e524c.ee28@mx.google.com>
Date: Tue, 28 Jul 2026 19:30:21 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 1/2] image-oci: call pm.update()
 before pm.install() in multi-layer package layers
In-Reply-To: <20260728115516.1107990-2-koen.kooi@oss.qualcomm.com>
References: <20260728115516.1107990-1-koen.kooi@oss.qualcomm.com>
 <20260728115516.1107990-2-koen.kooi@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jul 2026 02:30:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10013

Taken to master-next with two things worth flagging.

1) I reworded the commit message to capture historical context that
   only makes sense from the maintainer side: our own multi-layer
   test recipes use OCI_LAYER_MODE=multi with packages: layers and
   they build fine, so it wasn't obvious at first read why this bug
   didn't already burn us. Root cause turned out to be that
   image-oci.bbclass has three separate call sites resolving
   IMAGE_PKGTYPE with hardcoded defaults that disagree with each
   other (rpm/ipk/rpm), so our unpinned builds silently take the
   rpm path -- and dnf install refreshes repodata on demand, so the
   missing pm.update() was a no-op for us. Reproducing your ipk
   trace required someone to actually be using opkg, which we
   weren't. The reworded body walks through all of that so the next
   reader doesn't have to. Your Signed-off-by is preserved.

2) Two follow-up commits on top:

   * "image-oci: unify IMAGE_PKGTYPE default via oci_pkg_type()
     helper" -- collapses the three disagreeing defaults into one
     shared helper, defaulting to ipk to match oe-core's
     PACKAGE_CLASSES default. Nothing changes for anyone who was
     already pinning IMAGE_PKGTYPE.

   * "tests: assert multi-layer OCI blobs have real content, not
     just count" -- our existing multilayer test only checked
     len(layers) == 3, which happily passes on a fully-empty build.
     Adds a per-layer blob-size floor so a silent pm.install()
     failure fails the test the way it should have all along.

Thanks for finding this one. The 2/2 libgcc/libgcc-initial patch
I'm still working through; I'd like to reproduce it locally and
see whether the fix can be simpler than a full BB_TASKDEPDATA
mutation. I'll follow up on that thread separately.

Bruce

