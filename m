Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.5676.1630582781600146010
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Sep 2021 04:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NKVLQN+6;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id lc21so3582541ejc.7
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Sep 2021 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bBDbif+X7E9nd07up4a/KLiqQvzkImHpJLnY877aYMc=;
        b=NKVLQN+6yOCYSgB4iLexLkmYfu+ZpeDd/xqUdocHpWDg31MZztQ74GLy8zz7OzG/Dc
         4Xsz5Ep5B3fg/nX8aCg3dML8XTuffPhNWCIzCQC9IhXR/8Yk/i19c9eZan4TiNFjTNBk
         da/+axHV0UR9YP5qK2Pp6jPrDg/iCIkT8btmQQpH7qpPrrGi95ZbJoCWqYI3ReMNAFpb
         m7upxmqGR0QEgDXkMhzOs+saolzNSSATIKOAet5aR22FFHWHDZDP/WX3PNXc0ZTPj3Dk
         dwLbUCkCKVNAYCLiUIootijzafdf4cTtVEgLL5XtU2JvwnlXuVQj/E7aIm6ApDjE6JUu
         nNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bBDbif+X7E9nd07up4a/KLiqQvzkImHpJLnY877aYMc=;
        b=L5rvhjC2xMH4gZfMeTbZ3NI3/bwVUuVgIi/98vo0azJ08pu68x4azuHrTx8I+I8WLL
         LjJP8VcdfWn3H6WL8wIIeNLQCbkZTRhFxDlj8Pu6LtD62d5po7ZdXw6HqUwafRHncPkO
         wJzniWSLGb7xEYBtnXXPsWJja1oOYMtqTTSaoUDbUt0CEd83pzat1ZDgQG9cmvklm9hD
         F8kF32BiKPOYe+PO7YjPsFHuyRHsPUUUYYhSU0/kWAaZEPKnHc5ULFGBXWkEdehHfion
         Y2oGxKhW1ExdQvDDNxc9jZ7/IjOR0eyovE0nZ+tontxhDg2+FItPj/GB41T0E9AuwtBT
         hZkQ==
X-Gm-Message-State: AOAM531tMiI4Mdl64PFSZQhtveqPNMXoKgX9JrAy/4qEVcLSqEEMAS/Z
	91JyfHcPvwKEr2MoK6gLAJbW6tpgVGolHlXhdWgGhRJdutA=
X-Google-Smtp-Source: ABdhPJxQmXKUADidIoH0xAqF5M+q4jylGnuaQQPPf2uGeYKbq6a2IDpHrnFuplawCXjwknnwWzagGLW+S4+YlyxbdYE=
X-Received: by 2002:a17:907:1dcf:: with SMTP id og15mr3298025ejc.470.1630582780065;
 Thu, 02 Sep 2021 04:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210902085344.74360-1-yi.zhao@windriver.com>
In-Reply-To: <20210902085344.74360-1-yi.zhao@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 2 Sep 2021 13:39:28 +0200
Message-ID: <CA+chaQevEHaAZWz177bx7asB9P+t=EFpnaQJQ=s5hVs74fwG2A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] docker-distribution: allow empty packages
To: Yi Zhao <yi.zhao@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000061fcd705cb01a300"

--00000000000061fcd705cb01a300
Content-Type: text/plain; charset="UTF-8"

${PN}-dev already isn't empty when you get the "needed by
docker-distribution-dev-v2.7.1-r0.core2_64" message right?

and for empty ${PN}, why don't you set RDEPENDS:${PN}-dev to be empty
instead? empty packages are useless.

On Thu, Sep 2, 2021 at 10:53 AM Yi Zhao <yi.zhao@windriver.com> wrote:

> Allow to create empty packages for docker-distribution and
> docker-distribution-dev to fix the do_populate_sdk error:
> Error: nothing provides docker-distribution = v2.7.1-r0 needed by
> docker-distribution-dev-v2.7.1-r0.core2_64
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../docker-distribution/docker-distribution_git.bb             | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-containers/docker-distribution/
> docker-distribution_git.bb b/recipes-containers/docker-distribution/
> docker-distribution_git.bb
> index 1f6334f..6e93a21 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -72,3 +72,6 @@ SYSTEMD_AUTO_ENABLE:docker-registry = "enable"
>  RDEPENDS:${PN}-ptest:remove = "${PN}"
>
>  CVE_PRODUCT = "docker_registry"
> +
> +ALLOW_EMPTY:${PN} = "1"
> +ALLOW_EMPTY:${PN}-dev = "1"
> --
> 2.25.1
>
>
> 
>
>

--00000000000061fcd705cb01a300
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">${PN}-dev already isn&#39;t empty when you get the &quot;n=
eeded by docker-distribution-dev-v2.7.1-r0.core2_64&quot; message right?<br=
><div><br></div><div>and for empty ${PN}, why don&#39;t you set RDEPENDS:${=
PN}-dev to be empty instead? empty packages are useless.</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2=
, 2021 at 10:53 AM Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com">yi.=
zhao@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Allow to create empty packages for docker-distribution an=
d<br>
docker-distribution-dev to fix the do_populate_sdk error:<br>
Error: nothing provides docker-distribution =3D v2.7.1-r0 needed by docker-=
distribution-dev-v2.7.1-r0.core2_64<br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../docker-distribution/<a href=3D"http://docker-distribution_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">docker-distribution_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/recipes-containers/docker-distribution/<a href=3D"http://docke=
r-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribu=
tion_git.bb</a> b/recipes-containers/docker-distribution/<a href=3D"http://=
docker-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-dis=
tribution_git.bb</a><br>
index 1f6334f..6e93a21 100644<br>
--- a/recipes-containers/docker-distribution/<a href=3D"http://docker-distr=
ibution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribution_gi=
t.bb</a><br>
+++ b/recipes-containers/docker-distribution/<a href=3D"http://docker-distr=
ibution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribution_gi=
t.bb</a><br>
@@ -72,3 +72,6 @@ SYSTEMD_AUTO_ENABLE:docker-registry =3D &quot;enable&quot=
;<br>
=C2=A0RDEPENDS:${PN}-ptest:remove =3D &quot;${PN}&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;docker_registry&quot;<br>
+<br>
+ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
+ALLOW_EMPTY:${PN}-dev =3D &quot;1&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000061fcd705cb01a300--
