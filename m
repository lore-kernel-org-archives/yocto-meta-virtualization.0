Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD587C27C53
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 03:01:28 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.11239.1717988487274257270
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Jun 2024 20:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eBxVzLcI;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2c2ef6617bfso876891a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 09 Jun 2024 20:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717988487; x=1718593287; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdZmcdx6DB+SpPjCauSAEz50RkDn6JM3jyiuX7cud7w=;
        b=eBxVzLcIKSV+hWewmPmFR0c8veu+sORNTDvTFgehh+R/OVoGJ4m6GQu8DoMH6n045u
         HcR6reTo5Gojzg3dyXH8HlAU8vk7ewYpaWFH4cobVjSYDcqLNU9KNJSvuaWmtrzXofVW
         9B8QuYCUfRTfYBI7XBzQX/K8WkeWKXPM5rMxSpekwhp6G2YmeGgRKlEhU7E/9uQ2jc7s
         EYIThNrti2Z5otIFi+e7NVxoPojfzInzkCEVqg23lQ1PUsKll+J2mbumc3qG2AjNUc4S
         43oz09f1eyOzYqPNyvEUFCyCeP8Zy+oS3R39CnK80EHjv48JpzaY7rcOPDS7IbAWR9AW
         wPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717988487; x=1718593287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdZmcdx6DB+SpPjCauSAEz50RkDn6JM3jyiuX7cud7w=;
        b=exvi81rCU5OwJv4XP4aY/bdsos3noq7A/k402lF1fefNeH0jUg4TuT5dREts945Kvu
         6cDwGwwLkK921k7bcVn9BjGZywFa3aAbrbCQgwObz4ZL1ly8i4bgy3xhpN3Egi713hUb
         r381QZvG/kxfK1AKvtP/6UicpRaInBJx52nE5MFnA8fNucY0d/fDZzCPzGoddD9ge8Hm
         TOUiStREWIb3g8wfyORxomm4Mtn/9sZswVzobxQNGCFM5WbBWglljUStft2uUHZ6Y1fW
         AbYcyvgD3+QTp6mfsui63/AKfTnY2n0jd5W/6waBvyPFTbszSCX20y8NJxekol2+IKUq
         MV3g==
X-Gm-Message-State: AOJu0YyjlyUGpK1+0ntawIjhwuYJqRInka4IYf8r7LJ5T6TRxp9y5Rgb
	33m8GIJjxSKYxxdBlXTO7vEFbMJJ3rj52pHf01DUY4DkSqKL3eycQFQU8fP0ujbD2kXTUPaprno
	CXiLx9a5jGMXmcJfuGvEFZoN2oxQ=
X-Google-Smtp-Source: AGHT+IFkEv2c1SrNfakqZr0imSoplkTDlCYRBI9ho0gQ2CMV9xaC/GhRjNgGhXS3D5FhugDms+r3dVXrWWANWeJbOXg=
X-Received: by 2002:a17:90a:858a:b0:2bf:9566:7c58 with SMTP id
 98e67ed59e1d1-2c2bcc7ac65mr7616218a91.41.1717988486571; Sun, 09 Jun 2024
 20:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAGi-RUK7ARiAVcS-in3m_E1EjCOzFvPb=k=WYBJZCWQB_fT7UQ@mail.gmail.com>
In-Reply-To: <CAGi-RUK7ARiAVcS-in3m_E1EjCOzFvPb=k=WYBJZCWQB_fT7UQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 9 Jun 2024 23:01:15 -0400
Message-ID: <CADkTA4Me4M4qEeyvNWhHQ32m=9iuef4HRCSGTfNmst53KyW7MQ@mail.gmail.com>
Subject: Re: [meta-virtualization] mickledore - packagegroup-kubernetes-node
 pulls k3s instead of k8s
To: rfried.dev@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Jun 2024 03:01:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8793

On Sat, Jun 8, 2024 at 5:15=E2=80=AFPM Ramon Fried via lists.yoctoproject.o=
rg
<rfried.dev=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Hi.
> On mickledore, when directly selecting kubernetes, only k8s is built.
> I recently noticed the packagegroup-kubernetes-node and decided to use
> that instead of kubernetes.
> When Iuse that, we see k3s is also pulled and built.
>
> I masked the k3s.bb to understand the dependencies and it looks like that=
:
>
> Missing or unbuildable dependency chain was: ['k3s-server']
> NOTE: Runtime target 'packagegroup-k8s-node' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-k8s-node',
> 'k3s-server']
> NOTE: Runtime target 'packagegroup-core-boot' is unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-core-boot', 'packagegroup-k8s-node', 'k3s-server']
> NOTE: Runtime target 'core-image-minimal' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['core-image-minimal',
> 'packagegroup-core-boot', 'packagegroup-k8s-node', 'k3s-server']
>
> Is it intentional, or is there a problem here ?
>

It's more the way that packagegroups work.

How are you building packagegroup-k8s-node ? is it from your own
image (and rdepends) ? or is it from the command line on bitbake
(which shouldn't work as it is only rprovided).

Bruce

> Additionally, I added VIRTUAL-RUNTIME_container_orchestration =3D "k8s",
> but it didn't help.
>
> Thanks,
> Ramon
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8792): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8792
> Mute This Topic: https://lists.yoctoproject.org/mt/106566745/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

