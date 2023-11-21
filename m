Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6C6C5ACB3
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 09:51:28 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web11.36225.1700560287824487463
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Nov 2023 01:51:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hHLv3M4D;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4b04364f302so390274e0c.0;
        Tue, 21 Nov 2023 01:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700560287; x=1701165087; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rclxEPoPETruwFPQfbn/FW/Cogr2TcARNBHSLl0VUVw=;
        b=hHLv3M4D/p49WNdZYIn4SDJi8lUjHSgBqOexL83BtkZ8GQZNykJ4xptfeFkF0gioU7
         MmpG2tA7+yY2QeNSikb/K9nzvEkcCZWv6P/Ds3mz1vyhGWn4hLwrM3oTilxUqo8cPAlg
         9iCT+kJv7I+EfR8apnai//C95Yt489v/s04wJE0hFC60Yxz0EHt89A/pP5JMsqPirGYJ
         ITowtcNN8HKBj6kRgPpvFN/Jl6fSS1IMfaVMsSeCP0JbGjRYvNc3WsXS5q2mWMBSo4Y1
         s76bhIgplN7+CNz+QH8QgDvcFjUQ8Wglt+Z30lXowzifv20pyufZhMZceNK+2mDYWUE+
         kUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700560287; x=1701165087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rclxEPoPETruwFPQfbn/FW/Cogr2TcARNBHSLl0VUVw=;
        b=Gxn0HBp/kxf84s//PuZVP1D60vNNeXWArr6BbyPpHSsMrHuor2UWfrftOGlRQOHBq0
         99BMzOxpNjEFCMZXFzkdxjmV/nXdDKcT/nT9IN2EtirgKv1L1V1WxvRPBxq1jDuyL85Y
         265lDOrMKkt1O5LlHhlQ9ca8Cf8LlOI3jHcQQes9QR38Qgq4tVZ4Gh+LXsyVtVBpXoVn
         tbG1cvuUvznF9ldq8geOVtL4jRCZ1PsCRcTx5Oyi+g5xXNLGWP+sLnpFA8SGEKhJbBQ3
         PAtn6/EYKlAkI2L/Cvb2kNPO1HrUDx0pMvVPGYvzG6e+CdI74X/32e4HAxeo1Nt2Y3Fh
         c4qw==
X-Gm-Message-State: AOJu0YyFFDX9WjN2E9bbDPqo6jkjTZ1gfIYuwC4KDPu0xWpYgHI+G/Vd
	Akf4frcORSOrYNxH7U7LnB325Ke9cVPaGVek/wQ=
X-Google-Smtp-Source: AGHT+IEJG2OWTtRYIp/HlElBofRBljGX1BB7mnPozC0UVmPdcWQElBqDly9Ax8vyngYZAMFvSkNA3F0UqmMx7UvfhrM=
X-Received: by 2002:a1f:6d02:0:b0:49b:289a:cc44 with SMTP id
 i2-20020a1f6d02000000b0049b289acc44mr4797061vkc.6.1700560286648; Tue, 21 Nov
 2023 01:51:26 -0800 (PST)
MIME-Version: 1.0
References: <2023112021510697052353@mail.local> <CADkTA4O9JP3kHrC7AOy_JGsQApk+YHuzTD+C23quBrQdSN38oQ@mail.gmail.com>
 <202311202249029960e95f@mail.local> <17998426C3192B68.30166@lists.yoctoproject.org>
 <CADkTA4M2R7yCqh334QDCU542syUQaOxmb7+Sa3-+2DfZwKAySw@mail.gmail.com>
In-Reply-To: <CADkTA4M2R7yCqh334QDCU542syUQaOxmb7+Sa3-+2DfZwKAySw@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 21 Nov 2023 09:51:15 +0000
Message-ID: <CANPvuRmmoYjed_YxnOGEhSn7JJhAZG5ta7JLZRXE+_d-M_EcDA@mail.gmail.com>
Subject: Re: [meta-virtualization] meta-virt fails check-layer-nightly
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	meta-virtualization@lists.yoctoproject.org, swat@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000ce0ded060aa68bbb"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Nov 2023 09:51:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8464

--000000000000ce0ded060aa68bbb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The master backport will be merded soon on nanbield
https://lists.openembedded.org/g/openembedded-core/message/190895

Jose

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 21/11=
/2023
=C3=A0(s) 04:03:

> On Mon, Nov 20, 2023 at 10:00=E2=80=AFPM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Mon, Nov 20, 2023 at 5:49=E2=80=AFPM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > This is nanbield which uses meta-virt master
> > >
> >
> > That solves the mystery. There is a nanbield branch in meta-virt that
> > has a workaround
> > for that routine not existing in oe-core nanbield.
>
> And yes, I realize that meta-virt master still has nanbield in its
> LAYERSERIES_COMPAT variable, but core hasn't added a
> new compat name that I've seen, so I have no way that I know
> of to declare the incompatibility.
>
> Bruce
>
> >
> > The branch configuration for the AB is not something I normally tweak,
> > if I can figure
> > out what file to change, i can send a patch.
> >
> > Bruce
> >
> > > On 20/11/2023 17:17:01-0500, Bruce Ashfield wrote:
> > > > What branch ? We resolved that issue quite some time ago for master
> > > > and for the older branches.
> > > >
> > > > If something happened to Joshua's change in master, I'm not aware o=
f
> > > > it, and will wait for a patch to meta-virt to fix it up.
> > > >
> > > > Bruce
> > > >
> > > > On Mon, Nov 20, 2023 at 4:51=E2=80=AFPM Alexandre Belloni
> > > > <alexandre.belloni@bootlin.com> wrote:
> > > > >
> > > > > Hi Bruce,
> > > > >
> > > > > check-layer-nightly is failing for meta-virt:
> > > > >
> > > > > Loaded 0 entries from dependency cache.
> > > > > Parsing recipes...ERROR: ExpansionError during parsing
> /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-virtualizatio=
n/recipes-extended/images/
> container-base.bb
> > > > > Traceback (most recent call last):
> > > > >   File
> "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbake/lib/bb/da=
ta_smart.py",
> line 481, in
> DataSmart.expandWithRefs(s=3D"${@oe.go.map_arch(d.getVar('TARGET_ARCH'))}=
",
> varname=3D'OCI_IMAGE_ARCH'):
> > > > >                      tb =3D sys.exc_info()[2]
> > > > >     >                raise ExpansionError(varname, s,
> exc).with_traceback(tb) from exc
> > > > >
> > > > >   File
> "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbake/lib/bb/da=
ta_smart.py",
> line 465, in
> DataSmart.expandWithRefs(s=3D"${@oe.go.map_arch(d.getVar('TARGET_ARCH'))}=
",
> varname=3D'OCI_IMAGE_ARCH'):
> > > > >                      try:
> > > > >     >                    s =3D
> __expand_python_regexp__.sub(varparse.python_sub, s)
> > > > >                      except SyntaxError as e:
> > > > >   File
> "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbake/lib/bb/da=
ta_smart.py",
> line 153, in VariableParse.python_sub(match=3D<re.Match object; span=3D(0=
, 43),
> match=3D"${@oe.go.map_arch(d.getVar('TARGET_ARCH'))}">):
> > > > >
> self.contains[k].update(parser.contains[k])
> > > > >     >            value =3D utils.better_eval(codeobj,
> DataContext(self.d), {'d' : self.d})
> > > > >                  return str(value)
> > > > >   File
> "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbake/lib/bb/ut=
ils.py",
> line 434, in better_eval(source=3D<code object <module> at 0x7f1275c759a0=
,
> file "Var <OCI_IMAGE_ARCH>", line 1>, locals=3D{'d': <bb.data_smart.DataS=
mart
> object at 0x7f127678f790>}, extraglobals=3D{'d': <bb.data_smart.DataSmart
> object at 0x7f127678f790>}):
> > > > >                  ctx[g] =3D extraglobals[g]
> > > > >     >    return eval(source, ctx, locals)
> > > > >
> > > > >   File "Var <OCI_IMAGE_ARCH>", line 1, in <module>
> > > > > bb.data_smart.ExpansionError: Failure expanding variable
> OCI_IMAGE_ARCH, expression was ${@oe.go.map_arch(d.getVar('TARGET_ARCH'))=
}
> which triggered exception AttributeError: module 'oe' has no attribute 'g=
o'
> > > > > The variable dependency chain for the failure is: OCI_IMAGE_ARCH
> -> IMAGE_CMD:oci
> > > > >
> > > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1719/s=
teps/23/logs/stdio
> > > > >
> > > > > --
> > > > > Alexandre Belloni, co-owner and COO, Bootlin
> > > > > Embedded Linux and Kernel engineering
> > > > > https://bootlin.com
> > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8462):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8462
> Mute This Topic: https://lists.yoctoproject.org/mt/102717308/5052612
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/leave/11553848/50526=
12/94736074/xyzzy
> [quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ce0ded060aa68bbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br>The master backport will be merded soon on=
 nanbield<br><a href=3D"https://lists.openembedded.org/g/openembedded-core/=
message/190895">https://lists.openembedded.org/g/openembedded-core/message/=
190895</a><br><br></div><div>Jose</div><div><br></div><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"m=
ailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu n=
o dia ter=C3=A7a, 21/11/2023 =C3=A0(s) 04:03:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Mon, Nov 20, 2023 at 10:00=E2=80=AFPM Bruc=
e Ashfield via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a><br>
&lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" ta=
rget=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Nov 20, 2023 at 5:49=E2=80=AFPM Alexandre Belloni<br>
&gt; &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blank"=
>alexandre.belloni@bootlin.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; This is nanbield which uses meta-virt master<br>
&gt; &gt;<br>
&gt;<br>
&gt; That solves the mystery. There is a nanbield branch in meta-virt that<=
br>
&gt; has a workaround<br>
&gt; for that routine not existing in oe-core nanbield.<br>
<br>
And yes, I realize that meta-virt master still has nanbield in its<br>
LAYERSERIES_COMPAT variable, but core hasn&#39;t added a<br>
new compat name that I&#39;ve seen, so I have no way that I know<br>
of to declare the incompatibility.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; The branch configuration for the AB is not something I normally tweak,=
<br>
&gt; if I can figure<br>
&gt; out what file to change, i can send a patch.<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt; On 20/11/2023 17:17:01-0500, Bruce Ashfield wrote:<br>
&gt; &gt; &gt; What branch ? We resolved that issue quite some time ago for=
 master<br>
&gt; &gt; &gt; and for the older branches.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If something happened to Joshua&#39;s change in master, I&#3=
9;m not aware of<br>
&gt; &gt; &gt; it, and will wait for a patch to meta-virt to fix it up.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Bruce<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Nov 20, 2023 at 4:51=E2=80=AFPM Alexandre Belloni<br=
>
&gt; &gt; &gt; &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" target=
=3D"_blank">alexandre.belloni@bootlin.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hi Bruce,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; check-layer-nightly is failing for meta-virt:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Loaded 0 entries from dependency cache.<br>
&gt; &gt; &gt; &gt; Parsing recipes...ERROR: ExpansionError during parsing =
/home/pokybuild/yocto-worker/check-layer-nightly/build/meta-virtualization/=
recipes-extended/images/<a href=3D"http://container-base.bb" rel=3D"norefer=
rer" target=3D"_blank">container-base.bb</a><br>
&gt; &gt; &gt; &gt; Traceback (most recent call last):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-worker/che=
ck-layer-nightly/build/bitbake/lib/bb/data_smart.py&quot;, line 481, in Dat=
aSmart.expandWithRefs(s=3D&quot;${@oe.go.map_arch(d.getVar(&#39;TARGET_ARCH=
&#39;))}&quot;, varname=3D&#39;OCI_IMAGE_ARCH&#39;):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tb =3D sys.exc_info()[2]<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 raise ExpansionError(varname, s, exc).with_traceba=
ck(tb) from exc<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-worker/che=
ck-layer-nightly/build/bitbake/lib/bb/data_smart.py&quot;, line 465, in Dat=
aSmart.expandWithRefs(s=3D&quot;${@oe.go.map_arch(d.getVar(&#39;TARGET_ARCH=
&#39;))}&quot;, varname=3D&#39;OCI_IMAGE_ARCH&#39;):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D __expand_python_regexp__.sub(v=
arparse.python_sub, s)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 except SyntaxError as e:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-worker/che=
ck-layer-nightly/build/bitbake/lib/bb/data_smart.py&quot;, line 153, in Var=
iableParse.python_sub(match=3D&lt;re.Match object; span=3D(0, 43), match=3D=
&quot;${@oe.go.map_arch(d.getVar(&#39;TARGET_ARCH&#39;))}&quot;&gt;):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.contains[k].update(parser.contains[=
k])<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 value =3D utils.better_eval(codeobj, DataContext(self.d), {&#39;=
d&#39; : self.d})<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return str(value)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-worker/che=
ck-layer-nightly/build/bitbake/lib/bb/utils.py&quot;, line 434, in better_e=
val(source=3D&lt;code object &lt;module&gt; at 0x7f1275c759a0, file &quot;V=
ar &lt;OCI_IMAGE_ARCH&gt;&quot;, line 1&gt;, locals=3D{&#39;d&#39;: &lt;bb.=
data_smart.DataSmart object at 0x7f127678f790&gt;}, extraglobals=3D{&#39;d&=
#39;: &lt;bb.data_smart.DataSmart object at 0x7f127678f790&gt;}):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ctx[g] =3D extraglobals[g]<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 return eval(source=
, ctx, locals)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0File &quot;Var &lt;OCI_IMAGE_ARCH&gt;&quot;=
, line 1, in &lt;module&gt;<br>
&gt; &gt; &gt; &gt; bb.data_smart.ExpansionError: Failure expanding variabl=
e OCI_IMAGE_ARCH, expression was ${@oe.go.map_arch(d.getVar(&#39;TARGET_ARC=
H&#39;))} which triggered exception AttributeError: module &#39;oe&#39; has=
 no attribute &#39;go&#39;<br>
&gt; &gt; &gt; &gt; The variable dependency chain for the failure is: OCI_I=
MAGE_ARCH -&gt; IMAGE_CMD:oci<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon=
/#/builders/121/builds/1719/steps/23/logs/stdio" rel=3D"noreferrer" target=
=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/121/bui=
lds/1719/steps/23/logs/stdio</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; &gt; &gt; &gt; Embedded Linux and Kernel engineering<br>
&gt; &gt; &gt; &gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" targ=
et=3D"_blank">https://bootlin.com</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; - Thou shalt not follow the NULL pointer, for chaos and madn=
ess await<br>
&gt; &gt; &gt; thee at its end<br>
&gt; &gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br=
>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; &gt; Embedded Linux and Kernel engineering<br>
&gt; &gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_bla=
nk">https://bootlin.com</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await<=
br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8462): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8462" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8462</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/102717308/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/102717308/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/leave/11553848/5052612/94736074/xyzzy" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.yoctoproject.org/g/meta-virtualization/leave/11553848/5052=
612/94736074/xyzzy</a> [<a href=3D"mailto:quaresma.jose@gmail.com" target=
=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000ce0ded060aa68bbb--

