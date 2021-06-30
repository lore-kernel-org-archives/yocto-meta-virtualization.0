Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.83.1625066729943596584
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Jun 2021 08:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MKJxTyFn;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id bu12so4968279ejb.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Jun 2021 08:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zYWqLUjPkfVWC+a9b27FhNDMiDkE0v8SHfAygJLiC04=;
        b=MKJxTyFn6NdNCOUyZSLejPiX/k6zbEde1ReN6qv9864rVGRkwVOstTpGOpHVfmz5qa
         36wuq+iEtyRwYqV8w7TB6gqXhyrd+vkAnCriB0tSB8riZTBwoFxIXPdELP6EibKUfL8f
         CyEy6UyE/Cx2OjbX8uEwflgwlOJDWTYJ5RqAsDAiw4ALWdVoxWt3L8xSf6Vo4nsydvXj
         sAKLa+HP1RIpYxh2lahI+yUyE1K/Tn5T2t7NBAGFIvalBYllNIfmjIwdogEL5MgX51ye
         Hr6bpFyKxuzJo6s/LnXTfPcf/GEeMwNhIujQ4zPqXUIhQdqe6+h0sPQwhY2adFHhnZD6
         /BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zYWqLUjPkfVWC+a9b27FhNDMiDkE0v8SHfAygJLiC04=;
        b=h0vvhhVQnYvWD3VC6rC2NCH1AoNI4FAA5hVMADT/5g2CFs1gHpIE65tu8/ReVKOGNw
         vE0ZoPsjXxwRGjYWen2T3TRdN5Vc1Nwzdx16W9zsCTyTv3/U6o6YXNOibWtGXsMtCjuT
         ADhfr5K6PaAHzSTpjZuY+bn3cGdEZeg55lBlRIjXOwZ8si9C7JhkpgCJ8CDKYyZJGI/7
         EuJLORc3twDDMk6l9WQ1bMnsASMcVwQxB4koINGopwyyyGMe8AZD1GmjFN8yw5a3aGw6
         ev5GNrokE21qT88cba5G+kdFfSG5+XuZdghhPAy/uphk0PXjIq218gJVFgNXcp4FHQWg
         +C4Q==
X-Gm-Message-State: AOAM530e6Ijvcd+cPbpP63hIjirpFlH424PY8piT8A8/gtkuU3GG032t
	vxVShrdx3VWKrxfvH2g3NXnEyJME2HWQEaHL0cw=
X-Google-Smtp-Source: ABdhPJz2U9a/bUNPvNikev6xt4cLzXHc1CSkMIXsoNpNeWFmR+vhFNq9fl9lIlaEUX2AU9lA/LPJCMZBpZVwRL+n2KU=
X-Received: by 2002:a17:906:ca17:: with SMTP id jt23mr36409778ejb.334.1625066728284;
 Wed, 30 Jun 2021 08:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210629105104.3692000-1-ross.burton@arm.com>
In-Reply-To: <20210629105104.3692000-1-ross.burton@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 30 Jun 2021 11:25:17 -0400
Message-ID: <CADkTA4OM7wJW-udsdbaahkuwAMtCqLUy1R7x0sSbq+4uJa-zRw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] dev86: work on all hosts, other cleanups
To: Ross Burton <ross@burtonini.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Jun 29, 2021 at 6:51 AM Ross Burton <ross@burtonini.com> wrote:
>
> Remove COMPATIBLE_HOST, whilst this is an x86 assembler there's nothing to stop
> you building it on or for arm64 and assembling x86 code.
>
> Override INEXE so that binaries are not stripped and remove INSANE_SKIP.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  recipes-extended/dev86/dev86_git.bb | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86/dev86_git.bb
> index 9488d90..ad7a0df 100644
> --- a/recipes-extended/dev86/dev86_git.bb
> +++ b/recipes-extended/dev86/dev86_git.bb
> @@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
>  DEPENDS = "gperf-native dev86-native"
>
>  BBCLASSEXTEND = "native"
> -EXTRA_OEMAKE = "VERSION=${BASE_PV} PREFIX=${prefix} DIST=${D} LDFLAGS='${LDFLAGS}'"
> +EXTRA_OEMAKE = "VERSION=${BASE_PV} PREFIX=${prefix} DIST=${D} LDFLAGS='${LDFLAGS}' INEXE=''"
>
>  do_compile() {
>         # always regenerate token1.h, token2.h for deterministic behavior
> @@ -45,7 +45,4 @@ do_install_append_class-native() {
>          install -v -m 755 ${B}/ifdefg ${D}${bindir}
>  }
>
> -COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>  FILES_${PN} += "${libdir}/bcc"
> -
> -INSANE_SKIP_${PN} = "already-stripped"
> --
> 2.25.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
