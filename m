Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.16306.1601222885480931794
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Sep 2020 09:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NaUmp5et;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id p9so5011741ejf.6
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Sep 2020 09:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B4OjDnWnymafNSKAqIfLXps6oyJne+ivun3rWrQEyNg=;
        b=NaUmp5et2r47azyw16l5Zj6NbH6nbQ9yL0fkZrMILUqtvnS+wHqwp/YLJMlskQuZx7
         T8+QoEV70Pu/UyRbUshQmRAjVZtEGFLBDvYdxC9izUOtvaHA+gdoPYpoAClkKA7c40E5
         wJ6LBwujHOvQit2LdguMeLFEA1Lo1fK016gygsou/2VAWpO4AAyIq3ZV+dEw8IgSiF5N
         /O3M7IP1GTAcBzP6Dq5fEZ7fjUVnaH9n0jHWCkp0FSZ2ZYoCsrsOl3XV4aiTkTP8x+lt
         W0ShtDZRPT39ONvuLABOCS3pBBNuOFhskGgQiEsjflO3b4jTEjO5jjMLqCPqPX3hiURy
         wqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B4OjDnWnymafNSKAqIfLXps6oyJne+ivun3rWrQEyNg=;
        b=sD4JA9LEmmhEaYhZXq08xTWOLKt3V3myv3ohDSAlba0KPUfEjgWsONWVdVNDn+NSqh
         s4AuC5sHRzqtm8aDaLhxauKb6jEgJG03SsB6Vjs5Fw/UsYoqmsRKd2bHYpNc/T+JWiMl
         ubO+XQvLf7dc9mOw7a2Wa6zspTthueZlhzBnbTYHjCdMS1utCVeqjqYdJvBIAMARWdvR
         S0OLXjAxA8pUi/SaDmQ0Q+FmrZvm4wUXwD/8juVLS8DA1RKaVZnRTkEHg3Zro28U+sbu
         aZ+f31chR/eN19ZJbKSd6UrL4+tFvsuvEED47ZGOX1qZsdxSUYuuluwHHX6KyoMh9jD/
         FrLw==
X-Gm-Message-State: AOAM530MtXrNDH2LNc11WEIexrX7f5Hzpt/FyGpsXeLdvfia2L5fyb/Q
	jIC/S9+9iGFjM1IJ7QS74RaZweMQt7vpW8i1Ohw=
X-Google-Smtp-Source: ABdhPJzZ93N+9leCPXHEGNROnSbEin2Wy+8qvo7WmrmKRrWpdiO4kWZjksdeo+SQaRrU2P95FT7Li7/eBCegy9uwFms=
X-Received: by 2002:a17:906:4a81:: with SMTP id x1mr12238764eju.541.1601222883831;
 Sun, 27 Sep 2020 09:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200922194539.51933-1-bruce.ashfield@gmail.com> <20200922194539.51933-3-bruce.ashfield@gmail.com>
In-Reply-To: <20200922194539.51933-3-bruce.ashfield@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 27 Sep 2020 18:07:52 +0200
Message-ID: <CA+chaQe00HMya5KUDFONH9L4Wk4j1x=8tu-f=2KC1X-V9DR+HQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 3/7] busybox: add initrd variant
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000003272dc05b04dc1e8"

--0000000000003272dc05b04dc1e8
Content-Type: text/plain; charset="UTF-8"

Not sure if it's worth adding an DISABLE_STATIC exception for libxcrypt
in meta/conf/distro/include/no-static-libs.inc or libxcrypt recipe, but for
DISTROs which include conf/distro/include/no-static-libs.inc this recipe
fails with:
ld: error: cannot find -lcrypt
because there won't be static libcrypt.a in RSS.

On Tue, Sep 22, 2020 at 9:49 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> From: Bruce Ashfield <bruce.ashfield@xilinx.com>
>
> Add a busybox variant that inherits almost all of its support from
> the core busybox recipe, but adds configuration values that are
> appropriate to be used in an initrd.
>
> In particular:
>
>   - we build busybox statically
>   - we enable runlevel and init functionality
>   - mdev is always enabled
>   - applet install support is enabled
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../busybox/busybox-initrd/initrd.cfg         | 14 +++++++++++++
>  recipes-core/busybox/busybox-initrd/runx.cfg  |  1 +
>  recipes-core/busybox/busybox-initrd_1.32.0.bb | 20 +++++++++++++++++++
>  3 files changed, 35 insertions(+)
>  create mode 100644 recipes-core/busybox/busybox-initrd/initrd.cfg
>  create mode 100644 recipes-core/busybox/busybox-initrd/runx.cfg
>  create mode 100644 recipes-core/busybox/busybox-initrd_1.32.0.bb
>
> diff --git a/recipes-core/busybox/busybox-initrd/initrd.cfg
> b/recipes-core/busybox/busybox-initrd/initrd.cfg
> new file mode 100644
> index 0000000..9f64c4c
> --- /dev/null
> +++ b/recipes-core/busybox/busybox-initrd/initrd.cfg
> @@ -0,0 +1,14 @@
> +CONFIG_INIT=y
> +CNOFIG_FEATURE_UTMP=y
> +CONFIG_RUNLEVEL=y
> +CONFIG_FEATURE_USE_INITTAB=y
> +CONFIG_HALT=y
> +CONFIG_POWEROFF=y
> +CONFIG_FEATURE_KILL_DELAY=0
> +CONFIG_TELINIT_PATH=""
> +CONFIG_INIT_TERMINAL_TYPE=""
> +
> +# CONFIG_FEATURE_SHADOWPASSWDS is not set
> +CONFIG_USE_BB_PWD_GRP=y
> +
> +CONFIG_STATIC=y
> diff --git a/recipes-core/busybox/busybox-initrd/runx.cfg
> b/recipes-core/busybox/busybox-initrd/runx.cfg
> new file mode 100644
> index 0000000..1f1ac6a
> --- /dev/null
> +++ b/recipes-core/busybox/busybox-initrd/runx.cfg
> @@ -0,0 +1 @@
> +CONFIG_FEATURE_INSTALLER=y
> diff --git a/recipes-core/busybox/busybox-initrd_1.32.0.bb
> b/recipes-core/busybox/busybox-initrd_1.32.0.bb
> new file mode 100644
> index 0000000..82edb57
> --- /dev/null
> +++ b/recipes-core/busybox/busybox-initrd_1.32.0.bb
> @@ -0,0 +1,20 @@
> +FILESEXTRAPATHS_prepend :=
> "${THISDIR}/busybox-initrd:${COREBASE}/meta/recipes-core/busybox/busybox:${COREBASE}/meta/recipes-core/busybox/files:"
> +
> +require recipes-core/busybox/busybox_${PV}.bb
> +
> +SRC_URI += "file://init.cfg \
> +            file://mdev.cfg \
> +            file://runx.cfg \
> +            file://initrd.cfg"
> +
> +S = "${WORKDIR}/busybox-${PV}"
> +
> +# override security-flags settings, we have some warnings to ignore
> +SECURITY_STRINGFORMAT = ""
> +
> +# we do this to get the target binary available to recipes that
> +# depend on busybox
> +SYSROOT_DIRS += "/bin"
> +BUSYBOX_SPLIT_SUID = "0"
> +
> +FILES_${PN} += "${sysconfdir}/init.d/*"
> --
> 2.19.1
>
>
> 
>
>

--0000000000003272dc05b04dc1e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Not sure if it&#39;s worth adding an DISABLE_STATIC except=
ion for libxcrypt in=C2=A0meta/conf/distro/include/no-static-libs.inc or li=
bxcrypt recipe, but for DISTROs which include conf/distro/include/no-static=
-libs.inc this recipe fails with:<div>ld: error: cannot find -lcrypt<br></d=
iv><div>because there won&#39;t be static libcrypt.a in RSS.</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, S=
ep 22, 2020 at 9:49 PM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@=
gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Bruce Ashfield &lt;<a href=3D"mail=
to:bruce.ashfield@xilinx.com" target=3D"_blank">bruce.ashfield@xilinx.com</=
a>&gt;<br>
<br>
Add a busybox variant that inherits almost all of its support from<br>
the core busybox recipe, but adds configuration values that are<br>
appropriate to be used in an initrd.<br>
<br>
In particular:<br>
<br>
=C2=A0 - we build busybox statically<br>
=C2=A0 - we enable runlevel and init functionality<br>
=C2=A0 - mdev is always enabled<br>
=C2=A0 - applet install support is enabled<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@xilinx.=
com" target=3D"_blank">bruce.ashfield@xilinx.com</a>&gt;<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../busybox/busybox-initrd/initrd.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0| 14 +++++++++++++<br>
=C2=A0recipes-core/busybox/busybox-initrd/runx.cfg=C2=A0 |=C2=A0 1 +<br>
=C2=A0recipes-core/busybox/<a href=3D"http://busybox-initrd_1.32.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">busybox-initrd_1.32.0.bb</a> | 20 ++++++=
+++++++++++++<br>
=C2=A03 files changed, 35 insertions(+)<br>
=C2=A0create mode 100644 recipes-core/busybox/busybox-initrd/initrd.cfg<br=
>
=C2=A0create mode 100644 recipes-core/busybox/busybox-initrd/runx.cfg<br>
=C2=A0create mode 100644 recipes-core/busybox/<a href=3D"http://busybox-in=
itrd_1.32.0.bb" rel=3D"noreferrer" target=3D"_blank">busybox-initrd_1.32.0.=
bb</a><br>
<br>
diff --git a/recipes-core/busybox/busybox-initrd/initrd.cfg b/recipes-core=
/busybox/busybox-initrd/initrd.cfg<br>
new file mode 100644<br>
index 0000000..9f64c4c<br>
--- /dev/null<br>
+++ b/recipes-core/busybox/busybox-initrd/initrd.cfg<br>
@@ -0,0 +1,14 @@<br>
+CONFIG_INIT=3Dy<br>
+CNOFIG_FEATURE_UTMP=3Dy<br>
+CONFIG_RUNLEVEL=3Dy<br>
+CONFIG_FEATURE_USE_INITTAB=3Dy<br>
+CONFIG_HALT=3Dy<br>
+CONFIG_POWEROFF=3Dy<br>
+CONFIG_FEATURE_KILL_DELAY=3D0<br>
+CONFIG_TELINIT_PATH=3D&quot;&quot;<br>
+CONFIG_INIT_TERMINAL_TYPE=3D&quot;&quot;<br>
+<br>
+# CONFIG_FEATURE_SHADOWPASSWDS is not set<br>
+CONFIG_USE_BB_PWD_GRP=3Dy<br>
+<br>
+CONFIG_STATIC=3Dy<br>
diff --git a/recipes-core/busybox/busybox-initrd/runx.cfg b/recipes-core/b=
usybox/busybox-initrd/runx.cfg<br>
new file mode 100644<br>
index 0000000..1f1ac6a<br>
--- /dev/null<br>
+++ b/recipes-core/busybox/busybox-initrd/runx.cfg<br>
@@ -0,0 +1 @@<br>
+CONFIG_FEATURE_INSTALLER=3Dy<br>
diff --git a/recipes-core/busybox/<a href=3D"http://busybox-initrd_1.32.0.=
bb" rel=3D"noreferrer" target=3D"_blank">busybox-initrd_1.32.0.bb</a> b/rec=
ipes-core/busybox/<a href=3D"http://busybox-initrd_1.32.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">busybox-initrd_1.32.0.bb</a><br>
new file mode 100644<br>
index 0000000..82edb57<br>
--- /dev/null<br>
+++ b/recipes-core/busybox/<a href=3D"http://busybox-initrd_1.32.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">busybox-initrd_1.32.0.bb</a><br>
@@ -0,0 +1,20 @@<br>
+FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/busybox-initrd:${COREBASE}/=
meta/recipes-core/busybox/busybox:${COREBASE}/meta/recipes-core/busybox/fil=
es:&quot;<br>
+<br>
+require recipes-core/busybox/busybox_${PV}.bb<br>
+<br>
+SRC_URI +=3D &quot;file://init.cfg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mdev.cfg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://runx.cfg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://initrd.cfg&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/busybox-${PV}&quot;<br>
+<br>
+# override security-flags settings, we have some warnings to ignore<br>
+SECURITY_STRINGFORMAT =3D &quot;&quot;<br>
+<br>
+# we do this to get the target binary available to recipes that<br>
+# depend on busybox<br>
+SYSROOT_DIRS +=3D &quot;/bin&quot;<br>
+BUSYBOX_SPLIT_SUID =3D &quot;0&quot;<br>
+<br>
+FILES_${PN} +=3D &quot;${sysconfdir}/init.d/*&quot;<br>
-- <br>
2.19.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000003272dc05b04dc1e8--
