Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.8809.1605624090177655428
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 06:41:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sI+gtGXF;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 245B138C03CD
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 14:41:29 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id ay21so22738712edb.2
        for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 06:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U1r6LDa+4H/wIMglE/L87ZbP6uU2a0TVl/fvtLHTGc4=;
        b=sI+gtGXFyX8HJipBmjsypBJInGBJXyMyRV5qObDfbjbXMeIZ3KKNI4mS75ac8TGEbA
         BkMfIBqFjq6q9SrmGzDzkamJnP55AwrMtBURGh4NEPyfK5sGrwiWHjxRt+T8CtMEmGic
         a/XxRCg1G16zP1UKjaMXNxCdFsj6mARpO6v8HL3m+t6B2taBSy93TXzIGWxa/rhS1SFz
         FSdhFWBkUTw1f3k/M2Vgby2DnAPJv0/rX+cSw0+eN907bgiPKRnFr3p5N8AgrSnrReQw
         7vg2NcPuY06M4/OecFaZDlCMqHB3x1+zEeZe9c1GyO4RQz1uOvzsnafa72A5aDa/xmC1
         IhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U1r6LDa+4H/wIMglE/L87ZbP6uU2a0TVl/fvtLHTGc4=;
        b=FZikkfCAzils3gw6a20hrkwZITQ6rXy+437LvucjS82ouhr2H5/j7TkeqaXoG0Agyq
         zlQ3mXaSs1ZLuxYjgTScaekaRYZgQGwULMO5/DSl1EIBvAyy9L5Sz2NFHiSS9isgj+tW
         UbnM5cAubKzidh2Wb/BJNNCCtaz7xmLEujqC0k5eTZ7/DoY//eLqCEt/KRGZxwR5zxiB
         VHq27wo6aW+w3hTjcoQE2qK2wIh4so3pf7/wV8shm+74bz4IrrZzflOA3niKlyvI1kpi
         Evlgp2GzoYeLU+UdVy/Kqt3jigs3hr1RF1cmbKKT9Apme/4M6TKx1u/+spg80YdjQoBp
         Pr8w==
X-Gm-Message-State: AOAM533jp1GFF/gljUYhxjEIQeIDPmapIO/oGakm8PKgkBqNZG2xErnY
	Kx12pTFsCeKA2PpTZ7cZgKaqsawrFtmSawnQqx4=
X-Google-Smtp-Source: ABdhPJwkr55JpXEokl0DRSAw/RgFqstT3d/q7l/WE1D4Y81goZzaNYjClHn0vM7p9o3E7jA0pvQ6+oI3busfdQk3tgg=
X-Received: by 2002:a05:6402:17ad:: with SMTP id j13mr20250767edy.347.1605624087664;
 Tue, 17 Nov 2020 06:41:27 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <20201117123957.12607-1-joakimr@axis.com> <CADkTA4NWRcaOhgPO14H2qhgq_HP=dX4VUVT_uBXq5matGNGwag@mail.gmail.com>
 <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com> <CADkTA4POf_uUOEQ=P-Me-dFpJaK334nFvSJ_Uq-WW6God3DuOw@mail.gmail.com>
 <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com> <16485135E3A12798.28066@lists.yoctoproject.org>
 <CADkTA4N6C6HdSMhX-+W4L9QcZWOGN+6WcrH0i9f8dO37NhFSVg@mail.gmail.com> <6f43ed71-1a4c-f767-aa70-b83010851eb6@axis.com>
In-Reply-To: <6f43ed71-1a4c-f767-aa70-b83010851eb6@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 17 Nov 2020 09:41:16 -0500
Message-ID: <CADkTA4O9DLqwSrLFfwcebWoqP481b+aOR6MgpPD081hLC5=fJw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000635b9205b44e7d21"

--000000000000635b9205b44e7d21
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2020 at 9:27 AM Joakim Roubert <joakim.roubert@axis.com>
wrote:

> On 2020-11-17 15:19, Bruce Ashfield wrote:
> >
> >         But if you have an agent, that would be 2 nodes, right? One
> >         master and
> >         one worker node?
> >
> >     In kubernetes terms, perhaps. But physical boxes .. no. This needs
> >     to be testable under a single instance (qemu in my case).
>
> I see. Well, I have never tried that, but would in that case use one
> qemu instance for the master and a separate qemu instance for each
> worker node. (I should try to run both master and a worker on one
> machine and see what happens on my setup.)
>

I'm experimenting with two qemu sessions as well (I had to do this with
meta-openstack), but then host networking becomes an issue and if that's
also the box you are doing builds on (like I am), it can cause issues.

Either way, I'm fairly close now and hopefully will have this sorted out
soon.

My build is still running, but I'll post specific logs later today.

Bruce



>
> BR,
>
> /Joakim
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000635b9205b44e7d21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 9:27 AM Joakim Roubert &lt;=
<a href=3D"mailto:joakim.roubert@axis.com">joakim.roubert@axis.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2020-1=
1-17 15:19, Bruce Ashfield wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0But if you have an agent, that would=
 be 2 nodes, right? One<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0master and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0one worker node?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In kubernetes terms, perhaps. But physical boxes .=
. no. This needs<br>
&gt;=C2=A0 =C2=A0 =C2=A0to be testable under a single instance (qemu in my=
 case).<br>
<br>
I see. Well, I have never tried that, but would in that case use one <br>
qemu instance for the master and a separate qemu instance for each <br>
worker node. (I should try to run both master and a worker on one <br>
machine and see what happens on my setup.)<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m experim=
enting with two qemu sessions as well (I had to do this with meta-openstack=
), but then host networking becomes an issue and if that&#39;s also the box=
 you are doing builds on (like I am), it can cause issues.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Either way, I&#39;m fairly close now an=
d hopefully will have this sorted out soon.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">My build is still running, but I&#39;ll post specific=
 logs later today.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
BR,<br>
<br>
/Joakim<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000635b9205b44e7d21--
