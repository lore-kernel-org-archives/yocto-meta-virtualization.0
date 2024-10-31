Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FC3E68950
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 03:56:14 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.5036.1730346969911347981
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 20:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cRmDFGXj;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so464300a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Oct 2024 20:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730346969; x=1730951769; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qD/xdyyXceZTABR6U7cSkvSWPdvVzHsmsNwJY4idOkc=;
        b=cRmDFGXjfHRduqHqNHNe5SwDrSYgMNZMiSkI7k7w90nQo3/jy9yZDT46wyCcqurdsk
         jQK3YA8vo2Zia6YetKitaVa2vSbEMMPSImPJtfXsPerqiS8yrr9copxc8QtCHoVhYZkS
         BnbN7cc+ZYHVYl6i1J+6rVILOsLTONL/yWX7/D7DUTFeYQfZtZlRNHkP7nh9BJIXU29s
         eHX8ffPhYnIK2u4PPulA7f6IJoqnsrdTewtOqa2svO7moS3HD6DzXN6fbbtBuuo49/U/
         dbrl07EwmXMeIXx34mi0gQd59VDGjFEYhBtwp9A8fIOuC9etuNCOtYql38M824bhUTgc
         02mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730346969; x=1730951769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qD/xdyyXceZTABR6U7cSkvSWPdvVzHsmsNwJY4idOkc=;
        b=a2AEesblG/cYP44Pw1yDwcb8Vqw4aVMUOyHI0q8bchTj5ND2Jl/d+zmK9MtIhiuEOx
         VZiTIgGMDWJ123vrfI9VKpD0GsyEsHlOTQ7DGg64eXodsnsDHleiQ0DvUg2C/yLbso8w
         vY8zKn381muxk0KbA02K07e39zdQmmiijWRKbyuF3YnKtwQ6sKMyaBBmfDhXikrteX5B
         AwgMxcZNGI6+NL8qDrdEmQIvGJeaKzg/ZFKTPIsReD3tZqUO9gYUJTNA6hacXJ4vZOaS
         7wzijfv1WvvH9/eqKRp51JIfhD3mSvO49sega9GNvs2ZLdYJE65QO/R5K73KS/usaZSG
         ilfw==
X-Gm-Message-State: AOJu0Yy2dIo8XoxFLkxavHnaXaxofGfxTHqPkafYogI+LaAIGFIyM+9U
	MMo+rrDGW2owPjVCy4phtbd5LiiWyvlxI1sR5UoigSPIFLzh8OzcwpLxF+YQ7Zj2H9MVDNM/9cx
	TmCtxTqXgXDlv7gH+kGtXWtxN/EBwhsN4BNo=
X-Google-Smtp-Source: AGHT+IFazF4s8qLv7f6I8k90nKC4t0oHtj6EBreSWRCb585gixdsm3hMxgVd4gFEA6Rt/AG0ggfubGs/JPY58hg4iVI=
X-Received: by 2002:a05:6a20:7aa8:b0:1d9:25d4:e8b1 with SMTP id
 adf61e73a8af0-1db91dbb788mr1612537637.25.1730346969112; Wed, 30 Oct 2024
 20:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241028073846.1087759-1-xiangyu.chen@eng.windriver.com> <20241028073846.1087759-2-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20241028073846.1087759-2-xiangyu.chen@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 30 Oct 2024 23:55:56 -0400
Message-ID: <CADkTA4P7+11mKUu5xxQfYFtZe5Fb8dEAorUe8Oq44cgHoZMn+g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] lxc: don't allow named listening
 IPv6 address on lxcbrX network interface
To: xiangyu.chen@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006ea8280625bdcca4"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Oct 2024 03:56:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8944

--0000000000006ea8280625bdcca4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch.

I injured my hand (so I couldn't type) and then had to do some release
preparation, but will get to merging his shortly.

Bruce

On Mon, Oct 28, 2024 at 3:36=E2=80=AFAM Xiangyu Chen via lists.yoctoproject=
.org
<xiangyu.chen=3Deng.windriver.com@lists.yoctoproject.org> wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> lxc-net enabled the IPv6 by default since v6.0.0[1], when named enabled o=
n
> system, the lxc-net which based on dnsmasq would fail to bind the IPv6
> address on lxcbrX interface, that cause lxc cannot work correctly.
>
> Add the lxc-net default v6 address to named.conf.option to tell named don=
't
> bind and listen that address.
>
> [1] https://github.com/lxc/lxc/commit/e8888344
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-core/bind/bind_virtualization.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-core/bind/bind_virtualization.inc
> b/recipes-core/bind/bind_virtualization.inc
> index a6e39049..f942d7ad 100644
> --- a/recipes-core/bind/bind_virtualization.inc
> +++ b/recipes-core/bind/bind_virtualization.inc
> @@ -1,4 +1,4 @@
>  # Tell named not to bother listening on the IP address that lxc and
> libvirtd handles itself.
>  do_install:append() {
> -       sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc and libvirtd would
> take care of this address itself\n\tlisten-on { ! 10.0.3.1; !
> 192.168.122.1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
> +       sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc and libvirtd would
> take care of this address itself\n\tlisten-on { ! 10.0.3.1; !
> 192.168.122.1; any;};\n\tlisten-on-v6 { ! fc11:4514:1919:810::1; any;};\n=
,'
> ${D}${sysconfdir}/bind/named.conf.options
>  }
> --
> 2.35.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8938):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8938
> Mute This Topic: https://lists.yoctoproject.org/mt/109253028/1050810
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

--0000000000006ea8280625bdcca4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"><di=
v id=3D"gmail-:23e" class=3D"gmail-Am gmail-aiL gmail-aO9 gmail-Al editable=
 gmail-LW-avf gmail-tS-tW gmail-tS-tY" aria-label=3D"Message Body" role=3D"=
textbox" aria-multiline=3D"true" tabindex=3D"1" style=3D"direction:ltr;min-=
height:85px" aria-controls=3D":260" aria-expanded=3D"false"><div class=3D"g=
mail_default">Thanks for the patch.</div><div class=3D"gmail_default"><br><=
/div><div class=3D"gmail_default">I injured my hand (so I couldn&#39;t type=
) and then had to do some release preparation, but will get to merging=C2=
=A0his shortly.</div><div class=3D"gmail_default"><br></div><div class=3D"g=
mail_default">Bruce</div></div></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 28, 2024 at 3:36=E2=80=AFA=
M Xiangyu Chen via <a href=3D"http://lists.yoctoproject.org">lists.yoctopro=
ject.org</a> &lt;xiangyu.chen=3D<a href=3D"mailto:eng.windriver.com@lists.y=
octoproject.org">eng.windriver.com@lists.yoctoproject.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xiangyu Chen=
 &lt;<a href=3D"mailto:xiangyu.chen@windriver.com" target=3D"_blank">xiangy=
u.chen@windriver.com</a>&gt;<br>
<br>
lxc-net enabled the IPv6 by default since v6.0.0[1], when named enabled on<=
br>
system, the lxc-net which based on dnsmasq would fail to bind the IPv6<br>
address on lxcbrX interface, that cause lxc cannot work correctly.<br>
<br>
Add the lxc-net default v6 address to named.conf.option to tell named don&#=
39;t<br>
bind and listen that address.<br>
<br>
[1] <a href=3D"https://github.com/lxc/lxc/commit/e8888344" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/lxc/lxc/commit/e8888344</a><br>
<br>
Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.co=
m" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-core/bind/bind_virtualization.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-core/bind/bind_virtualization.inc b/recipes-core/bind/=
bind_virtualization.inc<br>
index a6e39049..f942d7ad 100644<br>
--- a/recipes-core/bind/bind_virtualization.inc<br>
+++ b/recipes-core/bind/bind_virtualization.inc<br>
@@ -1,4 +1,4 @@<br>
=C2=A0# Tell named not to bother listening on the IP address that lxc and l=
ibvirtd handles itself.<br>
=C2=A0do_install:append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,^\( *options *{\)$,\1\n\t// lx=
c and libvirtd would take care of this address itself\n\tlisten-on { ! 10.0=
.3.1; ! 192.168.122.1; any;};\n,&#39; ${D}${sysconfdir}/bind/named.conf.opt=
ions<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,^\( *options *{\)$,\1\n\t// lx=
c and libvirtd would take care of this address itself\n\tlisten-on { ! 10.0=
.3.1; ! 192.168.122.1; any;};\n\tlisten-on-v6 { ! fc11:4514:1919:810::1; an=
y;};\n,&#39; ${D}${sysconfdir}/bind/named.conf.options<br>
=C2=A0}<br>
-- <br>
2.35.5<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8938): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8938" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8938</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109253028/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109253028/1050810</a><br>
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
rek II<br><br></div>

--0000000000006ea8280625bdcca4--

