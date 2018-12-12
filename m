Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA2AAE00A54; Wed, 12 Dec 2018 11:17:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.172 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5FB00E0090E
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Dec 2018 11:17:05 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id n18-v6so17289932lji.7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Dec 2018 11:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PWjAUwSdvzUqGAkesu0fz6uhaCHaQO5adwpF99Q/nig=;
	b=OcjdTJqM/OKOp74oaWzXlUEA9H2KMVAIlST9XicfxzfxIT9EpcAC4He6kh1MYCz7sU
	SmlPQrfvM54LenqMluxSgzsck4WeYvDFDqqzf/HZ0ome4CGWobUKKr+BC+uZnGbiBfSf
	CGBKoKARKmrxkx2E8Hf0eOewHpRZnqwsU8fIw/E/2/OEXY40iwGe8wLL9vz7OF3ilTIS
	K9XqwgsTxSGIJFSAmdXjERQWkgR8zaZBM5kIjrSwHUlcZR6pxQZC/K9VKZ9zQNrpHKLA
	UJCI2runUoOiPG90s6AvIq8YdfXPvr5m3TReE/woC9yxkGeNR2kjYThDBE0vy5blbavZ
	66eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PWjAUwSdvzUqGAkesu0fz6uhaCHaQO5adwpF99Q/nig=;
	b=SfJUdMEerbWAdvsyD7LlRm3SiEFhWeEbDVoocO+pb1k1lV8A9aKbgcbvOnHkp0+41o
	TMOlDNONKzQCuuN4JpECN1QfQ5jxmfpJ7KZ/U2H4f7eRFj0NQTysFvuYlimMdCaGrGxU
	YGW9E9XJFEJ2Q+HRh//gmec4XVn4bDn1hfFL4zhcEBmf/GtQoRBXjTuph4YWNMbARSzh
	XnjbUc76VptGggfe1Cch+xP2aUs+9T1hPWn3E54VnFWyQ6eH1D9QiWOpa7Hh2J97BNLj
	fo8GoUrxBWnNFKloHBqMu8VBQgKjM2ul6Wif7syUcaEYFUAlDXgJa0ivDy4sQ2OWhIFp
	VAbw==
X-Gm-Message-State: AA+aEWb0AaNIlmZVkGShsl6qdKqUY9PTS96G97vERZ8zuTyDHyD4tnQy
	/xly2TXISuHFuOULSwK49OD/IOYfYSYcH50i2UmYBQ==
X-Google-Smtp-Source: AFSGD/VEQ2T+MgeBK/amuR/h0fTKeCMkZJOoMHF4MtDgxY2A3oUSZF0zMvQPFNjax0RpiAVksimg/IhLaaX8YE/Oiu8=
X-Received: by 2002:a2e:8596:: with SMTP id
	b22-v6mr13446331lji.122.1544642224242; 
	Wed, 12 Dec 2018 11:17:04 -0800 (PST)
MIME-Version: 1.0
References: <20181206233302.25442-1-chanudete@ainfosec.com>
In-Reply-To: <20181206233302.25442-1-chanudete@ainfosec.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Dec 2018 14:16:52 -0500
Message-ID: <CADkTA4NuLHETKmaUrXPCKZRTE01oDD3Z71vqHvdC+ztBhMSYRg@mail.gmail.com>
To: eric.chanudet@gmail.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] xen: Amend do_install for FHS 3.0.
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
X-List-Received-Date: Wed, 12 Dec 2018 19:17:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged.

Bruce
On Thu, Dec 6, 2018 at 6:35 PM Eric Chanudet <eric.chanudet@gmail.com> wrot=
e:
>
> Under FHS 3.0: /var/run -> /run
> http://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s15.html
>
> systemd-tmpfiles throws some warnings with /var/run in xen.conf:
> systemd-tmpfiles[981]: [/etc/tmpfiles.d/xen.conf:1] Line references path =
below legacy directory /var/run/, updating /var/run/xenstored =E2=86=92 /ru=
n/xenstored; please update the tmpfiles.d/ drop-in file accordingly.
> systemd-tmpfiles[981]: [/etc/tmpfiles.d/xen.conf:2] Line references path =
below legacy directory /var/run/, updating /var/run/xend =E2=86=92 /run/xen=
d; please update the tmpfiles.d/ drop-in file accordingly.
> systemd-tmpfiles[981]: [/etc/tmpfiles.d/xen.conf:3] Line references path =
below legacy directory /var/run/, updating /var/run/xend/boot =E2=86=92 /ru=
n/xend/boot; please update the tmpfiles.d/ drop-in file accordingly.
> systemd-tmpfiles[981]: [/etc/tmpfiles.d/xen.conf:4] Line references path =
below legacy directory /var/run/, updating /var/run/xen =E2=86=92 /run/xen;=
 please update the tmpfiles.d/ drop-in file accordingly.
>
> Signed-off-by: Eric Chanudet <chanudete@ainfosec.com>
> ---
>  recipes-extended/xen/xen.inc | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 7eb2ac4..e29e7f7 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -992,17 +992,18 @@ do_install() {
>      oe_runmake DESTDIR=3D"${D}" install
>
>      # remove installed volatiles
> -    rm -rf ${D}${localstatedir}/run \
> +    rm -rf ${D}${base_prefix}/run \
> +        ${D}${localstatedir}/run \
>          ${D}${localstatedir}/lock \
>          ${D}${localstatedir}/log \
>          ${D}${localstatedir}/volatile \
>          ${D}${localstatedir}/lib/xen
>
>      VOLATILE_DIRS=3D" \
> -        ${localstatedir}/run/xenstored \
> -        ${localstatedir}/run/xend \
> -        ${localstatedir}/run/xend/boot \
> -        ${localstatedir}/run/xen \
> +        ${base_prefix}/run/xenstored \
> +        ${base_prefix}/run/xend \
> +        ${base_prefix}/run/xend/boot \
> +        ${base_prefix}/run/xen \
>          ${localstatedir}/log/xen \
>          ${localstatedir}/lock/xen \
>          ${localstatedir}/lock/subsys \
> --
> 2.19.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

