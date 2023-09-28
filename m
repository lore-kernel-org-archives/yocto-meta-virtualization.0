Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C6FE732CC
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 12:52:06 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.12483.1695905517406814199
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Sep 2023 05:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f8L+lx8e;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-79fe612beabso164894739f.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Sep 2023 05:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695905516; x=1696510316; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kDjl+MAS7FdfJ9tz0qz+UYtL/2glSGhqNCD6aM7kdos=;
        b=f8L+lx8eiJ2H/v1nHw52CiwAxTjd7hakxcuvtvd/Hbn6d6Hem3PuO5jRxFqvtoHZ+R
         sN42poK703p17aARk7bAWXoqdxhV8GrCzkAf7twTcnT5MGp4JatRpxPDAzaIGhXHCw/N
         MOv2HKTa1IbtK8m3zC44rAuDp5FrR6eoGRTHnarypvXYBbhq4/YPjEFJQL1gW4+ZKBgo
         w6rTcDOMyvx506clsl//2l0GbViof3e1DlymeOfnl4LMGDwfLdx6E5zvYQZAVotwYNNq
         /QDSum3hcsOAESfONSUEUxkdjAz07JZdOGtueRtY8xSblABFV+XtjrYw7MVOnkPyARmc
         VcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695905516; x=1696510316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDjl+MAS7FdfJ9tz0qz+UYtL/2glSGhqNCD6aM7kdos=;
        b=FOoUEOKgT3nc7CChNgtBBKTgp+C+VR7M+4NC64oY3tjeqFI/9dTrn5ib0F+ez5949M
         oF6EVkaxpotAItNPCjyKu9NEHfYfPefjndR+tmTAubmPrmo3Pnw8aWZ1toi672lhgP/p
         Oqme6Mq/eWD/Z1EHa70MKxU7vA4Awcd2y6Wxzx+VXaPCc6BF34Q/drKt3mWQQvzaUkxz
         SPMSxuOooB7ZbZdjQmyUJva9tkaE/jmlOSZvW8hRJSZ8j7BviHrNduxntMyMOKcoke6i
         JxAY3OpACEuIXTEKvUKpz506ZdCSwXYTSzIDwIzM/dgezlHNpxvo0CBYrSU/rqHPDgIW
         jlcA==
X-Gm-Message-State: AOJu0YxDkY8bkX9gupYiu/aP7izAjs73bDlVCfFPKP/N33wVp2Ax1q69
	IkKMLvfxHI8tdPkzqj20ta7myMdowTobtgs+mmQ=
X-Google-Smtp-Source: AGHT+IHQCe0W3KbqjqovEehXgxULpuZ00iBP7QZtVapi5ULyZCwKaEUx9hl+qVyTXkrGdwy4CUmgDDSAM4PhbeMOzDU=
X-Received: by 2002:a5e:891a:0:b0:794:e11c:d8c3 with SMTP id
 k26-20020a5e891a000000b00794e11cd8c3mr1205150ioj.16.1695905516426; Thu, 28
 Sep 2023 05:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230925163116.1060-1-ali.oezaslan@linaro.org> <32130.1695900351881779361@lists.yoctoproject.org>
In-Reply-To: <32130.1695900351881779361@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Sep 2023 08:51:49 -0400
Message-ID: <CADkTA4OxoMcxMBX_QuDVqPjRFKRX9M0n5Vs_wmVs0yvYWEspxg@mail.gmail.com>
Subject: Re: [meta-virtualization] [mickledore][PATCH 1/2] moby: update to v24.0.2
To: Adam Johnston <adam.johnston@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e11cad06066ac5a0"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Sep 2023 12:52:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8328

--000000000000e11cad06066ac5a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's only been three days ... Which for a -stable release isn't a
particularly long time to get them into my testing queue.

My cycles are on finishing up final package updates for the current
release, and then another -stable set of merge.

But yes, since they cherry-picks, I've tagged them and they'll appear in
mickledore once I can sanity check things.

Bruce

On Thu, Sep 28, 2023 at 7:25=E2=80=AFAM Adam Johnston <adam.johnston@arm.co=
m> wrote:

> Any feedback on backporting these patches to mickledore?
>
> Thanks and Regards
>
> Adam
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8327):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8327
> Mute This Topic: https://lists.yoctoproject.org/mt/101577831/1050810
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

--000000000000e11cad06066ac5a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">It&=
#39;s only been three days ... Which for a -stable release isn&#39;t a part=
icularly long time to get them into my testing queue.</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">My cycles are on finishing up final package up=
dates for the current release, and then another -stable set of merge.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">But yes, since they cherry-pic=
ks, I&#39;ve tagged them and they&#39;ll appear in mickledore once I can sa=
nity check things.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Sep 28, 2023 at 7:25=E2=80=AFAM Adam Johnston &lt;<a href=3D"m=
ailto:adam.johnston@arm.com">adam.johnston@arm.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Any feedback on backporti=
ng these patches to mickledore?<br><br>Thanks and Regards<br><br>Adam
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8327): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8327" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8327</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101577831/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101577831/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div>

--000000000000e11cad06066ac5a0--

