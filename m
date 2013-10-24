Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B485E01764
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Oct 2013 16:06:06 -0700 (PDT)
Received: by mail-la0-f42.google.com with SMTP id ea20so2512870lab.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Oct 2013 16:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=3hJvuYaOlfyTWgob2PuSntu0fUKMIDYxIsI/30o7HA0=;
	b=GLrrMeHBQmSE48SHktEkLJ1fFuu5tKuAMS/8fFNTVCNgkzpsqsoB9LS9gh7+r4bOW+
	soOvihdypcDZ4KCei3YGWlSMQNmfSejQsl8THF0MUh4h/qYW4E3KI9HN/ATfdxkyT17S
	urndA618c7cwjiytj7e4aZkayWtRCUAnAt6y14jnTCZfDBfX0m4Zlb4Yg27XhnNxHbAg
	zMnFiC7IGsuVNPjG5rNgoagNuibLYV+8bsXzHWtTyMkyaEHEDl2Bk/obz0L03wONkRdF
	pbRkUlDYo0HMMcucMoangi9EXjlOH3yQ2NDY2+UiCWhXr5UoZ2cTiAZ4J0m0YhW4/Px7
	hsLA==
MIME-Version: 1.0
X-Received: by 10.112.72.197 with SMTP id f5mr38709lbv.59.1382655965490; Thu,
	24 Oct 2013 16:06:05 -0700 (PDT)
Received: by 10.112.14.200 with HTTP; Thu, 24 Oct 2013 16:06:05 -0700 (PDT)
In-Reply-To: <526979F3.3060707@enea.com>
References: <526979F3.3060707@enea.com>
Date: Thu, 24 Oct 2013 19:06:05 -0400
Message-ID: <CADkTA4PhJRBOV-vjye2eo6Oo8Kz1MYpTcwV8OSshfG4=8rD1Nw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Release branches.
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
X-List-Received-Date: Thu, 24 Oct 2013 23:06:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 3:50 PM, David Nystr=F6m <david.nystrom@enea.com> w=
rote:
> Hi,
>
> Should we start doing release branches in meta-virtualzation ?
> Perhaps its time.
>
> What do you think ?

It is definitely time. I have a few that I maintain locally, and it is
little effort for us
to create matching branches to the yocto/oe-core release that is last known=
 to
work.

I can start by pushing out a few branches that match the tags that I
have locally
if that's ok ?

Bruce
>
> Br,
> David
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

