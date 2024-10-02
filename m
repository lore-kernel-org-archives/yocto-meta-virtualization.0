Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6369FCEACF3
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 17:17:03 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.1375.1727889421445836043
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 10:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jVZvrrpF;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2facf00b0c7so9756591fa.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Oct 2024 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727889419; x=1728494219; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OOQ1ttyehFLp/7uJUQ4xvOCoEbfaB4240ut80BWzriE=;
        b=jVZvrrpF2shwAuNky+a9Uq7CVP0/85XMXgCJt3Y+pk4zuJ0/E/OCO3nsP5Ca9a6EIF
         p1gthmpmUzshFdMnFDXm/vXn8JbJcbqoVTPfZ+83DxOjPLWu2FnNyCzjlhJuvX2F0XXH
         AO5ecvN9RApNaeTmura/8C92o8uV2qP4fLc/xGbZ67n/iHitu+8UGOVIcCBefy0ndtEN
         16tSP1X4GyBGfc2GqdA80maiQTVWNqmRhw+xdBfISBR8sFL4DrR32ur6Jb4IuLVXz8bE
         WaMp6IJYn0klZXM4PwnnCflI/IdOqAd7rG2bXCAWsnHm+j6XSq1TLtu1W7y50SmGgzJu
         A9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727889419; x=1728494219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOQ1ttyehFLp/7uJUQ4xvOCoEbfaB4240ut80BWzriE=;
        b=tX9D7NxuFFJ9TxKRO1AG4Q9sH3L4XOn5v4YTsD80BfbPwObj+uOrjGNv/bYnkwmNpg
         zQFpkzqBVAL81GxAaefCxQDyTEnP09nZqtXttl8adH5eUHb6znr0wv2tBRYARdVnO6aS
         tit6pbecM8uqRsWYagUNKv5CI89WtYn88ZpOH4tAI9OL9n7C3OAeRuI0GFFs1xeyMiu4
         gmdb83K9L2FWsAoWPuSaX2O0Po2V7eDG1SnR5ur7pjVHW/Y4g3bHvNZcDw6IBnepSkra
         9NyJmKicV0mtCmAmBdRKJez5C++PMhwFUXB0y2VYsuXEbGK+7KA8uict//pASE+mKWxB
         JMzA==
X-Forwarded-Encrypted: i=1; AJvYcCWspNHk/rXPt5Ep14+92f+ahvUMdqCkP04brkusihwA6zO+CoN+t166rtlcJrWw+z4IlbYLdQ4fVy0Tonl+n5cjoD2o@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz7A8yO3snu4uEqSMc6TmznhjOPMMBtZPTP1Rl3gGjkt33IqCe1
	pde3pbLEj8heRAiLo1wjiWcOG/WjhGuNuHVM1vH7cMolWOryqa9fdp4wqgqi+78ZH7iUyzY2woV
	EZQTYfrfnVZgmMVnRLhkyhsDd7kw=
X-Google-Smtp-Source: AGHT+IEFX8XpoXqVxyA3G+Ou8Z/n+1BfhhC1sx9gvyKE8O6udOYpYL6jq59R7KbGbaIG3q1bJiy/xgLyI6XTNA+T+T8=
X-Received: by 2002:a19:6a0d:0:b0:539:9f5f:efd5 with SMTP id
 2adb3069b0e04-539a6283040mr97713e87.26.1727889419112; Wed, 02 Oct 2024
 10:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <ZvsHJZqFe38Cpq6T@gmail.com> <6732.1727859017264507661@lists.yoctoproject.org>
 <CADkTA4PYTZHTWv=1P_Lm5vy-DSCH0AogBvj2zHnnP9fKP4GpEg@mail.gmail.com>
In-Reply-To: <CADkTA4PYTZHTWv=1P_Lm5vy-DSCH0AogBvj2zHnnP9fKP4GpEg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 2 Oct 2024 10:16:47 -0700
Message-ID: <CANx9H-CT3HP9WMQ0mhh5EXdzOM-dMYZvTwncEPbw6x8sZs7o9Q@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libvirt: ensure sysusers.d path for libvirt-qemu
To: bruce.ashfield@gmail.com
Cc: matthis.hauschild@airbus.com, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000009994d0623819bda"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Oct 2024 17:17:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8910

--00000000000009994d0623819bda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 6:15=E2=80=AFAM Bruce Ashfield via lists.yoctoprojec=
t.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

> On Wed, Oct 2, 2024 at 4:50=E2=80=AFAM Matthis Hauschild via
> lists.yoctoproject.org
> <matthis.hauschild=3Dairbus.com@lists.yoctoproject.org> wrote:
> >
> > Hi,
> >
> > does that really solve your issue? With this patch applied, I run into
> the following build error because with the `-d` option, all arguments are
> treated as directories. So we should either use `-D` or create the
> directory accoring to the other created dirs in do_install
> >
> >
> > install: cannot create directory
> =E2=80=98/workdir/build/tmp/work/core2-64-wlanvm-linux/libvirt/v10.5.0+gi=
t/sources-unpack/libvirt-qemu.conf=E2=80=99:
> File exists
> > install: cannot create directory
> =E2=80=98/workdir/build/tmp/work/core2-64-wlanvm-linux/libvirt/v10.5.0+gi=
t/image/usr/lib/sysusers.d/libvirt-qemu.conf=E2=80=99:
> File exists
> >
> > So I propose the following patch. Please let me know what you think.
> > Side note: This is my first contribution, I hope the format is correct,
> otherwise please let me know. I cannot use `git send-email`, so this is
> written from the webinterface.
> > Best regards,
> > Matthis
>
> This was my mistake, I had meant t push this to master-next, not master s=
o
> my test loop didn't trigger!
>
> This should indeed match the format of the other directory installs, sinc=
e
> the
> combined command line is not universally supported.
>
> The patch won't apply as it is in this email, but I'll make the change by
> hand
> and add your information to the commit log.


My bad as well. I didn=E2=80=99t test it well enough. Don=E2=80=99t send pa=
tches late at
night?

Thank you for the fix Matthias! LGTM

>
>
> Bruce
>
> >
> > Patch:
> >
> > 3902ac8844a9868ab14fa38b663d3832daa4b9de leads to the following build
> > errors:
> > install: cannot create directory =E2=80=98{UNPACKDIR}/libvirt-qemu.conf=
=E2=80=99: File
> exists
> > install: cannot create directory
> =E2=80=98{D}/usr/lib/sysusers.d/libvirt-qemu.conf=E2=80=99: File exists
> > because `-d` treats all arguments as directories. Create the required
> > directory the same way as the other directories.
> > Signed-off-by: Matthis Hauschild <matthis.hauschild@airbus.com>
> > ---
> >  recipes-extended/libvirt/libvirt_git.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > diff --git a/recipes-extended/libvirt/libvirt_git.bb
> b/recipes-extended/libvirt/libvirt_git.bb
> > index bef98b69..5c5a9b3f 100644
> > --- a/recipes-extended/libvirt/libvirt_git.bb
> > +++ b/recipes-extended/libvirt/libvirt_git.bb
> > @@ -205,10 +205,11 @@ do_install:append() {
> >      install -d ${D}/etc/init.d
> >      install -d ${D}/etc/libvirt
> >      install -d ${D}/etc/dnsmasq.d
> > +    install -d ${D}${nonarch_base_libdir}/sysusers.d
> >
> >      install -m 0755 ${UNPACKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
> >      install -m 0644 ${UNPACKDIR}/libvirtd.conf
> ${D}/etc/libvirt/libvirtd.conf
> > -    install -d -m 0644 ${UNPACKDIR}/libvirt-qemu.conf
> ${D}${nonarch_base_libdir}/sysusers.d/libvirt-qemu.conf
> > +    install -m 0644 ${UNPACKDIR}/libvirt-qemu.conf
> ${D}${nonarch_base_libdir}/sysusers.d/libvirt-qemu.conf
> >
> >      if
> ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; the=
n
> >          # This will wind up in the libvirtd package, but will NOT be
> invoked by default.
> > --
> > 2.43.0
> >
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
> View/Reply Online (#8909):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8909
> Mute This Topic: https://lists.yoctoproject.org/mt/108714337/924729
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000009994d0623819bda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 2, 2024 at 6:15=E2=80=AFAM Bruce Ashfield via <=
a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;bru=
ce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com=
@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Wed, Oc=
t 2, 2024 at 4:50=E2=80=AFAM Matthis Hauschild via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a><br>
&lt;matthis.hauschild=3D<a href=3D"mailto:airbus.com@lists.yoctoproject.org=
" target=3D"_blank">airbus.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; does that really solve your issue? With this patch applied, I run into=
 the following build error because with the `-d` option, all arguments are =
treated as directories. So we should either use `-D` or create the director=
y accoring to the other created dirs in do_install<br>
&gt;<br>
&gt;<br>
&gt; install: cannot create directory =E2=80=98/workdir/build/tmp/work/core=
2-64-wlanvm-linux/libvirt/v10.5.0+git/sources-unpack/libvirt-qemu.conf=E2=
=80=99: File exists<br>
&gt; install: cannot create directory =E2=80=98/workdir/build/tmp/work/core=
2-64-wlanvm-linux/libvirt/v10.5.0+git/image/usr/lib/sysusers.d/libvirt-qemu=
.conf=E2=80=99: File exists<br>
&gt;<br>
&gt; So I propose the following patch. Please let me know what you think.<b=
r>
&gt; Side note: This is my first contribution, I hope the format is correct=
, otherwise please let me know. I cannot use `git send-email`, so this is w=
ritten from the webinterface.<br>
&gt; Best regards,<br>
&gt; Matthis<br>
<br>
This was my mistake, I had meant t push this to master-next, not master so<=
br>
my test loop didn&#39;t trigger!<br>
<br>
This should indeed match the format of the other directory installs, since =
the<br>
combined command line is not universally supported.<br>
<br>
The patch won&#39;t apply as it is in this email, but I&#39;ll make the cha=
nge by hand<br>
and add your information to the commit log.</blockquote><div dir=3D"auto"><=
br></div><div dir=3D"auto">My bad as well. I didn=E2=80=99t test it well en=
ough. Don=E2=80=99t send patches late at night?</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Thank you for the fix Matthias! LGTM</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)" dir=3D"auto"><br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Patch:<br>
&gt;<br>
&gt; 3902ac8844a9868ab14fa38b663d3832daa4b9de leads to the following build<=
br>
&gt; errors:<br>
&gt; install: cannot create directory =E2=80=98{UNPACKDIR}/libvirt-qemu.con=
f=E2=80=99: File exists<br>
&gt; install: cannot create directory =E2=80=98{D}/usr/lib/sysusers.d/libvi=
rt-qemu.conf=E2=80=99: File exists<br>
&gt; because `-d` treats all arguments as directories. Create the required<=
br>
&gt; directory the same way as the other directories.<br>
&gt; Signed-off-by: Matthis Hauschild &lt;<a href=3D"mailto:matthis.hauschi=
ld@airbus.com" target=3D"_blank">matthis.hauschild@airbus.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libvirt_git.bb</a> | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb=
" rel=3D"noreferrer" target=3D"_blank">libvirt_git.bb</a> b/recipes-extende=
d/libvirt/<a href=3D"http://libvirt_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">libvirt_git.bb</a><br>
&gt; index bef98b69..5c5a9b3f 100644<br>
&gt; --- a/recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libvirt_git.bb</a><br>
&gt; +++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libvirt_git.bb</a><br>
&gt; @@ -205,10 +205,11 @@ do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -d ${D}/etc/init.d<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -d ${D}/etc/libvirt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -d ${D}/etc/dnsmasq.d<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${nonarch_base_libdir}/sysusers.d<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -m 0755 ${UNPACKDIR}/libvirtd.sh ${D}/etc/=
init.d/libvirtd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -m 0644 ${UNPACKDIR}/libvirtd.conf ${D}/et=
c/libvirt/libvirtd.conf<br>
&gt; -=C2=A0 =C2=A0 install -d -m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}$=
{nonarch_base_libdir}/sysusers.d/libvirt-qemu.conf<br>
&gt; +=C2=A0 =C2=A0 install -m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}${no=
narch_base_libdir}/sysusers.d/libvirt-qemu.conf<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
&#39;sysvinit&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This will wind up in the libvirtd =
package, but will NOT be invoked by default.<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
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
View/Reply Online (#8909): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8909" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8909</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/108714337/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/108714337/924729</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" ta=
rget=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000009994d0623819bda--

