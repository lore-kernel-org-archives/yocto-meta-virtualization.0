Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.3652.1631213144385399407
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Sep 2021 11:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OKx18s0J;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id z19so3957158edi.9
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Sep 2021 11:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ylq2IOrqdAc+Obso/SvTxMRcXcIlYp6Me3IXOOi0rd0=;
        b=OKx18s0Jrxdau6rlvxqdsSr3rBROQuruua3245R45qK6XF9cMPZNUBdKBHoJ6OpjqC
         D6u8rAtRew9BKUITqLosT4sXB5J3AczpvnKr/0HsAKT6LXtUzpbavwy2fnCEVGH8pCBA
         fihUgbnq2YcpkC1O8GI9cvL2KNYbM7xhr8QZLQa2sw7eiYyoAPhBKJQJ+eqc+PNoyYWN
         EGg0XkewDoQ3iGhX9sQj9iSgJA2H5zIFzsxz3J41PmnDuZb3j8iJY13bujRqQ18yTOqn
         FtHUIduJxm6rGrQQgINZeejsLHGuPEerRMSreHxrTxq7rx7HhT1qvkBFMm90Kzya7bQm
         TUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ylq2IOrqdAc+Obso/SvTxMRcXcIlYp6Me3IXOOi0rd0=;
        b=rOjCLnNZ543NdyJ/9voBsSVujA1HtyoBT8YjwB102yQsdmsrphQ+sJ2QjQnlXlCrbt
         OxTnZcmUbPKA+NiLr20I+8VPYydyq79idUBUtrtPLpW6EIECVWsSEN2J3um4TnS89ufl
         QFtSUduJ6dYg2w6ox0ZAkk1HU365hUqql2dXb6Y54Jx6ALSsh33PoSINanYzNlmjtIH8
         /oGX27P9bXhfGpxTtIW6wlJ+IULOHswt69JCyK6319drTBO0R714NpDEEjtGgKwutn2a
         LyuFh5azMVUpLZv8zn8AvVYTzMjWoSKfwmo9N8cZr+tZTYMxiKVLQekNP7tICPvMPrh9
         cuDQ==
X-Gm-Message-State: AOAM530KGcCczNU15q6ub34ZuFCsayUszOoy5SWdd4OGRR4LAlMVoKDy
	fWjEN2mq4sLAEeaI7omJAPIfwU3tLRpjVoaM9W8=
X-Google-Smtp-Source: ABdhPJx1W7/EFWKiRDt06fd8OfW5TZsx8EtiSt0ECDptIf4+JAuHQlBegHwdOpkNu0gzEtwsPkTwIn8WFKinx3iK8I8=
X-Received: by 2002:aa7:dd57:: with SMTP id o23mr4733113edw.385.1631213142840;
 Thu, 09 Sep 2021 11:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210904155408.6015-1-sanakazisk19@gmail.com>
In-Reply-To: <20210904155408.6015-1-sanakazisk19@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 9 Sep 2021 14:45:32 -0400
Message-ID: <CADkTA4P4meoNaQfcONA9yLWMV5GLuiZq1qi1tj0-2x8QqPET=Q@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCHv2] lxc: Enable seccomp support for lxc
To: sana kazi <sanakazisk19@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, nishaparrakat@gmail.com, 
	purushottamchoudhary29@gmail.com
Content-Type: text/plain; charset="UTF-8"

v2 is now merged.

Bruce

On Sat, Sep 4, 2021 at 11:54 AM sana kazi <sanakazisk19@gmail.com> wrote:
>
> Enabled seccomp support for lxc.
> Also added a patch to enable seccomp.profile only when compiled with
> libseccomp. Currently, seccomp.profile is silently ignored. This
> could lead to the false impression that the seccomp filter is
> applied while it actually isn't.
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> ---
>  ...omp_profile_when_compiled_libseccomp.patch | 46 +++++++++++++++++++
>  recipes-containers/lxc/lxc_4.0.9.bb           |  2 +
>  2 files changed, 48 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
>
> diff --git a/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch b/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
> new file mode 100644
> index 0000000..f0a5813
> --- /dev/null
> +++ b/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
> @@ -0,0 +1,46 @@
> +From 3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e Mon Sep 17 00:00:00 2001
> +From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> +Date: Mon, 23 Aug 2021 22:04:40 +0200
> +Subject: [PATCH] config: enable seccomp profile only when compiled with
> + libseccomp
> +
> +Make lxc fail if seccomp.profile is specified but lxc is compiled
> +without seccomp support. Currently, seccomp.profile is silently ignored
> +if is specified in such a scenario. This could lead to the false
> +impression that the seccomp filter is applied while it actually isn't.
> +
> +Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> +---
> + src/lxc/confile.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/3947/commits/3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e]
> +
> +diff --git a/src/lxc/confile.c b/src/lxc/confile.c
> +index d8b96c6921..1cc8da15f1 100644
> +--- a/src/lxc/confile.c
> ++++ b/src/lxc/confile.c
> +@@ -1211,7 +1211,11 @@ static int set_config_seccomp_notify_proxy(const char *key, const char *value,
> + static int set_config_seccomp_profile(const char *key, const char *value,
> +                                     struct lxc_conf *lxc_conf, void *data)
> + {
> ++#ifdef HAVE_SECCOMP
> +       return set_config_path_item(&lxc_conf->seccomp.seccomp, value);
> ++#else
> ++      return ret_set_errno(-1, ENOSYS);
> ++#endif
> + }
> +
> + static int set_config_execute_cmd(const char *key, const char *value,
> +@@ -4383,7 +4387,11 @@ static int get_config_seccomp_notify_proxy(const char *key, char *retv, int inle
> + static int get_config_seccomp_profile(const char *key, char *retv, int inlen,
> +                                     struct lxc_conf *c, void *data)
> + {
> ++#ifdef HAVE_SECCOMP
> +       return lxc_get_conf_str(retv, inlen, c->seccomp.seccomp);
> ++#else
> ++      return ret_errno(ENOSYS);
> ++#endif
> + }
> +
> + static int get_config_autodev(const char *key, char *retv, int inlen,
> diff --git a/recipes-containers/lxc/lxc_4.0.9.bb b/recipes-containers/lxc/lxc_4.0.9.bb
> index 0ef81a5..6720733 100644
> --- a/recipes-containers/lxc/lxc_4.0.9.bb
> +++ b/recipes-containers/lxc/lxc_4.0.9.bb
> @@ -49,6 +49,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
>         file://tests-add-no-validate-when-using-download-template.patch \
>         file://dnsmasq.conf \
>         file://lxc-net \
> +        file://enable_seccomp_profile_when_compiled_libseccomp.patch \
>         "
>
>  SRC_URI[md5sum] = "365fcca985038910e19a1e0fff15ed07"
> @@ -72,6 +73,7 @@ EXTRA_OECONF += "--enable-log-src-basename --disable-werror"
>  PACKAGECONFIG ??= "templates \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)} \
>  "
>  PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
>  PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
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
