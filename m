Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02C6CE00961; Thu, 20 Apr 2017 05:19:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.46 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.46 listed in dnsbl.sorbs.net]
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99CF0E0092B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Apr 2017 05:19:38 -0700 (PDT)
Received: by mail-oi0-f46.google.com with SMTP id r203so47923369oib.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Apr 2017 05:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=atdl2TN4NONJ4be/D2Toko3sUSyICpEkQUW/G+ATomg=;
	b=VltgI1A2ozcCprHgn9cTvON4pH2b3ClUq43PW8lWWTCjcSWCaJ23AE4lngpGZI8+LN
	tP5S7+U0rBgTPmpZqsAbfLGCAKUBlcVRUa+jgOP34Gqgz3Ww0C0QUEo66EIIPTkhiUYh
	7nRlBM8J90J3GXxaWf6uG1m6pyvWHZgIJCr2HDnGhDvNV5qNzMxplVuurElRBuGU/XYN
	TZGiweC5YXyDK9nNZpzaPsLkWXrtJQakgINfXiamh2R7iPAxAsqw7mbNDu+pAtFh99Ho
	F1JxmtJ1UoX+9OJMFTfcI0uNnZbpRfwZoiG/mZnvALJbc6jzI2VxYGrjypyEiIonnbrS
	6DDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=atdl2TN4NONJ4be/D2Toko3sUSyICpEkQUW/G+ATomg=;
	b=AdVxF2PSHXZx/U72+45v/vE1Lj9X4J2Q5EfRTfX/DsOxoIFKb27BDdQ7ow7+DK5Fz2
	4onYgb0VJB4Di1OPS3Vwz/EJcfZUlkAW9dcTztEGMGbRR8yFifYVXaB1kc8E2J1JbPbd
	WXnoyTVy7GWsgT/LShoQKzwDFRIB98p83dqO9n59UfrzeafCzqIjHlICHnX1zLEVG/xV
	Ia9cIRhjskQvEwSh3/Qyjy4a9uhGWit2PA4jNtlHagYChWG93LmZ74s2nMHaPKf5381I
	vq/Lw3mL2aSk/BKx8UFllaisEU1Bttsp+tfA1853d+41+asCZAOEKPhucEZJmKxPAMsi
	/aYA==
X-Gm-Message-State: AN3rC/4aEg6qo5P8OwYJKtUqaCg5NT2zk9aXx/J3BjZnq/VMXJP1K5Sh
	Mijp8ASTCrCv/+7kEeO6W8nEhROdTg==
X-Received: by 10.157.68.237 with SMTP id p45mr4004805otg.57.1492690777437;
	Thu, 20 Apr 2017 05:19:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.82.172 with HTTP; Thu, 20 Apr 2017 05:19:37 -0700 (PDT)
In-Reply-To: <8f017b80-eeff-457f-0769-43301ff38d5f@gmail.com>
References: <8f017b80-eeff-457f-0769-43301ff38d5f@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 20 Apr 2017 08:19:37 -0400
Message-ID: <CADkTA4NeNWuUqvLiXo0otRrgZmpHk2Qm873H3_0oQLAe6z7xeA@mail.gmail.com>
To: Christian Holl <cyborgx1@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Can we have a standard approach for Go?
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
X-List-Received-Date: Thu, 20 Apr 2017 12:19:41 -0000
Content-Type: multipart/alternative; boundary=f403043960148c7e17054d982707

--f403043960148c7e17054d982707
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 20, 2017 at 6:58 AM, Christian Holl <cyborgx1@gmail.com> wrote:

> Hi,
>
> I saw that there is a implementation of Go inside
> meta-virtualization.
>
>
> I am currently trying to build influxdb, telegraf and grafana for my
> rasberrypi.
>
> And telegraf depends on docker. Which is also written in Go.
>
> But I am using oe-meta-go for other recipes and they don't work together.
>
> So there is  meta-golang, oe-meta-go and meta-virtualization with go
> implementations.
>

This process is already done in master. I was part of the discussions on
moving
go to oe-core at ELCe in berlin, and Khem took the initiative and collected
our
go changes + oe-meta-go + meta-golang and got them merged into oe-core
for the upcoming 2.3 release.

Those changes won't be backported, but from the 2.3 release and on, we are
moving to the oe-core go variant.

Cheers,

Bruce


>
>
> So could you maybe could someone responsible join our discussion, what to
> use:
>
> https://github.com/madisongh/meta-golang/issues/12
>
>
> Kind Regards,
>
> Christian
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f403043960148c7e17054d982707
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 20, 2017 at 6:58 AM, Christian Holl <span dir=3D"ltr">&lt;<=
a href=3D"mailto:cyborgx1@gmail.com" target=3D"_blank">cyborgx1@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
I saw that there is a implementation of Go inside<br>
meta-virtualization.<br>
<br>
<br>
I am currently trying to build influxdb, telegraf and grafana for my<br>
rasberrypi.<br>
<br>
And telegraf depends on docker. Which is also written in Go.<br>
<br>
But I am using oe-meta-go for other recipes and they don&#39;t work togethe=
r.<br>
<br>
So there is=C2=A0 meta-golang, oe-meta-go and meta-virtualization with go<b=
r>
implementations.<br></blockquote><div><br></div><div>This process is alread=
y done in master. I was part of the discussions on moving</div><div>go to o=
e-core at ELCe in berlin, and Khem took the initiative and collected our</d=
iv><div>go changes + oe-meta-go + meta-golang and got them merged into oe-c=
ore</div><div>for the upcoming 2.3 release.</div><div><br></div><div>Those =
changes won&#39;t be backported, but from the 2.3 release and on, we are</d=
iv><div>moving to the oe-core go variant.</div><div><br></div><div>Cheers,<=
/div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
<br>
So could you maybe could someone responsible join our discussion, what to u=
se:<br>
<br>
<a href=3D"https://github.com/madisongh/meta-golang/issues/12" rel=3D"noref=
errer" target=3D"_blank">https://github.com/madisongh/m<wbr>eta-golang/issu=
es/12</a><br>
<br>
<br>
Kind Regards,<br>
<br>
Christian<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--f403043960148c7e17054d982707--
