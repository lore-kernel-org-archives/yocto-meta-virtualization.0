Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.2574.1635449544261067284
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Oct 2021 12:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eYG3F4H2;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id w1so10322048edd.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Oct 2021 12:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b4tm2TQxUF9mPXsMEtaJThbDtMdA3dMRYFAawLCb92Y=;
        b=eYG3F4H2vkLRZbipqbeKa0/qlXd1jVBQlNxu7HKtu4lM1ESul9XBJKQcfxrBtpE6+2
         C5v5cEHKUX/TJFAuWfCLIrTNJm3wk4LIfjO0VxyOWK3v+DUouXBMww6yUMr+9+NVzAPh
         +lv250r4XuEw99MVbmZq6dU8dytDMeK8GjoNTAuNYJg9cZAMXqaCziiZUfJAU5zceWfI
         43SHPP//MyZwWfvfv+uPfwf2BjJKowCAYiA2A1I/FeH8e3PpoT9sA26lm4NjsJ76TE9j
         8wmTEmtcdxNpTc8mtSa8NGrzoyNcrIYlXYkIwcgJpk4SCCFI/XzBDjV2zHCRMVoa9wyY
         CSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b4tm2TQxUF9mPXsMEtaJThbDtMdA3dMRYFAawLCb92Y=;
        b=p9SPs8kvHc7utgFnZTywFJDzm9nhiY65cIgCfh7QUSDsTTWxQ3V7IQhWw0cuYzwFRZ
         JzXtpWOorZxKD/6UgCjr6lcRVO/piuwh3TQQjM9lbB7+X+LaWeDd6MFl/RKdDR7x3M8J
         MhtNq09q00Jau935H0OBT75b8K97H+oLA/K5P7c4zwp3xee9iXGoNaVAL4xcoBSpWO2z
         Lrx97Z7zDusoVFcQOqjxzrnuHk/xNW7SIqjaZDqs5LTlYuxSpbj2wsu6e+AT0dzZBOz0
         3C9OOC7kDhdUueTxrGl6tL1Z27UXOl3SNbvMVoAEqpbI6opG4FIfBzGkkJolDH2x95R1
         /aaw==
X-Gm-Message-State: AOAM532kIMZRBdjDN6ET9ujHrOd8plDBbeNRS3+Kf0iLhsrUUQ0GWUxI
	4b9RUi5Pcw523RbK367Nb6fj1aPLCrjqXg0IF+I=
X-Google-Smtp-Source: ABdhPJx8AZ3v7kDNaoSQpXJ5A+bekJhmyHPxJ1VMc6Qinx5uby1XjGOCTYqMGo5TG95L5CHM8AYqGEXquFIh0TukjTw=
X-Received: by 2002:a17:906:8298:: with SMTP id h24mr8166184ejx.211.1635449542424;
 Thu, 28 Oct 2021 12:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4Ppi=7SLtd4hbDPZT1WARmaxs_7dwKMqa33wPuxz9aGLA@mail.gmail.com>
 <29697.1634888278709637812@lists.yoctoproject.org> <AM6PR08MB346139074D6A33370A78A2DB92869@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <16B232F25D90C384.11077@lists.yoctoproject.org>
In-Reply-To: <16B232F25D90C384.11077@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 28 Oct 2021 15:32:11 -0400
Message-ID: <CADkTA4PGDpxzYR+czzoHCKH23tEA2OFty8QaMPoA5GTsR5PEwQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] k3s: Update k3s service configuration
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	=?UTF-8?Q?Kamil_Dzie=C5=BCyk?= <Kamil.Dziezyk@arm.com>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000063b5605cf6ec5ec"

--000000000000063b5605cf6ec5ec
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 8:53 AM Bruce Ashfield via lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:

> On Thu, Oct 28, 2021 at 4:36 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
> >
> >
> > Hi Bruce,
> >
> > Any expectations to have this patch chain backported to honister?
> >
>
> I've tagged them for backport, I was just busy trying to figure out
> why python 3.10 is breaking master.
>
> I expect to get to them shortly.
>
>
... and they are now on honister as well.

Bruce



> Bruce
>
>
> > If it helps, we can send the patches targeting honister to the mailing
> list.
> >
> > Regards,
> > Diego Sueiro
> >
> > ________________________________
> > From: meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org> on behalf of Kamil Dziezyk
> via lists.yoctoproject.org <kamil.dziezyk=arm.com@lists.yoctoproject.org>
> > Sent: 22 October 2021 08:37
> > To: meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org>
> > Subject: Re: [meta-virtualization] [PATCH 1/2] k3s: Update k3s service
> configuration
> >
> >
> > Hello Bruce,
> >
> > Can you backport these two k3s patches to honister branch?
> >
> > Thanks,
> >
> > Kamil
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000063b5605cf6ec5ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 8:53 AM Bruce Ashfield via =
<a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;br=
uce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.co=
m@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Thu, Oct 28, 2021 at 4:36 AM Diego Sueiro &lt;<a=
 href=3D"mailto:Diego.Sueiro@arm.com" target=3D"_blank">Diego.Sueiro@arm.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; Hi Bruce,<br>
&gt;<br>
&gt; Any expectations to have this patch chain backported to honister?<br>
&gt;<br>
<br>
I&#39;ve tagged them for backport, I was just busy trying to figure out<br>
why python 3.10 is breaking master.<br>
<br>
I expect to get to them shortly.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">... and they are now on honister as well.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
Bruce<br>
<br>
<br>
&gt; If it helps, we can send the patches targeting honister to the mailing=
 list.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Diego Sueiro<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@lists.yoctoproject.org</a> &lt;<a href=
=3D"mailto:meta-virtualization@lists.yoctoproject.org" target=3D"_blank">me=
ta-virtualization@lists.yoctoproject.org</a>&gt; on behalf of Kamil Dziezyk=
 via <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D=
"_blank">lists.yoctoproject.org</a> &lt;kamil.dziezyk=3D<a href=3D"mailto:a=
rm.com@lists.yoctoproject.org" target=3D"_blank">arm.com@lists.yoctoproject=
.org</a>&gt;<br>
&gt; Sent: 22 October 2021 08:37<br>
&gt; To: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" targ=
et=3D"_blank">meta-virtualization@lists.yoctoproject.org</a> &lt;<a href=3D=
"mailto:meta-virtualization@lists.yoctoproject.org" target=3D"_blank">meta-=
virtualization@lists.yoctoproject.org</a>&gt;<br>
&gt; Subject: Re: [meta-virtualization] [PATCH 1/2] k3s: Update k3s service=
 configuration<br>
&gt;<br>
&gt;<br>
&gt; Hello Bruce,<br>
&gt;<br>
&gt; Can you backport these two k3s patches to honister branch?<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Kamil<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000063b5605cf6ec5ec--
