Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7FE3E00DB5; Tue, 30 Jan 2018 14:19:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E11ADE005A2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jan 2018 14:19:02 -0800 (PST)
Received: by mail-lf0-f65.google.com with SMTP id t79so17729973lfe.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jan 2018 14:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dTieQipTOokSPNTHcab5xyLJbR8TS9ppo6b3Q7A0qOI=;
	b=HXQdby4Zveh/aFqXpeycFcphz7ugTkevNMBadl2TyR+A/BgqnotAjpKVCLY1oed5Rq
	M0IzVzfJ2f102UGkyzE+RUIrMQrW+KxO+/ST3O5j19j8OMIJaW5g5EihrKrC5CgIXT71
	wB2vFcCmpk0MzfJSrPL7HAt+0gAyEE4rIu5U5J2xSPMDxOxCDrKZ6rTdAsHhSFEDqve1
	6sshL6QGbbGzQIwJGwjb5gc9DYhyS3XVyOF9qimnSe74lMaUDQ3D7d/3gOp6KP+iav9u
	VN9OcgLJ7y/0k6CkhFl7DhRasUl6tMvSFHd3j7I26XSrQIgU3OWMdetEd8fc9E9fBnl8
	LxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dTieQipTOokSPNTHcab5xyLJbR8TS9ppo6b3Q7A0qOI=;
	b=Vd7u1wPXW+K910pKhtpfZfSDyxHbAcpd0DJnpvWsRh2FFBKZIdqsOPbr7DDZIlv81Q
	zK+v/rZY87+vzbMgG0bFmHprDn3AqfeDYzboV46ylDkELQbpct5YXUTdy/8Ip98/KZO0
	0n6KEMaZmoc7F5lb5ftV3/84uVd2Bv3BqywhRp1W30GNl3jT2cEbjnQGvbXkYjL0//Jm
	dOYe5tKgJs3wwoJA58mIusv7mxY8mkQ6DNMxraRjybkntgV/JxtJGc4FXjmeMRvOfmvF
	8ES6kfmoYaMrnQygN9/mZyNMHNrI/lyaxJgm7mmQwXzKzcaC+7msGcaRN5uGunog0p9C
	D5yw==
X-Gm-Message-State: AKwxytfJ1om3q/09G4I6T13X9k9NubFrSLQ34qbmmiHdxXy+G5q0zCze
	AzbKi3buGz2IQUakOCrXUu4JvhT6BfdEs7byMxfqNQ==
X-Google-Smtp-Source: AH8x225sbfYPuziPWwYJPFxD22wsvUvvl6ANTxzTQ4PG58R/OvOfco1RIYzXrVI0qDWE4YJqsBEkXF7hu8yW0IHtYEg=
X-Received: by 10.46.29.6 with SMTP id d6mr4576550ljd.7.1517350741292; Tue, 30
	Jan 2018 14:19:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.18.151 with HTTP; Tue, 30 Jan 2018 14:19:00 -0800 (PST)
In-Reply-To: <1517343753-17969-1-git-send-email-ricardo@opensourcefoundries.com>
References: <1517343753-17969-1-git-send-email-ricardo@opensourcefoundries.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 30 Jan 2018 17:19:00 -0500
Message-ID: <CADkTA4NwDjeMguNOMU4VFimH1se4BHOqcDoWJXAxRLRLKos1hw@mail.gmail.com>
To: Ricardo Salveti <ricardo@opensourcefoundries.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] xen: use oe.utils.str_filter_out
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
X-List-Received-Date: Tue, 30 Jan 2018 22:19:03 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Jan 30, 2018 at 3:22 PM, Ricardo Salveti
<ricardo@opensourcefoundries.com> wrote:
> oe_filter_out is not available in oe-core anymore so use
> oe.utils.str_filter_out instead.
>
> Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
> ---
>  recipes-extended/xen/xen.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 15ec8cb..8dfe589 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -830,7 +830,7 @@ export LDFLAGS=""
>  # Yocto injects -mfpmath=sse for some machine types into the CFLAGS which
>  # conflicts with -mno-sse so instead we strip -mfpmath=sse instead of
>  # patching the build to be ok with this
> -TUNE_CCARGS := "${@oe_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}"
> +TUNE_CCARGS := "${@oe.utils.str_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}"
>
>  EXTRA_OECONF += " \
>      --exec-prefix=/usr \
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

