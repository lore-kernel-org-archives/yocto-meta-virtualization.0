Return-Path: <sarayu@m5nv.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D652DE00939; Wed, 29 Aug 2018 04:52:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.218.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B82BE00718
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 Aug 2018 04:52:47 -0700 (PDT)
Received: by mail-oi0-f53.google.com with SMTP id r69-v6so8590105oie.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 Aug 2018 04:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=m5nv-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lIfxfnRzLVRemTkbWuneAUT3gc4CzWb6vzyUX+Am9V4=;
	b=FIROUlSh9HHHVpGYg288Yqjicb14cK4sJuIxm4n9wLnng6SixA+lGxAybTXe491rtZ
	YNhy1ArGBXXNZpCPD+1dHElezagS1zayeQ3i/64qRUd5SuAf+UE4NmfSCE3ef/3wDyrp
	h/ETNIfnTdMCUKzrCF3I3t6n/Rqt47/ywzDVO7jbBBmQzPZl6IW7o1opqqw7tpjSOf8N
	VYx4IePJnRuIy4g+9g2Q5cJV0y1l11MdLHgLoa5sbG7qZLhbLd8fJVlb3I2YEp+G5SW0
	LuLukMVOQ9z2P7HLv9wR9WfuWpXovekdkcaanmDnAbFXs87359A6DhBWNWbQ2Xk9Dscy
	PSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lIfxfnRzLVRemTkbWuneAUT3gc4CzWb6vzyUX+Am9V4=;
	b=n6S2rKAJzPkPoAtPum0Q4SP74qV9tNFXBxURvTE5TSl6mp4WDHvhhZ36Q9QEYy6gPF
	M2YfUy0qAyxAdzT9jG25LbZwJsGK52Fw77AWcXjIfTPI7+r3QXnbga/2hVty8wy9vJY9
	1wWfRJ2kminZTzp29sqeZuGVd0Zp2+XD2BG5tn0tj9cKLI5Kl3Iv5MOsf6qO6iS5Spe6
	+A0HsmpvtuGqDb3MCkZ6BS7SOLbuiLNl7oOMA6LcvzBNorqS/wl8VC1hUpjg/B9PqS5R
	pC7DL6Z5yzRaUFFauuXdXPdB54v+Ee67/XOh+UJa1L9SFrKfh7/ktMiqAAOtA3fBiCMX
	/qRw==
X-Gm-Message-State: APzg51C6P+AnYnpZfumbRj7+m4DhqsFvNVXUfNvupWqDzaG8YRyZbzDj
	dFvZtiBJbB8/TqwuiCMu55DZYS2uyvxzZZZkEyHOwg==
X-Google-Smtp-Source: ANB0VdY6g0h3Y8lrKP/en/BPJYvopjy2sXVZO8h6tuRBTiklp/R3Y6Y8yD8ZCs5e6PdLJDatlnITGr2UaPaPMI/J5x8=
X-Received: by 2002:aca:ac54:: with SMTP id v81-v6mr2249180oie.1.1535543566592;
	Wed, 29 Aug 2018 04:52:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:3da6:0:0:0:0:0 with HTTP; Wed, 29 Aug 2018 04:52:45
	-0700 (PDT)
In-Reply-To: <CADkTA4NjRAdfEyxFp5ZiRXKgpqEpfD6Os_ujeO2qsoPqsE+GEw@mail.gmail.com>
References: <CAG3Cyz8_qsDW=53JVBNBVUrOMbhYk4Ou8P1P2qD8pBbizPNLLQ@mail.gmail.com>
	<CADkTA4NjRAdfEyxFp5ZiRXKgpqEpfD6Os_ujeO2qsoPqsE+GEw@mail.gmail.com>
From: Sarayu Sivanandam <sarayu@m5nv.com>
Date: Wed, 29 Aug 2018 17:22:45 +0530
Message-ID: <CAG3Cyz_RjQswemA0GDe7BNic6Q4DGtFu7juzy2sVcQieiMEPUw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: LXD on yocto
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2018 11:52:47 -0000
Content-Type: multipart/alternative; boundary="000000000000d317010574919871"

--000000000000d317010574919871
Content-Type: text/plain; charset="UTF-8"

Thanks Bruce.

Max,
Can you please share any details regarding how to build LXD on yocto ?

On Wed, Aug 22, 2018 at 9:14 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> Max was posting about doing LXD work in april of last year. I've added him
> here.
>
> Bruce
>
> On Wed, Aug 22, 2018 at 11:29 AM, Sarayu Sivanandam <sarayu@m5nv.com>
> wrote:
> > Hi all ,
> >
> > Is anyone currently working on a recipe for LXD .
> >
> > I am looking to create a LXD recipe and i am new to yocto so any inputs
> on
> > the same will be very helpful.
> >
> > Thanks and Regards
> > Sarayu
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--000000000000d317010574919871
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Bruce. <br></div><div><br></div><div>Max, <br>=
</div><div>Can you please share any details regarding how to build LXD on y=
octo ?<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Wed, Aug 22, 2018 at 9:14 PM, Bruce Ashfield <span dir=3D"ltr">&lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Max was=
 posting about doing LXD work in april of last year. I&#39;ve added him her=
e.<br>
<br>
Bruce<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Wed, Aug 22, 2018 at 11:29 AM, Sarayu Sivanandam &lt;<a href=3D"mailto:s=
arayu@m5nv.com">sarayu@m5nv.com</a>&gt; wrote:<br>
&gt; Hi all ,<br>
&gt;<br>
&gt; Is anyone currently working on a recipe for LXD .<br>
&gt;<br>
&gt; I am looking to create a LXD recipe and i am new to yocto so any input=
s on<br>
&gt; the same will be very helpful.<br>
&gt;<br>
&gt; Thanks and Regards<br>
&gt; Sarayu<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@<wbr>yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/=
listinfo/meta-<wbr>virtualization</a><br>
&gt;<br>
<br>
<br>
<br>
-- <br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span></blockquote></div><br></div>

--000000000000d317010574919871--
