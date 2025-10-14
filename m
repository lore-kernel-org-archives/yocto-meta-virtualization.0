Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BDFCCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:35:49 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.6534.1760474142905721278
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Oct 2025 13:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lSHnommO;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3306d3ab2e4so5895674a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Oct 2025 13:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760474142; x=1761078942; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4P5MKa43WjFJERDfSIfS2fpRuFmZMs2LesqeKTYmpss=;
        b=lSHnommOgGgfdG83eDRz2H6jHpfWCOL6iGnYZiCMIU/o+oOUzcKaGJVqN/ktH6fSRu
         Fc2X2tQC95xpUs8tXCF1sFAgZydXw1QOzJ4ANJVy2kLEaYsD2QpZy8O6cWTGckEjlTBz
         I1gBAPDRoa82RCApUVAYsvWLH/qUvtzngPFborFILFw4hkPZKM0qC1lkt5zn/s8m2trH
         xHySk/LHIkQzDiVzV01dCSxaRhdVxyWebaDDomq87qHUaC9pfIfUOvmcBVqnuGD76bOv
         9ibw/VK2FLMx+WSI0L5u34S5dW2+FelNtX0rnoj3dCQJlmoCmy77/EpRXgwm4KVSEKDM
         jmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760474142; x=1761078942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4P5MKa43WjFJERDfSIfS2fpRuFmZMs2LesqeKTYmpss=;
        b=qwZJnHBNr+/6BnQkQSEQFSZVLhsKHtHsTEQR5qlHvJ7ZaAFWsi158ifbeYPiYcgBHc
         9UAORx+ReHBD4FON27JTXbDyS6/LHUYorTO/cTgzkGCCpFhYjpS7QVbnGIWeJzvyf5kp
         HqBtbjSZ8uULyb3deX4DunmeaP45LWQXqDVLNnod60i9p+vc7KdnJ1r3mPfu2+swbnCL
         oM0QEebM0L4Q1ydn1XlHODPkdFW+aZt4i3l4BikpH85eK95MNMz5cF6QIXqOljkJgFDh
         8OoqPA4xgaLUx+JScNK2rpJIgIGyptNwb6jp4OIwW1M76OcRuBLRvQBcMuxvyuOnN7Hb
         wCvw==
X-Gm-Message-State: AOJu0YyBxkk+Yz8lp+aE8atKfK9zVhgeJWSvPdX8T4x6yehNQ8c1I3cf
	cZZfW5466SR15j/1FhRl7qtY5aZiGrd/jWhlfxq0ofa8pK2LAYMzte095rV1YYAxAdd5OcTVY0G
	HXfMsaIq6LLBS/BErkbPn70H061MmmdA=
X-Gm-Gg: ASbGncu80ObsLuU5QePPV9b/pcp/s3Wybs+LMMPEJqMZLrC+zK50zir92B9ZDuEgkJS
	nRBlwo1l6K0xJhEx1BjPLdcgA2xuoX7CSUXh2mrkPJWpbOLhKDtT43ei7QbU6A3npjNaIEZm+AD
	edYzR7hj+GsEd2OqkFDi9Rmjbo+EDGlNLaelgkHkpdBQmrSqvmClGx9rM+1ryIdRsyqfI5slzEV
	tET2R8lQXesFVQnz+S6reqbnnY=
X-Google-Smtp-Source: AGHT+IHXMhbR8Y/MRtWfVrBU3/k8DAcKmvldpZlvnrxbN9/v0oiZvd2mSwYJXxS0esV+Mv79bPaD3rmlE0NwDmeBEn8=
X-Received: by 2002:a17:90b:4f4e:b0:32b:6ac0:8633 with SMTP id
 98e67ed59e1d1-33b51149788mr37696339a91.16.1760474141424; Tue, 14 Oct 2025
 13:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250924175611.3927714-1-sudumbha@cisco.com> <20251014180911.807508-1-sudumbha@cisco.com>
In-Reply-To: <20251014180911.807508-1-sudumbha@cisco.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Oct 2025 16:35:28 -0400
X-Gm-Features: AS18NWCsHax7-o-c4M-k15Yoqpjxoc1egTsNYQAUZnRtKGINC7pn5x_81p62TJM
Message-ID: <CADkTA4MpnaGBGaPpq4CDHpir4DYFX5QzAMd5EEyeJY=+kfnK5Q@mail.gmail.com>
Subject: Re: [meta-virtualization] [scarthgap] [PATCH v4] docker-moby 25.0.3:
 fix CVE-2024-36623
To: sudumbha@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d60795064124534c"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Oct 2025 20:35:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9419

--000000000000d60795064124534c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All of your patches come through corrupted.

Cheers,

Bruce

On Tue, Oct 14, 2025 at 2:09=E2=80=AFPM Sudhir Dumbhare -X (sudumbha - E IN=
FOCHIPS
PRIVATE LIMITED at Cisco) via lists.yoctoproject.org <sudumbha=3D
cisco.com@lists.yoctoproject.org> wrote:

> ping
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9418):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9418
> Mute This Topic: https://lists.yoctoproject.org/mt/115416924/1050810
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

--000000000000d60795064124534c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">All=
 of your patches come through corrupted.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Cheers,</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">B=
ruce</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 14, 2025 at 2:09=E2=80=AFPM Sud=
hir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco) via <a hr=
ef=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;sudumbh=
a=3D<a href=3D"mailto:cisco.com@lists.yoctoproject.org">cisco.com@lists.yoc=
toproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">ping<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9418): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9418" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9418</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/115416924/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/115416924/1050810</a><br>
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
rek II<br><br></div>

--000000000000d60795064124534c--

