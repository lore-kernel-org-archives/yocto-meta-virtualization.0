Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FE9C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 15:54:40 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web10.39430.1679932479751880367
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Mar 2023 08:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eiHNesIo;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id cu36so7897579vsb.7
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Mar 2023 08:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679932479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dc+niQ3FCwRxzcV1qtW0dnrslLU9l609Qrw4hm5u3es=;
        b=eiHNesIoi9zvAGdjxCax7+hOgbD3SBBMwzos88Us5Kjl/blOtl3/oAGaLI9+En4THA
         ovlKbJxlB6z7HN42vboNwUXlKfvvPVJP7FePXWd1QcNmi4nm1ma/+vkc3yNAjOuDNk2g
         FKZdN6rmGUxqfgrS/AFfX33x/aYgkJDVXhMamCwbWIGr9YW8Az1Rz01iezguqVdtl9Cw
         IwiyXjzigGYylZJAr4XpTJtY4KFcGxTnYc/sHAqsujZWozZ99QMwWhh1L+kVoHk8xQH7
         p7n5uKCgKgAdDtkJBE/sJBkR1gVDF98hSJMCPWj72tD1ecfMRCKm5My4Tde6mtJEeKCN
         geCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679932479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dc+niQ3FCwRxzcV1qtW0dnrslLU9l609Qrw4hm5u3es=;
        b=DQa6uMPVsGIn7xgBi4bdpzmGDXcWDIH2ZII3PQlGB+I2Qn3KD/grVAzeKnV9Y0PRuA
         RMucCgdoC6gntcmNRwwzNPtwuJgy2Xv2t1omtXATsug4CtRJw30biJjB8oExOYTu1jgb
         mUOiul1ZumwLuEWwY0ImwqaSK6BwY3cwUfBEjKNknbhduVnIKzQb9468DJuH8z5W/YkO
         4g4faJjKMswT4jabETcdshV/GBYUiFYoNnViNvrtM7sZss1a6g7WA11h8AJ+jSsTjnP2
         6HDSnIL3l3yhL8vyfA+yk0L5CCr2WBMNwRS9m9rHTQpHo9dioO2DgoWpafpIVMf2CDGM
         VTKQ==
X-Gm-Message-State: AAQBX9cfjqGLHvyno+u6Ln+59+238wo3DvEoT8Ha9sQQ+S09DFmJ7V9J
	ytsUw8+kmgya/NDR4z4arrYjsfKU8TpoqemnT9o=
X-Google-Smtp-Source: AKy350bR2mwjTdfds7ocxgJrUwKvxGI/fTlXqUC3TSR2xb7c5e+MBsafjpm1ymimjhktZIsLZuGNmj8+HSTv+YgOJt0=
X-Received: by 2002:a67:cc1b:0:b0:412:4e02:ba9f with SMTP id
 q27-20020a67cc1b000000b004124e02ba9fmr6363087vsl.1.1679932478729; Mon, 27 Mar
 2023 08:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230327082037.3173653-1-jose.quaresma@foundries.io>
 <20230327082037.3173653-2-jose.quaresma@foundries.io> <CADkTA4MLWur3FH-B1j83MP=JnUEHNTgq_jx3_bk1Nisa8A-1NA@mail.gmail.com>
In-Reply-To: <CADkTA4MLWur3FH-B1j83MP=JnUEHNTgq_jx3_bk1Nisa8A-1NA@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 27 Mar 2023 16:54:27 +0100
Message-ID: <CANPvuRm-+EZvbNBKs1t2eFn8WP7qXwbQa0QrFfstJDqs4haC3A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] buildah: enable linkshared
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000a4371805f7e3c269"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Mar 2023 15:54:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7959

--000000000000a4371805f7e3c269
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia segunda,
27/03/2023 =C3=A0(s) 13:21:

> I'm going to keep this change as-is.
>
> The structure of the linkeshared building in buildah isn't well done,
> and the build -> rm -> build again is strange (to say the least).
>

Ok, no problem.
I also have checked the size of the binaries and it is mostly the same.

static vs shared:

tree --du -h
build/tmp/work/corei7-64-lmp-linux/buildah/1.29-r0/image/usr/bin
[107M]  build/tmp/work/corei7-64-lmp-linux/buildah/1.29-r0/image/usr/bin
=E2=94=9C=E2=94=80=E2=94=80 [ 38M]  buildah
=E2=94=9C=E2=94=80=E2=94=80 [ 35M]  copy
=E2=94=94=E2=94=80=E2=94=80 [ 34M]  imgtype

 107M used in 0 directories, 3 files

vs

tree --du -h
build/tmp/work/corei7-64-lmp-linux/buildah/1.29-r0/image/usr/bin
[ 86M]  build/tmp/work/corei7-64-lmp-linux/buildah/1.29-r0/image/usr/bin
=E2=94=9C=E2=94=80=E2=94=80 [ 31M]  buildah
=E2=94=9C=E2=94=80=E2=94=80 [ 28M]  copy
=E2=94=94=E2=94=80=E2=94=80 [ 28M]  imgtype

  86M used in 0 directories, 3 files


Jose


>
> Bruce
>
> On Mon, Mar 27, 2023 at 4:21=E2=80=AFAM Jose Quaresma <quaresma.jose@gmai=
l.com>
> wrote:
> >
> > The linkshared is fixed upstream and backported in oe-core.
> >
> https://git.yoctoproject.org/poky/commit/?id=3Dd5c79ca6a77af1a04992fff430=
0333e02d94d84d
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  recipes-containers/buildah/buildah_git.bb | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-containers/buildah/buildah_git.bb
> b/recipes-containers/buildah/buildah_git.bb
> > index 3c17c98..af340eb 100644
> > --- a/recipes-containers/buildah/buildah_git.bb
> > +++ b/recipes-containers/buildah/buildah_git.bb
> > @@ -40,9 +40,15 @@ do_compile:prepend() {
> >  go_do_compile() {
> >          export TMPDIR=3D"${GOTMPDIR}"
> >          if [ -n "${GO_INSTALL}" ]; then
> > -                ${GO} install ${GOBUILDFLAGS} ./cmd/buildah
> > -                ${GO} install ${GOBUILDFLAGS} ./tests/imgtype/imgtype.=
go
> > -                ${GO} install ${GOBUILDFLAGS} ./tests/copy/copy.go
> > +                if [ -n "${GO_LINKSHARED}" ]; then
> > +                        ${GO} install ${GOBUILDFLAGS} ./cmd/buildah
> > +                        ${GO} install ${GOBUILDFLAGS}
> ./tests/imgtype/imgtype.go
> > +                        ${GO} install ${GOBUILDFLAGS}
> ./tests/copy/copy.go
> > +                        rm -rf ${B}/bin
> > +                fi
> > +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS}
> ./cmd/buildah
> > +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS}
> ./tests/imgtype/imgtype.go
> > +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS}
> ./tests/copy/copy.go
> >          fi
> >  }
> >
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7957):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7957
> > Mute This Topic: https://lists.yoctoproject.org/mt/97877470/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a4371805f7e3c269
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt=
; escreveu no dia segunda, 27/03/2023 =C3=A0(s) 13:21:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">I&#39;m going to keep this change as=
-is.<br>
<br>
The structure of the linkeshared building in buildah isn&#39;t well done,<b=
r>
and the build -&gt; rm -&gt; build again is strange (to say the least).<br>=
</blockquote><div><br>Ok, no problem.<br>I also have checked the size of th=
e binaries and it is mostly the same.<br><br>static vs shared:<br><br>tree =
--du -h build/tmp/work/corei7-64-lmp-linux/buildah/1.29-r0/image/usr/bin<br=
>[107M] =C2=A0build/tmp/work/corei7-64-lmp-linux/buildah/1.29-r0/image/usr/=
bin<br>=E2=94=9C=E2=94=80=E2=94=80 [ 38M] =C2=A0buildah<br>=E2=94=9C=E2=94=
=80=E2=94=80 [ 35M] =C2=A0copy<br>=E2=94=94=E2=94=80=E2=94=80 [ 34M] =C2=A0=
imgtype<br><br>=C2=A0107M used in 0 directories, 3 files<br><br>vs<br><br>t=
ree --du -h build/tmp/work/corei7-64-lmp-linux/buildah/1.29-r0/image/usr/bi=
n<br>[ 86M] =C2=A0build/tmp/work/corei7-64-lmp-linux/buildah/1.29-r0/image/=
usr/bin<br>=E2=94=9C=E2=94=80=E2=94=80 [ 31M] =C2=A0buildah<br>=E2=94=9C=E2=
=94=80=E2=94=80 [ 28M] =C2=A0copy<br>=E2=94=94=E2=94=80=E2=94=80 [ 28M] =C2=
=A0imgtype<br><br>=C2=A0 86M used in 0 directories, 3 files<br><br></div><d=
iv><br></div><div>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
Bruce<br>
<br>
On Mon, Mar 27, 2023 at 4:21=E2=80=AFAM Jose Quaresma &lt;<a href=3D"mailto=
:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; The linkshared is fixed upstream and backported in oe-core.<br>
&gt; <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3Dd5c79ca6a77a=
f1a04992fff4300333e02d94d84d" rel=3D"noreferrer" target=3D"_blank">https://=
git.yoctoproject.org/poky/commit/?id=3Dd5c79ca6a77af1a04992fff4300333e02d94=
d84d</a><br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/buildah/<a href=3D"http://buildah_git.bb" rel=
=3D"noreferrer" target=3D"_blank">buildah_git.bb</a> | 12 +++++++++---<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-containers/buildah/<a href=3D"http://buildah_git.=
bb" rel=3D"noreferrer" target=3D"_blank">buildah_git.bb</a> b/recipes-conta=
iners/buildah/<a href=3D"http://buildah_git.bb" rel=3D"noreferrer" target=
=3D"_blank">buildah_git.bb</a><br>
&gt; index 3c17c98..af340eb 100644<br>
&gt; --- a/recipes-containers/buildah/<a href=3D"http://buildah_git.bb" rel=
=3D"noreferrer" target=3D"_blank">buildah_git.bb</a><br>
&gt; +++ b/recipes-containers/buildah/<a href=3D"http://buildah_git.bb" rel=
=3D"noreferrer" target=3D"_blank">buildah_git.bb</a><br>
&gt; @@ -40,9 +40,15 @@ do_compile:prepend() {<br>
&gt;=C2=A0 go_do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export TMPDIR=3D&quot;${GOTMPDIR}&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${GO_INSTALL}&quot; ];=
 then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GO} install=
 ${GOBUILDFLAGS} ./cmd/buildah<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GO} install=
 ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GO} install=
 ${GOBUILDFLAGS} ./tests/copy/copy.go<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot=
;${GO_LINKSHARED}&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ${GO} install ${GOBUILDFLAGS} ./cmd/buildah<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ${GO} install ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ${GO} install ${GOBUILDFLAGS} ./tests/copy/copy.go<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 rm -rf ${B}/bin<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GO} install=
 ${GO_LINKSHARED} ${GOBUILDFLAGS} ./cmd/buildah<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GO} install=
 ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GO} install=
 ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/copy/copy.go<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7957): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7957" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/7957</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/97877470=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/97877470/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div><span>-- </span><br><di=
v dir=3D"ltr"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</di=
v></div></div></div>

--000000000000a4371805f7e3c269--

