Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1E845E00C01; Tue, 17 Oct 2017 10:21:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.181 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B12AFE00B83
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 10:21:06 -0700 (PDT)
Received: by mail-qk0-f181.google.com with SMTP id x82so2973561qkb.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WC59HUijO5gwX1Qwsll0vo06Z5m79JVAMv71D4C2l3E=;
	b=ucRtpPwfKUQqMgHoOrlI9WuiyJr60b8obgjEGveiizbmmP7u+KmSGcYxHhHV1i8a1c
	3aFxsILVa5Qk9luhmHBAazC9bfZ8Q6CsZ0WWbO7eg3zeHJ/ZXF9bXG/Pqlr3SWRcdHQM
	zz4yl4ZLaUnnj1yVmbBVY0kGpz+NnozXfLYEx6LDkuCSmyHaUxKJ3EAhpZWl+9+RICTd
	ua2tspjuUQrEcFA8NvX+FjEE514gjoVM7MZGNIee/nOCnDjhs2kIIlGPlp0zmB/GhJvw
	kKzil/Q+JH3iCOGUfMHEI8C3811JeSfAgl2Ow+eMM7uaBcyZUttFawQGm4WeEvl7a8MZ
	UmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WC59HUijO5gwX1Qwsll0vo06Z5m79JVAMv71D4C2l3E=;
	b=dyZCywzJWQo5h1Wzx2QbCK6xr6CMtg2ghkUmNhCxCvZp7H3E3FqQhQWyMugNqr0QBe
	R4EkusRwaiRy7l7cwGe3YyA4zsq7zyEYlzGE7QznYIrItblJgM4dYDo+qrym4NB4tF/U
	rC4eyvrpICcYSBuQvHh7Gu/OA0qKjyok29YcswJnxH6148gEudPNQ2i/FFj+LZPeMJfm
	ukAtCxk8PQnjUTBtH2IMNtiopLyGTSbmkci4a+DV4qLbF2kpqgAlUcJXyGaCOtvrEZTO
	DYl1tOncCLm1xPVVRoubqvhY68Zfkw4USUOzbuWQ7AaGIYeOT9cY9fuhOA23JmhJ2gf9
	N1GQ==
X-Gm-Message-State: AMCzsaUyuAKg4ScjTPWYPRTvQmcr5M9k4r+6DWK0i7o8wgE2aPeVLmOU
	+qN8K0+y2MbxrNPOMgHsNMOWDWRLYQI/GlUiqY4=
X-Google-Smtp-Source: AOwi7QBSJLRKwicrriUaebxCutPatH67n1MvJZaqAvo0LIdY/gmLtbIw1BLKlrvUNPZkegJm656YAsxG1LjfAk3xD98=
X-Received: by 10.55.15.139 with SMTP id 11mr19549018qkp.141.1508260865543;
	Tue, 17 Oct 2017 10:21:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Tue, 17 Oct 2017 10:21:05 -0700 (PDT)
In-Reply-To: <1508256828-4392-1-git-send-email-dariusz.pelowski@gmail.com>
References: <1508256828-4392-1-git-send-email-dariusz.pelowski@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 17 Oct 2017 13:21:05 -0400
Message-ID: <CADkTA4MKP4Rs7HLhaa6d5fB-2e64gRgvHwinCjPhi2o+v7hb0g@mail.gmail.com>
To: Dariusz Pelowski <dariusz.pelowski@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] containers: corrected install path
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
X-List-Received-Date: Tue, 17 Oct 2017 17:21:07 -0000
Content-Type: text/plain; charset="UTF-8"

I cleaned up the short log, and added a long log, but this is now merged.

Bruce

On Tue, Oct 17, 2017 at 12:13 PM, Dariusz Pelowski
<dariusz.pelowski@gmail.com> wrote:
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index f574a3e..2c7161e 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -76,7 +76,7 @@ do_install() {
>      install -d ${D}${systemd_unitdir}/system/
>      install -d ${D}${systemd_unitdir}/system/kubelet.service.d/
>
> -    install -d ${sysconfdir}/kubernetes/manifests/
> +    install -d ${D}${sysconfdir}/kubernetes/manifests/
>
>      install -m 755 -D ${S}/src/import/_output/bin/kube* ${D}/${bindir}
>
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

