Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C97C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 12:06:13 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.39887.1666008369467278977
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 05:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mMBMsY6K;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id r142so8808970iod.11
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Oct 2022 05:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RWY4iKv7MoS1Ds1HaJI593pBKv+xTZkqohhUeqLmxhs=;
        b=mMBMsY6KwEyBicQ/NvnTV7MTdXaNjI1ismnkVjPoUmXcUkS51y1sAZ/yJUgmXi2MP5
         jLfQ/emMVUhmCHLEywlaj+LG9N5EOBDMRxnMowmwoFa2/a4gvItzw9GjuvsPvqrUblrD
         CfskAnlVsfSlmHL549Ofk15L25hpBaJM8vJ/vsSmRvlSFxbBVb/Qs6uWRBxB0oYq+/hu
         ba9ikJ80ihiz5MczWsKYq4ZrewEVv5dR/2bTAU1tNZIk8MnmBDbVLXpxi4KVQfihP04K
         RONStjtseuX2+Q+s0FuUgqs/tErr1OFHsVp0pqXJc3QJBHyaQiUNfrBbRti9xXDf20+u
         oU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWY4iKv7MoS1Ds1HaJI593pBKv+xTZkqohhUeqLmxhs=;
        b=clvFeeW8E3eotdLLQxvGeb83Bj8Q2iWYWuhOc0G96H2VBy9q3ImL/GyR5QcA91YY7G
         uTGhrFMv82N9u0e38ivQ2QC4FfPnMCV+B9GNbHYzRm7+Ao3Li/CyxCXgLvllsv3nQrHz
         ANe68yEg+FMllgEo49TQYKYlpEfqHIfIRH8gL3eNJ91+nNth0crbaV33LAZudNzDRFB3
         zgAdsrwggA7l4UE9KeLINjX6E+hvvlBs66qVhDqjWVim7S35+BRMDn2HLB+p9QGs5u1/
         i5iTA5uBXadk81dilUbWLXx364+J6R0aAvPSkmzTPfOhstb7k47TTEITaWD6b8aIIJKW
         dNQQ==
X-Gm-Message-State: ACrzQf2uHTFQzgfbNWkB8sobJYu72e7VBIXSJdmZWzMtJUu/olh3vcQ2
	dH4nhc2UGowkwARLl8K5ienKPLYaozhrW8Mhh2s=
X-Google-Smtp-Source: AMsMyM6E05NH6OjEsCV5fnIrteQ1ZrVo8bhkDmTT7pXfUcL6+nAkkRmuoiziMTkx57eTEHJaOb4L0S5BJZzg50DHG60=
X-Received: by 2002:a02:cf05:0:b0:363:a207:c3ff with SMTP id
 q5-20020a02cf05000000b00363a207c3ffmr5154865jar.178.1666008368750; Mon, 17
 Oct 2022 05:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221017111121.25341-1-vasileios.anagnostopoulos@siemens.com>
In-Reply-To: <20221017111121.25341-1-vasileios.anagnostopoulos@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Oct 2022 08:05:57 -0400
Message-ID: <CADkTA4PGeBhrfynE4zUE3tqiC6D8qpn-o12LtEfznMih3d+B6w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/7] podman: allow overwriting the
 container runtime
To: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000326ca05eb39cd09"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Oct 2022 12:06:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7661

--0000000000000326ca05eb39cd09
Content-Type: text/plain; charset="UTF-8"

There's already a mechanism that was being put into place for this, it is
part of some container image
and package group work that is pending (it didn't make this release), so
for now, you'll have to carry
this locally until the rework is refreshed.

That patch creates namesspaces for the cni, cri, etc, and I don't want any
other variables introduced
for this, since once they land in the tree, they are an interface to the
recipes that I don't really change
often.

Bruce

On Mon, Oct 17, 2022 at 7:12 AM Vasileios Anagnostopoulos <
vasileios.anagnostopoulos@siemens.com> wrote:

> Signed-off-by: Vasileios Anagnostopoulos <
> vasileios.anagnostopoulos@siemens.com>
> ---
>  recipes-containers/podman/podman_git.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb
> b/recipes-containers/podman/podman_git.bb
> index e3bc908..dea14ba 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -65,6 +65,9 @@ EXTRA_OEMAKE = " \
>  # packageconfig, the podman package will rconfict with docker.
>  PACKAGECONFIG ?= "docker"
>
> +# Supported are: virtual-runc, crun
> +DEFAULT_CONTAINER_RUNTIME ??= "virtual-runc"
> +
>  do_compile() {
>         cd ${S}/src
>         rm -rf .gopath
> @@ -136,7 +139,7 @@ SYSTEMD_SERVICE:${PN} = "podman.service podman.socket"
>  VIRTUAL-RUNTIME_base-utils-nsenter ?= "util-linux-nsenter"
>
>  RDEPENDS:${PN} += "\
> -       conmon virtual-runc iptables cni skopeo
> ${VIRTUAL-RUNTIME_base-utils-nsenter} \
> +    conmon ${DEFAULT_CONTAINER_RUNTIME} iptables cni skopeo
> ${VIRTUAL-RUNTIME_base-utils-nsenter} \
>         ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'fuse-overlayfs
> slirp4netns', '', d)} \
>  "
>  RRECOMMENDS:${PN} += "slirp4netns kernel-module-xt-masquerade
> kernel-module-xt-comment"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7653):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7653
> Mute This Topic: https://lists.yoctoproject.org/mt/94381602/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000000326ca05eb39cd09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">The=
re&#39;s already a mechanism that was being put into place for this, it is =
part of some container image</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">and package group work that is pending (it didn&#39;t make th=
is release), so for now, you&#39;ll have to carry</div><div class=3D"gmail_=
default" style=3D"font-size:small">this locally until the rework is refresh=
ed.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">That patch creates na=
messpaces=C2=A0for the cni, cri, etc, and I don&#39;t want any other variab=
les introduced</div><div class=3D"gmail_default" style=3D"font-size:small">=
for this, since once they land in the tree, they are an interface to the re=
cipes that I don&#39;t really change</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">often.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 17, 2022 at 7:12 AM Vasileios Anagnostopoulos &=
lt;<a href=3D"mailto:vasileios.anagnostopoulos@siemens.com">vasileios.anagn=
ostopoulos@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Signed-off-by: Vasileios Anagnostopoulos &lt;<a href=
=3D"mailto:vasileios.anagnostopoulos@siemens.com" target=3D"_blank">vasilei=
os.anagnostopoulos@siemens.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a> | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a> b/recipes-containers/po=
dman/<a href=3D"http://podman_git.bb" rel=3D"noreferrer" target=3D"_blank">=
podman_git.bb</a><br>
index e3bc908..dea14ba 100644<br>
--- a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a><br>
+++ b/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a><br>
@@ -65,6 +65,9 @@ EXTRA_OEMAKE =3D &quot; \<br>
=C2=A0# packageconfig, the podman package will rconfict with docker.<br>
=C2=A0PACKAGECONFIG ?=3D &quot;docker&quot;<br>
<br>
+# Supported are: virtual-runc, crun<br>
+DEFAULT_CONTAINER_RUNTIME ??=3D &quot;virtual-runc&quot;<br>
+<br>
=C2=A0do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}/src<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf .gopath<br>
@@ -136,7 +139,7 @@ SYSTEMD_SERVICE:${PN} =3D &quot;podman.service podman.s=
ocket&quot;<br>
=C2=A0VIRTUAL-RUNTIME_base-utils-nsenter ?=3D &quot;util-linux-nsenter&quot=
;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0conmon virtual-runc iptables cni skopeo ${VIRTU=
AL-RUNTIME_base-utils-nsenter} \<br>
+=C2=A0 =C2=A0 conmon ${DEFAULT_CONTAINER_RUNTIME} iptables cni skopeo ${VI=
RTUAL-RUNTIME_base-utils-nsenter} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &=
#39;rootless&#39;, &#39;fuse-overlayfs slirp4netns&#39;, &#39;&#39;, d)} \<=
br>
=C2=A0&quot;<br>
=C2=A0RRECOMMENDS:${PN} +=3D &quot;slirp4netns kernel-module-xt-masquerade =
kernel-module-xt-comment&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7653): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7653" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7653</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/94381602/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/94381602/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--0000000000000326ca05eb39cd09--

