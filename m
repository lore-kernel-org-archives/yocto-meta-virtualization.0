Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C9DBE013EE
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 May 2013 08:39:48 -0700 (PDT)
Received: by mail-la0-f48.google.com with SMTP id fs12so5723778lab.7
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 May 2013 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VP3nPlYzNFnSEWnvpzN+HTvLuJ1EoNuJ9pifG3bZZtY=;
	b=QQkG5Vxf8LYxN7286jEg6tY/grtY4K1TblAfBRZylLFFD5M27P1VWrDGN1byCVsghv
	T2yb5pZx9pEe9yWlSfprHohQA/k9CG6raD3xEUMAFxkywwhjZrAWUYeEWwNgUE05jaEC
	6K/1c9g147vZxGdeFMaHTTv1nmFuXoPXCcIyxZljxOYMDpoxfuuuy0RqtIvI7oY+aV0B
	uBS7jLu2tL9mBZIARjp1vIThI3nIQktSk+DdXoE0IvH7qXU9P1vZOGOAoSjoPiAf+sNr
	WTuSb5bWg6l9XsGDr/4om9g+mFV1C6qSlmCB/tPxXxyh00NqjthJYZ4vhMES+y4e99Ik
	lFdg==
MIME-Version: 1.0
X-Received: by 10.112.20.3 with SMTP id j3mr12286707lbe.90.1369582787284; Sun,
	26 May 2013 08:39:47 -0700 (PDT)
Received: by 10.112.166.100 with HTTP; Sun, 26 May 2013 08:39:47 -0700 (PDT)
In-Reply-To: <1369548269-22464-1-git-send-email-lei.yang@windriver.com>
References: <1369548269-22464-1-git-send-email-lei.yang@windriver.com>
Date: Sun, 26 May 2013 11:39:47 -0400
Message-ID: <CADkTA4MQEGUh92FkVXLzdSs3YdffdjwbiDTxSvqy13ATZkN0LA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: lei yang <lei.yang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Bruce Ashfield <bruce.ashfield@gmail.co>
Subject: Re: [PATCH] dev86: add "COMPATIBLE_HOST" in the recipe
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
X-List-Received-Date: Sun, 26 May 2013 15:39:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, May 26, 2013 at 2:04 AM,  <lei.yang@windriver.com> wrote:
> From: Lei Yang <lei.yang@windriver.com>
>
> dev86 is only used for x86/x86-64

A reasonable change. I've staged it here.

Bruce

>
> Signed-off-by: Lei Yang <lei.yang@windriver.com>
> ---
>  recipes-extended/dev86/dev86_0.16.19.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes-extended/dev86/dev86_0.16.19.bb b/recipes-extended/dev86/dev86_0.16.19.bb
> index ea03812..807504e 100644
> --- a/recipes-extended/dev86/dev86_0.16.19.bb
> +++ b/recipes-extended/dev86/dev86_0.16.19.bb
> @@ -33,5 +33,5 @@ do_install() {
>         ln -s ../lib/bcc/bcc-cc1 ${D}${prefix}/bin/bcc-cc1
>
>  }
> -
> +COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>  FILES_${PN} += "${libdir}/bcc"
> --
> 1.7.1
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

