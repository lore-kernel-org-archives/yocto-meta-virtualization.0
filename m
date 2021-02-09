Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.7640.1612858745731787539
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Feb 2021 00:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FKtkfCA2;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id y18so22321990edw.13
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Feb 2021 00:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BSy2XDu9yA7pREwhC17Yp8Z9fESmtp4CKYqjZbLHEj0=;
        b=FKtkfCA2l//xjxqsRRmzJ0u1TZLmgTQQyTcDZx2SO4OkL1+gCj1x9J6tZNhpH49dQp
         f13IK9wkoIpRp+VyOp1J74/+d2qqdNYbF9/xxwfCcB17gq3s5Be4CLr6ok/K9cNn9kgy
         zv3Fd6i8Ch65fFe+8zpQJQCsbPLd654e8ugeX8TNK5Yc7HpzViojBmXxRildhHJYNiAd
         H+gwrGMeCnhQYvMZQ99VrJZBA89r3UJFLkxSZaBJ++AWEzbP+SDYT9Mv96elJtTTOXPL
         bEwlHPX4gJ8AGik3tT4H2jmi2L60s/JTMkb72a7lLS/Q05UeHf1+XciczYqm84nFIaEj
         nUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BSy2XDu9yA7pREwhC17Yp8Z9fESmtp4CKYqjZbLHEj0=;
        b=tr6lAdgss4MNXZ5PwSN97sKWRncE/LhBtaa3uN1yQia+BhGaGggq9wpU6VxqAHu8hb
         cxJlOorgbvd0MtNJHl9l9CfDOyR1HXRCRbS+Tx76Gwt0inpn702bgEsjAePNXqoBJU/T
         XhDY+Sk/sfjDE8xDAw/GzS9uZyQSqcxcqJ0kZDts27IV12bfNkwgev4Q4DtU7+2fc27Z
         xU93kRGoHtwPbuagkRwaMQiEebRphdNlNT/osQ5MhcW5HsR1IdnJX/pfxc19xEvAfZv5
         +gXuGJqs1KOSN5SDSCQfKaUecE32c5q+Lf+jym268Ezyn2Zvwc1uo8BrMys5yGHqRfRm
         w/Ag==
X-Gm-Message-State: AOAM533jwascblB1+GVpvoXMC9OwT51h6jgQBu+sG3Eya5+rU4pjhCSX
	paPEFSd1o2BmzjfLDqB+1NXHaBdnnoYnV2uQkVw=
X-Google-Smtp-Source: ABdhPJyAg2cHDC/xPqeTOxf0tje/i5F6VGTIUXcY2HOTUMXXm0Ym6ildzZGsSHsU7k4fU2YWS87RUn+gCZRA/u2sqbg=
X-Received: by 2002:a50:c94b:: with SMTP id p11mr21480645edh.388.1612858744235;
 Tue, 09 Feb 2021 00:19:04 -0800 (PST)
MIME-Version: 1.0
References: <20210209080915.1149076-1-Martin.Jansa@gmail.com> <166205F40D747E18.19464@lists.yoctoproject.org>
In-Reply-To: <166205F40D747E18.19464@lists.yoctoproject.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 9 Feb 2021 09:18:52 +0100
Message-ID: <CA+chaQemgaG1DHNN+jyV_NaBCGNXivoCK-En73H+NbAYPqbbgw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] libvirt-python: inherit python3targetconfig
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000085e91f05bae2f01e"

--00000000000085e91f05bae2f01e
Content-Type: text/plain; charset="UTF-8"

This 2nd one should be merged to dunfell and gatesgarth branches as well
when the PYTHON_SYSCONFIGDATA_NAME changes are backported there as
discussed in:
https://lists.openembedded.org/g/openembedded-core/message/146715
https://lists.openembedded.org/g/openembedded-core/message/147844

Unfortunately it cannot be applied in advance,
because python3targetconfig.bbclass doesn't exist in oe-core/dunfell nor
gatesgarth yet, so oe-core and meta-virtualization stable branches should
be updated at the same time.

Regards,

On Tue, Feb 9, 2021 at 9:09 AM Martin Jansa via lists.yoctoproject.org
<Martin.Jansa=gmail.com@lists.yoctoproject.org> wrote:

> * otherwise libvirt build will incorrectly use host's gcc and fail with:
>   gcc: error: unrecognized command line option
> "-fmacro-prefix-map=/OE/libvirt/6.1.0-r0=/usr/src/debug/libvirt/6.1.0-r0"
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc
> b/recipes-extended/libvirt/libvirt-python.inc
> index 7b87d5e..bcd7657 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -1,4 +1,4 @@
> -inherit python3native python3-dir
> +inherit python3native python3-dir python3targetconfig
>
>  export STAGING_INCDIR
>  export STAGING_LIBDIR
> --
> 2.27.0
>
>
> 
>
>

--00000000000085e91f05bae2f01e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This 2nd one should be merged to dunfell and gatesgarth br=
anches as well when the=C2=A0PYTHON_SYSCONFIGDATA_NAME changes are backport=
ed there as discussed in:<div><a href=3D"https://lists.openembedded.org/g/o=
penembedded-core/message/146715">https://lists.openembedded.org/g/openembed=
ded-core/message/146715</a><br><div><a href=3D"https://lists.openembedded.o=
rg/g/openembedded-core/message/147844">https://lists.openembedded.org/g/ope=
nembedded-core/message/147844</a><br></div></div><div><br></div><div>Unfort=
unately it cannot be applied in advance, because=C2=A0python3targetconfig.b=
bclass doesn&#39;t exist in oe-core/dunfell nor gatesgarth yet, so oe-core =
and meta-virtualization stable branches should be updated at the same time.=
</div><div><br></div><div>Regards,</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 9, 2021 at 9:09 AM Mart=
in Jansa via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.o=
rg</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.or=
g">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">* otherwise libvirt build will incorrect=
ly use host&#39;s gcc and fail with:<br>
=C2=A0 gcc: error: unrecognized command line option &quot;-fmacro-prefix-m=
ap=3D/OE/libvirt/6.1.0-r0=3D/usr/src/debug/libvirt/6.1.0-r0&quot;<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/libvirt-python.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extende=
d/libvirt/libvirt-python.inc<br>
index 7b87d5e..bcd7657 100644<br>
--- a/recipes-extended/libvirt/libvirt-python.inc<br>
+++ b/recipes-extended/libvirt/libvirt-python.inc<br>
@@ -1,4 +1,4 @@<br>
-inherit python3native python3-dir<br>
+inherit python3native python3-dir python3targetconfig<br>
<br>
=C2=A0export STAGING_INCDIR<br>
=C2=A0export STAGING_LIBDIR<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000085e91f05bae2f01e--
