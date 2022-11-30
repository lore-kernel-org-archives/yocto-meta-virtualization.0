Return-Path: <anthony.t.davies@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923DCC46467
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 12:10:03 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.9264.1669810200738362215
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 04:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Idu46zIM;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: anthony.t.davies@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id v13so3705913oie.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 04:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GQutbx0mtnmYaDx+Yu2ZQzV8EIK5LRr+yANZr9cpd24=;
        b=Idu46zIMq4UnOikmOuqSlfCweOr6WtCTUcC10SnNjmwzuuw58uwruD2POk9LoaP6zI
         xiHqtuXvFqCfwdC3pW2z8Fg7MJPzXH49+JztOSRRxXzSGpW7yryEcb9exyNyUHVdvqBv
         nXB80gFE/VHky3c4RggAJH97WcmHROTqqBYYLHC7DSZG2at6hCS9XmgAHlcpoe418Ga3
         K+E8L7AlirjcHPTQ89bfmV2V48L3c1dUQ85DnhxFHMdAAuOvTWcVoGo1FbFOh6MB2ld6
         KyjeCiUITSCVnPVNwqLrU1q7qxn++KpzXpp2Rik7/Bugm8YavCNruhqhRNvh2ir/d1QU
         6+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQutbx0mtnmYaDx+Yu2ZQzV8EIK5LRr+yANZr9cpd24=;
        b=XuHYiSv4lklNc/CcdmhINdnwjsVT4ZQyhPYcNAQ4/qiFTUoW1zrpzBOlsSVQOEgNSm
         O3GUP4qSyy7VqicLIbtKzd7WSFjL4Ny06Ox9S9YiQrmed2T4RPusQvD3tXTkMTOPvofS
         5hztLmF03oiUYA/zbJj0Y/4vwl9nJcxKjUnYJI05S1T6JGBFxucuZBcE2MLzif6ljeT0
         AhCWqkH6v0r8xFnfGNrLBXJiNEEag5cH87+v62NmqMJj99APWcqJJJqr9M2+gMS8kar5
         rR7cohzLBvbwP64TjvW/lG4cHpDFAQeqhyEM6toor2clA7A6Oken6hkHFd0yV0YvmY3Z
         z2Tg==
X-Gm-Message-State: ANoB5pnAWdyDyCSilKQ9cS37IyvDM7MtPFYTh4htjtbxUwNReEBGOSfd
	t/4m+DV+6hckSKJTDJu/TdwkX1VvJsYNu343MtI=
X-Google-Smtp-Source: AA0mqf7kza4tMeK3EdVV3hWfAGz4XG3SC8MNaGywVPKMPt6ssi3X7GtuxAn0T82e0k6yYxEsptnp72wLPqF67wALFMU=
X-Received: by 2002:aca:120d:0:b0:359:f8a7:c88 with SMTP id
 13-20020aca120d000000b00359f8a70c88mr28068941ois.278.1669810199933; Wed, 30
 Nov 2022 04:09:59 -0800 (PST)
MIME-Version: 1.0
References: <CAL5F+oJ78-LCD44FjQrJzrjrVcN2m1bCqUv746HFVdMFuUvPgw@mail.gmail.com>
 <CADkTA4OBu7UNq_mHWf8WCzW0Sev8Y2b6yGag5maCJfqzy3b_iQ@mail.gmail.com> <172C3ECB7FB2C3DA.1705@lists.yoctoproject.org>
In-Reply-To: <172C3ECB7FB2C3DA.1705@lists.yoctoproject.org>
From: Anthony Davies <anthony.t.davies@gmail.com>
Date: Wed, 30 Nov 2022 23:09:48 +1100
Message-ID: <CAL5F+oK3990RMOQgaDZzU8fWen4mVFuz87BCSKOr3QAJAz=ogg@mail.gmail.com>
Subject: Re: [meta-virtualization] k3s (kirkstone) segfaults when run on hardware
To: anthony.t.davies@gmail.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000cf385a05eeaefb8d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 12:10:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7713

--000000000000cf385a05eeaefb8d
Content-Type: text/plain; charset="UTF-8"

I should also clarify I am building using musl.

On Wed, 30 Nov 2022 at 14:23, Anthony Davies via lists.yoctoproject.org
<anthony.t.davies=gmail.com@lists.yoctoproject.org> wrote:

> Hi Bruce,
>
> The board that is having problems is a Radxa Rock 3A
> https://wiki.radxa.com/Rock3/3a
>
> Regards,
>
> Tony
>
> On Wed, 30 Nov 2022, 14:21 Bruce Ashfield, <bruce.ashfield@gmail.com>
> wrote:
>
>> On Tue, Nov 29, 2022 at 7:28 PM Anthony Davies
>> <anthony.t.davies@gmail.com> wrote:
>> >
>> > Hi,
>> >
>> > I have created an image that includes k3s. When my hardware boots and I
>> attempt to execute k3s straight out segfaults, output from "k3s --debug"
>> and no logs are created.
>> >
>>
>> What are the details of your hardware ? k3s is running fine for me on
>> everything that I have available. So we'll need to try and figure out
>> some differences.
>>
>> Bruce
>>
>> > On #meta-virt it was suggested to try another go program on my image, I
>> installed "go-helloworld" which runs successfully.
>> >
>> > Regards,
>> >
>> > Tony Davies
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
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7709):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7709
> Mute This Topic: https://lists.yoctoproject.org/mt/95348603/7328908
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> anthony.t.davies@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000cf385a05eeaefb8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I should also clarify=C2=A0I am building using musl.</div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
, 30 Nov 2022 at 14:23, Anthony Davies via <a href=3D"http://lists.yoctopro=
ject.org">lists.yoctoproject.org</a> &lt;anthony.t.davies=3D<a href=3D"mail=
to:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"auto">Hi Bruce,<div dir=3D"auto"><br></div><div dir=3D"auto">The boar=
d that is having problems is a Radxa Rock 3A <a href=3D"https://wiki.radxa.=
com/Rock3/3a" target=3D"_blank">https://wiki.radxa.com/Rock3/3a</a></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Tony=C2=A0</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 30 Nov 2022, 14:21 Bru=
ce Ashfield, &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_bla=
nk">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Tue, Nov 29, 2022 at 7:28 PM Anthony Davies<=
br>
&lt;<a href=3D"mailto:anthony.t.davies@gmail.com" rel=3D"noreferrer" target=
=3D"_blank">anthony.t.davies@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I have created an image that includes k3s. When my hardware boots and =
I attempt to execute k3s straight out segfaults, output from &quot;k3s --de=
bug&quot; and no logs are created.<br>
&gt;<br>
<br>
What are the details of your hardware ? k3s is running fine for me on<br>
everything that I have available. So we&#39;ll need to try and figure out<b=
r>
some differences.<br>
<br>
Bruce<br>
<br>
&gt; On #meta-virt it was suggested to try another go program on my image, =
I installed &quot;go-helloworld&quot; which runs successfully.<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; Tony Davies<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7709): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7709" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7709</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/95348603/7328=
908" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/95348603/7328908</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:anthony.t.davies@gmail=
.com" target=3D"_blank">anthony.t.davies@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cf385a05eeaefb8d--

