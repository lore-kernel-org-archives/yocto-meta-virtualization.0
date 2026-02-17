Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7181DE81A32
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 13:32:06 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11846.1771335120095533891
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 05:32:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=me9JLRWw;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-824b32875e7so2161190b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Feb 2026 05:32:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771335119; cv=none;
        d=google.com; s=arc-20240605;
        b=KxGa/836Uluz4OHoa2HcKhU4ysYONyTks0ecu4RujNuZ324yzDIjGXGj2j1lF8O2WJ
         54Wdmeu1noC5nU6QfspmbP0ao2+AyVn3CwoBEswKYt+DmjXRt++7vyPAIOvQG1mvzCLg
         jLQqa9x2lIMHNc40iLSWyx6KzoYODQXYzARXsOlI5RI6Ty88CeawQwDATLqI70xzFVoh
         EwaRHBC9Mw4Wu5w1UFjsp/VZcESDy0wWAuXxpggBJkFaRtBhEeFFjmBLF9dd8EWi21Kr
         oNa6jpdXQhcG3HKVaQtPxHSOY5ZqC5OUJY+9K8/pp8XvysfmrJoQoJ6/Teb4Avip9wcN
         CVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x/doIAdUoaOchGU68owcljRff1EOSwc+bWu6NngdKEk=;
        fh=qmASqHX8b4fSE944WaLt5qVja6mGuXLXf+R15hqt114=;
        b=OJJjvyj8D3cOStahDYTvDwwo0g6bqnt2iPMTPDRa2nDpXcKDVu5Vw5igLRw3iPha5F
         pHdq2t2huSCTBZWeySrFJOVKMlhcCa40eyYQXeWMOiH9NT9rL0VDnAU6ATp/K4paJJmf
         Gcyf47eXKWFRxc8cwJbw/VX5JuGdZ/SsEiyvDT9UIw39WYnxh3Dpc6O2AqA8+Gf6tdvI
         Z7oSQ6DieHRXmfHOk8zjt5SA2wFlO+msgOjvQM4OWeMJDjyZ0sN+sYqgtiaOgFK3F3tJ
         X5DMJCxehuPWg8qVbT1CEp9pwjt1gmicyWm01a1eMkpnHP+aWqfwQwdjGvo2ylgisO8h
         lOEg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771335119; x=1771939919; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x/doIAdUoaOchGU68owcljRff1EOSwc+bWu6NngdKEk=;
        b=me9JLRWwaLmnWt+jyowFcQtoJJ/Fqh8aedLZ2wKrqaf2+zyNMilkju5JG/luwJpruY
         dM1lqt87gJr2fJCRhpJUA2IBrauFWD5/3IFI9AOCwJDAkWNcfIwxrawr+iiJRZwaqq59
         PEyBxjrmsEpVP1hHFRVwanuugd2ZID8fXxlh00QrOyQ5riUkxVhBLggj7IrczaQqxYML
         nFpw97YNceyIiwTE6Q6ZbTdxKYhWfyIANAtL0GhiF4D53xL2CKYAQNEhd5E+iQZ/8k6m
         BsxP0W6LpPZ+vSYhZyE1oLG7BqWYYFzVEhhDOvE1El4hNFz8gM57uuLVUt5VvQfyGZSU
         1BdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771335119; x=1771939919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/doIAdUoaOchGU68owcljRff1EOSwc+bWu6NngdKEk=;
        b=Jpvo5cT5A8NQ+eIGwjPlL6tljTlHVWTHAVS16WBNU2/uaLylRLB9pl6RG/QCrxiwyO
         dzrKjv1eh66DLieeFyA4Rmjja+Re9bQR/datDPvF8r474QktIxLVJjdIj1Kq4mPhbicM
         6HDUlleL6p4VYObA2hM6o9v76tRX1VmCJWQTXU2VSUmBFC/kFKABJwmFACvYrVmUKfF2
         /LkJASqDZAkGi8URYgK6cTNqxItuzgBs8BXw7lF8BBDvJlEfDFBnJLnM3sf5Jv6c+Hhs
         flp9HHivm1se86VOHEeE+XLFmoEp/LozTIHGp62KTc+945GwJQ99aZSGa3lY9OzTMwOB
         UcIA==
X-Gm-Message-State: AOJu0YzWLCKluHW4xGXelItrZxD8+/ZJk6KFt/FuttbjqeUnE1sTCA+w
	l5RyKAlinBgJbtsMMSgXJg+Y9IVEfwry6SxPoWf8XMMMp29PRSzIhlN8brKzR4x+1xhECAcO61h
	AMy7ochwoORjmuqPpfoYFO5Rf+VHqoUk=
X-Gm-Gg: AZuq6aKeOWyFy7zFqDwyGG0HNUUSqhJ3qNWuRbvwVkvb5gJCfQ7e+lo5xkvHPMaKDhv
	VZ1x09nvf7yOwiqgnqqbuyo0SzN0JpkfE3wKgt9eGr+j8HetDl/3/zyv6dQ0/xemvPXkcTl4JdD
	GzfLTg/Oy4xygKYYRnH9DxhBW2jDYAU/0dhg6Esl1bgJ2h8Ius8+drzEemR1LDxcmKlw0GC1SgU
	erUnkknFslIabm1v9Dnsp0YMXk20skTivQFNFI4iijm20IsSAOH2RkBcnqDlRqZIJGnekdYDaVT
	qntVlBGsR45n3WTSlg6xi3yMklgCZHgFBYC7s0RN
X-Received: by 2002:a17:90b:3d04:b0:354:bd08:4812 with SMTP id
 98e67ed59e1d1-356aada1674mr11087771a91.31.1771335119070; Tue, 17 Feb 2026
 05:31:59 -0800 (PST)
MIME-Version: 1.0
References: <20260216-upstream-update-docker-moby-v1-0-8ddcc5b7ff63@non.se.com>
 <CADkTA4PF6nXSAm7Fo3DT8vPgEEiUStXO9zidXgVhwfyM5Hbzmw@mail.gmail.com> <960627.1771320595010970409@lists.yoctoproject.org>
In-Reply-To: <960627.1771320595010970409@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 17 Feb 2026 08:31:47 -0500
X-Gm-Features: AaiRm52B3-f49_IaQdHzt8DJCOC3dPt7XUsIo6Sgw5DlotI33zzz29GcUefW394
Message-ID: <CADkTA4NDJxJWfnvDAaY2BxrCtmroX5C6Qof9K=LY3gRVLX6VRg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] Update docker-moby to v25.0.9
To: felix@piedallu.me
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000008ce8db064b05186c"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Feb 2026 13:32:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9597

--0000000000008ce8db064b05186c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 4:29=E2=80=AFAM felix via lists.yoctoproject.org <f=
elix=3D
piedallu.me@lists.yoctoproject.org> wrote:

> So I assume this is for scarthgap ?  That's not indicated in the subject
> line, so I want to be sure.
>
> Yes, it is for Scarthgap.
>
> Also note, if a newer go is backported to one of the mixin layers, I'm
> find to take newer 25.x releases of docker, we just need to select a
> default that builds with oe-core only.
>
> Yes, 25.0.9 is the last release that will build with oe-core. We would
> need to update oe-core before updating to newer 25.0.x releases or newer
> branches (e.g v29).
>

That's what I said :)

If a newer go is available in a mixin layer, I'd accept a newer docker
update in scarthgap. I just wouldn't replace the old recipe, it would be
offered along side of the older one, and we'd pin the default to the last
one that works with the go version in oe-core.

Bruce



> F=C3=A9lix
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9596):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9596
> Mute This Topic: https://lists.yoctoproject.org/mt/117842532/1050810
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

--0000000000008ce8db064b05186c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 17, 2026 at 4:29=
=E2=80=AFAM felix via <a href=3D"http://lists.yoctoproject.org">lists.yocto=
project.org</a> &lt;felix=3D<a href=3D"mailto:piedallu.me@lists.yoctoprojec=
t.org">piedallu.me@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div>
<div>
<blockquote>
<div>So I assume this is for scarthgap ?=C2=A0 That&#39;s not indicated in =
the subject line, so I want to be sure.</div>
</blockquote>
Yes, it is for Scarthgap.
<blockquote>
<div>Also note, if a newer go is backported to one of the mixin layers, I&#=
39;m find to take newer 25.x releases of docker, we just need to select a d=
efault that builds with oe-core only.</div>
</blockquote>
Yes, 25.0.9 is the last release that will build with oe-core. We would need=
 to update oe-core before updating to newer 25.0.x releases or newer branch=
es (e.g v29).</div></div></blockquote><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">That&#39;s what I said :)</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">If a newer go is available in a mixi=
n layer, I&#39;d accept a newer docker update in scarthgap. I just wouldn&#=
39;t replace the old recipe, it would be offered along side of the older on=
e, and we&#39;d pin the default to the last one that works with the go vers=
ion in oe-core.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div>
<div>F=C3=A9lix</div>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9596): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9596" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9596</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117842532/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117842532/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000008ce8db064b05186c--

