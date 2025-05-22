Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD47EC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 21:59:54 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.35320.1747951187577836755
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 May 2025 14:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BShdn2ZW;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30e93626065so5799803a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 May 2025 14:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747951187; x=1748555987; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UGe6ydzmHiNzXo9NydGkQwuZASXrzTZLyd9Pq8ARa/k=;
        b=BShdn2ZWl52Y5bzUFs8GXwZZ/BbrH1ZSfuKOesF0CmxxTw+U58zxb55uQE2EkTjttV
         u/zgtgGsJGGb3x+uSxVu7hvQjsM6CCYNdIbrVdEyyWqltmuPsMJUqrGBmVnjVy/bOj1R
         hQBuMn0J8k2AHKJxXI2Aj7k8f9dv5k5W68B9YUF1LewEERYtvjCBNZ/TDzb8st4L3+nB
         akb8C+WdHgH0NXSTvopujNwobvMzSxfDL9rYmRz8wFsY13IkUU5kNFQZIN3j9Q7x2mNZ
         9cO4j91j2GVLjD59E5fWM0rOmB4+b9Id2W2nodUiTyqcusvISHEBgk+oSkMDgT4eGMZC
         pYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747951187; x=1748555987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGe6ydzmHiNzXo9NydGkQwuZASXrzTZLyd9Pq8ARa/k=;
        b=BEpfbl6y1NbAu0zJsn7/If9gNbFrA4bBf71QwqABBn4yojqIrzUHBGLICTxXo8MHC6
         uMlmyVQXpy4u0bZZ7j5EAjymyETrr2URp9t+so0zGO6yNTSpQ0fpASZampqppB/ebq+7
         B29wIoD1/0bZk8xoOpB3nidv4YWH6z8Fp7BFTXHv6antTlg8hcx/gkck6UAwilfHHCdR
         CO3tcCLadPNzl37wfHhFh1KP3YsrFN0N89DnMeiofJtaNTETXroZ+MvdLog2VgXa4diU
         n7KXGqQSJOOgrLON17tfskWILA+pMUd2x8R18TwCHaC7PRMFQ8CPLY7pUnXAwGElmUvG
         GtRA==
X-Gm-Message-State: AOJu0YzkfJfwPJR84jX6D+V1tASNjczxv1eYmBVcp0UrPQw0bz0+75aW
	uxX8Iu+5A0K279yy5cHWDn+Oi/EqGyvl4Y4IB3bXugkTaRYTAmcMolGw6IiIw9OPVW/2F9u4uox
	4DrfQepQMkbSOq3JyefK32ZUu08AFy44=
X-Gm-Gg: ASbGncu7ArsppCN4Jh7eTdngOGmp8Um2H2abunVHKISQuVb7czKj0Y2wFG8Gl2RZ2Gr
	04uBBO2IYuytlZNZnGOmwjXBgJvC3ZBh5bdLHcVHUDn1THDnD/Eh9ddrqyJR6RXbbWB+gjqBp4y
	FpdZcoUib3Vas1k+uWUAnu+0E8rZUJdcKORc8=
X-Google-Smtp-Source: AGHT+IF9tJ7yTqkjMf0kZuF0ErAlQmGgA8CNAjVcPquMV2vqTzd3V8kbtEQqansCT6TtfxpYoi1eNIDBMak+vtlfjao=
X-Received: by 2002:a17:90b:56c8:b0:2ff:64c3:3bd9 with SMTP id
 98e67ed59e1d1-30e83216eccmr32749232a91.23.1747951186674; Thu, 22 May 2025
 14:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250522201932.1481656-1-patrick.vogelaar@belden.com>
In-Reply-To: <20250522201932.1481656-1-patrick.vogelaar@belden.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 May 2025 17:59:35 -0400
X-Gm-Features: AX0GCFsGARTPfrmK-NSeZCNVYFdp6GyxyKniXKR9avvrYCZA-F5B5ynelc4YJc8
Message-ID: <CADkTA4OFj6L70KHB3meGRxJ_6kd2B+W=du5mtEynhHFdnXxGmQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] cni: make ca-certificates rrecommends
To: patrick.vogelaar@belden.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009107860635c09997"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 May 2025 21:59:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9257

--0000000000009107860635c09997
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 4:19=E2=80=AFPM Patrick Vogelaar via B4 Relay via
lists.yoctoproject.org <patrick.vogelaar=3Dbelden.com@lists.yoctoproject.or=
g>
wrote:

> Moving ca-certificates from RDEPENDS to RRECOMMENDS allows using cni
> without
> installing all the certificates.

Hmmm. This was done on purpose as kubernetes images using cni won't
Come up with the certificates.

So if this changes, those sorts of images will indirectly break.

If this was a configurable option for the recipe (packageconfig), then
It would be acceptable and consuming distros could modify the
Depends if they don't want the certificates to be installed.

Bruce


>
> Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
> ---
>  recipes-networking/cni/cni_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/
> cni_git.bb
> index e6d71aa2..bd67cd0d 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -109,5 +109,4 @@ INSANE_SKIP:${PN} +=3D "ldflags already-stripped"
>
>  deltask compile_ptest_base
>
> -RDEPENDS:${PN} +=3D " ca-certificates"
> -RRECOMMENDS:${PN} +=3D "iptables iproute2"
> +RRECOMMENDS:${PN} +=3D "ca-certificates iptables iproute2"
> --
> 2.34.1
>
>
> **********************************************************************
> DISCLAIMER:
> Privileged and/or Confidential information may be contained in this
> message. If you are not the addressee of this message, you may not copy,
> use or deliver this message to anyone. In such event, you should destroy
> the message and kindly notify the sender by reply e-mail. It is understoo=
d
> that opinions or conclusions that do not relate to the official business =
of
> the company are neither given nor endorsed by the company. Thank You.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9256):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9256
> Mute This Topic: https://lists.yoctoproject.org/mt/113254268/1050810
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

--0000000000009107860635c09997
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 22, 2025 at 4:19=
=E2=80=AFPM Patrick Vogelaar via B4 Relay via <a href=3D"http://lists.yocto=
project.org">lists.yoctoproject.org</a> &lt;patrick.vogelaar=3D<a href=3D"m=
ailto:belden.com@lists.yoctoproject.org">belden.com@lists.yoctoproject.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">M=
oving ca-certificates from RDEPENDS to RRECOMMENDS allows using cni without=
<br>
installing all the certificates.<span class=3D"gmail_default" style=3D"font=
-size:small"></span></blockquote><div><span class=3D"gmail_default" style=
=3D"font-size:small"></span></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hmmm. This was done on purpose as kubernetes images using cni=
 won&#39;t</div><div class=3D"gmail_default" style=3D"font-size:small">Come=
 up with the certificates.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">So if this changes, those sorts of images will indirectly break.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">If this was a configurable option=
 for the recipe (packageconfig), then</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">It would be acceptable and consuming distros could m=
odify the</div><div class=3D"gmail_default" style=3D"font-size:small">Depen=
ds if they don&#39;t want the certificates to be installed.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
Signed-off-by: Patrick Vogelaar &lt;<a href=3D"mailto:patrick.vogelaar@beld=
en.com" target=3D"_blank">patrick.vogelaar@belden.com</a>&gt;<br>
---<br>
=C2=A0recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a> | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"no=
referrer" target=3D"_blank">cni_git.bb</a> b/recipes-networking/cni/<a href=
=3D"http://cni_git.bb" rel=3D"noreferrer" target=3D"_blank">cni_git.bb</a><=
br>
index e6d71aa2..bd67cd0d 100644<br>
--- a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a><br>
+++ b/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a><br>
@@ -109,5 +109,4 @@ INSANE_SKIP:${PN} +=3D &quot;ldflags already-stripped&q=
uot;<br>
<br>
=C2=A0deltask compile_ptest_base<br>
<br>
-RDEPENDS:${PN} +=3D &quot; ca-certificates&quot;<br>
-RRECOMMENDS:${PN} +=3D &quot;iptables iproute2&quot;<br>
+RRECOMMENDS:${PN} +=3D &quot;ca-certificates iptables iproute2&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
**********************************************************************<br>
DISCLAIMER:<br>
Privileged and/or Confidential information may be contained in this message=
. If you are not the addressee of this message, you may not copy, use or de=
liver this message to anyone. In such event, you should destroy the message=
 and kindly notify the sender by reply e-mail. It is understood that opinio=
ns or conclusions that do not relate to the official business of the compan=
y are neither given nor endorsed by the company. Thank You.<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9256): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9256" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9256</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/113254268/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/113254268/1050810</a><br>
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

--0000000000009107860635c09997--

