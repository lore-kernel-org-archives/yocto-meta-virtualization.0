Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.8237.1605622558804010693
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 06:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KoTarcQL;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 93A7738C04BB
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 14:15:58 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a16so1865062ejj.5
        for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 06:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=02gIjE2oNH9h49frZzXZwPBbU/GM2/NGknP0ergiuAg=;
        b=KoTarcQLdIgSHxGE6dUSkCh0Wswu3TAjE8d3Q5A1c4tB/A/MLh5DOxnMI/tbSOzDnE
         xTFZF3xIznsSAsU2PgjqEv2bUsXcAcrXiaERS7LXofqqZnTOjH4DTmJNKQw3jA4hft6i
         B80z1M3K4tuyVL+KJKODgdqii70Juupol9nxiLZ23njFU5C/Pgw1FfF4jaLWcJ/x8JY1
         0+n0WaQvg+JfsTr2W2EDfV2f7JSS4kJJnlxOo1h9javryU0d6gPPyaL6/4oojhrb69UW
         U0fNzT/nBQT83r7droVYEamTkeny5XSxk/bjOT4m+BTPy48Lqcg0G5PMihXGOX5Oo2Yr
         kxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=02gIjE2oNH9h49frZzXZwPBbU/GM2/NGknP0ergiuAg=;
        b=EbqtnhrL4pOaDCe7d1I+OzH5nTmSyy3xQ0GHq7jEULomCJGxrqkrN36A70xo1yOvE7
         xlkci7qQkKjAcBgnsDbiAYXk7Z5KYXxo77x/Ttljzn70aTk+jFZlpgJejj9hZdcYWECr
         o0nH3qPR6ju84kdsgB33u49TVrMwDjMKs/xMHsCy/g7ZXmvVwQ2mVsg5IMegQgd0d3U2
         QxipGUE0pY3BO+5snZDnHfxDOKocrqBlXtDFMei/dfohniyIgWaOa0V3T05tSsSuPv+Z
         CugDxFD8o5NAahNNROfnKZtu/N83A5lN2votLFzG5t9hece+dyeq4Rjzh+xUTHf689uw
         wjAA==
X-Gm-Message-State: AOAM530PZ2vHtfft/KBaVYryA8dNnAnoEc/0LdIAJbtrMBJdqSO9DAFF
	LremmXQnql8v+T7DMODtTy/26dwBkNfq99UQYac=
X-Google-Smtp-Source: ABdhPJweG/6C6r7pn6QT75SxFPZhD2Mqey0zhp7W1DMgTyJDdaW9ogLXkZXnDUM3rFS081IsKcgIck/L0FeMfpACnUY=
X-Received: by 2002:a17:906:c18c:: with SMTP id g12mr19182149ejz.334.1605622556853;
 Tue, 17 Nov 2020 06:15:56 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <20201117123957.12607-1-joakimr@axis.com> <CADkTA4NWRcaOhgPO14H2qhgq_HP=dX4VUVT_uBXq5matGNGwag@mail.gmail.com>
 <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com> <CADkTA4POf_uUOEQ=P-Me-dFpJaK334nFvSJ_Uq-WW6God3DuOw@mail.gmail.com>
 <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com>
In-Reply-To: <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 17 Nov 2020 09:15:45 -0500
Message-ID: <CADkTA4M8RejWm52-14iRH2OY_AqGx=baTNfr61Ev_Cmxzz=VyQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000250aaa05b44e2279"

--000000000000250aaa05b44e2279
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2020 at 8:50 AM Joakim Roubert <joakim.roubert@axis.com>
wrote:

> On 2020-11-17 14:40, Bruce Ashfield wrote:
> >
> > The agent is unable to register with the master due to one of several
> >  errors
>
> But if you have an agent, that would be 2 nodes, right? One master and
> one worker node?
>
In kubernetes terms, perhaps. But physical boxes .. no. This needs to be
testable under a single instance (qemu in my case). I can use docker /
container tricks from within the instance if required (the guides are mixed
on that), but it needs to be a single box as I have no way to easily
coordinate deployment on multiple boxes for my CI testing.

Bruce



>
> > I'm rebuilding on a rebased master now, and will follow up with
> > better logs when I relaunch my test.
>
> Excellent!
>
> BR,
>
> /Joakim
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000250aaa05b44e2279
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 8:50 AM Joakim Roubert &lt;=
<a href=3D"mailto:joakim.roubert@axis.com">joakim.roubert@axis.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2020-1=
1-17 14:40, Bruce Ashfield wrote:<br>
&gt; <br>
&gt; The agent is unable to register with the master due to one of several=
<br>
&gt;=C2=A0 errors<br>
<br>
But if you have an agent, that would be 2 nodes, right? One master and<br>
one worker node?<br></blockquote><div><span class=3D"gmail_default" style=
=3D"font-size:small"></span></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">In kubernetes terms, perhaps. But physical boxes .. n=
o. This needs to be testable under a single instance (qemu in my case). I c=
an use docker / container tricks from within the instance if required (the =
guides are mixed on that), but it needs to be a single box as I have no way=
 to easily coordinate deployment on multiple boxes for my CI testing.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=
=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div><sp=
an class=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I&#39;m rebuilding on a rebased master now, and will follow up with<b=
r>
&gt; better logs when I relaunch my test.<br>
<br>
Excellent!<br>
<br>
BR,<br>
<br>
/Joakim<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000250aaa05b44e2279--
