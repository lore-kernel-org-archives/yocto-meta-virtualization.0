Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17A20E01538
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Jun 2013 05:39:26 -0700 (PDT)
Received: by mail-lb0-f175.google.com with SMTP id r10so3258281lbi.20
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Jun 2013 05:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pxUos0xYT/xM4pLzmYik+/bZ1Hf52jI9KkWEMCmBrWE=;
	b=weIvaQ9/DpyuLRPprWZdtsNvA1ROXi5JV1MV1Zg4d87nqLH3yz/t1YsZXpIWN7IBa6
	bHbyan7c39vr0fhJZU9O0DbzAYlOzzQ4oQBDyKyNRVn4wFOysXC5ZfIEYnTnop0TeRki
	XhGoSAphx3TgKMdrnWafspHZK+iy+4nKB/rGA2pQrOnK0vuv5hZVElpafNffoQCO1wKA
	pxLhrZJIDSetuHt+sYV03fFba2gEgRaYzbeNUsqYWaq6d0XjHYehBxrtkwIIFLedNo+q
	PWDCfAMCOBHZ34MD/zlt46C706fOBamzlE+5hvlp/FZJC8OEVq6gf6TB2arQT/rmO6BG
	tUcw==
MIME-Version: 1.0
X-Received: by 10.152.27.169 with SMTP id u9mr2191436lag.8.1370954364695; Tue,
	11 Jun 2013 05:39:24 -0700 (PDT)
Received: by 10.112.71.14 with HTTP; Tue, 11 Jun 2013 05:39:24 -0700 (PDT)
In-Reply-To: <1370940490-41856-1-git-send-email-anders.roxell@linaro.org>
References: <1370940490-41856-1-git-send-email-anders.roxell@linaro.org>
Date: Tue, 11 Jun 2013 08:39:24 -0400
Message-ID: <CADkTA4PrMMedmcwnMvjjt52RbrTAUa9MemEeweSRnhhxmJhW9A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: Checksum missmatch fix
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
X-List-Received-Date: Tue, 11 Jun 2013 12:39:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hmmm. That's very strange to be broken.

I've grabbed the change, and will push it out, once I've seen a build work
myself!

Cheers,

Bruce

On Tue, Jun 11, 2013 at 4:48 AM, Anders Roxell <anders.roxell@linaro.org> wrote:
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  recipes-networking/openvswitch/openvswitch_1.10.0.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> index 2e89454..fe112f2 100644
> --- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> +++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> @@ -23,8 +23,8 @@ SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
>         file://openvswitch-controller-setup \
>         "
>
> -SRC_URI[md5sum] = "e9004202b0e10c0de9870f19d2044f11"
> -SRC_URI[sha256sum] = "825730db82c7b46a142f057a43345590c299e66704ef7a88d9ed4ffd0c3d6b64"
> +SRC_URI[md5sum] = "fe8b49efe9f86b57abab00166b971106"
> +SRC_URI[sha256sum] = "803966c89d6a5de6d710a2cb4ed73ac8d8111a2c44b12b846dcef8e91ffab167"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=49eeb5acb1f5e510f12c44f176c42253"
>
>  # Don't compile kernel modules by default since it heavily depends on
> --
> 1.7.10.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

