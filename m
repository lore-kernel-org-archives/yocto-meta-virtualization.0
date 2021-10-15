Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.7357.1634291554558305922
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Oct 2021 02:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UXGzrFXj;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id t11so6051721plq.11
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Oct 2021 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+4HKdl42i+Cx0u6wMpKgg9uIm7PircJJYoVDbrgARSo=;
        b=UXGzrFXjUdXnHbMVhIE7Pp9B1VRybWfIZ0iewbhC0TCbaYV/w+LlQ8mN5+BHpEfQIj
         l2XfLEeHoUmJPpIM9kCFvpwf1CKPbJLQZhAqcf20bb/aMepPRbf4dbyQ73dmTfrLB2Ja
         ml/mSuZujmDUkDy7nGfEsiKbP6tzVYu+WyQtdlwMVMh/qT1E6TCuuS9JgpFmtUrs4GbO
         wFgUegx/BA6A127JHx8LC1qf6citdlkuIQkP3l1jdzgNreqtJW0+P9Pr1E67goFRn8/o
         5pl5Nv6INWNzNsAXg6Z7Ie7b6npqRXuhq4iUwnAb7Qsk3HKeZjKQoZ5tn2s5EF6QIFPG
         8d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+4HKdl42i+Cx0u6wMpKgg9uIm7PircJJYoVDbrgARSo=;
        b=TgVvqpP2m/+Mrp/B7e+k4hTls2EnR96o2PajhDx7p7E+BAy5gKolAd2C5cgfpCRRZS
         fK3jegQj/O7ndZXDWkH581wj2djYPvVL4vXUOkBpZefSunBK6FX3XvfEkSCGDmVwNR6y
         AdeCs2mBlw2QvOef39/udtN+xIrUXweqPjhUE2lMpwvUnX81Us9givTxIMqn123cpMtP
         qR6u2Iblm2HEZw5RoBCFyCEc5mcKdiN/GpUa+kNrs47phk9Hou2fadSZ9b9Ljogx8a7F
         QkblUXeWo7GkJwpC/bH9QsrLZphIUPCP0A+tE7EmUEsvNGgVsDgsUXPdOWsUufyPkEuH
         WoJA==
X-Gm-Message-State: AOAM531GOX4txjsRV0mDcd+rrWFqFdwMW77Ih/OfjyZB2j3gl2aj2zlZ
	wxi5Eeabg3CPfEaF1dWPOzl+j/kHSSwdCkB2V/U=
X-Google-Smtp-Source: ABdhPJyA4e0d+4fNjY2e9VBMCRXVu+4j7PS0CF5i4XzfRneVsh/IqSOOIeKUtQRpsxiHHhYs4ubv4yWJ0qobGfTn4AQ=
X-Received: by 2002:a17:902:e746:b0:13f:398e:a0e2 with SMTP id
 p6-20020a170902e74600b0013f398ea0e2mr10007514plf.48.1634291553839; Fri, 15
 Oct 2021 02:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211015093705.39812-1-kai.kang@windriver.com>
In-Reply-To: <20211015093705.39812-1-kai.kang@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 15 Oct 2021 11:52:23 +0200
Message-ID: <CA+chaQcDzC0r2HPeLSDO5WfXMHidaRXw1G1fd2-H4dDwp0soWQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] ceph: inherit pkgconfig.bbclass
To: kai <kai.kang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000086bbbc05ce6127a2"

--00000000000086bbbc05ce6127a2
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 15, 2021 at 11:37 AM kai <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> According to oe-core commit
>
> 652fdf8719 sstate: Allow validation of sstate singatures against list of
> keys
>

I think you should refer to this oe-core commit instead:
https://git.openembedded.org/openembedded-core/commit/?id=8e26252b45b7660c7c67c702411bdec187a76ffc


pkgconfig-native is not deployed in sysroot by default any more. Inherit
> pkgconfig.bbclass to make it work for ceph.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-extended/ceph/ceph_15.2.12.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/ceph/ceph_15.2.12.bb
> b/recipes-extended/ceph/ceph_15.2.12.bb
> index 6636d7a..693b525 100644
> --- a/recipes-extended/ceph/ceph_15.2.12.bb
> +++ b/recipes-extended/ceph/ceph_15.2.12.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24
>
>  file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING;md5=4eb012c221c5fd4b760029a2981a6754 \
>  "
> -inherit cmake python3native python3-dir systemd
> +inherit cmake pkgconfig python3native python3-dir systemd
>  # Disable python pybind support for ceph temporary, when corss compiling
> pybind,
>  # pybind mix cmake and python setup environment, would case a lot of
> errors.
>
> --
> 2.17.1
>
>
> 
>
>

--00000000000086bbbc05ce6127a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 15, 2021 at 11:37 AM kai =
&lt;<a href=3D"mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: K=
ai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai=
.kang@windriver.com</a>&gt;<br>
<br>
According to oe-core commit<br>
<br>
652fdf8719 sstate: Allow validation of sstate singatures against list of ke=
ys<br></blockquote><div><br></div><div>I think you should refer to this oe-=
core commit instead:</div><div><a href=3D"https://git.openembedded.org/open=
embedded-core/commit/?id=3D8e26252b45b7660c7c67c702411bdec187a76ffc">https:=
//git.openembedded.org/openembedded-core/commit/?id=3D8e26252b45b7660c7c67c=
702411bdec187a76ffc</a>=C2=A0</div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
pkgconfig-native is not deployed in sysroot by default any more. Inherit<br=
>
pkgconfig.bbclass to make it work for ceph.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/ceph/<a href=3D"http://ceph_15.2.12.bb" rel=3D"noref=
errer" target=3D"_blank">ceph_15.2.12.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/ceph/<a href=3D"http://ceph_15.2.12.bb" rel=
=3D"noreferrer" target=3D"_blank">ceph_15.2.12.bb</a> b/recipes-extended/ce=
ph/<a href=3D"http://ceph_15.2.12.bb" rel=3D"noreferrer" target=3D"_blank">=
ceph_15.2.12.bb</a><br>
index 6636d7a..693b525 100644<br>
--- a/recipes-extended/ceph/<a href=3D"http://ceph_15.2.12.bb" rel=3D"noref=
errer" target=3D"_blank">ceph_15.2.12.bb</a><br>
+++ b/recipes-extended/ceph/<a href=3D"http://ceph_15.2.12.bb" rel=3D"noref=
errer" target=3D"_blank">ceph_15.2.12.bb</a><br>
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING-LGPL2.1;md5=3Dfbc=
093901857fcd118f065f900982c24<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://COPYING-GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://COPYING;md5=3D4eb012c221c5fd4b760029a2981a6754 \<br>
=C2=A0&quot;<br>
-inherit cmake python3native python3-dir systemd<br>
+inherit cmake pkgconfig python3native python3-dir systemd<br>
=C2=A0# Disable python pybind support for ceph temporary, when corss compil=
ing pybind,<br>
=C2=A0# pybind mix cmake and python setup environment, would case a lot of =
errors.<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000086bbbc05ce6127a2--
