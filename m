Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA03EE013C3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 Apr 2013 12:35:26 -0700 (PDT)
Received: by mail-lb0-f177.google.com with SMTP id x10so996010lbi.22
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 Apr 2013 12:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=lrLya4HaSJE3stO3IEVQu5MXoORlqZLHrlErCNWieVI=;
	b=Lng9dC8TgpigEq2iSA7gtLcl23bIknHepacoayy4CSfnQ0BrhB5ec6u6kcoaDtnprR
	MeVK0M4AwcCl5BPWP+8Bd1fL265dIqAdKDZhAAQN8R79fpBfp1PSLuqwRcqeoOXbkDrW
	pZYmAM4qg5k6l5WKPj4PATU9jgZn2IAyvnD8kvOncLVyTyXZW3Gcnlri/YuP9ko804sB
	t0W9sMSmLbVfbtJBSk6gfrDbWL0fn2U9w4AHNqaGzNli6xM54RQjjr8k5YkSI1qGBCuL
	IyvZdEEbhQ/qDIYrlw7PokcJqTiv5ZMEfTrWvqyv/zHsBNBObMTzVbh8DroKzPqqClqU
	51mg==
MIME-Version: 1.0
X-Received: by 10.112.136.33 with SMTP id px1mr16079370lbb.95.1366745725187;
	Tue, 23 Apr 2013 12:35:25 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Tue, 23 Apr 2013 12:35:25 -0700 (PDT)
In-Reply-To: <1366745204-17291-1-git-send-email-jslater@windriver.com>
References: <1366745204-17291-1-git-send-email-jslater@windriver.com>
Date: Tue, 23 Apr 2013 15:35:25 -0400
Message-ID: <CADkTA4N=1gEhpBRW7baf2=vAVP8tAvqSMU8At8jmpdYwxfYyUw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, "Slater,
	Joseph" <joe.slater@windriver.com>
Subject: Re: [PATCH] openvswitch: update version to 1.9.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Apr 2013 19:35:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 23, 2013 at 3:26 PM, Joe Slater <jslater@windriver.com> wrote:
> CQID: 393776

We can drop this in future requests, I know some people like them .. but I tend
to no bug tracker IDs in patches :)

>
> Update recipe to version 1.9.0.

Can you also do a patch that documents your test steps, and put it into the
docs/ subdirectory ?

We need to have some evidence about how this was tested.

Cheers,

Bruce

>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../{openvswitch_1.4.3.bb => openvswitch_1.9.0.bb} |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>  rename recipes-networking/openvswitch/{openvswitch_1.4.3.bb => openvswitch_1.9.0.bb} (96%)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_1.4.3.bb b/recipes-networking/openvswitch/openvswitch_1.9.0.bb
> similarity index 96%
> rename from recipes-networking/openvswitch/openvswitch_1.4.3.bb
> rename to recipes-networking/openvswitch/openvswitch_1.9.0.bb
> index 6764073..bfaa004 100644
> --- a/recipes-networking/openvswitch/openvswitch_1.4.3.bb
> +++ b/recipes-networking/openvswitch/openvswitch_1.9.0.bb
> @@ -14,7 +14,7 @@ RDEPENDS_${PN}-pki = "${PN}"
>  RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
>  RRECOMMENDS_${PN} += "kernel-module-openvswitch"
>
> -PR = "r1"
> +PR = "r0"
>
>  SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
>         file://openvswitch-switch \
> @@ -23,8 +23,8 @@ SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
>         file://openvswitch-controller-setup \
>         "
>
> -SRC_URI[md5sum] = "66df8e84f579e734aa4a43bc502baffd"
> -SRC_URI[sha256sum] = "be1ae1ecff0ff095d24f552c148dd4d2931d187bbb35b3d9205416a0aca746a8"
> +SRC_URI[md5sum] = "e9004202b0e10c0de9870f19d2044f11"
> +SRC_URI[sha256sum] = "825730db82c7b46a142f057a43345590c299e66704ef7a88d9ed4ffd0c3d6b64"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=49eeb5acb1f5e510f12c44f176c42253"
>
>  # Don't compile kernel modules by default since it heavily depends on
> --
> 1.7.3.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

