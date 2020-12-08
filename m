Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.4083.1607402278697386410
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 20:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EPKVaUyn;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id r5so16155834eda.12
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Dec 2020 20:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MsoJ8avr1ATqh7+tP/nTrFzl8FNgAAG7Zc7V0s7nGUE=;
        b=EPKVaUynL1+/4cdGOatVeqXKaAUjK37a7OZeH/JeLyX5y+Av7P610v7XRj6FV90IjK
         w1IhIumW3j4dqJFZ+hjauABwCm3b1i7I9wRgwZhrFVo1euYlc5SnPME2Oxh4SikD8+cm
         3/rcgUQiM/Ftzg9235Ldj6S6Sl2vn4u0lbdnDrxK8hYlk2kWtDpJJdEkUJBfeoB8Rpzz
         /qjM3OSkzVYzDCYQ4zK+NbeBF9c8JR0jyPJ0re/nLn25QM4R30sbJIBCxPf67AgcP8DC
         +aP4IUJaHhftvxtNcNvexpUKm2O0noITGxbEdp/l95FbbPLngkNGcKbev21MVQxRotLr
         GJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MsoJ8avr1ATqh7+tP/nTrFzl8FNgAAG7Zc7V0s7nGUE=;
        b=HU3eNFldB7YW4SJzZnT7d8EupUNBdvc35wXAMr7rWjx2EEnUdAQ2sgPHjLWEnRSe7s
         jKT8QLM9PULgJVkrrULiuB4fEem0A5LI/8cY88wN6xbCLtQrkB9EQ+Ez61hBrUqiPhPd
         I86swzy908VSXneYpRZ/pZXHrD/26U5pm3TqWntpIfYO09kBljarZI+NsQ2A2ZU7xXxx
         jqyOof5pMNPjf8Xb2pb+feaejg9PnFWFXKXlPI3jUZWBx2xJvNKr2VFT70veLK+C70Hi
         4fSwp+J5VAeXjxScf6HCpzg47oOS7+PQou924qJW67M7EpZYYhbrmZ71jbMJbXS8mk9M
         Pa4g==
X-Gm-Message-State: AOAM530jinqgGAYS/fCDnWG4kIyMoPMpc7VWA6DCS8o04IUSMLvh2+uM
	X8EV9GNzE/aTQXiYVMQPmtmJX6ksIAEbrRSDxKBf4JSEPt8oyQ==
X-Google-Smtp-Source: ABdhPJzsx1ax2XOeykycXHP7DdCkqqoGJl5jzbEJkNPSShRWde8lKTB+ktRIqgBblq5c3v84Rdb7rW/iyelyDl6snzk=
X-Received: by 2002:aa7:c886:: with SMTP id p6mr23701528eds.352.1607402277155;
 Mon, 07 Dec 2020 20:37:57 -0800 (PST)
MIME-Version: 1.0
References: <20201207023512.21842-1-Qi.Chen@windriver.com>
In-Reply-To: <20201207023512.21842-1-Qi.Chen@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 7 Dec 2020 23:37:46 -0500
Message-ID: <CADkTA4Pq9WyJ_1Jh2Mrt-Lc9YbGfp3yQokQnCCfSqzLb3kJWJQ@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH] python3-salttesting: use SRCREV instead of tag
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 6, 2020 at 9:35 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> If we enable BB_NO_NETWORK, using tag in SRC_URI causes problem.
> Merely parsing the recipes will raise error. For example, `bitbake -p'.
>

I'm surprised we only noticed this now!

Thanks for the fix, it has been merged.

Bruce

> So use SRCREV instead of tag to solve this problem.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../recipes-devtools/python/python3-salttesting_git.bb         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python3-salttesting_git.bb b/meta-openstack/recipes-devtools/python/python3-salttesting_git.bb
> index 34476219..fdc0341a 100644
> --- a/meta-openstack/recipes-devtools/python/python3-salttesting_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-salttesting_git.bb
> @@ -4,10 +4,11 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f36f1e9e3e30f90180efdf7e40d943e5"
>
> -SRC_URI = "git://github.com/saltstack/salt-testing.git;branch=develop;tag=v2018.9.21 \
> +SRC_URI = "git://github.com/saltstack/salt-testing.git;branch=develop \
>             file://0001-Add-ptest-output-option-to-test-suite.patch \
>             "
>
> +SRCREV = "8d21627a4eef316d22cc424deeca16a0ec8472e9"
>  PV = "2018.9.21+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
