Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 388C8E002F9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Aug 2013 10:25:38 -0700 (PDT)
Received: by mail-la0-f51.google.com with SMTP id es20so1734433lab.10
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Aug 2013 10:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JhHesEihKO6D3AoH4/uHLo0tsZfjgCeV8Nx0Qhv2oS0=;
	b=za6P5VrgObFnISa7uOlcXt7T/QbKBdNiY1gRdk6PSIALXw5dfh9lXCnIo/dUBui+dh
	fC9Zo0VR0BH0V5PXbI/iPEtBFXNRYTpEVbKBKrukqhvBBG0A/t4vqI5PTZP1woI/s5F7
	oKwzuJtM8lWRhTKWleOPb/fhq0vkP/KiZUpBU8dCsCl0g0bZ5qk+qR9d97xAyhs2P5Xc
	K375pvtZAdqqmFmtWTxaxQKc6cgL+t0dRKkbUswUUQ9itF2EQGI5glT+H9c1mevAdQi2
	4QzbeGffvsfnPf1oNqOlpsa2ShRO1feeJUIFMP5KEs1UOtJ6u+wPoKF6ZwYORLRS38XQ
	QOuQ==
MIME-Version: 1.0
X-Received: by 10.152.29.201 with SMTP id m9mr2177803lah.6.1376673936212; Fri,
	16 Aug 2013 10:25:36 -0700 (PDT)
Received: by 10.112.158.229 with HTTP; Fri, 16 Aug 2013 10:25:36 -0700 (PDT)
In-Reply-To: <520E3BB8.1090708@mentor.com>
References: <520E3BB8.1090708@mentor.com>
Date: Fri, 16 Aug 2013 13:25:36 -0400
Message-ID: <CADkTA4PST+H09j7eNwR92kLYEKFYbv6g0fXw=--7ZHLncEAvRA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Usman, Fahad" <Fahad_Usman@mentor.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: remove the bbappend of busybox?
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
X-List-Received-Date: Fri, 16 Aug 2013 17:25:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 16, 2013 at 10:48 AM, Usman, Fahad <Fahad_Usman@mentor.com> wrote:
> Hi,
> I am trying to use meta-virtualization with master branches of poky and
> meta-oe. But meta-virtualization contains a .bbappend for an older version
> of busybox which causes the build to fail. The patch that this .bbappend
> file adds has already been merged into the newer version of busybox so it
> would not be needed with the newer version.

What version of meta-virt are you using ? meta-virt is sync'd to oe-core master
on 1.21.1

>
> There is also a defconfig for busybox in meta-virtualization layer, and I am
> not sure if it's needed or not. If it's not needed then I can send a pull
> request to remove busybox .bbappend and defconfig file.

We want the defconfig, it represents the features that meta-virt wants to be
enabled for the most common configs.

That being said, we would take a patch that updates the bbappend and factors
out the configuration changes into a fragment.

Cheers,

Bruce

>
> Regards,
> Fahad Usman.



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

