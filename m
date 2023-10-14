Return-Path: <przemekchwiala@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD66CDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 15:37:19 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.66562.1697297837211210116
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 14 Oct 2023 08:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MuVMn3kx;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: przemekchwiala@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c501bd6ff1so27994641fa.3
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Oct 2023 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697297835; x=1697902635; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bnnkNPdH+LysyjbZlAC3J01p9fIHKGweb6vjrXHTCKU=;
        b=MuVMn3kxskM4qY/wDXVzF9LunMzzYgId0mFFOva5mDjDVHcQH8i+lkmAmi5UcZbm/t
         uwnCSvCBDA9G73YttD7snmF3tb/YXKAW2orO7SUPAmKTjc7CQGsn1O5MOmUH5vUYQE0K
         n2ttZBRxHci/LS+bOCz8B1KkFWohi3LqzNu7iIAZplITNIo8S5l9zCxgbREl1cMmv5++
         oH70LoPwnQ76ibnAKnG8ZFSgtTZFWs2oGg9C7kxcBJTl8ExIXJly2juS4bWVi+cDbM3T
         21HIhh1V09JKsMacuY8bT/qx/Qrpeo8yTynhz/UgWvtHL5i4qR6F2kdN5XlZM5WDneUD
         /zGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697297835; x=1697902635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnnkNPdH+LysyjbZlAC3J01p9fIHKGweb6vjrXHTCKU=;
        b=bzO6jvAwlhOg2kqD6Zm63On/b1/tww2elsTqdDF7yooloNkOG8ZHz4sS8gRKTr4DrH
         STrq1ApcNUlUJUlESBvLy3L/mZyH2uKDHdnJZJkaLr4nVP3aKvqzggVqGzr1iaHkYJ3k
         yVABPWnAROMbMsAAutfP/6W6udgHi09eLbOoOzTuEDLapor3d9dwGyTeBRhed0hp4X3D
         ZjD0J3VqEeICeeXsHtAqRZk++ithcT8PbohMJqKaB7ZOq+cLPGClKCpnCFLyzjxeoYT2
         KNFYr8evn8MC/uD3uTZpeRe2DH5MeOZWWcPp6fwS60wuq85Ghcqm6f9c0wmclE1p/qsQ
         MxDg==
X-Gm-Message-State: AOJu0YyOHIa8bRimbyyidCnpeCJj321HH60ehT5czjZm/GTQQlPBHYMi
	Na3A6//X4TpeNJIFZgr/leHrYCY/nNqCfHyvIYI=
X-Google-Smtp-Source: AGHT+IE1fqsdXdlrDTGurDxUaFOG3iDZXDq1QlkNTxJqJagsvNcAmwYpE5WmHy5F0vhG4NvI5CBmdTt/XAFkC6Hg1nU=
X-Received: by 2002:a2e:b8ca:0:b0:2c5:911:db70 with SMTP id
 s10-20020a2eb8ca000000b002c50911db70mr3914237ljp.14.1697297834828; Sat, 14
 Oct 2023 08:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <1D32D17E-126F-413C-9F22-2E5CCF20E61F@gmail.com>
 <AS1PR10MB5697BD98F27E7C45E4D4C4E8FDC9A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CADkTA4P=iuTAbZyk=g=Z_oCZOS8i1GXKNDrPgU1U7CmrMZoW6g@mail.gmail.com>
In-Reply-To: <CADkTA4P=iuTAbZyk=g=Z_oCZOS8i1GXKNDrPgU1U7CmrMZoW6g@mail.gmail.com>
From: =?UTF-8?B?UHJ6ZW15c8WCYXcgQ2h3aWHFgmE=?= <przemekchwiala@gmail.com>
Date: Sat, 14 Oct 2023 17:37:03 +0200
Message-ID: <CAJYsxP0xnC7Bp3ejPXQWxyZ6UtifqvqMa8knrnFANzWhNQ+nAQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Docker-compose Go update on kirkstone
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: peter.marko@siemens.com, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000085e5360607aef23d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Oct 2023 15:37:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8367

--00000000000085e5360607aef23d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I apologize for the long response time. I tested what you suggested and
indeed, everything works as it should. I added a meta-lts-mixins layer and
used the docker-compose recipe from the meta-virtualization master branch.
Everything built up, without the slightest problem. Thank you very much for
your help.

Przemek

sob., 7 pa=C5=BA 2023 o 02:53 Bruce Ashfield <bruce.ashfield@gmail.com>
napisa=C5=82(a):

> Peter is correct, the issue with the build is very likely due to the
> golang version, and we've had good success in supporting m-virt master on
> old releases using the newer golang.
>
> As for getting the package officially in the older branch, that's a
> different question. It technically is a new package, so it isn't a major
> version jump in the same sense as if we backported the same recipe/packag=
e
> from master to the old branch. That being said, adding a new feature to a
> released branch is also not something we typically do.
>
> Bruce
>
> On Fri, Oct 6, 2023 at 2:21=E2=80=AFPM Peter Marko via lists.yoctoproject=
.org
> <peter.marko=3Dsiemens.com@lists.yoctoproject.org> wrote:
>
>> You will probably need new golang version.
>>
>> Mixin layer kirkstone/go is working pretty well with meta-virtualization
>> master.
>>
>> https://git.yoctoproject.org/meta-lts-mixins/tree/?h=3Dkirkstone/go
>>
>>
>>
>> Peter
>>
>>
>>
>> *From:* meta-virtualization@lists.yoctoproject.org <
>> meta-virtualization@lists.yoctoproject.org> *On Behalf Of *Przemyslaw
>> Chwiala via lists.yoctoproject.org
>> *Sent:* Friday, October 6, 2023 17:23
>> *To:* meta-virtualization@lists.yoctoproject.org
>> *Subject:* [meta-virtualization] Docker-compose Go update on kirkstone
>>
>>
>>
>> > Hello,
>> >
>> > I'm working on the kirkstone branch, where we still have
>> python3-docker-compose_1.29.2.bb. I am wondering if there is any chance
>> to upgrade to the Go version of docker-compose from the main branch? I
>> tried to build the recipe from the main branch, but got some errors. Bef=
ore
>> I dig into fixing them, I'd like to ask if you see any additional issues
>> that might block building docker-compose_git.bb from the main branch on
>> kirkstone?
>> >
>> > Thank you
>> > Przemek
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8338):
>> https://lists.yoctoproject.org/g/meta-virtualization/message/8338
>> Mute This Topic: https://lists.yoctoproject.org/mt/101799787/1050810
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

--00000000000085e5360607aef23d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I apologize for the long response time. I teste=
d what you suggested and indeed, everything works as it should. I added a m=
eta-lts-mixins layer and used the docker-compose recipe from the meta-virtu=
alization master branch. Everything built up, without the slightest problem=
. Thank you very much for your help.<br><br>Przemek<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">sob., 7 pa=C5=BA 202=
3 o 02:53=C2=A0Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m">bruce.ashfield@gmail.com</a>&gt; napisa=C5=82(a):<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 class=3D"gmail_default" style=3D"font-size:small">Peter is correct, the is=
sue with the build is very likely due to the golang version, and we&#39;ve =
had good success=C2=A0in supporting m-virt master on old releases using the=
 newer golang.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">As for get=
ting the package officially=C2=A0in the older branch, that&#39;s a differen=
t question. It technically is a new package, so it isn&#39;t a major versio=
n jump in the same sense as if we backported the same recipe/package from m=
aster to the old branch. That being said, adding a new feature to a release=
d branch is also not something we typically do.</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 6, 2023 at 2:21=E2=80=AFPM Pe=
ter Marko via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">l=
ists.yoctoproject.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@l=
ists.yoctoproject.org" target=3D"_blank">siemens.com@lists.yoctoproject.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div>





<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal">You will probably need new golang version.<u></u><u>=
</u></p>
<p class=3D"MsoNormal">Mixin layer kirkstone/go is working pretty well with=
 meta-virtualization master.<u></u><u></u></p>
<p class=3D"MsoNormal"><a href=3D"https://git.yoctoproject.org/meta-lts-mix=
ins/tree/?h=3Dkirkstone/go" target=3D"_blank">https://git.yoctoproject.org/=
meta-lts-mixins/tree/?h=3Dkirkstone/go</a><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Peter<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> <a href=3D"mailto:meta-virtualization@l=
ists.yoctoproject.org" target=3D"_blank">meta-virtualization@lists.yoctopro=
ject.org</a> &lt;<a href=3D"mailto:meta-virtualization@lists.yoctoproject.o=
rg" target=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>&gt;
<b>On Behalf Of </b>Przemyslaw Chwiala via <a href=3D"http://lists.yoctopro=
ject.org" target=3D"_blank">lists.yoctoproject.org</a><br>
<b>Sent:</b> Friday, October 6, 2023 17:23<br>
<b>To:</b> <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
<b>Subject:</b> [meta-virtualization] Docker-compose Go update on kirkstone=
<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">&gt; Hello,<br>
&gt;<br>
&gt; I&#39;m working on the kirkstone branch, where we still have <a href=
=3D"http://python3-docker-compose_1.29.2.bb" target=3D"_blank">python3-dock=
er-compose_1.29.2.bb</a>. I am wondering if there is any chance to upgrade =
to the Go version of docker-compose from the main branch? I tried to build =
the recipe from the main branch, but got
 some errors. Before I dig into fixing them, I&#39;d like to ask if you see=
 any additional issues that might block building <a href=3D"http://docker-c=
ompose_git.bb" target=3D"_blank">docker-compose_git.bb</a> from the main br=
anch on kirkstone?<br>
&gt;<br>
&gt; Thank you<br>
&gt; Przemek<u></u><u></u></p>
</div>
</div>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8338): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8338" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8338</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101799787/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101799787/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re">- Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II=
<br><br></div></div>
</blockquote></div>

--00000000000085e5360607aef23d--

