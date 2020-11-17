Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.8489.1605622806195451371
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 06:20:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pxFDitil;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6884C38C04BB
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 14:20:05 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id ay21so22662737edb.2
        for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 06:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UvNGlDjBYboMB02LtiYgU64p1VfUZY3wLh3NKC8GnZ4=;
        b=pxFDitilO9I4htelhe4E1zIy7BgdBUQ34ZNbJdDOz6vSDQx0vvZwSXscMqtxzsgDOA
         3chYBTY/MGHgr+9KxqmCrvr7nYMmaELA8brhQED1HKc2SYA6RbFPylJmfYQAjoR4yiuW
         zlnMB6R/LTB2cpgHConCyWOdj1H8eK3XQfQlf3n9UOyl7BzPHf5oD8r8YEcUetbieu7+
         Uf98p0mG44nKnwbXR0kYrRahTi6BZl/JHtz6Zf89bCZ7zaQILngUcVPtSSSRuO6owd9y
         lSu+CewfHIPTXrc5/TnfeqrQ4OK2Qs52HEd3vzuRSQreg06b/9dWtN7ULb9/DyYCD8oV
         wRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UvNGlDjBYboMB02LtiYgU64p1VfUZY3wLh3NKC8GnZ4=;
        b=HX4zs4Ju6y5wEhHbydSr2YDZ1QH8mInA267LmHR9ThSCFR16Mp0RJwuqKnrbnVBfhN
         FItxfzYzPVjbCBzY8ekzwyjAYf8ZwV7TTTl6D2ac+D63oImPQMFoe30nrAChiN4iqRqx
         GfVOq3jzLnazrahE0NEQFf1hXryKAAXKFXXSUrU9Nk60roanjTiI0TJeN+cDsNdesIOq
         6y+EThjeRq6zP0QO9eMHqaXg1s/SGfrgfz73I2SxBPgsGlRI0TQs0xVsVcnJNUnthgNN
         NOooJM3MWDNpUy5PB458IIDS3vDBh49kolLssytp75qIUF0ZNR2JlJf2gJ02L9+JVdfm
         f+Mw==
X-Gm-Message-State: AOAM531odkvJEKwT0UZhAV4/KPKfvAPl6Xa2prJKPHvP5ae6dCJ2tboO
	q7g/RCkVleru67uLZJUkPKYtBOlaHp/ZSMaVYP0=
X-Google-Smtp-Source: ABdhPJxOijVx6Ww+c+vMMCaN/Yw/lHWGDH1n9aAP8l5tokGJE0d5tMYkXqj8eetFMiURo9cZByPenAILAnfCyzrwspY=
X-Received: by 2002:aa7:d407:: with SMTP id z7mr21545659edq.234.1605622803757;
 Tue, 17 Nov 2020 06:20:03 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <20201117123957.12607-1-joakimr@axis.com> <CADkTA4NWRcaOhgPO14H2qhgq_HP=dX4VUVT_uBXq5matGNGwag@mail.gmail.com>
 <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com> <CADkTA4POf_uUOEQ=P-Me-dFpJaK334nFvSJ_Uq-WW6God3DuOw@mail.gmail.com>
 <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com> <16485135E3A12798.28066@lists.yoctoproject.org>
In-Reply-To: <16485135E3A12798.28066@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 17 Nov 2020 09:19:52 -0500
Message-ID: <CADkTA4N6C6HdSMhX-+W4L9QcZWOGN+6WcrH0i9f8dO37NhFSVg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>, 
	meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000dc80b505b44e306b"

--000000000000dc80b505b44e306b
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2020 at 9:16 AM Bruce Ashfield via lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:

>
>
> On Tue, Nov 17, 2020 at 8:50 AM Joakim Roubert <joakim.roubert@axis.com>
> wrote:
>
>> On 2020-11-17 14:40, Bruce Ashfield wrote:
>> >
>> > The agent is unable to register with the master due to one of several
>> >  errors
>>
>> But if you have an agent, that would be 2 nodes, right? One master and
>> one worker node?
>>
> In kubernetes terms, perhaps. But physical boxes .. no. This needs to be
> testable under a single instance (qemu in my case). I can use docker /
> container tricks from within the instance if required (the guides are mixed
> on that), but it needs to be a single box as I have no way to easily
> coordinate deployment on multiple boxes for my CI testing.
>
>
I should also say that this is how I've been testing k8s (but that also
needs work again), so it has been up and running in the past.

Bruce



> Bruce
>
>
>
>>
>> > I'm rebuilding on a rebased master now, and will follow up with
>> > better logs when I relaunch my test.
>>
>> Excellent!
>>
>> BR,
>>
>> /Joakim
>>
>>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000dc80b505b44e306b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 9:16 AM Bruce Ashfield via =
<a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;br=
uce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.co=
m@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 8:50 AM Joakim Roubert &lt;=
<a href=3D"mailto:joakim.roubert@axis.com" target=3D"_blank">joakim.roubert=
@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On 2020-11-17 14:40, Bruce Ashfield wrote:<br>
&gt; <br>
&gt; The agent is unable to register with the master due to one of several=
<br>
&gt;=C2=A0 errors<br>
<br>
But if you have an agent, that would be 2 nodes, right? One master and<br>
one worker node?<br></blockquote><div><span class=3D"gmail_default" style=
=3D"font-size:small"></span></div><div><div style=3D"font-size:small">In k=
ubernetes terms, perhaps. But physical boxes .. no. This needs to be testab=
le under a single instance (qemu in my case). I can use docker / container =
tricks from within the instance if required (the guides are mixed on that),=
 but it needs to be a single box as I have no way to easily coordinate depl=
oyment on multiple boxes for my CI testing.</div><div style=3D"font-size:sm=
all"><br></div></div></div></div></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">I should also say that this i=
s how I&#39;ve been testing k8s (but that also needs work again), so it has=
 been up and running in the past.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><=
div style=3D"font-size:small"></div><div style=3D"font-size:small">Bruce</d=
iv><br></div><div><span class=3D"gmail_default" style=3D"font-size:small"><=
/span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
">- Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<b=
r><br></div></div>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000dc80b505b44e306b--
