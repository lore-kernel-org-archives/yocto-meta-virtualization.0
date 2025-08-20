Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32BBCA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 13:03:31 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.19129.1755695011380840160
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Aug 2025 06:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uh2eDrMJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e2eb4a171so7495613b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Aug 2025 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755695011; x=1756299811; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kbl0g7hIA9rJt+YkvMxXAEbkWztjO7s0Zs0fBYY8RiA=;
        b=Uh2eDrMJumzsory2SEXTIoq0GAoHpwO7X3lNOKIVERwmmKjkoac2+hjGslwZa3Li2i
         aevtuu4Mo+ElSadgRSzeqvn3Q6AoQ3H/6fAGBs4mrBF9jZLu3hnJr1IJZ/ha52CiYMWb
         gZy9aZpEgPFFJYt5oVbPrMVJXR+Rd5PFMEOrEC7+PRY02sbT4hTRLCUQAWUZ1G1UVUEF
         n60AEBL3mkCKX6WOTJoH/vwW+pCxPO96PPXLgC7RnjaEDTaBFF6kJK8SBB4XuT50ux9a
         /f9LEVgk8oG0YDHv21djUy3Da06s5Ii7ftY962oATxiaSyTfm5r7+nACQb51BdfX9BX7
         oG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695011; x=1756299811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbl0g7hIA9rJt+YkvMxXAEbkWztjO7s0Zs0fBYY8RiA=;
        b=HOqoEMq1cB9m9U5AIOrvN2vVCRW+876ASzmfXlRakFACPgMJOKDpROKTdk6jvu2dT0
         wXfv8dpJIMyqv5ZCbO+8oiaRE4UQi83VOZRQeC2lMcuhpR++TxPRPVHbHaYWdC2V/tEw
         OkMMvNPKx53PTKEkM6wP3OV4/4E+nxxQIII8rkkDvWFOEX/IhgGuYXIs0CMdPsHuKKZc
         1H4/CMh2QSOfdfeV4k/A5pmP1XcJWBSdAJvmLSnZAfqHE1RTx5hN3a8y+0Jg7AhHVOjD
         D91C1P+IzMs7c2D/sP/CnyU6QTkN5PllwjQHVfcgzh/+PvG0O3P83YMssRvuBEtzEoDo
         B00Q==
X-Gm-Message-State: AOJu0Yw6VRVhxZfZG++BuN9llqb+VWoXiDhtocUnHN4AN3DycKN1vI+s
	Lc4SzMXw18e/5SuMnvLYITvr9ONwsOC99UriFirSpJvywuvz1+s0vi4XmtgYlRz3D62Hy0Ex8y8
	Cm0wurZqRc4FejBRNpoXrlt6TvIrJ4gjMQPtY
X-Gm-Gg: ASbGncvSOGy6/0v9WUQBOKZU5kJnz9kh73QTGPPtxcnmh0I0zcF9ZdgeNGtPFyyUa9H
	SnlLA1xvazc8GVLCPxnqGUlD/5DOoWg/bWfYWXEd8lkwHBh3GMnahQrz59dtpRJbUpz3QiRFx+W
	u+kPdi1Kxh4VgYHQBXk4ST70AVSkx0V+Nf++9ReZgt6JNg7pOyLQiGTdiswjH1DzHOVoGupnwGL
	BVVyHo8DIFU6UsdHPg=
X-Google-Smtp-Source: AGHT+IFBB0g2HiZ3EYSZaVNhYrGPLf+KNapyDUoYmliJagLsDxZXhNJ924AMAB/9oIX076x2JF0PlJ9h0dAdcnAiwcE=
X-Received: by 2002:a05:6a20:258f:b0:240:413:bda6 with SMTP id
 adf61e73a8af0-2431b778e64mr3613325637.9.1755695010276; Wed, 20 Aug 2025
 06:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250326195009.757247-3-praveen.kumar@windriver.com> <30722.1755670081726781653@lists.yoctoproject.org>
In-Reply-To: <30722.1755670081726781653@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Aug 2025 09:03:18 -0400
X-Gm-Features: Ac12FXxR_Jidy8Zz1LCdXFJLycLgkBwTyMF7QtUB0WA7yYLdmrehXojN7yRpJ0c
Message-ID: <CADkTA4NeefN5rhgsSi1k9EZwVNuiGLt8UvGKjoCmQVgAXr1H4w@mail.gmail.com>
Subject: Re: [meta-virtualization] [scarthgap][PATCH 3/3] buildah: upgrade
 1.34.3 -> 1.35.5
To: hprajapati@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006beb14063ccb9994"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Aug 2025 13:03:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9353

--0000000000006beb14063ccb9994
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 2:08=E2=80=AFAM Hitendra Prajapati via
lists.yoctoproject.org <hprajapati=3Dmvista.com@lists.yoctoproject.org> wro=
te:

> Hi Team,
> Does there any issue with this patch for upgrading :  buildah: upgrade
> 1.34.3 -> 1.35.5 ??
>
> Why it is not merged into repo yet. It's been 5-6 month after the patch
> submitted .
>

Did you read my reply to the original email? I won't repeat it here.

Bruce



>
> Regards,
> Hitendra
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9350):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9350
> Mute This Topic: https://lists.yoctoproject.org/mt/111924201/1050810
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

--0000000000006beb14063ccb9994
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 20, 2025 at 2:08=
=E2=80=AFAM Hitendra Prajapati via <a href=3D"http://lists.yoctoproject.org=
">lists.yoctoproject.org</a> &lt;hprajapati=3D<a href=3D"mailto:mvista.com@=
lists.yoctoproject.org">mvista.com@lists.yoctoproject.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>Hi Team,</div=
>
<div>Does there any issue with this patch for upgrading : =C2=A0buildah: up=
grade 1.34.3 -&gt; 1.35.5 ??</div>
<div>=C2=A0</div>
<div>Why it is not merged into repo yet. It&#39;s been 5-6 month after the =
patch submitted .</div></blockquote><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">Did you read my reply to the original e=
mail? I won&#39;t repeat=C2=A0it here.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<div>=C2=A0</div>
<div>Regards,</div>
<div>Hitendra</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9350): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9350" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9350</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111924201/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111924201/1050810</a><br>
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

--0000000000006beb14063ccb9994--

