Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE3DCF6498
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 23:39:42 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21147.1763595578999011662
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 15:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aoulZgNC;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-343dd5aa6e7so252424a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 15:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763595578; x=1764200378; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tIPEOpQK3yUZDMcI1QOxcINPIIbLZVwZd+gac01KysQ=;
        b=aoulZgNCTNJCWqi/UZt0vqUol3nSTZOLn8/ngaQYsNv9Y1HHKk6TGa4p0/RUCrnriC
         6FgMA4gZyhYK/E8OLzNnvO2VGGYgIW19tqftWDhBt6x4nfGxmTzL7koXKqYaApGdqdiZ
         RpuytPPszID9EYmN+v6DBamxir5Wwu9D4Nz+vTfidIdzPsSFLaNBg1MLvig3MlwEoArv
         LBNkPX/Bggdnd/nWRmDXuzLbIhNkMs90YBSejeZo9OQxMtoDgQ+i+sLh7UGMKJGHHYMa
         uM51RjHElht/An1YiQKX/5jZGMT9+0kj+AowUg6LCVZlPCyX0fGInNUZ9RqQeemRRb01
         mYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763595578; x=1764200378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIPEOpQK3yUZDMcI1QOxcINPIIbLZVwZd+gac01KysQ=;
        b=seFu381wtxPvzWFuknDFkoLLdxPrpsj/jPGCxMAqiGZN3Za+5OsaUR+LbxhSE2pVcD
         cMBvnI5ZCjapa0LUh/o7x1qckm/KpPlvWWBD8CR/+ChyaAjkBDkQxK2TfMQ9JHUCTbEX
         9eWjOM8nWtowCb0pFizJ5+rubqPuIyRC2D8msqe/A8KlS8E20nhmtYh8Qw9gTLq6g8e8
         H9id8Pld8i1ZftHbXqSsw80k8VwmnmhcX2BnlNFhWtczFGr8U5ENlT4LNe0gM5J2YANJ
         eLXkGCOndNn8ldjxERGRKsl0sa0KtSQIbku9kA/InfglAAhhbl1xExj0HIMqAYFnRq7t
         KtOQ==
X-Gm-Message-State: AOJu0YyuMXUczJv+V4BmLpEaymEHardIWuV+PnyLo4HSGxUEuOYvfNn7
	HuFz2E701pM9eVB3xt9BzLPcMxYQVeZosAZ2hps/GZA7sH9DIKM71oLeavLB5sqEzwyt0INkrCO
	dndXNOiA+O5/8vFhH03WJrsa3jFEkC2U=
X-Gm-Gg: ASbGncv/Jwx5P+aSWAVnp1IfE/f7oQffu5VtcSDQXVkvsUFba2jTM+BgjYUqyW01vYa
	gk+cXDHO3mRAtqn55k5Ydo28cmGRfP+E9MHO3cTowANi0/RfozcXC58m5DUa9UnzuVYtyXC1Wq5
	n02suytVrDuLEs9vyRwZNZKeugNTeMyJQy+UplPJ7QN9U2VfmIZFlJuKBYkZRxvQK1Kf5tiIwIR
	0fjrVJjViAlW7L8PcXHPQApxOYQn7imIpFl449+ZxDqF7sth6sFODILrdvxuKym28Pky2ZSAZF9
	FthdqCY=
X-Google-Smtp-Source: AGHT+IG3eCuCtWeed6wya3Sxy21cEodAdd4hvNnyfLeozRG2LHA65NX+D97TCABlAfpm9zjVFXlkfU4f+e7oTQ32k24=
X-Received: by 2002:a17:90b:4a91:b0:341:761c:3330 with SMTP id
 98e67ed59e1d1-3472841d17amr990641a91.23.1763595578347; Wed, 19 Nov 2025
 15:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20240430061733.3518484-1-changqing.li@windriver.com>
 <ZjPU1aQrRd2rs7hR@gmail.com> <445921.1763099458031068955@lists.yoctoproject.org>
In-Reply-To: <445921.1763099458031068955@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Nov 2025 18:39:26 -0500
X-Gm-Features: AWmQ_bnQs8Kb8Mie6RvVGfaWgdGDAWryU0TW3pTZbhXJLNc-QH6muQTh_RDTIn4
Message-ID: <CADkTA4M5hsyScYp38JTrwzFhYtzitxC4GUPUkrsRhsfigR1Pyw@mail.gmail.com>
Subject: Re: [master][scarthgap][meta-virtualization][PATCH] kubernetes: skip
 textrel QA warning
To: nvhieudt11@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f995b70643fb17a8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 23:39:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9452

--000000000000f995b70643fb17a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 12:50=E2=80=AFAM nvhieudt11 via lists.yoctoproject.=
org
<nvhieudt11=3Dgmail.com@lists.yoctoproject.org> wrote:

> Hi Changqing Li, Bruce!
>
> My understanding is that CGO is disabled directly in the build script
> because building statically can fail on certain environments that don=E2=
=80=99t
> have all the required static libraries. However, for meta-layer builds
> with Yocto, could we enable CGO and set -extldflags "-static"
> so that we can apply some default security flags from Yocto, such as PIE
> and RELRO?
>
>
> https://git.yoctoproject.org/poky/plain/meta/conf/distro/include/security=
_flags.inc?h=3Dscarthgap
>
> Could there be any runtime issues when enabling CGO and building
> statically?
>

I used to build most of the go applications using -static, but have moved
away from it in most
cases as it was causing other integration issues (and possible security and
footprint issues).
I'm not pulling up all the runtime issues from memory but can dig more
another time.

If we do want this to be something enabled via an image or distro feature
(or even packageconfig)
that is possible, but I wouldn't make it the default.

Bruce



> I hope to receive your feedback.
> Hieu
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9440):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9440
> Mute This Topic: https://lists.yoctoproject.org/mt/105816435/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000f995b70643fb17a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 14, 2025 at 12:50=
=E2=80=AFAM nvhieudt11 via <a href=3D"http://lists.yoctoproject.org">lists.=
yoctoproject.org</a> &lt;nvhieudt11=3D<a href=3D"mailto:gmail.com@lists.yoc=
toproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div>
<div>Hi <span style=3D"color:rgb(51,51,51);font-family:system-ui,&quot;Sego=
e UI&quot;,Roboto,&quot;Helvetica Neue&quot;,&quot;Noto Sans&quot;,&quot;Li=
beration Sans&quot;,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Se=
goe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;=
;font-size:16px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;word-spacing:0px;white-space:pre-wrap;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">Changqing Li, <span style=3D"color:r=
gb(51,51,51);font-family:system-ui,&quot;Segoe UI&quot;,Roboto,&quot;Helvet=
ica Neue&quot;,&quot;Noto Sans&quot;,&quot;Liberation Sans&quot;,Arial,sans=
-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe=
 UI Symbol&quot;,&quot;Noto Color Emoji&quot;;font-size:16px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
word-spacing:0px;white-space:pre-wrap;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline">Bruce!<br><br>My understanding is that CGO is disabled directly in=
 the build script</span></span></div>
<div><span style=3D"color:rgb(51,51,51);font-family:system-ui,&quot;Segoe U=
I&quot;,Roboto,&quot;Helvetica Neue&quot;,&quot;Noto Sans&quot;,&quot;Liber=
ation Sans&quot;,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;;fo=
nt-size:16px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;word-spacing:0px;white-space:pre-wrap;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline"><span style=3D"color:rgb(51,51,51);font=
-family:system-ui,&quot;Segoe UI&quot;,Roboto,&quot;Helvetica Neue&quot;,&q=
uot;Noto Sans&quot;,&quot;Liberation Sans&quot;,Arial,sans-serif,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,=
&quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;word-spacing:0px;=
white-space:pre-wrap;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">because =
building statically can fail on certain environments that don=E2=80=99t </s=
pan></span></div>
<div><span style=3D"color:rgb(51,51,51);font-family:system-ui,&quot;Segoe U=
I&quot;,Roboto,&quot;Helvetica Neue&quot;,&quot;Noto Sans&quot;,&quot;Liber=
ation Sans&quot;,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;;fo=
nt-size:16px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;word-spacing:0px;white-space:pre-wrap;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline"><span style=3D"color:rgb(51,51,51);font=
-family:system-ui,&quot;Segoe UI&quot;,Roboto,&quot;Helvetica Neue&quot;,&q=
uot;Noto Sans&quot;,&quot;Liberation Sans&quot;,Arial,sans-serif,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,=
&quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;word-spacing:0px;=
white-space:pre-wrap;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">have all=
 the required static libraries. However, for meta-layer builds </span></spa=
n></div>
<div><span style=3D"color:rgb(51,51,51);font-family:system-ui,&quot;Segoe U=
I&quot;,Roboto,&quot;Helvetica Neue&quot;,&quot;Noto Sans&quot;,&quot;Liber=
ation Sans&quot;,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;;fo=
nt-size:16px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;word-spacing:0px;white-space:pre-wrap;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline"><span style=3D"color:rgb(51,51,51);font=
-family:system-ui,&quot;Segoe UI&quot;,Roboto,&quot;Helvetica Neue&quot;,&q=
uot;Noto Sans&quot;,&quot;Liberation Sans&quot;,Arial,sans-serif,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,=
&quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;word-spacing:0px;=
white-space:pre-wrap;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">with Yoc=
to, could we enable CGO and set <code>-extldflags &quot;-static&quot;</code=
> </span></span></div>
<div><span style=3D"color:rgb(51,51,51);font-family:system-ui,&quot;Segoe U=
I&quot;,Roboto,&quot;Helvetica Neue&quot;,&quot;Noto Sans&quot;,&quot;Liber=
ation Sans&quot;,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;;fo=
nt-size:16px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;word-spacing:0px;white-space:pre-wrap;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline"><span style=3D"color:rgb(51,51,51);font=
-family:system-ui,&quot;Segoe UI&quot;,Roboto,&quot;Helvetica Neue&quot;,&q=
uot;Noto Sans&quot;,&quot;Liberation Sans&quot;,Arial,sans-serif,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,=
&quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;word-spacing:0px;=
white-space:pre-wrap;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">so that =
we can apply some default security flags from Yocto, such as PIE and RELRO?=
<br></span></span></div>
<div>=C2=A0</div>
<div><span style=3D"color:rgb(51,51,51);font-family:system-ui,&quot;Segoe U=
I&quot;,Roboto,&quot;Helvetica Neue&quot;,&quot;Noto Sans&quot;,&quot;Liber=
ation Sans&quot;,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;;fo=
nt-size:16px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;word-spacing:0px;white-space:pre-wrap;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline"><span style=3D"color:rgb(51,51,51);font=
-family:system-ui,&quot;Segoe UI&quot;,Roboto,&quot;Helvetica Neue&quot;,&q=
uot;Noto Sans&quot;,&quot;Liberation Sans&quot;,Arial,sans-serif,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,=
&quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;word-spacing:0px;=
white-space:pre-wrap;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline"><a href=
=3D"https://git.yoctoproject.org/poky/plain/meta/conf/distro/include/securi=
ty_flags.inc?h=3Dscarthgap" rel=3D"noopener" target=3D"_blank">https://git.=
yoctoproject.org/poky/plain/meta/conf/distro/include/security_flags.inc?h=
=3Dscarthgap</a></span></span></div>
<div>=C2=A0</div>
<div><span style=3D"color:rgb(51,51,51);font-family:system-ui,&quot;Segoe U=
I&quot;,Roboto,&quot;Helvetica Neue&quot;,&quot;Noto Sans&quot;,&quot;Liber=
ation Sans&quot;,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;;fo=
nt-size:16px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;word-spacing:0px;white-space:pre-wrap;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline"><span style=3D"color:rgb(51,51,51);font=
-family:system-ui,&quot;Segoe UI&quot;,Roboto,&quot;Helvetica Neue&quot;,&q=
uot;Noto Sans&quot;,&quot;Liberation Sans&quot;,Arial,sans-serif,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,=
&quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;word-spacing:0px;=
white-space:pre-wrap;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">Could th=
ere be any runtime issues when enabling CGO and building statically?<br></s=
pan></span></div></div></blockquote><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">I used to build most of the go applicat=
ions using -static, but have moved away from it in most</div><div class=3D"=
gmail_default" style=3D"font-size:small">cases as it was causing other inte=
gration=C2=A0issues (and possible security and footprint issues).</div><div=
 class=3D"gmail_default" style=3D"font-size:small">I&#39;m not pulling up a=
ll the runtime issues from memory but can dig more another time.</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">If we do want this to be something =
enabled via an image or distro feature (or even packageconfig)</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">that is possible, but I wou=
ldn&#39;t make it the default.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Bruce=C2=A0</div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div><div><span style=3D"color:rgb(51,51,51);font-=
family:system-ui,&quot;Segoe UI&quot;,Roboto,&quot;Helvetica Neue&quot;,&qu=
ot;Noto Sans&quot;,&quot;Liberation Sans&quot;,Arial,sans-serif,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&=
quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;word-spacing:0px;w=
hite-space:pre-wrap;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline"><span sty=
le=3D"color:rgb(51,51,51);font-family:system-ui,&quot;Segoe UI&quot;,Roboto=
,&quot;Helvetica Neue&quot;,&quot;Noto Sans&quot;,&quot;Liberation Sans&quo=
t;,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot=
;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;;font-size:16px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;word-spacing:0px;white-space:pre-wrap;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">I hope to receive your feedback.<br>Hieu</span></span=
></div>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9440): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9440" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9440</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105816435/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/105816435/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000f995b70643fb17a8--

