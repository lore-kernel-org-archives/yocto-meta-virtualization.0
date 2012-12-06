Return-Path: <richard.purdie@linuxfoundation.org>
Received: from tim.rpsys.net (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCAFEE002AB
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 07:16:47 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6FGbJr030104;
	Thu, 6 Dec 2012 15:16:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29127-07; Thu,  6 Dec 2012 15:16:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6FGTCc030098
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 6 Dec 2012 15:16:30 GMT
Message-ID: <1354806979.12928.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.nystrom@enea.com>
Date: Thu, 06 Dec 2012 15:16:19 +0000
In-Reply-To: <50C0B185.9050807@enea.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
	<1354802601-10840-14-git-send-email-david.c.nystrom@gmail.com>
	<CADkTA4NrbWtbBB-0oqHPC1VHMbvxkJnKKfbYD9p68cD_jwX02A@mail.gmail.com>
	<50C0B185.9050807@enea.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-Mailman-Approved-At: Thu, 20 Dec 2012 09:28:17 -0800
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCHv3 13/14] Upgraded to libvirt 1.0.0, and added a more detailed packageconfig
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
X-List-Received-Date: Thu, 06 Dec 2012 15:16:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2012-12-06 at 15:53 +0100, David Nyström wrote:
> > Another random questions. I've got some other libvirt recipes kicking
> > around, and
> > is it generally frowned upon to trigger options via DISTRO_FEATURES vs
> > PACKAGECONFIG ? I'm thinking of bigger scale features like selinux, which
> > are
> > decided on a distro basis.
> >
> > Cheers,
> >
> > Bruce
> 
> Thats a good question, CC:ing RP who added the feature in 1.3.
> 
> Don't know whats generally frowned upon by the community, I see 
> PACKAGECONFIG as a more fine granular way of doing this.
> Alot of packages in oe-core do a R/DEPENDS split with:
> 
> DEPENDS += ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 
> libxtst libice libsm libxcb gtk+', '', d)}"
> 
> I see no reason for why DISTRO_FEATURES can't select a PACKAGECONFIG 
> setup instead. I'm guessing that's why it was added. i.e.
> 
> PACKAGECONFIG += ${@base_contains('DISTRO_FEATURES', 'kvm', 'qemu yajl', 
> '', d)}"

Its ok to select PACKAGECONFIG based on DISTRO_FEATURES and some recipes
do this already in OE-Core. Lets try and keep a relatively trim set of
things we do at the DISTRO_FEATURE level though (and we should better
document the options available).

I'm a big fan of having sensible defaults and only exposing choices that
have significant real world value.

Cheers,

Richard





