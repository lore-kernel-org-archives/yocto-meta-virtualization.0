Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEABCDB47E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 22:40:05 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.26322.1697150396106893916
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 15:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wv6KmtcT;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7a2cc9ee64cso59290139f.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Oct 2023 15:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697150395; x=1697755195; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ynUqSSrz7LTRSsMqFEs2MPCZfW6ko7ks8xUTIn6OBw=;
        b=Wv6KmtcTM4aTl9lhEDksDuSykUyqJ7jp4HfZhuWVxLwgxi2LUHJ1/V7xpWgBwkrz7+
         fQQyZeziriBUHrG8R+WosVjU3jHWAFDXUJauyEzkCopnduX4qcxLrRST714D3N6tL2N7
         PFci5wU9jcVOe0VLjK+IBJEKvlDDLubEYlnUoNK39ajA8WMNfn6gZEUofJZMg3awuUhj
         P+lsychDJ6tqP2G1kbkjgWHEgKF/XclWWjN8Y0xoMbAYHvCIQ4/tA5Np+DEiM0wq7r4t
         erdgwxUYUbKduCez1IYdjqUyYow6ZKJikTa8zIt6R6u2B5AF/UOrWsp+aoTbUtDkQ71/
         vn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697150395; x=1697755195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ynUqSSrz7LTRSsMqFEs2MPCZfW6ko7ks8xUTIn6OBw=;
        b=AUVlSzpR9CQIi8XBXWTDu2ecLZ7kyjR8XV48Kl5kQ4w8aCAmYWUeOM6onSWmODnnip
         HpfKwtq29gSzAAVJb3pAwchvRbfYsrtP+SS1m4hsWxKEzduukaADE6Ob/uaZe6Shl+ZR
         zhm8QkupXHF7VOG8rIeSGoOgIM2onlQotnNZcjdla5Stl2ymhZWvxGyI1xj2KCeJ3q9t
         9iaX+snCESm2gxoaL/DCSsUqVmQP0V52590nez6b4WUtFpIP0GgyXb7Ri4FT5Ddqzdc8
         IiOsHGBCM85WQwZ1UxnIub9YNpaDwpdXAV3haGJ23YNKm0vGxnLQQQolvgKyHsOptTdb
         jw0g==
X-Gm-Message-State: AOJu0Yw8DTzL9S3aXO0yWgXeSSwx4pl7XK4EkWRgbGFhcj5x+GM9/3g6
	M2ZRc5T+VQQlRK1ppO0ZUH5cVsTULqUYX1SfBQo=
X-Google-Smtp-Source: AGHT+IF87lolvKReKVcm/jk3QWaZM11OXnk5y2bECGDiVDLaiSgJW5wOs59yGOan8S5dYxLIGtmyMO7wMPUipT88lwg=
X-Received: by 2002:a05:6e02:1c22:b0:351:526a:499 with SMTP id
 m2-20020a056e021c2200b00351526a0499mr31633910ilh.20.1697150395030; Thu, 12
 Oct 2023 15:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231012165156.357269-1-JPEWhacker@gmail.com> <178D6BFFDDF3349D.29357@lists.yoctoproject.org>
 <CADkTA4PAnZabpi8Hz-maV6fb9Mm0VnucUrHiX+42K5dkaYbQWw@mail.gmail.com> <CAJdd5GaDk3kvnNmO4G6NfxkBjKVaWUBrkbRdd1OAS_YSOH261Q@mail.gmail.com>
In-Reply-To: <CAJdd5GaDk3kvnNmO4G6NfxkBjKVaWUBrkbRdd1OAS_YSOH261Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Oct 2023 18:39:43 -0400
Message-ID: <CADkTA4PNKo9XAPzJ4qQVCbtOh-ZXU2C1MXztYH1c7U4d-UWLnQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] classes/image-oci: Add OCI_IMAGE_ENTRYPOINT_ARG_LIST
To: Joshua Watt <jpewhacker@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006d249806078c9ec9"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Oct 2023 22:40:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8357

--0000000000006d249806078c9ec9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 6:09=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com> =
wrote:

> On Thu, Oct 12, 2023 at 11:25=E2=80=AFAM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> >
> >
> > On Thu, Oct 12, 2023 at 1:23=E2=80=AFPM Bruce Ashfield via
> lists.yoctoproject.org <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org=
>
> wrote:
> >>
> >>
> >>
> >> On Thu, Oct 12, 2023 at 12:52=E2=80=AFPM Joshua Watt <JPEWhacker@gmail=
.com>
> wrote:
> >>>
> >>> The "entrypoint arguments" (command) is allowed to be a list of
> >>> arguments to pass to the entrypoint. However, the current
> >>> OCI_IMAGE_ENTRYPOINT_ARGS variables doesn't support however. In order
> to
> >>> maintain backward compatibility, a new variable has to be introduced =
to
> >>> that can be split into the multiple arguments required
> >>>
> >>
> >> I haven't looked in detail, but the original intent of that variable I=
S
> to have more than
> >> one argument. I was just the only current user of them, and only had
> one argument
> >> that needed to be passed.
> >>
> >> I'd rather not have a new variable, but just change the processing to
> do 1 or more
> >> arguments in the existing variable.
> >>
> >
> > Which if I'm not mistaken, is your first patch :)
>
> Almost. The first patch does it for OCI_IMAGE_ENTRYPOINT. That one is
> straight forward because there is no backward compatible problem. The
> second one (this one) does it for
> OCI_IMAGE_ENTRYPOINT_ARGS, which is trickier because if we make it
> behave the same as OCI_IMAGE_ENTRYPOINT it will break anyone who is
> currently relying on a space in OCI_IMAGE_ENTRYPOINT_ARGS to be passed
> verbatim to their entrypoint (hence my tentative suggestion to add a
> new variable). I'd be fine with just make OCI_IMAGE_ENTRYPOINT_ARGS
> split on space if that was the original intention (I can even roll it
> into the previous patch if you want and make it do both variables at
> the same time).
>

That's sort of my point.

The entry point can just be the executable, and this variable is supposed
to be the arguments.

So no arguments should be passed via that first variable, but should be in
this one. We can have the split and processing here, and check and forbid
it in the first variable. It shouldn't be in both.

Bruce


>
> >
> > Bruce
> >
> >
> >>
> >> I'll also have to figure out how to make the sloci backend work, but
> that's a different
> >> question.
> >>
> >> Bruce
> >>
> >>
> >>>
> >>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> >>> ---
> >>>  classes/image-oci-umoci.inc | 3 +++
> >>>  classes/image-oci.bbclass   | 1 +
> >>>  2 files changed, 4 insertions(+)
> >>>
> >>> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.in=
c
> >>> index 6c7f244..da93570 100644
> >>> --- a/classes/image-oci-umoci.inc
> >>> +++ b/classes/image-oci-umoci.inc
> >>> @@ -103,6 +103,9 @@ IMAGE_CMD:oci() {
> >>>      if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
> >>>         umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cm=
d
> "${OCI_IMAGE_ENTRYPOINT_ARGS}"
> >>>      fi
> >>> +    if [ -n "${OCI_IMAGE_ENTRYPOINT_ARG_LIST}" ]; then
> >>> +       umoci config --image $image_name:${OCI_IMAGE_TAG} ${@"
> ".join("--config.cmd %s" % s for s in
> d.getVar("OCI_IMAGE_ENTRYPOINT_ARG_LIST").split())}
> >>> +    fi
> >>>      umoci config --image $image_name:${OCI_IMAGE_TAG} --author
> ${OCI_IMAGE_AUTHOR_EMAIL}
> >>>
> >>>      # make a tar version of the image direcotry
> >>> diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
> >>> index 9ddb88b..68045ad 100644
> >>> --- a/classes/image-oci.bbclass
> >>> +++ b/classes/image-oci.bbclass
> >>> @@ -57,6 +57,7 @@ OCI_IMAGE_SUBARCH ?=3D
> "${@oci_map_subarch(d.getVar('TARGET_ARCH'), d.getVar('TUNE
> >>>
> >>>  OCI_IMAGE_ENTRYPOINT ?=3D "sh"
> >>>  OCI_IMAGE_ENTRYPOINT_ARGS ?=3D ""
> >>> +OCI_IMAGE_ENTRYPOINT_ARG_LIST ?=3D""
> >>>  OCI_IMAGE_WORKINGDIR ?=3D ""
> >>>  OCI_IMAGE_STOPSIGNAL ?=3D ""
> >>>
> >>> --
> >>> 2.34.1
> >>>
> >>>
> >>>
> >>>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#8354):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8354
> >> Mute This Topic: https://lists.yoctoproject.org/mt/101922305/1050810
> >> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/leave/6693017/105081=
0/978058475/xyzzy
> [bruce.ashfield@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000006d249806078c9ec9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 12, 2023 at 6:09=E2=80=AFPM Joshua Watt=
 &lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Thu, Oct 12, 2023 at 11:25=E2=80=AFAM Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ash=
field@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Oct 12, 2023 at 1:23=E2=80=AFPM Bruce Ashfield via <a href=3D"=
http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.y=
octoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.=
yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt=
; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Oct 12, 2023 at 12:52=E2=80=AFPM Joshua Watt &lt;<a href=
=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.com</a>=
&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The &quot;entrypoint arguments&quot; (command) is allowed to b=
e a list of<br>
&gt;&gt;&gt; arguments to pass to the entrypoint. However, the current<br>
&gt;&gt;&gt; OCI_IMAGE_ENTRYPOINT_ARGS variables doesn&#39;t support howeve=
r. In order to<br>
&gt;&gt;&gt; maintain backward compatibility, a new variable has to be intr=
oduced to<br>
&gt;&gt;&gt; that can be split into the multiple arguments required<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I haven&#39;t looked in detail, but the original intent of that va=
riable IS to have more than<br>
&gt;&gt; one argument. I was just the only current user of them, and only h=
ad one argument<br>
&gt;&gt; that needed to be passed.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;d rather not have a new variable, but just change the proces=
sing to do 1 or more<br>
&gt;&gt; arguments in the existing variable.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Which if I&#39;m not mistaken, is your first patch :)<br>
<br>
Almost. The first patch does it for OCI_IMAGE_ENTRYPOINT. That one is<br>
straight forward because there is no backward compatible problem. The<br>
second one (this one) does it for<br>
OCI_IMAGE_ENTRYPOINT_ARGS, which is trickier because if we make it<br>
behave the same as OCI_IMAGE_ENTRYPOINT it will break anyone who is<br>
currently relying on a space in OCI_IMAGE_ENTRYPOINT_ARGS to be passed<br>
verbatim to their entrypoint (hence my tentative suggestion to add a<br>
new variable). I&#39;d be fine with just make OCI_IMAGE_ENTRYPOINT_ARGS<br>
split on space if that was the original intention (I can even roll it<br>
into the previous patch if you want and make it do both variables at<br>
the same time).<br></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">That&#39;s sort of my point.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">The entry point can just be the executa=
ble, and this variable is supposed to be the arguments.</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">So no arguments should be passed via that fi=
rst variable, but should be in this one. We can have the split and processi=
ng here, and check and forbid it in the first variable. It shouldn&#39;t be=
 in both.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; I&#39;ll also have to figure out how to make the sloci backend wor=
k, but that&#39;s a different<br>
&gt;&gt; question.<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gm=
ail.com" target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 classes/image-oci-umoci.inc | 3 +++<br>
&gt;&gt;&gt;=C2=A0 classes/image-oci.bbclass=C2=A0 =C2=A0| 1 +<br>
&gt;&gt;&gt;=C2=A0 2 files changed, 4 insertions(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-u=
moci.inc<br>
&gt;&gt;&gt; index 6c7f244..da93570 100644<br>
&gt;&gt;&gt; --- a/classes/image-oci-umoci.inc<br>
&gt;&gt;&gt; +++ b/classes/image-oci-umoci.inc<br>
&gt;&gt;&gt; @@ -103,6 +103,9 @@ IMAGE_CMD:oci() {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${OCI_IMAGE_ENTRYPOINT_ARGS}=
&quot; ]; then<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0umoci config --image $image_n=
ame:${OCI_IMAGE_TAG} --config.cmd &quot;${OCI_IMAGE_ENTRYPOINT_ARGS}&quot;<=
br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 if [ -n &quot;${OCI_IMAGE_ENTRYPOINT_ARG_LIST}&=
quot; ]; then<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0umoci config --image $image_name:$=
{OCI_IMAGE_TAG} ${@&quot; &quot;.join(&quot;--config.cmd %s&quot; % s for s=
 in d.getVar(&quot;OCI_IMAGE_ENTRYPOINT_ARG_LIST&quot;).split())}<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 fi<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 umoci config --image $image_name:${OCI_IMA=
GE_TAG} --author ${OCI_IMAGE_AUTHOR_EMAIL}<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 # make a tar version of the image direcotr=
y<br>
&gt;&gt;&gt; diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbc=
lass<br>
&gt;&gt;&gt; index 9ddb88b..68045ad 100644<br>
&gt;&gt;&gt; --- a/classes/image-oci.bbclass<br>
&gt;&gt;&gt; +++ b/classes/image-oci.bbclass<br>
&gt;&gt;&gt; @@ -57,6 +57,7 @@ OCI_IMAGE_SUBARCH ?=3D &quot;${@oci_map_suba=
rch(d.getVar(&#39;TARGET_ARCH&#39;), d.getVar(&#39;TUNE<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 OCI_IMAGE_ENTRYPOINT ?=3D &quot;sh&quot;<br>
&gt;&gt;&gt;=C2=A0 OCI_IMAGE_ENTRYPOINT_ARGS ?=3D &quot;&quot;<br>
&gt;&gt;&gt; +OCI_IMAGE_ENTRYPOINT_ARG_LIST ?=3D&quot;&quot;<br>
&gt;&gt;&gt;=C2=A0 OCI_IMAGE_WORKINGDIR ?=3D &quot;&quot;<br>
&gt;&gt;&gt;=C2=A0 OCI_IMAGE_STOPSIGNAL ?=3D &quot;&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.34.1<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at its end<br>
&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#8354): <a href=3D"https://lists.yoctoproject.o=
rg/g/meta-virtualization/message/8354" rel=3D"noreferrer" target=3D"_blank"=
>https://lists.yoctoproject.org/g/meta-virtualization/message/8354</a><br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/1019=
22305/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/mt/101922305/1050810</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.y=
octoproject.org" target=3D"_blank">meta-virtualization+owner@lists.yoctopro=
ject.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virt=
ualization/leave/6693017/1050810/978058475/xyzzy" rel=3D"noreferrer" target=
=3D"_blank">https://lists.yoctoproject.org/g/meta-virtualization/leave/6693=
017/1050810/978058475/xyzzy</a> [<a href=3D"mailto:bruce.ashfield@gmail.com=
" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000006d249806078c9ec9--

