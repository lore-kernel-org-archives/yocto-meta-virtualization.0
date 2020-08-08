Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.3364.1596853247304892591
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 19:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EfL3Tp9q;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id m19so3928750ejd.8
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2020 19:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gQtTVBh+rmZ1heOp7xjXAfCZH39RRIaXvoWGtWsRkgs=;
        b=EfL3Tp9quCg3fyQPvVIvzYU9YsLZIa8hgArsseBAyMgErkpce+ejC08yTDXPXhWACq
         kOu7cpAbp7+L6uoRuMzYPyXUDY2e2YxEXU11tR69a7SlYn9zyT+wDe+gQSfTpX7Rfz6B
         PZD8pLhE2sw7hkIqY4gvwnu17axuVe1IZ5Xb2h/6582SiLVs6Pd3Bo2J7qheaw+q5aHi
         Ktd6SdMHqz1/S5yVpIRh1L3iveBg+9p9s0xLpyL2MPBJ5r6bFGx4JC4TkYJ67aakxDWm
         lihQIME6wfDV6G886VjOGO7jXXFxv+XWlqW0GO3SqxKZ0V1TIO3JnYagrsgIaXs4mvzZ
         QHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gQtTVBh+rmZ1heOp7xjXAfCZH39RRIaXvoWGtWsRkgs=;
        b=fccinDrXtppej8pyQ5jL79y1iNeSWGktbUq/o3JPQO+FiXscyHuyvgdBMms51yVVIT
         UNTxK12sz0qFsh9rN8CuzDWZoa9IU/G0WHxyWW5X3pDK+qOqdV3dBX9vpOsqvmJs2C7b
         VfKQcq7tbO6/N8Wa/wAzvDKr5kTbcz5vvJ/Hrsb94gl+zQktvBth6GFPU1zFoxRmYZbr
         /N5tE0FkiSUrHEDv4De6rMMOzVkTGGbeSDaPrOkMBbFxopsGHtXwF4OwmteLUAI7q1tI
         ZRQ+7NOqmFhE3WcKmmmzZZbE2UyMRf8Meo0RzWLHG41T4s4o3Ily6zOUGtzQSfL9yScm
         cfRA==
X-Gm-Message-State: AOAM5307IzIpw0H/pKeOuJXgaOIxsGuIBFOaNdpyZGGUzlpSBaT7OQGg
	0mfPKKtNvZcCP4DaGorF5LbIN3zPMrksrGGYv+s=
X-Google-Smtp-Source: ABdhPJwLHeJ0BRlo5avV94e88X5eaiR6WOLFqESZ56DTtMkZWTKuxS2EnspiftXshfVR47Q4Eb+rs3YlWAGU5C91+d4=
X-Received: by 2002:a17:906:71d3:: with SMTP id i19mr12012714ejk.459.1596853245747;
 Fri, 07 Aug 2020 19:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200806083859.23530-1-nicolas.lavocat@harman.com>
In-Reply-To: <20200806083859.23530-1-nicolas.lavocat@harman.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 7 Aug 2020 22:20:34 -0400
Message-ID: <CADkTA4MkEGauPg43VesmA-o+sLrEkLaNrVK1WLqrrPMkP2SpSQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: fix install error without qemu
To: "Lavocat, Nicolas" <Nicolas.Lavocat@harman.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000078a5ea05ac545e28"

--00000000000078a5ea05ac545e28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2020 at 4:39 AM Lavocat, Nicolas <Nicolas.Lavocat@harman.com=
>
wrote:

> An error occurs during the install step of libvirt when the variable
> PACKAGECONFIG does not contain qemu.
>
> Indeed, in this case, the operation "chown -R qemu:qemu
> ${D}/${localstatedir}/lib/libvirt/qemu" fails, since the folder
> ${D}/${localstatedir}/lib/libvirt/qemu has not been created.
>
> The fix consist in doing this operation only if
> the variable =E2=80=9CPACKAGECONFIG=E2=80=9D contains =E2=80=9Cqemu=E2=
=80=9D.
> remark: issue present since the Warrior release of yocto.
>

Technically this patch needs to be against master, not an older branch.
Changes merge to master first, and then we backport appropriately.

But the patch edit was trivial in this case, so I fixed it for master and
have now pushed it for master and dunfell.

Bruce



>
> Upstream-Status: Pending
>
> Signed-off-by: Nicolas Lavocat <nicolas.lavocat@harman.com>
> ---
>  recipes-extended/libvirt/libvirt_6.1.0.bb | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_6.1.0.bb
> b/recipes-extended/libvirt/libvirt_6.1.0.bb
> index 9aa78b7..f301a0e 100644
> --- a/recipes-extended/libvirt/libvirt_6.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_6.1.0.bb
> @@ -340,10 +340,12 @@ do_install_append() {
>                         break
>                         ;;
>                 *)
> -                       chown -R qemu:qemu
> ${D}/${localstatedir}/lib/libvirt/qemu
> -                       echo "d qemu qemu 0755
> ${localstatedir}/cache/libvirt/qemu none" \
> -                           >>
> ${D}${sysconfdir}/default/volatiles/99_libvirt
> -                       break
> +                       if ${@bb.utils.contains('PACKAGECONFIG', 'qemu',
> 'true', 'false', d)}; then
> +                               chown -R qemu:qemu
> ${D}/${localstatedir}/lib/libvirt/qemu
> +                               echo "d qemu qemu 0755
> ${localstatedir}/cache/libvirt/qemu none" \
> +                                   >>
> ${D}${sysconfdir}/default/volatiles/99_libvirt
> +                               break
> +                       fi
>                         ;;
>         esac
>
> --
> 2.18.0.129.ge333175
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000078a5ea05ac545e28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Aug 6, 2020 at 4:39 AM Lavocat, Nicolas &lt=
;<a href=3D"mailto:Nicolas.Lavocat@harman.com">Nicolas.Lavocat@harman.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">An=
 error occurs during the install step of libvirt when the variable<br>
PACKAGECONFIG does not contain qemu.<br>
<br>
Indeed, in this case, the operation &quot;chown -R qemu:qemu<br>
${D}/${localstatedir}/lib/libvirt/qemu&quot; fails, since the folder<br>
${D}/${localstatedir}/lib/libvirt/qemu has not been created.<br>
<br>
The fix consist in doing this operation only if<br>
the variable =E2=80=9CPACKAGECONFIG=E2=80=9D contains =E2=80=9Cqemu=E2=80=
=9D.<br>
remark: issue present since the Warrior release of yocto.<br></blockquote>=
<div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">=
Technically this patch needs to be against master, not an older branch. Cha=
nges merge to master first, and then we backport appropriately.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">But the patch edit was trivial in th=
is case, so I fixed it for master and have now pushed it for master and dun=
fell.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Upstream-Status: Pending<br>
<br>
Signed-off-by: Nicolas Lavocat &lt;<a href=3D"mailto:nicolas.lavocat@harma=
n.com" target=3D"_blank">nicolas.lavocat@harman.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_6.1.0.bb" rel=3D"=
noreferrer" target=3D"_blank">libvirt_6.1.0.bb</a> | 10 ++++++----<br>
=C2=A01 file changed, 6 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_6.1.0.bb" =
rel=3D"noreferrer" target=3D"_blank">libvirt_6.1.0.bb</a> b/recipes-extende=
d/libvirt/<a href=3D"http://libvirt_6.1.0.bb" rel=3D"noreferrer" target=3D"=
_blank">libvirt_6.1.0.bb</a><br>
index 9aa78b7..f301a0e 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_6.1.0.bb" rel=3D"=
noreferrer" target=3D"_blank">libvirt_6.1.0.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_6.1.0.bb" rel=3D"=
noreferrer" target=3D"_blank">libvirt_6.1.0.bb</a><br>
@@ -340,10 +340,12 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0chown -R qemu:qemu ${D}/${localstatedir}/lib/libvirt/qemu<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0echo &quot;d qemu qemu 0755 ${localstatedir}/cache/libvirt/qemu =
none&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; ${D}${sysconfdir}/default/volatiles/99_li=
bvirt<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;qemu&#39;,=
 &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chown -R qemu:qemu ${D}/${localstate=
dir}/lib/libvirt/qemu<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;d qemu qemu 0755 ${locals=
tatedir}/cache/libvirt/qemu none&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; ${D}${sysconf=
dir}/default/volatiles/99_libvirt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
<br>
-- <br>
2.18.0.129.ge333175<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--00000000000078a5ea05ac545e28--
