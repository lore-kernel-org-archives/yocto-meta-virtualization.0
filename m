Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.105.1580081178951797337
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Jan 2020 15:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NoxE7Yyb;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id dc19so8950054edb.10
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Jan 2020 15:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KeQvfBTrtjM0wS2Pa9Lk6COKvIm8u3V1M1LzUtDGIPY=;
        b=NoxE7Yyb6qRObikO14rQOja2stx+mD1k55BNzd3O//u5K40JiSvoZGnfqLWQmd5f9A
         n1Yzmh0wmiJG67KGY5mBJDPeaxMK4FMQYOUstqYqeUWAiPtGH4m4UlbCGBI0rhcVsva8
         ypR1clpRDGlfDMI8LUEssyax/i5duYPWAlI+/KslBfHqd2/e9sgGVkFgoCRFFCIZaR5x
         ROPkUkRhYCD9iKGlrqitF6JyEGNRQDRwZeBBmUW9qH//07QOL1YYhF5C5pqQaaTognhS
         bvK7usEM8bGZ5zPq/NhRqbQVcGHWnuWGNB4AjlglkbLuuaqnX0RrkV2Ckprvjj/OBAqE
         J0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KeQvfBTrtjM0wS2Pa9Lk6COKvIm8u3V1M1LzUtDGIPY=;
        b=qlnEXEnxH/rL/c4ou0de5hon5f98gWGnucd7BKxs0hxV6qlAgzvM7bLPB0IC7jij6L
         X/9p95M0XgnGsNR45gCAvGJ5Vpta1fXUsHdHEQ2UEkBkgCx9MX5VF+Ni09Bc9MtLypOv
         Ppj8+0sEvG2UaFwqZM3uX+nV8DuidC4+7SN59H554TBreozYwI5Y3qCJAzRP53V1h04z
         0RNmd3phU4vi9XfdfrZsInsjP4uN2PCCRQRjCjsDmhCcT8rwkOod7BB12Yr99p8xoE2c
         sIC0hW75a4BiRevkywJwPmpyh/fuBJg12rcFltkduE9wI8miBoUzZNu+vl4is6ziI2IC
         B88w==
X-Gm-Message-State: APjAAAVgqPXAxbSLTfP+ilwXn59ip6TSMrzYfdPK0m24VjBKzhdOhkuo
	KZamez8+duIilky78Mptvt2vTTCtXgjUmZkT/Q4=
X-Google-Smtp-Source: APXvYqxCFbwhBaGjOY/NffC8NJVMYqnfYWnNRH1RrtuJF6U/K9JSS8JtmPvmAG86XyzbJ0c0YY1y3h69dek+75tKOkE=
X-Received: by 2002:a17:906:5787:: with SMTP id k7mr11684817ejq.37.1580081177136;
 Sun, 26 Jan 2020 15:26:17 -0800 (PST)
MIME-Version: 1.0
References: <20200126224016.24918-1-stefan@agner.ch>
In-Reply-To: <20200126224016.24918-1-stefan@agner.ch>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 26 Jan 2020 18:26:06 -0500
Message-ID: <CADkTA4NOcZYZ8rJ2w6s1tstbyn6seuWWR5ULh8pw4KfAOVmQew@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] conmon: compile with journald support if systemd is enabled
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Stefan Agner <stefan.agner@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 26, 2020 at 5:40 PM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Currently conman is compiled without journald support which leads to
> this error message when trying to use it (e.g. --log-driver=journald
> with podman):
>   [conmon:e] Include journald in compilation path to log to systemd journal
>
> Make sure to build with journald backend compiled-in when systemd is in
> distro features by adding systemd to DEPENDS (through PACKAGECONFIG).
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  recipes-containers/conmon/conmon_2.0.9.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-containers/conmon/conmon_2.0.9.bb b/recipes-containers/conmon/conmon_2.0.9.bb
> index fc76f15..7f6f6e7 100644
> --- a/recipes-containers/conmon/conmon_2.0.9.bb
> +++ b/recipes-containers/conmon/conmon_2.0.9.bb
> @@ -20,6 +20,9 @@ inherit pkgconfig
>
>  EXTRA_OEMAKE = "PREFIX=${prefix} BINDIR=${bindir} LIBEXECDIR=${libexecdir}"
>
> +PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"

We should still make this something that can be easily overridden,
i.e. ?= for the default PACKAGECONFIG.

Bruce

> +PACKAGECONFIG[systemd] = ",,systemd"
> +
>  do_install() {
>      oe_runmake 'DESTDIR=${D}' install
>  }
> --
> 2.17.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
