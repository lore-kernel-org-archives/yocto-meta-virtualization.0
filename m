Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.8060.1605620457827183509
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 05:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lAIFuJx4;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 8DC2E38C04BB
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 13:40:56 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id y4so16649687edy.5
        for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 05:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iRrV1L8I0BuYf77ezwsjs3/AuOn5ufpUy4HIh1hukMM=;
        b=lAIFuJx4KpbGAGtSYvt1pjkExQ/Nm0pGJN+CYPQ9YbY3CDiDvrOn1dfAh8eOb0cVzE
         I8Z+7JbmHK9h1Ts5OD1q5qCDUIq0OI1oDWP1dHgIEIzaAfwpveQVwxtrZUmESllRX1PB
         5vqhpzdu39fywP7uFs+IS6bqRnKmWyLX3qbB/Wnmbs8YwTg2914TyhH0IYqGXx8W99CO
         IlRAD2LIJQGEbyxfgh//gRo3tWC70LtSiK+Vio7wBzNrK78vGnyY4pns8AbWhW8bUFfF
         Q2bgSRkzLE4WxUMa6BJhBCmzuFDRcJhRk0NsUkVq/li/SDqdQKhNR2Vfym+jwDdYhHrU
         Q6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iRrV1L8I0BuYf77ezwsjs3/AuOn5ufpUy4HIh1hukMM=;
        b=D9QPvBjz+QkiSMt5xH52qgT4TcMVc8/zYZvzgw8NaCva3nRmia0+OXjuKssEK6tMo9
         pipVIyFtS7ZPllfWgrJoL7Q8hvGA7BGgspjl9rvT68L981fiOCHyDv6/DC6t3Fw3eZA+
         L3OOgfETXw05Bfo7dd++ZSuqzWkw4TZmq/x+EyW7Y2P3PdKupFLSSGRYaYhv/y+IIBi7
         KeoiJmuc3Jw/UDw5FS78gkwkrBrqO/ifi+gtnyQ73+y9lJzeNUhlhOubh7QXYmr8hpYt
         4CwUBD4ifR1thcZuIfnr9/6ZEUuijryg4OnDRaGk5hdFqz+iFi14tmTfJBnZeMCeB07y
         ZL4w==
X-Gm-Message-State: AOAM533GamC/+A8SVl8ymtMdWBuJSUzAoHxMHTloV3zguWVOAJPl/wvi
	VUUmQkM07KVDcVmgSEEcWuWQJ1Auyc0xBCz6SiU=
X-Google-Smtp-Source: ABdhPJxbLGIhDV6dHsY7gkw2QKY4mNQ75bixRjqNFLwHjDVs7/k3I4TG8bLLg3eIKGcnTaVQu5Hw0rB+gUfu1EWDrL0=
X-Received: by 2002:aa7:c612:: with SMTP id h18mr20280920edq.27.1605620453945;
 Tue, 17 Nov 2020 05:40:53 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <20201117123957.12607-1-joakimr@axis.com> <CADkTA4NWRcaOhgPO14H2qhgq_HP=dX4VUVT_uBXq5matGNGwag@mail.gmail.com>
 <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com>
In-Reply-To: <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 17 Nov 2020 08:40:42 -0500
Message-ID: <CADkTA4POf_uUOEQ=P-Me-dFpJaK334nFvSJ_Uq-WW6God3DuOw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000cd33af05b44da45e"

--000000000000cd33af05b44da45e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 8:32 AM Joakim Roubert <joakim.roubert@axis.com>
wrote:

> On 2020-11-17 14:27, Bruce Ashfield wrote:
> >
> > I already have this queued in my WIP branch.
>
> Ah, good.
>
> > But without being able to assemble a single node working "cluster", th=
is
> > is still stuck in my staging branch.
>
> I am not sure what this single node cluster is. Is it a k3s master
> running on a single machine, where you can deploy things? What are the
>

Yes. That's the typical description we've been using of single node
"cluster" (I put cluster in quotes, because technically .. it's not a
cluster :D



> current issues that you face there?
>

The issues that we were describing at length in the other longer (more
muddled thread). It was very easy to get lost in that thread, so I'll star=
t
something new here.

The agent is unable to register with the master due to one of several
errors, either certifications or some sort of authentication issue. I've
worked through the flannel and other config issues, so they are taken care
of at this point.

I'm rebuilding on a rebased master now, and will follow up with better log=
s
when I relaunch my test.

Bruce



>
> BR,
>
> /Joakim
> --
> Joakim Roubert
> Senior Engineer
>
> Axis Communications AB
> Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden
> Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
> Fax: +46 46 13 61 30, www.axis.com
>
>
>=20
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000cd33af05b44da45e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 8:32 AM Joakim Roubert &lt;=
<a href=3D"mailto:joakim.roubert@axis.com">joakim.roubert@axis.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2020-1=
1-17 14:27, Bruce Ashfield wrote:<br>
&gt; <br>
&gt; I already have this queued in my WIP branch.<br>
<br>
Ah, good.<br>
<br>
&gt; But without being able to assemble a single node working &quot;cluste=
r&quot;, this <br>
&gt; is still stuck in my staging branch.<br>
<br>
I am not sure what this single node cluster is. Is it a k3s master <br>
running on a single machine, where you can deploy things? What are the <br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Yes. That&#39;s the typical description we&#39;ve been using =
of single node &quot;cluster&quot; (I put cluster in quotes, because techni=
cally .. it&#39;s not a cluster :D</div><br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
current issues that you face there?<br></blockquote><div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small">The issues that we wer=
e describing at length in the other longer (more muddled thread). It was ve=
ry easy to get lost in that thread, so I&#39;ll start something new here.</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">The agent is unable to reg=
ister with the master due to one of several errors, either certifications o=
r some sort of authentication issue. I&#39;ve worked through the flannel an=
d other config issues, so they are taken=C2=A0care of at this point.</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">I&#39;m rebuilding on a rebas=
ed master now, and will follow up with better logs when I relaunch my test.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
BR,<br>
<br>
/Joakim<br>
-- <br>
Joakim Roubert<br>
Senior Engineer<br>
<br>
Axis Communications AB<br>
Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden<br>
Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48<br>
Fax: +46 46 13 61 30, <a href=3D"http://www.axis.com" rel=3D"noreferrer" t=
arget=3D"_blank">www.axis.com</a><br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000cd33af05b44da45e--
