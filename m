Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F30D75BA3
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 02:54:39 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.2414.1732157672346022581
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 18:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CdTGtY37;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso262711a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Nov 2024 18:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732157672; x=1732762472; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OggpXLaDPQE1hNi0ZTEh9VMQoSza74Jb9r/pn0BfZNc=;
        b=CdTGtY37jiZkDJTFRAw9RBPDh0Bvd12XJUP3jlTxSg3hBcKDZB7niRPmLfTKQDhzCu
         y+xfPgWlbmcE86bgwYdaNSycnUCZ/3AewHIx3/CpFpKcqiGjVbv+jq5G+DLCprwy8fVW
         cHm0A8zcHu5JpKxeRuLKaMoXioVcsVv09/E+3dtfme4JJ9ucq73DojDAtmg3E1BBY9FU
         kuXLBY7v2dxYNqiRtpd77lM5LPAAlaRn9KR4c59xuSw5JI8wV3AKP3H06FuiZjMBa2db
         ZPybmZPhQGBURq1mOKMX+0pwF5Qem7rfW/Z31u7PiRP4a6XsCBFSPyxKHn6vJUmPaLn2
         jFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732157672; x=1732762472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OggpXLaDPQE1hNi0ZTEh9VMQoSza74Jb9r/pn0BfZNc=;
        b=CTQEgKB4nZ3PGywbZDXeDZcR1cjN90Gkh6xzXAfgaNA9MyKoYwk41mEZDEY0NK0TBo
         RHj9o76MdJikPZg99uOLEAPbhOKCq0el6yRHEtQFXURyKuXsRuGOq0FmBek+Va7h5YzF
         2rd3270Uu+QvpsSyWv7k+ky+Acm5nr+3lONQpNab7zaH9VjJG7OhY5BZmCl4lAetr0v5
         ENnw+V7tKRoVetLu5jGPDg+iCKATb2zlFnQnleVz8MHQGgbtZjI1zw1tK6JG8IuxLY+8
         FjunXJt5REhsma97DhZAThHANINKGsEY4ARbRIFooJNazemZjqeVUrBZnJLcca5ay1Uh
         4nhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkvLWUIn6vNadPqn/gjgcgbVhstof9jMZGtY7m26aJekxZQUt/T04glxQvBFRGMdHJ2lnLWu5CKa7SERQQGmTX0Lgw@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwtUDDri2674K716ofscuunPWQg16W+uyt2fFZypkzO1SgJXQ3R
	WVLKuXGIba8O9qXae7tR9Mp5ykZTuER0mzWoR3FpPr/9b2keKS/SvirIDfhujkeODfuKY/o0Jyl
	Oa9pLImjWA4DAZsuHuw3mniZqMr8=
X-Google-Smtp-Source: AGHT+IHQwlnh4ecy0miUms/9Co6fiydpUts8IxygT8Af7U+akx0NBy6PbOsI7aSiBN3YX3pLAa6XvzpdfCUL/brFOYM=
X-Received: by 2002:a17:90a:c906:b0:2ea:a9dc:79d5 with SMTP id
 98e67ed59e1d1-2eaebf2ed95mr2572229a91.18.1732157671325; Wed, 20 Nov 2024
 18:54:31 -0800 (PST)
MIME-Version: 1.0
References: <CAERRtEuXxxZcjs0fGovUhF_dufQeco7dNM=zaU5aFJ9baoszog@mail.gmail.com>
 <CADkTA4N5eTYG8aTbjBfRspdR-25+0a3aFSGnjR_y63d8b+mtxA@mail.gmail.com>
 <CAERRtEukEAPrG87yduFEk=r1TzdakJqitdiR94Wsd+UUWxu5sQ@mail.gmail.com> <b431a35c-63eb-41ed-907b-84db66432cc7@windriver.com>
In-Reply-To: <b431a35c-63eb-41ed-907b-84db66432cc7@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Nov 2024 21:54:19 -0500
Message-ID: <CADkTA4MMhGbecya==_SSBAk1W2QfJ-WXYi4uRitJ4xOu3h6Rnw@mail.gmail.com>
Subject: Re: [meta-virtualization] Canonical LXD on Yocto
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: kev.ferber@gmail.com, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b1ca2e0627636238"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 02:54:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8986

--000000000000b1ca2e0627636238
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 9:02=E2=80=AFPM Randy MacLeod <randy.macleod@windri=
ver.com>
wrote:

> On 2024-10-10 10:43 a.m., Kevin Ferber via lists.yoctoproject.org wrote:
>
> Hi Bruce,
>
> it would be really great if you could share the recipe with me, even if i=
t
> is only partially finished.
>
> I've only just started working with Yocto, so it would be good to have a
> starting point.
>
> Kevin
>
> Getting caught up on old email...
>
>
> Would "incus" would be a better idea than lxd, at least for master:
>
> https://github.com/lxc/incus
>
> Incus, which is named after the Cumulonimbus incus
> <https://en.wikipedia.org/wiki/Cumulonimbus_incus> or anvil cloud started
> as community
> fork of Canonical's LXD following Canonical's takeover
> <https://linuxcontainers.org/lxd/> of the LXD project from the Linux
> Containers community.
>
> https://discuss.linuxcontainers.org/t/incus-6-7-has-been-released/22099
>
>
> I only just heard about incus on LWN today but the interactive demo was
> cool and worked well:
>   https://linuxcontainers.org/incus/try-it/
>
>
> Thoughts?
>

It would be an "and" and not an "or".  Just like the other container
runtimes, the overall meta-virt policy is not to pick a winner, but to
provide choice.

But this is a good reminder, I actually had completely forgotten about
finishing up my LXD recipe, so I'm going to drag that up and get working on
it now that I've finished the prep work for the cross-container install and
I've got enough time before the spring release.

Bruce



>
> ../Randy
>
>
>
> Am Do., 10. Okt. 2024 um 15:03 Uhr schrieb Bruce Ashfield <
> bruce.ashfield@gmail.com>:
>
>> I have some partial work on it that I did about a year ago.
>>
>> I never did finish the recipe, since there were runtime issues and no
>> one was asking for it :)
>>
>> It is something I'd like to have in meta-virt (the fact that someone
>> made an entire separate layer for it .. just makes no sense).
>>
>> If you do work on it, please contribute it to the layer. Or it is
>> something I can pick up in a few weeks and perhaps get some assistance
>> in validation.
>>
>> Bruce
>>
>>
>> On Thu, Oct 10, 2024 at 8:52=E2=80=AFAM Kevin Ferber via
>> lists.yoctoproject.org <kev.ferber=3Dgmail.com@lists.yoctoproject.org>
>> wrote:
>> >
>> > Hi all,
>> >
>> > does anyone worked on a recipe for LXD.
>> >
>> > We are in the process of moving from Ubuntu to Yocto Scarthgap because
>> we wanted to use the OTA functionality of RAUC.
>> >
>> > Now we are faced with the challenge of successfully compiling LXD, I
>> have looked at an old unofficial layer (
>> https://github.com/fcuringa/meta-lxd) for reference, which of course no
>> longer works with more recent LXD builds.
>> >
>> > Best regards
>> >
>> > Kevin
>> >
>> >
>> >
>> >
>> >
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8927): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8927
> Mute This Topic: https://lists.yoctoproject.org/mt/108927978/3616765
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b1ca2e0627636238
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 20, 2024 at 9:02=E2=80=AFPM Randy MacLe=
od &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriv=
er.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><u></u>

 =20
  <div>
    <div>On 2024-10-10 10:43 a.m., Kevin Ferber
      via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists=
.yoctoproject.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">Hi Bruce,
          <div><br>
          </div>
          <div>
            <div>it would be really great if you could share the recipe
              with me, even if it is only partially finished.</div>
            <div><br>
            </div>
            <div>I&#39;ve only just started working with Yocto, so it would
              be good to have a starting point.=C2=A0</div>
          </div>
          <div><br>
          </div>
          <div>Kevin</div>
        </div>
      </div>
    </blockquote>
    <p>Getting caught up on old email...</p>
    <p><br>
    </p>
    <p>Would &quot;incus&quot; would be a better idea than lxd, at least fo=
r
      master:<br>
      <br>
      <a href=3D"https://github.com/lxc/incus" target=3D"_blank">https://gi=
thub.com/lxc/incus</a></p>
    <p>Incus, which is named after the <a href=3D"https://en.wikipedia.org/=
wiki/Cumulonimbus_incus" rel=3D"nofollow" target=3D"_blank">Cumulonimbus in=
cus</a> or anvil cloud started as
      community <br>
      fork of Canonical&#39;s LXD following <a href=3D"https://linuxcontain=
ers.org/lxd/" rel=3D"nofollow" target=3D"_blank">Canonical&#39;s
        takeover</a> of the LXD project from the Linux Containers
      community.</p>
    <p><a href=3D"https://discuss.linuxcontainers.org/t/incus-6-7-has-been-=
released/22099" target=3D"_blank">https://discuss.linuxcontainers.org/t/inc=
us-6-7-has-been-released/22099</a><br>
    </p>
    <p><br>
    </p>
    <p>I only just heard about incus on LWN today but the interactive
      demo was cool and worked well:<br>
      =C2=A0 <a href=3D"https://linuxcontainers.org/incus/try-it/" target=
=3D"_blank">https://linuxcontainers.org/incus/try-it/</a><br>
    </p>
    <p><br>
    </p>
    <p>Thoughts?</p></div></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">It would be an &quot;and&quot; and n=
ot an &quot;or&quot;.=C2=A0 Just like the other container runtimes, the ove=
rall meta-virt policy is not to pick a winner, but to provide choice.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">But this is a good reminder, I=
 actually had completely forgotten about finishing up my LXD recipe, so I&#=
39;m going to drag that up and get working on it now that I&#39;ve finished=
 the prep work for the cross-container install and I&#39;ve got enough time=
 before the spring release.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite"><br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">Am Do., 10. Okt. 2024 um
          15:03=C2=A0Uhr schrieb Bruce Ashfield &lt;<a href=3D"mailto:bruce=
.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;:<br=
>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">I
          have some partial work on it that I did about a year ago.<br>
          <br>
          I never did finish the recipe, since there were runtime issues
          and no<br>
          one was asking for it :)<br>
          <br>
          It is something I&#39;d like to have in meta-virt (the fact that
          someone<br>
          made an entire separate layer for it .. just makes no sense).<br>
          <br>
          If you do work on it, please contribute it to the layer. Or it
          is<br>
          something I can pick up in a few weeks and perhaps get some
          assistance<br>
          in validation.<br>
          <br>
          Bruce<br>
          <br>
          <br>
          On Thu, Oct 10, 2024 at 8:52=E2=80=AFAM Kevin Ferber via<br>
          <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.yoctoproject.org</a>
          &lt;kev.ferber=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.o=
rg" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt;<br>
          wrote:<br>
          &gt;<br>
          &gt; Hi all,<br>
          &gt;<br>
          &gt; does anyone worked on a recipe for LXD.<br>
          &gt;<br>
          &gt; We are in the process of moving from Ubuntu to Yocto
          Scarthgap because we wanted to use the OTA functionality of
          RAUC.<br>
          &gt;<br>
          &gt; Now we are faced with the challenge of successfully
          compiling LXD, I have looked at an old unofficial layer (<a href=
=3D"https://github.com/fcuringa/meta-lxd" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/fcuringa/meta-lxd</a>)
          for reference, which of course no longer works with more
          recent LXD builds.<br>
          &gt;<br>
          &gt; Best regards<br>
          &gt;<br>
          &gt; Kevin<br>
          &gt;<br>
          &gt;<br>
          &gt;<br>
          &gt;<br>
          &gt; <br>
          &gt;<br>
          <br>
          <br>
          -- <br>
          - Thou shalt not follow the NULL pointer, for chaos and
          madness await<br>
          thee at its end<br>
          - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
        </blockquote>
      </div>
      <br>
      <fieldset></fieldset>
      <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#8927): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8927" target=3D"_blank">https://lists.yoctoproject.=
org/g/meta-virtualization/message/8927</a>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/108927978/361=
6765" target=3D"_blank">https://lists.yoctoproject.org/mt/108927978/3616765=
</a>
Group Owner: <a href=3D"mailto:meta-virtualization+owner@lists.yoctoproject=
.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org</a=
>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" target=3D"_blank">https://lists.yoctoproject.org/g/meta-virtualiza=
tion/unsub</a> [<a href=3D"mailto:randy.macleod@windriver.com" target=3D"_b=
lank">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000b1ca2e0627636238--

