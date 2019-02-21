Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70D73E00B92; Wed, 20 Feb 2019 19:17:07 -0800 (PST)
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
	*      [209.85.167.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14094E0090E
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Feb 2019 19:17:05 -0800 (PST)
Received: by mail-lf1-f67.google.com with SMTP id m11so19218876lfc.6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Feb 2019 19:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t87y6k6gYSBKC2uahMWuDR3LiQDikoNLhka8MMequUE=;
	b=Kb+v6l8Jifk6b/VKO8TInMxVGMtzUsx0xZqrFFQZMO28oUox7/iXSfwv13rxdpUUkV
	3MHJERkfoDljYiCBOqPCXl3VVtIqD6mf4tkJTyEqKtzOzht/tVhmOznlru/idUX+9bUY
	u06x9vFVt6RD/4hDi3qs/pXErSnNiwPQ98eSasniuXjUvJrmLsIMUgUYkJFkbnchz8z4
	Te9MZZohDCrgg0dEq9VaPlYmEu50L7LfLP3PFI+PXywrZOKqZrDmkyaZwXJHbExV+y+u
	W+6Uetmz99Ag52nPLsEzmNU6hyIMo1d5vUDdpI9U7KIBn2RVmp47KTl7QJhDV80+nUpQ
	DvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t87y6k6gYSBKC2uahMWuDR3LiQDikoNLhka8MMequUE=;
	b=CkZ7GcUncuQcS38dsy6eBmjtFS3UqUNJEuZCXYqgPSZ8ZlEY+607w9yPA093Izvrwe
	ruuea4QtpQ9KUi+TnGAdEzacF8C279y7CxfrlbTdfWDJrH8BOv1kF92ZTVpfGIqeO37N
	UhHroMqZdMg2FYcqPun7RQBgx3KKy+ydW0a9HE/+jnpXZ5tPYBduGCkoIvajdIwxVmf7
	yIVmP2Vvg0DYGVYWeriGKZM971QbD+0A9ECAB8bW+I9+s+cpy+MjgfSlfmuwPbYw1sdU
	+Ec6jwbW0h/m8LmyKAUEtb3rug1kKS3Y/WaQ04D5t1SjdNU7omPIS804BzNoz+7F+dvW
	3q3Q==
X-Gm-Message-State: AHQUAuZNjKQjxJ1/edXiCWT37FX7ppYT1z/dNrTRNnXwkHzcocPs9kDt
	bRoO6ZJB+djgsOceVd/rZ7J1bfly3hBdsenBOljFk27r2S8=
X-Google-Smtp-Source: AHgI3IbdF95a9Y+AJKYwaBhrSzc3X8Wkhh4OHSRL7hm6DZ/aQW9zKCfCSfs/Nw3k8HqCjZlExkiyCizfPFly3JO+6O4=
X-Received: by 2002:a19:da1a:: with SMTP id r26mr19819294lfg.2.1550719024612; 
	Wed, 20 Feb 2019 19:17:04 -0800 (PST)
MIME-Version: 1.0
References: <20190217182535.22222-1-oleksandr.kravchuk@pelagicore.com>
In-Reply-To: <20190217182535.22222-1-oleksandr.kravchuk@pelagicore.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Feb 2019 22:16:52 -0500
Message-ID: <CADkTA4M4A+Uqun=LqECs1iD8Vrvjn=0dbjSscuhaQF=_pwZX8Q@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: meta-virtualization@yoctoproject.org,
	Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: Re: [thud][PATCH] lxc: remove perl-module-warnings-register from RDEPENDS
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
X-List-Received-Date: Thu, 21 Feb 2019 03:17:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 17, 2019 at 1:26 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> This module is part of the perl package now and is shipped by default.

We don't make changes on the released branches that aren't also in
master. So the right process would be to send this to master, and also
ask for the change to be cherry-picked to thud.

I've gone ahead and done just that (it is on master and thud now).

Bruce

>
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> ---
>  recipes-containers/lxc/lxc_3.1.0.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/recipes-containers/lxc/lxc_3.1.0.bb b/recipes-containers/lxc/lxc_3.1.0.bb
> index 9dba76b..977583f 100644
> --- a/recipes-containers/lxc/lxc_3.1.0.bb
> +++ b/recipes-containers/lxc/lxc_3.1.0.bb
> @@ -15,7 +15,6 @@ RDEPENDS_${PN} = " \
>                 perl-module-strict \
>                 perl-module-getopt-long \
>                 perl-module-vars \
> -               perl-module-warnings-register \
>                 perl-module-exporter \
>                 perl-module-constant \
>                 perl-module-overload \
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

