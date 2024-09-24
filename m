Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12704CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 12:59:54 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.13320.1727182793168684254
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 Sep 2024 05:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kVqxcrAM;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71b0722f221so115603b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Sep 2024 05:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727182792; x=1727787592; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gU64dm6xkz0zWN2cdyfMfi9BelY9R2WotSb3tIlJNCU=;
        b=kVqxcrAM/dBBHedJjNUeJAlVp9kCmYMsXLQy/KxTpP7QhS9GalCuRLu15oA4mU+cAX
         7NQaSDuMxQxqn/4tOBzFg7Ol7L+dAmLMmk1kChrVqeN/XXmELG7h1PmDJLGT3v1XFtA3
         8Z+MM6XOcjzBGvOJNCPFL31pJrg1s3xR1SBsWiS/JHm8+pMlUfcDQNmv8u9bD2tQXtwD
         Z7Rx3FCQZaDZsdMWDR8qPu95uLCnX5jo2jmD1tklzgq9uAZYfzrtdrvkwdFFsFRONJk9
         rsDjYlEX1xKvg3LU8V8WaoUGJcPrAs30XbudIfCQElT73KIs7f0v6EGOIWM0OToVx+mP
         7AIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727182792; x=1727787592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gU64dm6xkz0zWN2cdyfMfi9BelY9R2WotSb3tIlJNCU=;
        b=Bm91LoL5uQH2lqvVYiOpaJWZwSWgxYFo5/D+Wuj+fUIG/yzU9GIVdZXWYhbzOTc0qT
         h/zhqGGSIKJAn+M2eWVmfzq2yhioalmSs/lW4Quu+ra45Mr66ENfVaQlTyV5GhriWIND
         arlJd5QNb+/qXW4uyOy2p4tRprI3ojWKAstZwrWtNadyIonZ454XE/55PAcbisAVGTfF
         F/laaw5pgm/mq6bWLJ+Gx9iA9s67xEO2NlHppeV4DC2+1kaBOHa4yF/UmuYgl0hMpQeX
         215siRaytjgmC9sEzwQjnI0kokvwSd729rZRsk6ZoPfxENbaZpjMZSYaKbEvpnIV1jT5
         lNAg==
X-Forwarded-Encrypted: i=1; AJvYcCU3sWarcE+Jp9HsrDVPGk/URVpcxCVfmsHqIbpO8fJnOAd4RD3wWZ6GT1//PhloYz1IxxnLz7Aviz9g2FhpBz1Q+VVg@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Ywc2Ya3jA9jvvSPIltRkZWw2eLQ8uASAkQpyuRazxFzK5z6aY8O
	35ANbOKTL14U0c4PdkhC9MiILnqYoxfJb6p9XAb2DnE+pQn6suSa70LIGP9m07u1w0zsPIXyIew
	AS1XrvCv3h7nfTK46rAXvmBLpr9U=
X-Google-Smtp-Source: AGHT+IHdIjcrl0dbSX0ZuYewW64a8P5ZtgNzRHohTYzDdKzyUd0CdL6XiTIFASUaA8C2xVZi0HRwJaaXHX0wX9gct5k=
X-Received: by 2002:a05:6a20:c99a:b0:1ce:d1b0:bc65 with SMTP id
 adf61e73a8af0-1d30a9d6aacmr18893932637.43.1727182792298; Tue, 24 Sep 2024
 05:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240912083239.237361-1-f_l_k@t-online.de> <CA+chaQfdVmLsJD3WL_O8YiJ9urPvgwiHO82=48rBruRcw9-PWg@mail.gmail.com>
 <A7ZOJS.J4CMW0BLYVKO2@t-online.de> <CA+chaQeJoEypkzx7rBxW7mBFDYtyFKSr37Fm4CVvwMiM2cj6Pw@mail.gmail.com>
 <SG4PJS.15GM9H9ULONU@t-online.de> <CA+chaQc_U+y+hVm7Rp5r7TKOAA5EwzntnC+frCvd-m+45W2VHw@mail.gmail.com>
 <CADkTA4M_dWNzKa8J_Aeu1EF5qmJzkbcEfobVKOMD8Sm42uDQwQ@mail.gmail.com>
In-Reply-To: <CADkTA4M_dWNzKa8J_Aeu1EF5qmJzkbcEfobVKOMD8Sm42uDQwQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 24 Sep 2024 08:59:40 -0400
Message-ID: <CADkTA4OD1rZoAPyG9y70FtM2b618a8VM0ZButzXnfCpB-SjJsw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] linux-%.bbappend: fix compatibility
 issue with linux-intel
To: martin.jansa@gmail.com
Cc: Markus Volk <f_l_k@t-online.de>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000cc17030622dd146d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Sep 2024 12:59:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8898

--000000000000cc17030622dd146d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 11:17=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gma=
il.com>
wrote:

>
>
> On Thu, Sep 12, 2024 at 7:00=E2=80=AFAM Martin Jansa via lists.yoctoproje=
ct.org
> <martin.jansa=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>> I see, the .inc file adds the +git suffix to LINUX_VERSION.
>>
>>
>> https://git.yoctoproject.org/meta-intel/tree/recipes-kernel/linux/linux-=
intel.inc#n15
>> PV =3D "${LINUX_VERSION}+git${SRCPV}"
>>
>> Not sure what's the best solution here, all are a bit fragile.
>>
>> Using LINUX_VERSION for both might be safest (as it will add the
>> include only for "sane" combinations and then add "sane" version to
>> yocto-cfg-fragments dependency.
>>
>> Using PV + LINUX_VERSION now or PREFERRED_VERSION + LINUX_VERSION
>> before leads to these mismatches.
>>
>> Lets see what Bruce thinks.
>
>
> Thanks to you both for the options and discussion!
>
> I'm absolutely willing to change the implementation on this, as
> what we currently have was my attempt to solve warnings that
> popped up between 6.6 and 6.10 (and that was a first for
> the fragments).
>
> I tried to make it dynamic/automatic, but perhaps that was just
> too much hassle for what it is supposed to do.
>
> Let me re-state the goals:
>
> - The fragments are no longer split between the kernel-cache
> and meta-virtualization. We get that by only using the yocto-cfg-fragment=
s
> provider.
> - Work with more than linux-yocto, since even if you don't use kernel-yoc=
to
> having agreed upon fragments has value. We also get that with the
> yocto-cfg-fragments provider. (this is arguably the more important of
> my goals).
>
> .. and then, when the warnings started to pop up with 6.10 and
> options being removed/renamed in the kernel, I could no longer get
> away with a single version of the fragments (this would have also
> been a problem with the fragments directly in meta-virtualization).
>
> Which is why I introduced the versioned recipes for the config
> provider, and tried to make the dependency dynamic / flexible.
>
> I could just make a preferred version for the recipe and have bitbake
> select it. Then switching could be something that is done in the
> configuration space for a given configuration and whoever is building
> that configuration could explicitly make the choice.
>
> But I'm ok with trying a bit more flexible, and possibly some more
> corner cases to look into. At a minimum, I'm finding out more
> about some configurations and mix and match that I didn't know
> was happening, and these are all configurations that I'd like to
> support.
>
> All that being said, I probably just over thought this when doing
> the implementation.
>
> I already rely on LINUX_MAJOR and LINUX_MINOR to match
> supported / tested versions to the kernel virtualization include, so
> maybe I toss it all in the bin and just do:
>
> KERNEL_CFG_DEPENDS ?=3D
> "yocto-cfg-fragments-${LINUX_MAJOR}.${LINUX_MINOR}-native:do_populate_sys=
root
> do_kernel_metadata[depends] +=3D "${KERNEL_CFG_DEPENDS}"
>
> And call it done. Since there's still a way to easily override the variab=
le
> and control it by the two variables already in use, which is fundamentall=
y
> what Martin was getting down to with the PV direction.
>
> ... or am I missing something obvious (like variable expansion or
> other issues) ?
>

I let this sit and mull at the back of my mind while I was at OSSEu in
Vienna,
and yes, I've come to the conclusion that I made this overly complicated.

I just pushed a version of the patch to master-next that uses exactly the
same variables that find the versioned include file that contains the
dependency.

Bruce



>
> Bruce
>
>
>
>> On Thu, Sep 12, 2024 at 12:42=E2=80=AFPM Markus Volk <f_l_k@t-online.de>=
 wrote:
>> >
>> > I see, thanks for the clarification. After looking into this I can say
>> that in fact
>> > the issue was caused by this commit:
>> >
>> https://git.yoctoproject.org/meta-virtualization/commit/?id=3Dc02af94731=
631b3432b8ddee2b89761ab32530ee
>> >
>> >
>> > It fails because meta-intel missed to set the patch version in
>> LINUX_VERSION in linux-intel_6.10.bb
>> >
>> https://git.yoctoproject.org/meta-intel/tree/recipes-kernel/linux/linux-=
intel_6.10.bb#n16
>> >
>> > changing to LINUX_VERSION ?=3D "6.10.0" fixes the issue
>> >
>> > On Thu, Sep 12 2024 at 11:32:52 AM +02:00:00, Martin Jansa <
>> martin.jansa@gmail.com> wrote:
>> >
>> > That's weird, these LINUX_MAJOR/LINUX_MINOR are used only to include
>> the .inc file in: recipes-kernel/linux/linux-%.bbappend:include
>> ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
>> 'linux-${KERNEL_META_TYPE}_${LINUX_MAJOR}.${LINUX_MINOR}_virtualization.=
inc',
>> '', d)} while yocto-cfg-fragments dependency you've mentioned in the err=
or
>> is added based on PV now in this .inc file:
>> recipes-kernel/linux/linux-yocto_virtualization.inc: return
>> "yocto-cfg-fragments-%s-native:do_populate_sysroot" % pv So I think your
>> fix only prevents either of these to be included:
>> ./recipes-kernel/linux/linux-yocto_virtualization.inc
>> ./recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
>> ./recipes-kernel/linux/linux-yocto_6.10_virtualization.inc and not only =
for
>> people using meta-intel, but for everybody, because there is no
>> linux-yocto_x.y_virtualization.inc at all. That doesn't look right. I th=
ink
>> "oe.utils.trim_version(d.getVar('PV'), 2)" should be improved to strip
>> trailing +git as well or maybe to use LINUX_MAJOR/LINUX_MINOR instead of=
 PV
>> inside the .inc file. Regards, On Thu, Sep 12, 2024 at 10:48=E2=80=AFAM =
Markus Volk
>> <f_l_k@t-online.de> wrote:
>> >
>> > On Thu, Sep 12 2024 at 10:36:04 AM +02:00:00, Martin Jansa <
>> martin.jansa@gmail.com> wrote: Wasn't this fixed by
>> https://git.yoctoproject.org/meta-virtualization/commit/?id=3Dc02af94731=
631b3432b8ddee2b89761ab32530ee
>> ? I have meta-virtualization layer up to date, so it includes this commi=
t,
>> but was still hit by this problem.
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8891):
>> https://lists.yoctoproject.org/g/meta-virtualization/message/8891
>> Mute This Topic: https://lists.yoctoproject.org/mt/108409634/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[
>> bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
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

--000000000000cc17030622dd146d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 12, 2024 at 11:17=E2=80=AFAM Bruce Ashf=
ield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Sep 12, 2024 at 7:00=E2=80=AFAM Martin Jansa via <a href=3D"http:=
//lists.yoctoproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;=
martin.jansa=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=
=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">I see, the .inc file adds the +=
git suffix to LINUX_VERSION.<br>
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
:small"></span></blockquote><div><br></div><div><div style=3D"font-size:sma=
ll">Thanks to you both for the options and discussion!</div><div style=3D"f=
ont-size:small"><br></div><div style=3D"font-size:small">I&#39;m absolutely=
 willing to change the implementation on this, as</div><div style=3D"font-s=
ize:small">what we currently have was my attempt to solve warnings that</di=
v><div style=3D"font-size:small">popped up between 6.6 and 6.10 (and that w=
as a first for</div><div style=3D"font-size:small">the fragments).</div><di=
v style=3D"font-size:small"><br></div><div style=3D"font-size:small">I trie=
d to make it dynamic/automatic, but perhaps that was just</div><div style=
=3D"font-size:small">too much hassle for what it is supposed to do.</div><d=
iv style=3D"font-size:small"><br></div><div style=3D"font-size:small">Let m=
e re-state the goals:</div><div style=3D"font-size:small"><br></div><div st=
yle=3D"font-size:small">- The fragments are no longer split between the ker=
nel-cache</div><div style=3D"font-size:small">and meta-virtualization. We g=
et that by only using the yocto-cfg-fragments</div><div style=3D"font-size:=
small">provider.</div><div style=3D"font-size:small">- Work with more than =
linux-yocto, since even if you don&#39;t use kernel-yocto</div><div style=
=3D"font-size:small">having agreed upon fragments has value. We also get th=
at with the</div><div style=3D"font-size:small">yocto-cfg-fragments provide=
r. (this is arguably the more important of</div><div style=3D"font-size:sma=
ll">my goals).</div><div style=3D"font-size:small"><br></div><div style=3D"=
font-size:small">.. and then, when the warnings started to pop up with 6.10=
 and</div><div style=3D"font-size:small">options being removed/renamed in t=
he kernel, I could no longer get</div><div style=3D"font-size:small">away w=
ith a single version of the fragments (this would have also</div><div style=
=3D"font-size:small">been a problem with the fragments directly in meta-vir=
tualization).</div><div style=3D"font-size:small"><br></div><div style=3D"f=
ont-size:small">Which is why I introduced the versioned recipes for the con=
fig</div><div style=3D"font-size:small">provider, and tried to make the dep=
endency dynamic / flexible.</div><div style=3D"font-size:small"><br></div><=
div style=3D"font-size:small">I could just make a preferred version for the=
 recipe and have bitbake</div><div style=3D"font-size:small">select it. The=
n switching could be something that is done in the</div><div style=3D"font-=
size:small">configuration space for a given configuration and whoever is bu=
ilding</div><div style=3D"font-size:small">that configuration could explici=
tly make the choice.</div><div style=3D"font-size:small"><br></div><div sty=
le=3D"font-size:small">But I&#39;m ok with trying a bit more flexible, and =
possibly some more</div><div style=3D"font-size:small">corner cases to look=
 into. At a minimum, I&#39;m finding out more</div><div style=3D"font-size:=
small">about some configurations and mix and match that I didn&#39;t know</=
div><div style=3D"font-size:small">was happening, and these are all configu=
rations that I&#39;d like to</div><div style=3D"font-size:small">support.</=
div><div style=3D"font-size:small"><br></div><div style=3D"font-size:small"=
>All that being said, I probably just over thought this when doing</div><di=
v style=3D"font-size:small">the implementation.</div><div style=3D"font-siz=
e:small"><br></div><div style=3D"font-size:small">I already rely on LINUX_M=
AJOR and LINUX_MINOR to match</div><div style=3D"font-size:small">supported=
 / tested versions to the kernel virtualization include, so</div><div style=
=3D"font-size:small">maybe I toss it all in the bin and just do:</div><div =
style=3D"font-size:small"><br></div><div style=3D"font-size:small">KERNEL_C=
FG_DEPENDS ?=3D &quot;yocto-cfg-fragments-${LINUX_MAJOR}.${LINUX_MINOR}-nat=
ive:do_populate_sysroot</div></div>do_kernel_metadata[depends] +=3D &quot;$=
{KERNEL_CFG_DEPENDS}&quot;</div><div class=3D"gmail_quote"><br></div><div c=
lass=3D"gmail_quote"><div style=3D"font-size:small">And call it done. Since=
 there&#39;s still a way to easily override the variable</div><div style=3D=
"font-size:small">and control it by the two variables already in use, which=
 is fundamentally</div><div style=3D"font-size:small">what Martin was getti=
ng down to with the PV direction.</div><div style=3D"font-size:small"><br><=
/div><div style=3D"font-size:small">... or am I missing something obvious (=
like variable expansion or<br></div><div style=3D"font-size:small">other is=
sues) ?</div></div></div></blockquote><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">I let this sit and mull at the back o=
f my mind while I was at OSSEu in Vienna,</div><div class=3D"gmail_default"=
 style=3D"font-size:small">and yes, I&#39;ve come to the conclusion that I =
made this overly complicated.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">I just pushed a version of the patch to master-next that uses exactly =
the</div><div class=3D"gmail_default" style=3D"font-size:small">same variab=
les that find the versioned include file that contains the dependency.</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_quote"><div style=3D"font-size:small"><br></div><div s=
tyle=3D"font-size:small">Bruce</div><br><div style=3D"font-size:small"><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000cc17030622dd146d--

