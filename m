Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.31097.1605731946562340959
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 12:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZVLBMCQV;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 83C8138C04AD
	for <meta-virtualization@yoctoproject.org>; Wed, 18 Nov 2020 20:39:05 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id f23so4690010ejk.2
        for <meta-virtualization@yoctoproject.org>; Wed, 18 Nov 2020 12:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WeDXfLBemIx2+Y2kwAUtZaUxpSFEbZy9MWodLOFYoYE=;
        b=ZVLBMCQV/gBocdmNHzVmF30CchJEgI7wVh8tScet0cznXXmwRK75IVNbUlRwmaBkC1
         Y25Bxtv5N37D4n+7pJzKQIYWBXYZkrtYIX1T8LLim2pVq66B463u5zV3sdlnOM3aUx2Y
         I7hgeUajlZp5hHRPU2gCZRepBtSwy5qhBez3H78eNmhNQDiklp4U512FaQD2UidX5TAR
         u8/rBX56qC02KqVqAjvy3Gs1qZUfapIpPltpa6QEQs8NGj6d+u9L9+rr+MKaVVdpcqm8
         bdhdfTABZuG2nnR0zNAHjWJahUChvr3Nsc5rUh1w1zdUMXQewI7238PC27QDtXgG8Kl/
         h2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WeDXfLBemIx2+Y2kwAUtZaUxpSFEbZy9MWodLOFYoYE=;
        b=JLX6ceNvXf9fcBzXiCex9DWnVtYLSCq8paqyXVC0RGyYv0rUTez4tY7RPUvJ78j8BA
         RpMyMI2zDVGaBTt67kbN+xqDMw8dgUN4nlmOBTh8n5DXqcYIc3T4uAWmV+bvWrBAWx5M
         TwpTgBj8S/d4NVbqQNDFwTdpSV3r204a01vEYo6+zQXdcr3Z6zX+BnKeBYvLi+2AqnpL
         9Cu728bUhwcr2Nx0qJ6JJbWo8A68Vmwq80mxaSlACtPYJmRF7AgOsD9gl9x4iKHWISHm
         yaikHBYot7z39y6GVEn2NVHQrIn7Prn1PCrQR3Hw1y5ZBaK+GhHYo3dE8yK5NdBCfPId
         2CcQ==
X-Gm-Message-State: AOAM530f1ekRare5m+spo0AB5EA/qSv/GRV4fDlFYxvxb5KBEPX3aRov
	xWmQoiFGERLCQaqeGTKiMKtf9gTnXHYCKHbTl0s=
X-Google-Smtp-Source: ABdhPJwQ6E4sO5AE5/HT6v2YW+DxaHqtGHnxn7rl9ZQFmRrdtv28vNM/K/MaaL/Ey7f8lVe2zzGhVKKdcYZyoKiZ4ww=
X-Received: by 2002:a17:907:4335:: with SMTP id ni5mr21713797ejb.459.1605731943022;
 Wed, 18 Nov 2020 12:39:03 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <20201117123957.12607-1-joakimr@axis.com> <CADkTA4NWRcaOhgPO14H2qhgq_HP=dX4VUVT_uBXq5matGNGwag@mail.gmail.com>
 <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com> <CADkTA4POf_uUOEQ=P-Me-dFpJaK334nFvSJ_Uq-WW6God3DuOw@mail.gmail.com>
 <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com> <16485135E3A12798.28066@lists.yoctoproject.org>
 <CADkTA4N6C6HdSMhX-+W4L9QcZWOGN+6WcrH0i9f8dO37NhFSVg@mail.gmail.com>
 <6f43ed71-1a4c-f767-aa70-b83010851eb6@axis.com> <1648529A6FD37D30.5807@lists.yoctoproject.org>
 <CADkTA4PntU=xXDHzC6EissVgNf+hVq45qu58fuAr_x-b1Hdnsg@mail.gmail.com> <6eaac6fd-21cd-8d06-eeb5-c8a77516bdbe@axis.com>
In-Reply-To: <6eaac6fd-21cd-8d06-eeb5-c8a77516bdbe@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 18 Nov 2020 15:38:51 -0500
Message-ID: <CADkTA4PwG9_aUk07u=RttdwurGrbP1YPG1g+gE5H=q8r73ANhA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000001186f205b4679aa4"

--0000000000001186f205b4679aa4
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2020 at 1:27 PM Joakim Roubert <joakim.roubert@axis.com>
wrote:

> On 2020-11-17 20:39, Bruce Ashfield wrote:
>  >
> > root@qemux86-64:~# kubectl get pods -n kube-system
> > NAME READY STATUS RESTARTS AGE
> > local-path-provisioner-7ff9579c6-bd947 0/1 CrashLoopBackOff 822m
> > coredns-66c464876b-76bdl 0/1 CrashLoopBackOff 822m
> > helm-install-traefik-mvt5k 0/1 CrashLoopBackOff 822m
> > metrics-server-7b4f8b595-ck5kz 0/1 CrashLoopBackOff 822m
> > root@qemux86-64:~#
>
>  From my own experience with CrashLoopBackOff situations is that there
> may be serveral different things causing that. Can you trace down what
> is causing the CrashLoopBackOff here?
>

Not really. The build seems to have some sort of misconfiguration and no
logs are created (and hence can't be accessed via kubectl).

Running the server on the command line just gets us reams of messages and a
lot of false leads (too many nameservers, iptables --random-fully not
supported, etc ).

I've tried a few variants today, but can't get any really simple logs out.
I'll do more tomorrow.

I've been able to confirm that my packagegroup/image type runs docker,
containerd, and runc launched containers just fine, so this is just some
quirk/idiocy of k*s that is causing the problem.

Bruce


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

--0000000000001186f205b4679aa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 18, 2020 at 1:27 PM Joakim Roubert &lt;=
<a href=3D"mailto:joakim.roubert@axis.com">joakim.roubert@axis.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2020-1=
1-17 20:39, Bruce Ashfield wrote:<br>
=C2=A0&gt;<br>
&gt; root@qemux86-64:~# kubectl get pods -n kube-system<br>
&gt; NAME READY STATUS RESTARTS AGE<br>
&gt; local-path-provisioner-7ff9579c6-bd947 0/1 CrashLoopBackOff 822m<br>
&gt; coredns-66c464876b-76bdl 0/1 CrashLoopBackOff 822m<br>
&gt; helm-install-traefik-mvt5k 0/1 CrashLoopBackOff 822m<br>
&gt; metrics-server-7b4f8b595-ck5kz 0/1 CrashLoopBackOff 822m<br>
&gt; root@qemux86-64:~#<br>
<br>
=C2=A0From my own experience with CrashLoopBackOff situations is that ther=
e <br>
may be serveral different things causing that. Can you trace down what <br=
>
is causing the CrashLoopBackOff here?<br></blockquote><div><br></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">Not really. The buil=
d seems to have some sort of misconfiguration and no logs are created (and =
hence can&#39;t be accessed via kubectl).</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">Running the server on the command line just gets us reams =
of messages and a lot of false leads (too many nameservers, iptables --rand=
om-fully not supported, etc ).</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">I&#39;ve tried a few variants today, but can&#39;t get any really sim=
ple logs out. I&#39;ll do more tomorrow.</div></div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">I&#39;ve been able to confirm that my packagegroup/im=
age type runs docker, containerd, and runc launched containers just fine, s=
o this is just some quirk/idiocy of k*s that is causing the problem.</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
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

--0000000000001186f205b4679aa4--
