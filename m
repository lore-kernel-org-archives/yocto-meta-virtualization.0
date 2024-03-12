Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553ABC5475B
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 00:41:13 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.943.1710204063930184018
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 17:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=byeCE3Cr;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-609f4d8551eso37809657b3.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Mar 2024 17:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710204063; x=1710808863; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3GYr7Ozh9jUd466uTPcl0wktZ1vG72iOxjuFg3uK1nk=;
        b=byeCE3CrbePfpE5oLGfoJsLjVdh46uFCq88nP189A6Gq4eAHUihuew2egoKgtBB8pQ
         +i50rh2gS7kPBZzkYJKV9ZbCe+oJYOSObypHxNvfEUpHS8WlgLso4uPJESZq2KUnLQc8
         iDyZIjOxUHh6F+UuFxq6yE0P4KzeJKl7jkbf7F6oqgabzYoRAz7UR9d7Wnm38cYua+lW
         pHptedM4r2IWcUfQvayr/yiiJCF7a/RJ11uStjTzb4D6dpJrSdFrr6EipbTiFbicVjFv
         +S1hfs3j0JMpHA9yU2dGMKcOjajKcJKmlxbfVT3xzoCZJ3ZUErUes137WnUOCtFVQAJj
         oS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710204063; x=1710808863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GYr7Ozh9jUd466uTPcl0wktZ1vG72iOxjuFg3uK1nk=;
        b=cM3ytoBriiP2XpRfow8x2tyPoqvpChSYD2Gt3bk4KxynaM6bGWcxP0VLil4luo5po4
         QfTBJOuAmxjllwS+JwK298mAVFYXgdN8LYOKPjD9ufUaQ4Os+rOUoQWVyIEvOuBDuUXY
         eE88uYMIkezAkljdRBkc0Jg3f6b0Ag2gBxeymyKd6Z/u7ygop/BGp16FuskSeifhkcms
         +0GZouRjTigiQfD4XFv8XB/J1roBcVHhSV1RjLJ52xvBUuJIn7rKQn52v7urV4GWnIPB
         GAzNIitxrKqQM/TL40GGdabMlC7AEqe1VYgFRfb8liGnd8nUw89PatV2a1+AqmYDJcTq
         byqA==
X-Gm-Message-State: AOJu0Yx5aYUF2SiwezmJ8A+8Q7nyQQgTnXAz8DZLOcd4SAxdVjnwDZ9+
	7kPshYwhywfzaNGGeCl3tF3ZjZbhDw9AAQf32rbFuqR8amMWLUAiS1xVRQVNCzGNOjNsk6zqU6p
	hIGCsQvtol/r9mJqvuyrYt1PqZ6c=
X-Google-Smtp-Source: AGHT+IGw47+KOG4ez8tf9+EoYxuIfT7tV9J7fCuF7Wd/7WppsRUk9/OP2OjugmIa5Vg/fk89HAPcjIARbAcQyw2Cz74=
X-Received: by 2002:a81:490c:0:b0:60a:5a18:4190 with SMTP id
 w12-20020a81490c000000b0060a5a184190mr99486ywa.20.1710204062969; Mon, 11 Mar
 2024 17:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <17BA0B9342C35A1E.21429@lists.yoctoproject.org> <CADkTA4M9w2W+7Cio6x2DBsHf+i6TPtrodVB4p5it_oGbh0bO-w@mail.gmail.com>
In-Reply-To: <CADkTA4M9w2W+7Cio6x2DBsHf+i6TPtrodVB4p5it_oGbh0bO-w@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 11 Mar 2024 17:40:51 -0700
Message-ID: <CANx9H-B2RS3CP6xg+R3QFCYUO0a6NYTzAgjhaJuoWRjw8dq2jA@mail.gmail.com>
Subject: Re: [meta-virtualization] ceph upgrade
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000aab90f06136be9b7"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Mar 2024 00:41:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8625

--000000000000aab90f06136be9b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 2:11=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> Hi all,
>
> I'm still looking for help with this.
>
> It's all fine and well that folks have packages that they are
> interested in more than others, but it needs to be more than
> maintainers that step up and fix the niche packages.
>
> I'm still holding the meta-virt master-next -> master push until Ceph
> is upgraded and working.
>
> I know absolutely nothing about CMake, so I'm flailing around in the
> build of Ceph and have gotten no further since I last asked for help.
>

Well I did try, but I am no CMake expert nor ceph expert either. I got
stalled on it detecting =E2=80=9Cthrift=E2=80=9D in one of the vendored lib=
raries.

We can only take so much abuse from upstream ;)



> Bruce
>
> On Tue, Mar 5, 2024 at 9:22=E2=80=AFPM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > Hi all,
> >
> > If anyone has experience with Cmake, I could use a hand completing the
> > ceph upgrade that is marked as WIP in master-next.
> >
> > It took me a few hours today, but I managed to get past python3
> > detection issues, but now I'm running into a compiler test failure
> > during the build.
> >
> > To me, it looks like our sysroot isn't being passed, which could be
> > related to the toolchain.cmake not being used (since the compiler test
> > is being launched by a sub component).
> >
> > I'm inclined to be stubborn about this, and keep working on getting
> > the package bumped, as it has missed a few upgrades and is in need of
> > some love.
> >
> > Bruce
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
> View/Reply Online (#8624):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8624
> Mute This Topic: https://lists.yoctoproject.org/mt/104759213/924729
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000aab90f06136be9b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Mar 11, 2024 at 2:11=E2=80=AFPM Bruce Ashfield &lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;b=
order-left-color:rgb(204,204,204)">Hi all,<br>
<br>
I&#39;m still looking for help with this.<br>
<br>
It&#39;s all fine and well that folks have packages that they are<br>
interested in more than others, but it needs to be more than<br>
maintainers that step up and fix the niche packages.<br>
<br>
I&#39;m still holding the meta-virt master-next -&gt; master push until Cep=
h<br>
is upgraded and working.<br>
<br>
I know absolutely nothing about CMake, so I&#39;m flailing around in the<br=
>
build of Ceph and have gotten no further since I last asked for help.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Well I did try, =
but I am no CMake expert nor ceph expert either. I got stalled on it detect=
ing =E2=80=9Cthrift=E2=80=9D in one of the vendored libraries.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">We can only take so much abuse from =
upstream ;)</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)"><br>
Bruce<br>
<br>
On Tue, Mar 5, 2024 at 9:22=E2=80=AFPM Bruce Ashfield via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a><br>
&lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" ta=
rget=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt; If anyone has experience with Cmake, I could use a hand completing the=
<br>
&gt; ceph upgrade that is marked as WIP in master-next.<br>
&gt;<br>
&gt; It took me a few hours today, but I managed to get past python3<br>
&gt; detection issues, but now I&#39;m running into a compiler test failure=
<br>
&gt; during the build.<br>
&gt;<br>
&gt; To me, it looks like our sysroot isn&#39;t being passed, which could b=
e<br>
&gt; related to the toolchain.cmake not being used (since the compiler test=
<br>
&gt; is being launched by a sub component).<br>
&gt;<br>
&gt; I&#39;m inclined to be stubborn about this, and keep working on gettin=
g<br>
&gt; the package bumped, as it has missed a few upgrades and is in need of<=
br>
&gt; some love.<br>
&gt;<br>
&gt; Bruce<br>
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
View/Reply Online (#8624): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8624" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8624</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/104759213/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/104759213/924729</a><br>
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

--000000000000aab90f06136be9b7--

