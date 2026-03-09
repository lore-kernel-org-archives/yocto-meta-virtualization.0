Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37732F3C24F
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:22:06 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14065.1773062524127284425
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 06:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LN1xbTBl;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70bfef17a4so7167180a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Mar 2026 06:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773062523; cv=none;
        d=google.com; s=arc-20240605;
        b=WLjtkYg8+enULujP2SmylvMuoYq+rm0486AjA6Naq4cR7Yw75oE7OIU8fsE3A2xpMw
         9/5/7wC32Pn7eRxWsJwFEzt/e+0gG5akemnP6jjbttXG2mTJRM5olCPRZpepyLtDJ7tE
         hPboTuA8D+X3JPGp1329bKqaZDFieyXtmwM57NwmYWHg0g1LEk0vz53ac4VsjxaJ4eWf
         qLdELyhVoim534aGswokn9X85+ZmXJlpbHiRMBdn9moJLZBtqhJ+zQHzVchJMaC89yzR
         42Noh+UggcJzWfPZdDUOYbowT+eP5zSuiDaR0uuLqa/8x8oDg69ohM+330DMyPCSPPHn
         ayqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KwH5ny+qhUinYeIqauBxKPhGqxP3Lcye8Y6Wg5OwZvk=;
        fh=OClHZqodWSNbeHsUYFR0FyVz9DAVa4a7109tpdSIGh0=;
        b=daWBW1DVuHZHqu8ONKTuj43pvyKF5k2jVHLE80FQ/psA/z60KlBEy24euEgr9Y9oyw
         OlnICq0jP7KXEecKMSazvohl1nxr1Nr6+8cFt7fv8UdxURngE5BTbEisPbw2iwl5QOsV
         puy4ycm+Nw3DFFDVNtTwBXCvAqWp4nigcV7pY+5HwL6rWOtYYuoBjhrlG2qLrSuyJnWn
         I612rylyV1lOhYi3WxxslpDEitzOe7itu786F1NMnNxz+Pp3+aULJrEcl9OqXbpOxYgz
         cKJOYLZzSIXrdyZ84ADGos8Mu07WJDhIxSfmwFJjVDFUcug+cSmFyZUmqcrNABNEEeN/
         VUsA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773062523; x=1773667323; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KwH5ny+qhUinYeIqauBxKPhGqxP3Lcye8Y6Wg5OwZvk=;
        b=LN1xbTBlEaG6aLcuXbR6hbTFTtlgfZ0WAMht5ITxHVQPlq9IiALqgKz22bKc2vNeW1
         jt8ZuFTew7ZiMiivoTc5x9USpuyooI5DKuk6iIPi6YToGOIupCrdv6oNHX9R5LXuQEdP
         TE7aLG3DWBsgiWJ8rUwE5dqb0BOk+qQ43/wVPePzOnA9q6KsiPaNcn9D/SAbyvftOfFm
         ZJ0/5pVSYBiGnk4bMXEInFIUFtySDO4eeLLkiuZ6jAUwrHZeHVU4CBWT5cn0Pv3Ol+Tz
         UxECRaahRuUaKDMA5Wo32N77RcsMcgtmDT/dgBwljGhgTS3i7WOc5rcXJIASlP8D/gO+
         iaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062523; x=1773667323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwH5ny+qhUinYeIqauBxKPhGqxP3Lcye8Y6Wg5OwZvk=;
        b=BfnYV0+AzLl3ZzVB4vFove6duE4/l2MxPnWmyjO2NRB16lBL46rHvBlM7403oY0uT1
         ih+WaW0AR2w7aCrQ5dCMVn/fAvMMk7+hrCUeKCU2qJJZuGvlR1LQXHN7DIS7l+psELsh
         SQq+sLVxw82QtkAYB4k+bjyfIHJFKlwu+hPzRcWa6OX1HvGpsYf49DtVqGrr230vwsu/
         JGMvu5JC4h8jIvGT3rmk/aKUi1usfXd/G/1wrPvnEUJjJBhHzJCr1qgsP5imvrsXZiUh
         KCnDPkzSvxj/+9H2mlrGBjF6juv9b11wgZ3/rE9es6fG/d1iSGcQVhGmV/EhXc+xZ6K/
         j7xw==
X-Gm-Message-State: AOJu0YxVE0kFGvOyQeEI0Ezp1RHj0Mdd68YKtHxue6wbALZ6Ysqo63x+
	YLUht2vxCGHiOFyQGy3AdY7oqpMmevF1fRwLi8BBmMS9np38l7/dPdCW+AAVZypBXD+pRiDOMSb
	hlbu28FloiQwhNG+AyBE/IcUaeF+9P9k=
X-Gm-Gg: ATEYQzxLUN1DeSMtpALYHGxMK5Ldk+kjn/ehde5FoKAA7EjLjvDbHAOoge+/2VvTYSc
	WHTQM6oLF9MTf3gv64xoSqubWfvFftyHDYjMVpuzK/UgOaHPnA4Ip394HwJOvYgkmdAGRXOYqPA
	z4Sc/RYFk2JBamYQP9UrAtsyPBKiioKSUgD+AjOqdjlzPq7ag65Nv7+TQZqjEZS+UzlBMfCrtV4
	2TWkKtIsKROQLh0XgWbcvhC6qsETZz/2v49QvvO+CZ3p04Dmu/HYmKohpij5bzjamGI/MSn5F5L
	IOK02w0t7xOeaR9V8te6wLPFv37U2m6PYZ4by63U
X-Received: by 2002:a05:6300:4045:b0:394:f972:43c3 with SMTP id
 adf61e73a8af0-398590dd348mr10851418637.63.1773062522965; Mon, 09 Mar 2026
 06:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <TY3PR01MB101107358F0B9DB8423E4529A9B7AA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <CADkTA4M2kCghCv75qd83WZ3KPcP0W8J84Z5onLkJ1TUjisWFMQ@mail.gmail.com> <OS7PR01MB144446379D645D96FE313F4C49B79A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB144446379D645D96FE313F4C49B79A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Mar 2026 09:21:51 -0400
X-Gm-Features: AaiRm526oWwP5nO2Ct5dDbYxeqYw928MzzasiTmWHyPupqq1e73R5Cx4gOGCkTs
Message-ID: <CADkTA4NNDqHooBO14LPhhJ3LVB5ON89n2AJo0ka1W_EFKkXjyw@mail.gmail.com>
Subject: Re: Depends about podman rootless
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000d892d9064c9749c4"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Mar 2026 13:22:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9629

--000000000000d892d9064c9749c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 4:37=E2=80=AFAM Yiding Liu (Fujitsu) <liuyd.fnst@fuj=
itsu.com>
wrote:

> Hi Bruce
>
>     I have read the doc of podman and found some improvement points:
>
>    1.  "The code samples are intended to be run as a non-root user..." is
>    mentioned in
>
>    Getting Started with Podman | Podman <https://podman.io/docs>
>
>               So, maybe it was suggested to use rootless?
>

rootless can be an option. But it won't be the meta-virt default.



>
>
>    2. And then in Installation doc, it says
>
>           "slirp4netns is no longer the default for rootless networking o=
n
> new podman installations, obsoleted in favor of passt
> <https://passt.top/passt/about/>. "
>            Podman Installation | Podman
> <https://podman.io/docs/installation>
>
>            So, I think we should use passt to instead of slirp4netns as
> RDPEND for podman in rootless .
>

No. It still needs to be variable, which someone can tune as they see fit.

Redhat has the bad habit of re-writing the stack to where they can control
all the elements, the policy of meta-virt has always been to maintain the
flexibility of choice.



>
>        3.  By the way, the RDEPEND fuse-overlayfs is an Optional package =
may
> resolve a number of issues, e.g. the one from Ecryptfs, so I think we
> should add a PACKAGECONFIG for it.
>

A packageconfig is fine, but again, not on by default.



>
>          As considering mentioned above, I want to make to new patch for
> podman as following:
>            diff --git a/recipes-containers/podman/podman_git.bb
> b/recipes-containers/podman/podman_git.bb
> index 53b9b6a0..3ca217cc 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -67,8 +67,9 @@ EXTRA_OEMAKE =3D " \
>  # variable, the podman package will rconfict with docker.
>  PODMAN_FEATURES ?=3D "docker"
>
> -PACKAGECONFIG ?=3D ""
> -PACKAGECONFIG[rootless] =3D ",,,fuse-overlayfs slirp4netns,,"
> +PACKAGECONFIG ?=3D "rootless"
>


> +PACKAGECONFIG[rootless] =3D ",,,passt,,"
> +PACKAGECONFIG[fuse] =3D ",,,fuse-overlayfs,,"
>
>  do_compile() {
>         cd ${S}/src
> @@ -117,11 +118,6 @@ do_install() {
>         if ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'true',
> 'false', d)}; then
>                 install -d "${D}${sysconfdir}/sysctl.d"
>                 install -m 0644 "${UNPACKDIR}/50-podman-rootless.conf"
> "${D}${sysconfdir}/sysctl.d"
> -               install -d "${D}${sysconfdir}/containers"
> -               cat <<-EOF >>
> "${D}${sysconfdir}/containers/containers.conf"
> -               [NETWORK]
> -               default_rootless_network_cmd=3D"slirp4netns"
> -               EOF
>         fi
>  }
>
>        What do you think about it.
>

See above.

Bruce



>   Liu
>
> ------------------------------
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2026=E5=B9=B43=E6=9C=886=E6=97=A5=
 22:17
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81 <=
liuyd.fnst@fujitsu.com>
> *=E6=8A=84=E9=80=81:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org>
> *=E4=B8=BB=E9=A2=98:* Re: Depends about podman rootless
>
>
>
> On Fri, Mar 6, 2026 at 2:04=E2=80=AFAM Yiding Liu (Fujitsu) <
> liuyd.fnst@fujitsu.com> wrote:
>
> Hi Bruce
>     When I try to run container with  podman rootless, it showed followin=
g
> error:
>  $ podman run -it xxx
>  Error: could not find pasta, the network namespace can't be configured:
> exec: "pasta": executable file not found in $PATH
>
>    Which means pasta is required by  podman rootless.
>    Pasta command is provided by passt recipe, so I want to send a patch t=
o
> fix this issue like
>
>
> I'm still attempting to keep all of the networking and
> infrastructure dependencies
> for the runtimes by variable, even if there's less flexibility now.
>
> That being said, podman's networking is typically provided by network whi=
ch
> is what the profile's have for that selection.
>
> This sort of falls into a "support utility" category,  and in that case,
> it would be
> better in the podman recipe itself, under a "rootless" packagecconrfig
> option.
>
> If there needs to be coordination between multiple recipes and packages t=
o
> make rootless work, then it could be promoted to a distro or image featur=
e
> and then the podman packageconfig could trigger off of that.
>
> That
>
>
>
>
>   diff --git a/recipes-core/packagegroups/packagegroup-container.bb
> b/recipes-core/packagegroups/packagegroup-container.bb
> index b94e6799..c861e508 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -39,6 +39,7 @@ RDEPENDS:packagegroup-docker =3D " \
>
>  RDEPENDS:packagegroup-podman =3D " \
>      podman \
> +    passt \
>  "
>
>  What do you think about my suggestion=EF=BC=9F
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d892d9064c9749c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 9, 2026 at 4:37=
=E2=80=AFAM Yiding Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.c=
om">liuyd.fnst@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div class=3D"msg4903875284372122694">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<span style=3D"background-color:white">Hi Bruce</span></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<span style=3D"background-color:white"><br>
</span></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<span style=3D"background-color:white">=C2=A0 =C2=A0 I have read the doc of=
 podman and found some improvement points:</span></div>
<ol style=3D"margin-top:0px;margin-bottom:0px;list-style-type:decimal" star=
t=3D"1">
<li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calib=
ri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<div role=3D"presentation">=C2=A0&quot;The code samples are intended to be =
run as a non-root user...&quot; is mentioned in=C2=A0</div>
</li></ol>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0<a id=3D"m_4903875284372122694OWA9186c479-0a73-47a4-da4a-c414a=
6d69b85" href=3D"https://podman.io/docs" target=3D"_blank">Getting Started =
with Podman | Podman</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 So, maybe it was suggested=
 to use rootless?</div></div></div></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">rootless can be an option. =
But it won&#39;t be the meta-virt default.</div><br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg49038752=
84372122694"><div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<ol style=3D"margin-top:0px;margin-bottom:0px;list-style-type:decimal" star=
t=3D"2">
<li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calib=
ri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<div role=3D"presentation">And then in Installation doc, it says</div>
</li></ol>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;slirp4netns is no longer the defau=
lt for rootless networking on new podman installations, obsoleted in favor =
of
<span style=3D"color:rgb(30,204,255)"><a style=3D"color:rgb(30,204,255);tex=
t-align:left" rel=3D"noopener noreferrer" id=3D"m_4903875284372122694OWA8c4=
bfc53-01ce-6627-3dd1-f0701371003d" href=3D"https://passt.top/passt/about/" =
target=3D"_blank">passt</a></span>.=C2=A0&quot;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a id=3D"m_4903875284372122694OWAb=
d951f7a-7888-2b46-ff9a-dfeadf54217a" href=3D"https://podman.io/docs/install=
ation" target=3D"_blank">Podman Installation | Podman</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0So, I think we should use passt to=
 instead of slirp4netns as RDPEND for podman in rootless .</div></div></div=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">No. It still needs to be variable, which someone can tune as =
they see fit.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Redhat has =
the bad habit of re-writing the stack to where they can control</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">all the elements, the poli=
cy of meta-virt has always been to maintain the</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">flexibility of choice.</div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg4903875284372122694"><div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A03.=C2=A0 By the way, the RDEPEND fuse-overlayfs =
is an <span style=3D"font-weight:600">
Optional package </span>may resolve a number of issues, e.g. the one from E=
cryptfs, so I think we should add a PACKAGECONFIG for it.=C2=A0</div></div>=
</div></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">A packageconfig is fine, but again, not on by default.=
</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div class=3D"msg4903875284372122694"><div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0As considering mentioned above, I want to=
 make to new patch for podman as following:</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/recipes-containers/po=
dman/<a href=3D"http://podman_git.bb" target=3D"_blank">podman_git.bb</a> b=
/recipes-containers/podman/<a href=3D"http://podman_git.bb" target=3D"_blan=
k">podman_git.bb</a></div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
index 53b9b6a0..3ca217cc 100644</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
--- a/recipes-containers/podman/<a href=3D"http://podman_git.bb" target=3D"=
_blank">podman_git.bb</a></div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+++ b/recipes-containers/podman/<a href=3D"http://podman_git.bb" target=3D"=
_blank">podman_git.bb</a></div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
@@ -67,8 +67,9 @@ EXTRA_OEMAKE =3D &quot; \</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0# variable, the podman package will rconfict with docker.</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0PODMAN_FEATURES ?=3D &quot;docker&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
-PACKAGECONFIG ?=3D &quot;&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
-PACKAGECONFIG[rootless] =3D &quot;,,,fuse-overlayfs slirp4netns,,&quot;</d=
iv>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+PACKAGECONFIG ?=3D &quot;rootless&quot;</div></div></div></blockquote><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg4903875284372122694"><div dir=3D"ltr">
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+PACKAGECONFIG[rootless] =3D &quot;,,,passt,,&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+PACKAGECONFIG[fuse] =3D &quot;,,,fuse-overlayfs,,&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0do_compile() {</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}/src</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
@@ -117,11 +118,6 @@ do_install() {</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;=
, &#39;rootless&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d &quot;${=
D}${sysconfdir}/sysctl.d&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 &qu=
ot;${UNPACKDIR}/50-podman-rootless.conf&quot; &quot;${D}${sysconfdir}/sysct=
l.d&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d &quot;${D}${s=
ysconfdir}/containers&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &lt;&lt;-EOF &gt;&gt=
; &quot;${D}${sysconfdir}/containers/containers.conf&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [NETWORK]</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_rootless_network=
_cmd=3D&quot;slirp4netns&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EOF</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0}</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0What do you think about it.</div></div></div></b=
lockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">See above.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div class=3D"msg4903875284372122694"><div dir=3D"ltr">
<div style=3D"margin:25px 0px 20px" id=3D"m_4903875284372122694optional-pac=
kages">
<div style=3D"text-align:left;text-indent:0px;line-height:1.75rem;font-fami=
ly:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-seri=
f;font-size:12pt;color:rgb(0,0,0)">
=C2=A0=C2=A0Liu</div>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0</div>
<div id=3D"m_4903875284372122694appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_4903875284372122694divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>=E5=8F=91=
=E4=BB=B6=E4=BA=BA:</b> Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield=
@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<b>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b> 2026=E5=B9=B43=E6=9C=886=E6=97=
=A5 22:17<br>
<b>=E6=94=B6=E4=BB=B6=E4=BA=BA:</b> Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=
=81 &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuyd.f=
nst@fujitsu.com</a>&gt;<br>
<b>=E6=8A=84=E9=80=81:</b> <a href=3D"mailto:meta-virtualization@lists.yoct=
oproject.org" target=3D"_blank">meta-virtualization@lists.yoctoproject.org<=
/a> &lt;<a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" targe=
t=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>&gt;<br>
<b>=E4=B8=BB=E9=A2=98:</b> Re: Depends about podman rootless</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">
<div style=3D"font-size:small"><br>
</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Fri, Mar 6, 2026 at 2:04=E2=80=AFAM Yiding Liu (Fujitsu=
) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuyd.fns=
t@fujitsu.com</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div>
<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
<span style=3D"background-color:white">Hi Bruce</span></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 When I try to run container with =C2=A0podman rootless, it sh=
owed following error:</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0$ podman run -it xxx</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0Error: could not find pasta, the network namespace can&#39;t be confi=
gured: exec: &quot;pasta&quot;: executable file not found in $PATH</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0Which means pasta is required by =C2=A0podman rootless.=C2=A0<=
/div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0Pasta command is provided by passt recipe, so I want to send a=
 patch to fix this issue like</div>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>
<div style=3D"font-size:small">I&#39;m still attempting to keep all of the =
networking and infrastructure=C2=A0dependencies</div>
<div style=3D"font-size:small">for the runtimes by variable, even=C2=A0if t=
here&#39;s less flexibility now.</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">That being said, podman&#39;s networking is =
typically provided by network=C2=A0which</div>
<div style=3D"font-size:small">is what the profile&#39;s have for that sele=
ction.</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">This sort of falls into a &quot;support util=
ity&quot; category,=C2=A0 and in that case, it would be</div>
<div style=3D"font-size:small">better in the podman recipe itself, under a =
&quot;rootless&quot;=C2=A0packagecconrfig=C2=A0</div>
<div style=3D"font-size:small">option.</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">If there needs to be coordination between mu=
ltiple recipes and packages to</div>
<div style=3D"font-size:small">make rootless work, then it could be promote=
d to a distro or image feature</div>
<div style=3D"font-size:small">and then the podman packageconfig could trig=
ger off of that.</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">That=C2=A0</div>
<br>
</div>
<div>=C2=A0</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div>
<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 diff --git a/recipes-core/packagegroups/<a href=3D"http://packagegro=
up-container.bb" target=3D"_blank">packagegroup-container.bb</a> b/recipes-=
core/packagegroups/<a href=3D"http://packagegroup-container.bb" target=3D"_=
blank">packagegroup-container.bb</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
index b94e6799..c861e508 100644</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
--- a/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" target=3D"_blank">packagegroup-container.bb</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+++ b/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" target=3D"_blank">packagegroup-container.bb</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
@@ -39,6 +39,7 @@ RDEPENDS:packagegroup-docker =3D &quot; \</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0RDEPENDS:packagegroup-podman =3D &quot; \</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0podman \</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0passt \</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0&quot;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-size:12pt"><span style=3D"font-family:Aptos,Aptos_Embedd=
edFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;color:rgb(0,0,0)">=
=C2=A0</span><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif,serif,EmojiFont;color:black;backgrou=
nd-color:white">What
 do you think about my suggestion=EF=BC=9F</span></div>
</div>
</div>
</blockquote>
</div>
<div><br clear=3D"all">
</div>
<div><br>
</div>
<span>-- </span><br>
<div dir=3D"ltr">- Thou shalt not follow the NULL pointer, for chaos and ma=
dness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</div>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--000000000000d892d9064c9749c4--

