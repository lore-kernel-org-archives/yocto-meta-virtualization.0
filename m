Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.46736.1624280503693345573
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Jun 2021 06:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gufMif1r;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id hc16so300976ejc.12
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Jun 2021 06:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fA8uPtq98Arbug+d5mrcrL5EJ5irpTwYjNRJyAEnxlA=;
        b=gufMif1r0SnYoMRoMMyxkjBrbmZ4HLfyGQe//eehH9Fdi3wFv4srtJjW78Fo3XODY+
         XbkvkEz/MaWRJJI1l0asbLdjkdJfDLcHArEzCCsx5CiUIx/UMNQ72pAvK+s7tas0pT0q
         gS7NdrjFyJ9b93PuKfiiuY8dP2KAmyaw+Siyz4Y17gvaNenyvJ+F+LVTRaq+oxGtIrWj
         RPqdfBR/YvN+lMaKUb3Cjd9wq0+1t5KWBS79kPfKqcfiOBsIyBtOYWoF14wVIyl8nmeC
         94bE277bTz/WbkxvGvYGNeS5OsiHMgS2VCPekYXY4bGIACoe90ZQ99BjB4DJnbU6bry4
         5rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fA8uPtq98Arbug+d5mrcrL5EJ5irpTwYjNRJyAEnxlA=;
        b=FCFQu3vSgjNGwlwZRC4PKwz3ntoCMSyTbH+MhvMvLSJrIjf2OoY2dJGXVREnUVvpAM
         KFeP1Bi5lR5iKEll+0wbqzQi5AXEsmBud6NSA3mTXdSBBGxGizyVhx2YyCisuZuDTjtU
         9K/oEgO6xCWY2WySjYWc5+JY0hYt78uMkISFkTUKr5gAcIDTQrrs0reiiqD17Z7dQWKg
         ApfGAcPDAGh0kwK9oR8Mcbk1cWdqVFOf6aVx9s1LsYJX8Vho2JN+YdDUqp9Rz3CoZIzB
         a1RKhFC/Oh6yFfS/wSVOq5Xv5pTxHu7O2ApeWHay2OquJhIS3XS0tr878L1qgxHNd8PS
         dQDA==
X-Gm-Message-State: AOAM531/hIv4EDu8x+KhGsGtJQA/edkWvvpK3nEWbSNem3lKmejgmNrT
	GvaaMTOAjkoO8f7H8PZhJwcfd7cMCZILYbJUIUk=
X-Google-Smtp-Source: ABdhPJwtM6ZffS6lnck9R+FhEq7um5jOIa2GagRCWQQXnFuZlpBahw29/gYY7+1cnRDsHvdqcbk/O4UIEOpHyWiv+mk=
X-Received: by 2002:a17:906:180a:: with SMTP id v10mr24349484eje.22.1624280502174;
 Mon, 21 Jun 2021 06:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210621114433.4510-1-h.assmann@pengutronix.de>
In-Reply-To: <20210621114433.4510-1-h.assmann@pengutronix.de>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 21 Jun 2021 09:01:31 -0400
Message-ID: <CADkTA4N0dL=Q1yqFL7x7X6aejC6c3b=xEVjk=KwcrL_M0ADAbA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] crun: branch "master" renamed to "main"
To: Holger Assmann <h.assmann@pengutronix.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the fix!

I had made the same changes over the weekend, and coupled them with
bumps to the recipes. They are now pushed to the repo (and the branch
changes cherry picked to older releases).

Bruce

On Mon, Jun 21, 2021 at 7:44 AM Holger Assmann <h.assmann@pengutronix.de> wrote:
>
> crun "master" branch has been renamed to "main", so change SRC_URI
> accordingly.
>
> Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
> ---
>  recipes-containers/crun/crun_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
> index ced1e1c..ed2c5b0 100644
> --- a/recipes-containers/crun/crun_git.bb
> +++ b/recipes-containers/crun/crun_git.bb
> @@ -9,7 +9,7 @@ SRCREV_ispec = "79b036d80240ae530a8de15e1d21c7ab9292c693"
>  SRCREV_rspec = "7413a7f753e1bd9a6a9c6dc7f96f55888cbbd476"
>
>  SRCREV_FORMAT = "crun_rspec"
> -SRC_URI = "git://github.com/containers/crun.git;branch=master;name=crun \
> +SRC_URI = "git://github.com/containers/crun.git;branch=main;name=crun \
>             git://github.com/containers/libocispec.git;branch=main;name=libocispec;destsuffix=git/libocispec \
>             git://github.com/opencontainers/runtime-spec.git;branch=master;name=rspec;destsuffix=git/libocispec/runtime-spec \
>             git://github.com/opencontainers/image-spec.git;branch=master;name=ispec;destsuffix=git/libocispec/image-spec \
> --
> 2.29.2
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
