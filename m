Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.1244.1620315852497551954
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 May 2021 08:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qBDMPrHz;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id f24so8938451ejc.6
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 06 May 2021 08:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fJ6Ay+90rmY5Um0nQ0hqek0oKNGAGLZ+XtNzNcWbfzg=;
        b=qBDMPrHzfnrkxV1XJd/exFAi63sluSPMyNY8E6uP6W7WEe7Ad3P+ZHdd+BHzJl9ct1
         cYUsUJ5jQsO5juveiQAyy+ytQzi3q9cmjylJPGvXy4mG0tiuu7A7i3KB+j1/qJUo1zpg
         wM15qK7eX2LwN/Mv8xBPgLsy64vT/cuWJMuvqVuYpoFYv0a0QmRuyvLDT/jRJ+6yXUw6
         3gwUyhl9QcEWSMEHfdDIiD81vnl5S9Aqva9Bg1GURt7dc+LEZZigp/hF4jwim7HFfRow
         52u5LEIau5z4kDfAaA8uMqFSg0fyDG0CB48V25MH7d4wxudQ/cF4Z6F97cxc9YzlnNep
         yELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fJ6Ay+90rmY5Um0nQ0hqek0oKNGAGLZ+XtNzNcWbfzg=;
        b=br/8X3zL+ntaWWtmJ48J/JSLwAXMEOJExZiXDiW43NH6yRA0qn1rDHwAo7QzX0k43N
         0lr4guCSQCGoDmkovqNqcJ/+gl753kLfamrsyA7DI9Oh7mPm+uvwae/B0z6H/OCQAh/E
         ob6gVicrQvpMrO+nrw8Nk5gd9xv+AO+DAXQ5b2edEcKZGlLr59y03Q3fGZs8qYdt/s/5
         jQA5AmhEiJvQs3rNKHWF/lidSWYmQREc2l+lB0N/A+4CZXcaFdGOqLINecijH6vDPnV9
         OS7bLf4pUzYIYKDsmPSu7IKJtF2pDwTmssLTIecDxJBWutB3IbtUY2p5S/Yake2kILoY
         7WWQ==
X-Gm-Message-State: AOAM5326XsiNoh1O5yvhPDqcsokDf9slCvR+O2ZnYBiyoDJiCEPUBsnt
	xbQYOSonux84o12xsBQ2RiZhLIu/g4DVgLWEoPw=
X-Google-Smtp-Source: ABdhPJwfqccf5WNyAtGCOjD61OU3h4xv6plqhncrQQ+s0TbJaw1Zlq0r9gMfN0dU2ZQaehWCq219e7F4mi2wsOCis9M=
X-Received: by 2002:a17:906:2ac5:: with SMTP id m5mr5179529eje.517.1620315850847;
 Thu, 06 May 2021 08:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <aa94d0e5d2b32687aeb60654ca22ac0d009fb8d7.1620315173.git.diego.sueiro@arm.com>
In-Reply-To: <aa94d0e5d2b32687aeb60654ca22ac0d009fb8d7.1620315173.git.diego.sueiro@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 6 May 2021 11:43:59 -0400
Message-ID: <CADkTA4PBqriL1Dc6ihF7wdf+RhTBJjg4sU2bw9z1oXcRSGFngg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen-tools: Pass -Wno-vla-parameter to workaround when compiling with gcc-11
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.w.clark@gmail.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

Ross also mentioned on IRC, that fedora is cooking something up:

https://src.fedoraproject.org/rpms/xen/blob/rawhide/f/xen.gcc11.fixes.patch

But I have no idea about the upstream status, etc.

Bruce

On Thu, May 6, 2021 at 11:38 AM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> When compiling xen-tools (4.14 and 4.15) with gcc-11 the following kind of
> errors are produced:
>
> linux.c:164:50: error: argument 7 of type 'const xen_pfn_t[]' {aka 'const long unsigned int[]'} declared as an ordinary array [-Werror=vla-parameter]
>   164 |                                  const xen_pfn_t arr[/*num*/], int err[/*num*/])
>       |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~
>
> Workaround it by passing -Wno-vla-parameter to the compiler.
>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  recipes-extended/xen/xen-tools.inc | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
> index 3560e79..e939c45 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -725,9 +725,12 @@ do_configure() {
>      do_configure_common
>  }
>
> +# Workaround when compiling with gcc-11
> +EXTRA_CFLAGS_XEN_TOOLS_append = " -Wno-vla-parameter"
> +
>  do_compile() {
>      cd ${S}
> -    oe_runmake tools PYTHON="${PYTHON}"
> +    oe_runmake tools EXTRA_CFLAGS_XEN_TOOLS="${EXTRA_CFLAGS_XEN_TOOLS}" PYTHON="${PYTHON}"
>  }
>
>  do_install() {
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
