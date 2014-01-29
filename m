Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 370C2E0079B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 Jan 2014 07:18:26 -0800 (PST)
Received: by mail-lb0-f173.google.com with SMTP id y6so1553712lbh.4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 Jan 2014 07:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=TYdy1A87w6ne5LXoR5Qpnd8QZIdTy112c28/YbS+lgU=;
	b=WjSPLIqWRpS1I2hYoOIij4eatCMKp8DRJYxpeELo2CegoWvG93qI6ZMC0EKFj7yLH9
	VSt72W15IdND0EuXt010L0lurJTc4pOBi6Fu/QlK/MbT8PUJFhCDniIh5n3CIlga4mkq
	uYYkAPNarAHUEyiwb8pFTJVphXvUb2RbOzbSoZptYfTIY9S2+OFh/szD37fcqpKJcBLo
	7ZBhOJjISgcvV349C2d8VXYV0v5UzmIodHCi5TID766yyZoifaXz2PH3i6hGFbr0Vbqq
	Sf+fS93jfTvTKcmUMak3v3T0EhwYR6n43tp12w5Vj2+gs6Tzynu4A2qWSHuAZBarur05
	bOjA==
MIME-Version: 1.0
X-Received: by 10.112.73.100 with SMTP id k4mr5570411lbv.25.1391008704659;
	Wed, 29 Jan 2014 07:18:24 -0800 (PST)
Received: by 10.112.77.170 with HTTP; Wed, 29 Jan 2014 07:18:24 -0800 (PST)
Date: Wed, 29 Jan 2014 10:18:24 -0500
Message-ID: <CADkTA4P-dFh3-feJKTtwdOcWvF7nQxeq7s58qxDrtnOFyKHkDA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: FYI: bad libvirt in master
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
X-List-Received-Date: Wed, 29 Jan 2014 15:18:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Just a heads up that I pushed my unfinished libvirt update to 1.2.1 along
with the last round of Xen patches. It has some problems that I'm fixing
now, so if you see breakage, it is known and being fixed!

Cheers,

Bruce

-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

