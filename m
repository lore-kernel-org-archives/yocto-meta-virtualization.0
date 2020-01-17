Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web12.2141.1579225169307132008
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Jan 2020 17:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nC/4/fxB;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id m30so17060525lfp.8
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Jan 2020 17:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=orKvd6mcqbVGfZbhbA63UDGVlB4TTg3IsWyErzhEW+o=;
        b=nC/4/fxB3iO4pau9g46NTV7vjJZJcDCBPUoqbvCoF5LwCbWx2Ofe4JNBI8kfUYym0d
         OGLhFHcF7LEdIckjy73i0OF9Eg7eBdbxx+NKnvPsRlgiRFjWAmUExsjn9MeY86Ux5CTt
         x1oinMaVqwOmlKjznsgN5Iy0xFk6FaCRJRvudD1nc93otcRhmEtvSELuvldZnGhP66IJ
         5fwA5Wtf2RpyMe++uqzMIppOK8wdjCMaDu6WplKHWOEsGiMFYMRMNPBsBZJ8KX0e5bJX
         4aIHZNoYu8Cs51rp1hlT9wMySwnU3yrM6mFGHalIBdhoZ/lgx94ToKXJwpAr5+VS521g
         6nDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=orKvd6mcqbVGfZbhbA63UDGVlB4TTg3IsWyErzhEW+o=;
        b=RX+HjnBpv8shLKkqnnUmTN9TDlaDefTmKc0tI7iQ9udepU1vdOCiXF+w/mfu8QmSDT
         w/UDjyfsSHJ8Ztmd9qLaFUN4NbhwlwLO8PI6gb/4GT8YUd7upW7qGYUHMGyrjSKKbi8o
         5yrISVoAQtq+i4PrEb2c2rnWBVpZXKNvZWZtR6wpPUwAM4QCLotSrU7r9/IgN0jSKnFV
         dD+XwHqTRBkMvhaMbh3G9RWDxeRjMzrbCnY93QniH8fF3zMvsanZUktDhhRVUrR24iuN
         wnezkk75c1anFmwL7VycVfRdqKa74j1kw1mHIhhdaF8gk9cSo2YDTgPfXkadcY3EgAU5
         MbRA==
X-Gm-Message-State: APjAAAXdT3LdAepJ3XyGBEGUpH7KZtwe7VX3o9i2Mo8a8EhVvuKy+w9L
	fl4+4mQBQcbAW+q2bw6rVTTQXIt9UApmJE7+qGpHGw==
X-Google-Smtp-Source: APXvYqym2SsE40GsepB/6u8gwhzj+QJIYbelVPQEJ7MMxSXdbB2twZ6U0Y9CvyGyH+ZPGVKmFYn7AhEYnNjeRqrbztM=
X-Received: by 2002:ac2:4316:: with SMTP id l22mr4000177lfh.115.1579225167294;
 Thu, 16 Jan 2020 17:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20200113154742.15509-1-brendank310@gmail.com> <20200113154742.15509-3-brendank310@gmail.com>
In-Reply-To: <20200113154742.15509-3-brendank310@gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Thu, 16 Jan 2020 17:39:16 -0800
Message-ID: <CACMJ4GYTQiaOG2WCozPDr5EefMwoASNn+Xar5xOf3ViTP57-4Q@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/3] xen: add package for xen-ucode
To: Brendan Kerrigan <brendank310@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Brendan Kerrigan <kerriganb@ainfosec.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 13, 2020 at 8:16 AM Brendan Kerrigan <brendank310@gmail.com> wrote:
>
> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>

Reviewed-by: Christopher Clark <christopher.clark6@baesystems.com>

> ---
>  recipes-extended/xen/xen.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index a77b0d7..ed56e38 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -74,6 +74,7 @@ RDEPENDS_${PN}-base = "\
>      ${PN}-fsimage \
>      ${PN}-scripts-block \
>      ${PN}-scripts-network \
> +    ${PN}-ucode \
>      ${PN}-xen-watchdog \
>      ${PN}-xencommons \
>      ${PN}-xendomains \
> @@ -216,6 +217,7 @@ PACKAGES = "\
>      ${PN}-scripts-network \
>      ${PN}-shim \
>      ${PN}-staticdev \
> +    ${PN}-ucode \
>      ${PN}-volatiles \
>      ${PN}-xcutils \
>      ${PN}-xencommons \
> @@ -673,6 +675,10 @@ FILES_${PN}-shim = " \
>      ${libdir}/xen/boot/xen-shim \
>      "
>
> +FILES_${PN}-ucode = " \
> +    ${sbindir}/xen-ucode \
> +    "
> +
>  FILES_${PN}-volatiles = "\
>      ${sysconfdir}/default/volatiles/99_xen \
>      ${sysconfdir}/tmpfiles.d/xen.conf \
> --
> 2.20.1
>
> 
