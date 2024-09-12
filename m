Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C11BEED614
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 15:17:23 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.50526.1726154239692406793
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Sep 2024 08:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FwiSBLNn;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2daaa9706a9so904198a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Sep 2024 08:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726154239; x=1726759039; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9L6Xf1nvmspCwDj5ha2vcp3+j121NRH1tbAeDGhMF3k=;
        b=FwiSBLNnXpu94kMDQFC++vvcYgjdjNKYHclLBZtFiVl6xKBMibhNO3rV+mqn2NiiNQ
         CJ5ScpIEz1agWlhlvFb7j5fa8dh8J5pmZRe2VJU6jfar6AIPZUGaCvtYcEBMbTL+Y7QT
         EfJLT554KLIhNM4ZcygaRnqOJhITpMU68EqwQZ61o8EAhhoiUsPDBYffAyE0+ax1CEst
         Idw9uqvtSiP6mFeJFVuI5KFmsf0rQQ24mRr6broE2leyXrJrySI/q1MGBpTX+GMwAjIo
         xmIkfRxtQkngVvEFsZx2d7RUj5r28N/jXvn/8oDp9wsZ2BED1Mzj0lRiB5a77qWnb8zv
         yZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726154239; x=1726759039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9L6Xf1nvmspCwDj5ha2vcp3+j121NRH1tbAeDGhMF3k=;
        b=vCSP2jEUyoYXi8N54Q6uuGdPeO/5ikfWG54L8QivX0Zdvd+5XwFCYbDzKQ2X37QHqn
         md/F+Km85ZidkcvDwxwSbZ0DLne3X/v3lHzRNdn7sMMU1UlGsaEFr0fexJi72jw9NoR4
         IQfDQvFnv2irrH/i/lCXUFXwNDmubsID3L+r34V2ZPiLVkubAMZBMWVIz34eO8syRYF+
         LqWfmhN8ftrU7PRHac3VXz1OKwf7Or5WeywQI5nCFcUErMO4xjGxaUexVg6EfGlwnwfd
         mQ16nHjVJtWrhfKyNgAax9qzLygyMSeqofDxUG1hW/1IPvU3tWuiYHaaPQ/RUFd9QjXm
         Ukfw==
X-Forwarded-Encrypted: i=1; AJvYcCV2wixBSdIZueXA5uDAkIQii1/KCfdR1V0hUG+LWpdfugsqsif4VYnfyY53bNecYRGdpy+toEUz4iCdsCG1ahwSMYfy@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzdrSTI8w9Mx7oNmt/kX0vR4U1y8noR8btRFhtfMoT5wLRCmTG4
	ZIoPKaMVjfhTo40kDkUesxyzAKtYqhtSVWvwgthbl2PV4CNft5254eCreDLWxho0PGPTCfb9Pj5
	oww0mV2R2nKAtbtMjDcBSvO0V8JE=
X-Google-Smtp-Source: AGHT+IHoJ4aIqE/3PA2JytC67VIGM+reVfeBg7y7hQuUgefF7tcDKPWXyj2e4juf1791MlZCpWAd9RKZygc0CY8qOk8=
X-Received: by 2002:a17:90b:4c0c:b0:2d3:c0e5:cbac with SMTP id
 98e67ed59e1d1-2db9ffa11e4mr3408586a91.7.1726154238674; Thu, 12 Sep 2024
 08:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240912083239.237361-1-f_l_k@t-online.de> <CA+chaQfdVmLsJD3WL_O8YiJ9urPvgwiHO82=48rBruRcw9-PWg@mail.gmail.com>
 <A7ZOJS.J4CMW0BLYVKO2@t-online.de> <CA+chaQeJoEypkzx7rBxW7mBFDYtyFKSr37Fm4CVvwMiM2cj6Pw@mail.gmail.com>
 <SG4PJS.15GM9H9ULONU@t-online.de> <CA+chaQc_U+y+hVm7Rp5r7TKOAA5EwzntnC+frCvd-m+45W2VHw@mail.gmail.com>
In-Reply-To: <CA+chaQc_U+y+hVm7Rp5r7TKOAA5EwzntnC+frCvd-m+45W2VHw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Sep 2024 11:17:07 -0400
Message-ID: <CADkTA4M_dWNzKa8J_Aeu1EF5qmJzkbcEfobVKOMD8Sm42uDQwQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] linux-%.bbappend: fix compatibility
 issue with linux-intel
To: martin.jansa@gmail.com
Cc: Markus Volk <f_l_k@t-online.de>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000039581d0621ed9a0a"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Sep 2024 15:17:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8893

--00000000000039581d0621ed9a0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 7:00=E2=80=AFAM Martin Jansa via lists.yoctoproject=
.org
<martin.jansa=3Dgmail.com@lists.yoctoproject.org> wrote:

> I see, the .inc file adds the +git suffix to LINUX_VERSION.
>
>
> https://git.yoctoproject.org/meta-intel/tree/recipes-kernel/linux/linux-i=
ntel.inc#n15
> PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
> Not sure what's the best solution here, all are a bit fragile.
>
> Using LINUX_VERSION for both might be safest (as it will add the
> include only for "sane" combinations and then add "sane" version to
> yocto-cfg-fragments dependency.
>
> Using PV + LINUX_VERSION now or PREFERRED_VERSION + LINUX_VERSION
> before leads to these mismatches.
>
> Lets see what Bruce thinks.


Thanks to you both for the options and discussion!

I'm absolutely willing to change the implementation on this, as
what we currently have was my attempt to solve warnings that
popped up between 6.6 and 6.10 (and that was a first for
the fragments).

I tried to make it dynamic/automatic, but perhaps that was just
too much hassle for what it is supposed to do.

Let me re-state the goals:

- The fragments are no longer split between the kernel-cache
and meta-virtualization. We get that by only using the yocto-cfg-fragments
provider.
- Work with more than linux-yocto, since even if you don't use kernel-yocto
having agreed upon fragments has value. We also get that with the
yocto-cfg-fragments provider. (this is arguably the more important of
my goals).

.. and then, when the warnings started to pop up with 6.10 and
options being removed/renamed in the kernel, I could no longer get
away with a single version of the fragments (this would have also
been a problem with the fragments directly in meta-virtualization).

Which is why I introduced the versioned recipes for the config
provider, and tried to make the dependency dynamic / flexible.

I could just make a preferred version for the recipe and have bitbake
select it. Then switching could be something that is done in the
configuration space for a given configuration and whoever is building
that configuration could explicitly make the choice.

But I'm ok with trying a bit more flexible, and possibly some more
corner cases to look into. At a minimum, I'm finding out more
about some configurations and mix and match that I didn't know
was happening, and these are all configurations that I'd like to
support.

All that being said, I probably just over thought this when doing
the implementation.

I already rely on LINUX_MAJOR and LINUX_MINOR to match
supported / tested versions to the kernel virtualization include, so
maybe I toss it all in the bin and just do:

KERNEL_CFG_DEPENDS ?=3D
"yocto-cfg-fragments-${LINUX_MAJOR}.${LINUX_MINOR}-native:do_populate_sysro=
ot
do_kernel_metadata[depends] +=3D "${KERNEL_CFG_DEPENDS}"

And call it done. Since there's still a way to easily override the variable
and control it by the two variables already in use, which is fundamentally
what Martin was getting down to with the PV direction.

... or am I missing something obvious (like variable expansion or
other issues) ?

Bruce



> On Thu, Sep 12, 2024 at 12:42=E2=80=AFPM Markus Volk <f_l_k@t-online.de> =
wrote:
> >
> > I see, thanks for the clarification. After looking into this I can say
> that in fact
> > the issue was caused by this commit:
> >
> https://git.yoctoproject.org/meta-virtualization/commit/?id=3Dc02af947316=
31b3432b8ddee2b89761ab32530ee
> >
> >
> > It fails because meta-intel missed to set the patch version in
> LINUX_VERSION in linux-intel_6.10.bb
> >
> https://git.yoctoproject.org/meta-intel/tree/recipes-kernel/linux/linux-i=
ntel_6.10.bb#n16
> >
> > changing to LINUX_VERSION ?=3D "6.10.0" fixes the issue
> >
> > On Thu, Sep 12 2024 at 11:32:52 AM +02:00:00, Martin Jansa <
> martin.jansa@gmail.com> wrote:
> >
> > That's weird, these LINUX_MAJOR/LINUX_MINOR are used only to include th=
e
> .inc file in: recipes-kernel/linux/linux-%.bbappend:include
> ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
> 'linux-${KERNEL_META_TYPE}_${LINUX_MAJOR}.${LINUX_MINOR}_virtualization.i=
nc',
> '', d)} while yocto-cfg-fragments dependency you've mentioned in the erro=
r
> is added based on PV now in this .inc file:
> recipes-kernel/linux/linux-yocto_virtualization.inc: return
> "yocto-cfg-fragments-%s-native:do_populate_sysroot" % pv So I think your
> fix only prevents either of these to be included:
> ./recipes-kernel/linux/linux-yocto_virtualization.inc
> ./recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
> ./recipes-kernel/linux/linux-yocto_6.10_virtualization.inc and not only f=
or
> people using meta-intel, but for everybody, because there is no
> linux-yocto_x.y_virtualization.inc at all. That doesn't look right. I thi=
nk
> "oe.utils.trim_version(d.getVar('PV'), 2)" should be improved to strip
> trailing +git as well or maybe to use LINUX_MAJOR/LINUX_MINOR instead of =
PV
> inside the .inc file. Regards, On Thu, Sep 12, 2024 at 10:48=E2=80=AFAM M=
arkus Volk
> <f_l_k@t-online.de> wrote:
> >
> > On Thu, Sep 12 2024 at 10:36:04 AM +02:00:00, Martin Jansa <
> martin.jansa@gmail.com> wrote: Wasn't this fixed by
> https://git.yoctoproject.org/meta-virtualization/commit/?id=3Dc02af947316=
31b3432b8ddee2b89761ab32530ee
> ? I have meta-virtualization layer up to date, so it includes this commit=
,
> but was still hit by this problem.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8891):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8891
> Mute This Topic: https://lists.yoctoproject.org/mt/108409634/1050810
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

--00000000000039581d0621ed9a0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 12, 2024 at 7:00=E2=80=AFAM Martin Jans=
a via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoc=
toproject.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.yoct=
oproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I see, the =
.inc file adds the +git suffix to LINUX_VERSION.<br>
<br>
<a href=3D"https://git.yoctoproject.org/meta-intel/tree/recipes-kernel/linu=
x/linux-intel.inc#n15" rel=3D"noreferrer" target=3D"_blank">https://git.yoc=
toproject.org/meta-intel/tree/recipes-kernel/linux/linux-intel.inc#n15</a><=
br>
PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
Not sure what&#39;s the best solution here, all are a bit fragile.<br>
<br>
Using LINUX_VERSION for both might be safest (as it will add the<br>
include only for &quot;sane&quot; combinations and then add &quot;sane&quot=
; version to<br>
yocto-cfg-fragments dependency.<br>
<br>
Using PV + LINUX_VERSION now or PREFERRED_VERSION + LINUX_VERSION<br>
before leads to these mismatches.<br>
<br>
Lets see what Bruce thinks.<span class=3D"gmail_default" style=3D"font-size=
:small"></span></blockquote><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">Thanks to you both for the options and discussi=
on!</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">I&#39;m absolutely wi=
lling to change the implementation on this, as</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">what we currently have was my attempt to so=
lve warnings that</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">popped up between 6.6 and 6.10 (and that was a first for</div><div class=
=3D"gmail_default" style=3D"font-size:small">the fragments).</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">I tried to make it dynamic/automatic, b=
ut perhaps that was just</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">too much hassle for what it is supposed to do.</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Let me re-state the goals:</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">- The fragments are no longer split betw=
een the kernel-cache</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">and meta-virtualization. We get that by only using the yocto-cfg-frag=
ments</div><div class=3D"gmail_default" style=3D"font-size:small">provider.=
</div><div class=3D"gmail_default" style=3D"font-size:small">- Work with mo=
re than linux-yocto, since even if you don&#39;t use kernel-yocto</div><div=
 class=3D"gmail_default" style=3D"font-size:small">having agreed upon fragm=
ents has value. We also get that with the</div><div class=3D"gmail_default"=
 style=3D"font-size:small">yocto-cfg-fragments provider. (this is arguably =
the more important of</div><div class=3D"gmail_default" style=3D"font-size:=
small">my goals).</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">.. and =
then, when the warnings started to pop up with 6.10 and</div><div class=3D"=
gmail_default" style=3D"font-size:small">options being removed/renamed in t=
he kernel, I could no longer get</div><div class=3D"gmail_default" style=3D=
"font-size:small">away with a single version of the fragments (this would h=
ave also</div><div class=3D"gmail_default" style=3D"font-size:small">been a=
 problem with the fragments directly in meta-virtualization).</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">Which is why I introduced the versione=
d recipes for the config</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">provider, and tried to make the dependency dynamic / flexible.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">I could just make a preferr=
ed version for the recipe and have bitbake</div><div class=3D"gmail_default=
" style=3D"font-size:small">select it. Then switching could be something th=
at is done in the</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">configuration space for a given configuration and whoever is building</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">that configuratio=
n could explicitly make the choice.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">But I&#39;m ok with trying a bit more flexible, and possibly som=
e more</div><div class=3D"gmail_default" style=3D"font-size:small">corner c=
ases to look into. At a minimum, I&#39;m finding out more</div><div class=
=3D"gmail_default" style=3D"font-size:small">about some configurations and =
mix and match that I didn&#39;t know</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">was happening, and these are all configurations that =
I&#39;d like to</div><div class=3D"gmail_default" style=3D"font-size:small"=
>support.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">All that being =
said, I probably just over thought this when doing</div><div class=3D"gmail=
_default" style=3D"font-size:small">the implementation.</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">I already rely on LINUX_MAJOR and LINUX_MINO=
R to match</div><div class=3D"gmail_default" style=3D"font-size:small">supp=
orted / tested versions to the kernel virtualization include, so</div><div =
class=3D"gmail_default" style=3D"font-size:small">maybe I toss it all in th=
e bin and just do:</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">KERNEL=
_CFG_DEPENDS ?=3D &quot;yocto-cfg-fragments-${LINUX_MAJOR}.${LINUX_MINOR}-n=
ative:do_populate_sysroot</div></div>do_kernel_metadata[depends] +=3D &quot=
;${KERNEL_CFG_DEPENDS}&quot;</div><div class=3D"gmail_quote"><br></div><div=
 class=3D"gmail_quote"><div class=3D"gmail_default" style=3D"font-size:smal=
l">And call it done. Since there&#39;s still a way to easily override the v=
ariable</div><div class=3D"gmail_default" style=3D"font-size:small">and con=
trol it by the two variables already in use, which is fundamentally</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">what Martin was gettin=
g down to with the PV direction.</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">... or am I missing something obvious (like variable expansion or<b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">other issues=
) ?</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
On Thu, Sep 12, 2024 at 12:42=E2=80=AFPM Markus Volk &lt;<a href=3D"mailto:=
f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt; wrote:<br>
&gt;<br>
&gt; I see, thanks for the clarification. After looking into this I can say=
 that in fact<br>
&gt; the issue was caused by this commit:<br>
&gt; <a href=3D"https://git.yoctoproject.org/meta-virtualization/commit/?id=
=3Dc02af94731631b3432b8ddee2b89761ab32530ee" rel=3D"noreferrer" target=3D"_=
blank">https://git.yoctoproject.org/meta-virtualization/commit/?id=3Dc02af9=
4731631b3432b8ddee2b89761ab32530ee</a><br>
&gt;<br>
&gt;<br>
&gt; It fails because meta-intel missed to set the patch version in LINUX_V=
ERSION in <a href=3D"http://linux-intel_6.10.bb" rel=3D"noreferrer" target=
=3D"_blank">linux-intel_6.10.bb</a><br>
&gt; <a href=3D"https://git.yoctoproject.org/meta-intel/tree/recipes-kernel=
/linux/linux-intel_6.10.bb#n16" rel=3D"noreferrer" target=3D"_blank">https:=
//git.yoctoproject.org/meta-intel/tree/recipes-kernel/linux/linux-intel_6.1=
0.bb#n16</a><br>
&gt;<br>
&gt; changing to LINUX_VERSION ?=3D &quot;6.10.0&quot; fixes the issue<br>
&gt;<br>
&gt; On Thu, Sep 12 2024 at 11:32:52 AM +02:00:00, Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt; That&#39;s weird, these LINUX_MAJOR/LINUX_MINOR are used only to inclu=
de the .inc file in: recipes-kernel/linux/linux-%.bbappend:include ${@bb.ut=
ils.contains(&#39;DISTRO_FEATURES&#39;, &#39;virtualization&#39;, &#39;linu=
x-${KERNEL_META_TYPE}_${LINUX_MAJOR}.${LINUX_MINOR}_virtualization.inc&#39;=
, &#39;&#39;, d)} while yocto-cfg-fragments dependency you&#39;ve mentioned=
 in the error is added based on PV now in this .inc file: recipes-kernel/li=
nux/linux-yocto_virtualization.inc: return &quot;yocto-cfg-fragments-%s-nat=
ive:do_populate_sysroot&quot; % pv So I think your fix only prevents either=
 of these to be included: ./recipes-kernel/linux/linux-yocto_virtualization=
.inc ./recipes-kernel/linux/linux-yocto_6.6_virtualization.inc ./recipes-ke=
rnel/linux/linux-yocto_6.10_virtualization.inc and not only for people usin=
g meta-intel, but for everybody, because there is no linux-yocto_x.y_virtua=
lization.inc at all. That doesn&#39;t look right. I think &quot;oe.utils.tr=
im_version(d.getVar(&#39;PV&#39;), 2)&quot; should be improved to strip tra=
iling +git as well or maybe to use LINUX_MAJOR/LINUX_MINOR instead of PV in=
side the .inc file. Regards, On Thu, Sep 12, 2024 at 10:48=E2=80=AFAM Marku=
s Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-o=
nline.de</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Sep 12 2024 at 10:36:04 AM +02:00:00, Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt; wrote: Wasn&#39;t this fixed by <a href=3D"https://git.yoctoprojec=
t.org/meta-virtualization/commit/?id=3Dc02af94731631b3432b8ddee2b89761ab325=
30ee" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/met=
a-virtualization/commit/?id=3Dc02af94731631b3432b8ddee2b89761ab32530ee</a> =
? I have meta-virtualization layer up to date, so it includes this commit, =
but was still hit by this problem.<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8891): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8891" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8891</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/108409634/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/108409634/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--00000000000039581d0621ed9a0a--

