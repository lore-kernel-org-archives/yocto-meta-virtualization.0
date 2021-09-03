Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.3640.1630672468542821785
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Sep 2021 05:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jlso87t2;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id i21so11804636ejd.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Sep 2021 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KcFG4FvJ8MVTmkHeLGah8fn2/0P+GXZ8sTh+HXTeDPQ=;
        b=jlso87t2CMqYkKGCOo039L82TkOOCkoJ3BHHpfxrmNnZe2ixNT4vU64HkfHybgQq9V
         lGkLkcsaca3nee/K9SsTC8KvGGhIcTXN474+fdqgUAoTgP+E+q1A/2EL0Fpw7o/igEMS
         xSzvRsJEKtiBnspPD2UF4kVaWmhWJsVZ251hK7GKZoeeTPRaHO8p5Wqv+S0u3rwj51kS
         j5FkkmTdqQAsXthvYzlNN66GB8wRyJIh5iQkEuaf1ZKqCtJ6DPmXvcJRobXs5Kfn86ff
         NUz8HWFj+NDK0dtJvAiuxz9oOWpn3rfMAtVNNmhehWUTS0xOwcjRHJhMEUuFoJsaGG2q
         +e1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KcFG4FvJ8MVTmkHeLGah8fn2/0P+GXZ8sTh+HXTeDPQ=;
        b=It3j0EYxcrWcLzQgAzhgJKanxNpRQEAFvt47E2GKxsZyL3ow42uAE+Th3VgkOzCNQd
         df8pFnYvkdvLfW1neiZ2e1mHb1zecd8KjGXUR5unYzlguqo21GbTTxOAkiF91rol3LTH
         dqoRnPK8YIJV36WdJPh21CbfYVwC61/pLOqiXc5fT5MzSoL39xrUKUDIiLmIm68NR7fD
         i042wT6WR4CRAMnqpYJtkipHXdr33tHZapjGL0Azefz8pW9cFtdxIBvV0b8vARcb3cUk
         hhP/iUpLJflSqXFkBaT8dX1fggM9aMACrAHRqemiJam2GheuudCvoJIei23yEaqNQKuV
         do3A==
X-Gm-Message-State: AOAM531WGMbD+7EQ+yDsH5vBX3ztntZXiQVwiCmshWroie7ue35WUSiv
	39u2p6WvtPQ++lq11tEAPUXLizmRu/Lrm7IB4RI=
X-Google-Smtp-Source: ABdhPJxlQv/U1AUJnyi6iSgD/CYhS+joXmvtNp9OrJcJrRO5sS5FKN/7z1bMN9zgWIB5uJKCvKcbqc9zTzZsSQq15L4=
X-Received: by 2002:a17:906:d94:: with SMTP id m20mr3834352eji.445.1630672466775;
 Fri, 03 Sep 2021 05:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210903054737.20114-1-sanakazisk19@gmail.com>
In-Reply-To: <20210903054737.20114-1-sanakazisk19@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 3 Sep 2021 08:34:15 -0400
Message-ID: <CADkTA4O436p+on=VUFj6=-EzHjxQgxnXRDv2N=CJGnoKR2S4jg@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCH] lxc: Enable seccomp support for lxc
To: sana kazi <sanakazisk19@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, nishaparrakat@gmail.com, 
	purushottamchoudhary29@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 3, 2021 at 1:47 AM sana kazi <sanakazisk19@gmail.com> wrote:
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
>  recipes-containers/lxc/lxc_4.0.9.bb           |  3 +-
>  2 files changed, 48 insertions(+), 1 deletion(-)
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
> index 0ef81a5..1fd3ea5 100644
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
> @@ -69,7 +70,7 @@ ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>
>  EXTRA_OECONF += "--enable-log-src-basename --disable-werror"
>
> -PACKAGECONFIG ??= "templates \
> +PACKAGECONFIG ??= "templates seccomp \

This should be checking for seccomp in DISTRO_FEATURES, just like
systemd and selinux (and we already have other parts of meta-virt
checking for seccomp in distro_features, so this would keep lxc
consistent).

Bruce

>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>  "
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
