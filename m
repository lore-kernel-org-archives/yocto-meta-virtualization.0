Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556DCCDB474
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 03:40:07 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.31311.1697168404530038406
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 20:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IUHoBT5p;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7a5a746e355so41472939f.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Oct 2023 20:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697168404; x=1697773204; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qlAOS236vQrjr+83YIAbo9vZR6unvUBIHSmAScWH4fs=;
        b=IUHoBT5pCNXBqbIVo7ZtA1wAV3ITeBepcFaEzJJTBZIBLtdFwZZLpOlVt8TbTB0nrK
         Y/sWTo63yOSLZ26kTPu5tyxudcCfNuCbCjpoZRezDanmcvObZHBMPCUWJk1AyOOZpn6/
         zYNEKnsCpVVXTMwsrE7NRR5f2GLCB5Pn1MLNtAUfSxu6aBJgu6tkRS7FgynvbT2xBQzt
         0ew1wdxpI39S+z40uaYW2tX4fqPLdEtQ6ngkKRMmO7CVLpo0T6B8gz2k4WZRKlIsOI/Z
         qjSqb7jEVpgu1UJiBNMrYOoNzt/d5ftLuC6a1dnUX6sIFcJRLsFexdF5DbYxkn+J94TA
         Tr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697168404; x=1697773204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlAOS236vQrjr+83YIAbo9vZR6unvUBIHSmAScWH4fs=;
        b=kkpf4y1mcnczVbT4MNLmm+Znk3rDTmA2TVfH8afzR8XsVuR2UovlchVyZcCKOwxl0o
         hIiLom3+tbAoNsrceTnIPLe8RMVn8UzVbpRf/lPP4hwnLpY+pgJFs2nozTiBVYCmN8ym
         PJkqoSPNUoJX7l1/Mg/5M0knH1JSFZPWhQR/UPaExjsOOiDB7fbbP2n9Z/8VIa73QY1D
         xPue4WypNd5oJUBHwvz72Gv3rS8o7RaKnRsnWaRGw2BR0kiKF0tp157T9s+nAQhjkKJ9
         Nj6sUgxzPvsh9Hg6E4bfdIVtu8F5PwwAHPn0CwbVTOOtHTcIgAy0F1HAKzbTqeNbOQr+
         5D6Q==
X-Gm-Message-State: AOJu0YzSb12h9KWA7SliVldhqlzYPGJZfP8+2WZMGIOaKluzYgwTA+DN
	Ep+/WKELWcIBcCGhfEgGgLT2efW0SN+D6XFuRGY=
X-Google-Smtp-Source: AGHT+IEP2fdjqlR9c4RCUlhRW2bwtRzcKouHrU8fjaWIp47Gr51/aPgaqBkh3yYLpTJ7qOZ3n4KY6OXZ02rzpzlGVhk=
X-Received: by 2002:a05:6602:4a07:b0:7a2:50ef:66e1 with SMTP id
 eh7-20020a0566024a0700b007a250ef66e1mr16648280iob.8.1697168402797; Thu, 12
 Oct 2023 20:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231012165156.357269-1-JPEWhacker@gmail.com> <178D6BFFDDF3349D.29357@lists.yoctoproject.org>
 <CADkTA4PAnZabpi8Hz-maV6fb9Mm0VnucUrHiX+42K5dkaYbQWw@mail.gmail.com>
 <CAJdd5GaDk3kvnNmO4G6NfxkBjKVaWUBrkbRdd1OAS_YSOH261Q@mail.gmail.com>
 <CADkTA4PNKo9XAPzJ4qQVCbtOh-ZXU2C1MXztYH1c7U4d-UWLnQ@mail.gmail.com>
 <CAJdd5GYT5Wzpy8rQnKx3-=0XEDBspqWZbE2et14VkJ6io+z_QA@mail.gmail.com> <178D8BCB6046F019.14388@lists.yoctoproject.org>
In-Reply-To: <178D8BCB6046F019.14388@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Oct 2023 23:39:56 -0400
Message-ID: <CADkTA4OR61ZYbTyGpzk2_8v3gJcbR=6O1VYEa4M61Byo4dToUw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] classes/image-oci: Add OCI_IMAGE_ENTRYPOINT_ARG_LIST
To: bruce.ashfield@gmail.com
Cc: Joshua Watt <jpewhacker@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c5dabe060790cfd3"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Oct 2023 03:40:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8360

--000000000000c5dabe060790cfd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 11:05=E2=80=AFPM Bruce Ashfield via lists.yoctoproj=
ect.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Thu, Oct 12, 2023 at 7:02=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com=
> wrote:
>
>>
>>
>> On Thu, Oct 12, 2023, 4:39 PM Bruce Ashfield <bruce.ashfield@gmail.com>
>> wrote:
>>
>>>
>>>
>>> On Thu, Oct 12, 2023 at 6:09=E2=80=AFPM Joshua Watt <jpewhacker@gmail.c=
om>
>>> wrote:
>>>
>>>> On Thu, Oct 12, 2023 at 11:25=E2=80=AFAM Bruce Ashfield
>>>> <bruce.ashfield@gmail.com> wrote:
>>>> >
>>>> >
>>>> >
>>>> > On Thu, Oct 12, 2023 at 1:23=E2=80=AFPM Bruce Ashfield via
>>>> lists.yoctoproject.org <bruce.ashfield=3Dgmail.com@lists.yoctoproject.=
org>
>>>> wrote:
>>>> >>
>>>> >>
>>>> >>
>>>> >> On Thu, Oct 12, 2023 at 12:52=E2=80=AFPM Joshua Watt <JPEWhacker@gm=
ail.com>
>>>> wrote:
>>>> >>>
>>>> >>> The "entrypoint arguments" (command) is allowed to be a list of
>>>> >>> arguments to pass to the entrypoint. However, the current
>>>> >>> OCI_IMAGE_ENTRYPOINT_ARGS variables doesn't support however. In
>>>> order to
>>>> >>> maintain backward compatibility, a new variable has to be
>>>> introduced to
>>>> >>> that can be split into the multiple arguments required
>>>> >>>
>>>> >>
>>>> >> I haven't looked in detail, but the original intent of that variabl=
e
>>>> IS to have more than
>>>> >> one argument. I was just the only current user of them, and only ha=
d
>>>> one argument
>>>> >> that needed to be passed.
>>>> >>
>>>> >> I'd rather not have a new variable, but just change the processing
>>>> to do 1 or more
>>>> >> arguments in the existing variable.
>>>> >>
>>>> >
>>>> > Which if I'm not mistaken, is your first patch :)
>>>>
>>>> Almost. The first patch does it for OCI_IMAGE_ENTRYPOINT. That one is
>>>> straight forward because there is no backward compatible problem. The
>>>> second one (this one) does it for
>>>> OCI_IMAGE_ENTRYPOINT_ARGS, which is trickier because if we make it
>>>> behave the same as OCI_IMAGE_ENTRYPOINT it will break anyone who is
>>>> currently relying on a space in OCI_IMAGE_ENTRYPOINT_ARGS to be passed
>>>> verbatim to their entrypoint (hence my tentative suggestion to add a
>>>> new variable). I'd be fine with just make OCI_IMAGE_ENTRYPOINT_ARGS
>>>> split on space if that was the original intention (I can even roll it
>>>> into the previous patch if you want and make it do both variables at
>>>> the same time).
>>>>
>>>
>>> That's sort of my point.
>>>
>>> The entry point can just be the executable, and this variable is
>>> supposed to be the arguments.
>>>
>>> So no arguments should be passed via that first variable, but should be
>>> in this one. We can have the split and processing here, and check and
>>> forbid it in the first variable. It shouldn't be in both.
>>>
>>
>> I've made plenty of container images where ENTRYPOINT had multiple
>> arguments; the trivial example is ["/usr/bin/python3", "my script"]. Sur=
e,
>> you can do it other ways (e.g. a proxy shell script.... Which then means
>> your container needs a shell), but restricting that as an option doesn't
>> seem necessary?
>>
>>
> Sure, but I'm saying put that "my script" in the args variable, that's
> exactly what I added it for.
>
>
I should clarify that I mean that we don't have to process it via the
config.cmd for umoci
.. if there's a technical need to change how it is encoded, we can deal
with that. i.e in
theory that variable could just be turned into multiple config.entrypoint
calls instead of
config.cmd

But both ways of encoding it work (entrypoint + cmd), and there's no need t=
o
complicate things by adding another variable, we should be able to express
what
we need with the existing ones.

The umoci and image-spec tests that I've run use entrypoint + cmd to encode
arguments
to the main executable / interpreter. We can sit around and talk about how
we are reading
the oci-image-spec, but both entrypoint and cmd are optional in it (the
spec), and have a
similar function.  I've seen both ways of encoding in various container
stacks over
the years.

But in the end, I don't think it matters at all. With umoci, it is valid to
encode them either
way, so simply converting space separated entrypoints and arguments to
repeated
--config.entrypoint and --config.cmd calls are fine, and we don't have to
worry about
backward compatibility now that I've looked at things more closely.

If someone wants a single entrypoint and options via cmd, they can do that
with them
both converted, and vice versa.

Bruce



> Bruce
>
>
>
>>
>>
>>> Bruce
>>>
>>>
>>>>
>>>> >
>>>> > Bruce
>>>> >
>>>> >
>>>> >>
>>>> >> I'll also have to figure out how to make the sloci backend work, bu=
t
>>>> that's a different
>>>> >> question.
>>>> >>
>>>> >> Bruce
>>>> >>
>>>> >>
>>>> >>>
>>>> >>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>>> >>> ---
>>>> >>>  classes/image-oci-umoci.inc | 3 +++
>>>> >>>  classes/image-oci.bbclass   | 1 +
>>>> >>>  2 files changed, 4 insertions(+)
>>>> >>>
>>>> >>> diff --git a/classes/image-oci-umoci.inc
>>>> b/classes/image-oci-umoci.inc
>>>> >>> index 6c7f244..da93570 100644
>>>> >>> --- a/classes/image-oci-umoci.inc
>>>> >>> +++ b/classes/image-oci-umoci.inc
>>>> >>> @@ -103,6 +103,9 @@ IMAGE_CMD:oci() {
>>>> >>>      if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
>>>> >>>         umoci config --image $image_name:${OCI_IMAGE_TAG}
>>>> --config.cmd "${OCI_IMAGE_ENTRYPOINT_ARGS}"
>>>> >>>      fi
>>>> >>> +    if [ -n "${OCI_IMAGE_ENTRYPOINT_ARG_LIST}" ]; then
>>>> >>> +       umoci config --image $image_name:${OCI_IMAGE_TAG} ${@"
>>>> ".join("--config.cmd %s" % s for s in
>>>> d.getVar("OCI_IMAGE_ENTRYPOINT_ARG_LIST").split())}
>>>> >>> +    fi
>>>> >>>      umoci config --image $image_name:${OCI_IMAGE_TAG} --author
>>>> ${OCI_IMAGE_AUTHOR_EMAIL}
>>>> >>>
>>>> >>>      # make a tar version of the image direcotry
>>>> >>> diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
>>>> >>> index 9ddb88b..68045ad 100644
>>>> >>> --- a/classes/image-oci.bbclass
>>>> >>> +++ b/classes/image-oci.bbclass
>>>> >>> @@ -57,6 +57,7 @@ OCI_IMAGE_SUBARCH ?=3D
>>>> "${@oci_map_subarch(d.getVar('TARGET_ARCH'), d.getVar('TUNE
>>>> >>>
>>>> >>>  OCI_IMAGE_ENTRYPOINT ?=3D "sh"
>>>> >>>  OCI_IMAGE_ENTRYPOINT_ARGS ?=3D ""
>>>> >>> +OCI_IMAGE_ENTRYPOINT_ARG_LIST ?=3D""
>>>> >>>  OCI_IMAGE_WORKINGDIR ?=3D ""
>>>> >>>  OCI_IMAGE_STOPSIGNAL ?=3D ""
>>>> >>>
>>>> >>> --
>>>> >>> 2.34.1
>>>> >>>
>>>> >>>
>>>> >>>
>>>> >>>
>>>> >>
>>>> >>
>>>> >> --
>>>> >> - Thou shalt not follow the NULL pointer, for chaos and madness
>>>> await thee at its end
>>>> >> - "Use the force Harry" - Gandalf, Star Trek II
>>>> >>
>>>> >>
>>>> >>
>>>> >>
>>>> >
>>>> >
>>>> > --
>>>> > - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
>>>> thee at its end
>>>> > - "Use the force Harry" - Gandalf, Star Trek II
>>>> >
>>>>
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8359):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8359
> Mute This Topic: https://lists.yoctoproject.org/mt/101922305/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/leave/6693017/105081=
0/978058475/xyzzy
> [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c5dabe060790cfd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 12, 2023 at 11:05=E2=80=AFPM Bruce Ashf=
ield via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.=
yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists=
.yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Oct 12, 2023 at 7:02=E2=80=AFPM Joshua Watt &lt;<a href=3D"mailto:jpewhac=
ker@gmail.com" target=3D"_blank">jpewhacker@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div=
><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Thu, Oct 12, 2023, 4:39 PM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ash=
field@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 12, =
2023 at 6:09=E2=80=AFPM Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.=
com" rel=3D"noreferrer" target=3D"_blank">jpewhacker@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Oct 1=
2, 2023 at 11:25=E2=80=AFAM Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" rel=3D"noreferrer" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Oct 12, 2023 at 1:23=E2=80=AFPM Bruce Ashfield via <a href=3D"=
http://lists.yoctoproject.org" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail=
.com@lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">gmail.com=
@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Oct 12, 2023 at 12:52=E2=80=AFPM Joshua Watt &lt;<a href=
=3D"mailto:JPEWhacker@gmail.com" rel=3D"noreferrer" target=3D"_blank">JPEWh=
acker@gmail.com</a>&gt; wrote:<br>
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
the same time).<br></blockquote><div><br></div><div><div style=3D"font-size=
:small">That&#39;s sort of my point.</div><div style=3D"font-size:small"><b=
r></div><div style=3D"font-size:small">The entry point can just be the exec=
utable, and this variable is supposed to be the arguments.</div><div style=
=3D"font-size:small"><br></div><div style=3D"font-size:small">So no argumen=
ts should be passed via that first variable, but should be in this one. We =
can have the split and processing here, and check and forbid it in the firs=
t variable. It shouldn&#39;t be in both.</div></div></div></div></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ve made p=
lenty of container images where ENTRYPOINT had multiple arguments; the triv=
ial example is [&quot;/usr/bin/python3&quot;, &quot;my script&quot;]. Sure,=
 you can do it other ways (e.g. a proxy shell script.... Which then means y=
our container needs a shell), but restricting that as an option doesn&#39;t=
 seem necessary?</div><div dir=3D"auto"></div><div dir=3D"auto"><br></div><=
/div></blockquote><div><br></div><div><div style=3D"font-size:small">Sure, =
but I&#39;m saying put that &quot;my script&quot; in the args variable, tha=
t&#39;s exactly what I added it for.</div><div style=3D"font-size:small"><b=
r></div></div></div></div></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">I should clarify that I mean that we=
 don&#39;t have to process it via the config.cmd for umoci</div><div class=
=3D"gmail_default" style=3D"font-size:small">.. if there&#39;s a technical =
need to change how it is encoded, we can deal with that. i.e in</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">theory that variable could=
 just be turned into multiple config.entrypoint calls instead of</div><div =
class=3D"gmail_default" style=3D"font-size:small">config.cmd</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">But both ways of encoding it work (entr=
ypoint + cmd), and there&#39;s no need to</div><div class=3D"gmail_default"=
 style=3D"font-size:small">complicate things by adding another variable, we=
 should be able to express what</div><div class=3D"gmail_default" style=3D"=
font-size:small">we need with the existing ones.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">The umoci and image-spec tests that I&#39;ve run us=
e entrypoint=C2=A0+ cmd to encode arguments</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">to the main executable / interpreter. We can s=
it around and talk about how we are reading<br>the oci-image-spec, but both=
 entrypoint and cmd are optional in it (the spec), and have a</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">similar function.=C2=A0 I&#3=
9;ve seen both ways of encoding in various container stacks over</div><div =
class=3D"gmail_default" style=3D"font-size:small">the years.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">But in the end, I don&#39;t think it ma=
tters at all. With umoci, it is valid to encode them either</div><div class=
=3D"gmail_default" style=3D"font-size:small">way, so simply converting spac=
e separated entrypoints=C2=A0and arguments=C2=A0to repeated=C2=A0</div><div=
 class=3D"gmail_default" style=3D"font-size:small">--config.entrypoint and =
--config.cmd calls are fine, and we don&#39;t have to worry about</div><div=
 class=3D"gmail_default" style=3D"font-size:small">backward compatibility=
=C2=A0now that I&#39;ve looked at things more closely.</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">If someone wants a single entrypoint and opti=
ons via cmd, they can do that with them</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">both converted, and vice versa.</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_quote"><div><div style=3D"font-size:small"></div><div style=3D"font-=
size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmai=
l_quote"><div><div style=3D"font-size:small"><br></div><div style=3D"font-s=
ize:small">Bruce</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
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
ail.com" rel=3D"noreferrer" target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<=
br>
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
&gt;&gt; <br>
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
</blockquote></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8359): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8359" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8359</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101922305/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101922305/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/leave/6693017/1050810/978058475/xyzzy" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.yoctoproject.org/g/meta-virtualization/leave/6693017/10508=
10/978058475/xyzzy</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000c5dabe060790cfd3--

