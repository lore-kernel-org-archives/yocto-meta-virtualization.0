Return-Path: <richard.purdie@linuxfoundation.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93238E00D0E; Mon, 25 Sep 2017 06:10:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 653B9E00CD3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 06:10:34 -0700 (PDT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8PDARq4024980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 25 Sep 2017 14:10:28 +0100
Message-ID: <1506345027.31732.34.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 25 Sep 2017 14:10:27 +0100
In-Reply-To: <CADkTA4M5aiZw8d=cGjempdwjy_gtOpDfiQ_uok5w4h2i2WRmjg@mail.gmail.com>
References: <20170925084113.30094-1-Qi.Chen@windriver.com>
	<1506336011.31732.13.camel@linuxfoundation.org>
	<CADkTA4M5aiZw8d=cGjempdwjy_gtOpDfiQ_uok5w4h2i2WRmjg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V2 1/3] sanity-bbappend.bbclass: add class for bbappend files checking
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
X-List-Received-Date: Mon, 25 Sep 2017 13:10:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-09-25 at 08:49 -0400, Bruce Ashfield wrote:
> On Mon, Sep 25, 2017 at 6:40 AM, Richard Purdie <richard.purdie@linux
> foundation.org> wrote:
> > 
> > >  conf/layer.conf                 |  4 ++++
> > >  2 files changed, 14 insertions(+)
> > >  create mode 100644 classes/sanity-bbappend.bbclass
> > 
> > Looking at this patch series, I suspect this is partly related to
> > YP Compatibility v2.
> It is.
> 
> The first series arrived that created a magic distro variable
> 'virtualization' that no one would know about, and have no idea how
> to use it .. as a result existing configurations would have a silent
> and drastic change on the behaviour.
> 
> I wasn't about to merge that change, so I suggested that if
> everything was to be triggered off a variable, that variable needed
> to be advertised by more than just its use in the code, and more than
> a mention in a README.
> 
> That led to this first effort at making the new distro variable
> visible.
>  
> > 
> > I do think that its highlighting an issue here in that we have
> > several
> > very similar bbappends where the functionality would likely be
> > better
> > in a common file and secondly, better in the core recipes.
> > 
> > This layer would then just need to configure it rather than adding
> > the
> > config fragements and so on as well.
> > 
> > So yes, I think there is a valid issue here and in many senses, YP
> > Compat v2 is probably highlighting a real problem but I suspect
> > this
> > patch series is not the way to fix it...
> > 
> > Is there a good reason we wouldn't want "virt" markup in the main
> > recipes and it being a configuration option?
>
> I'm not following the configuration option 100%. Do you just mean
> setting 'virtualization' in distro features or some other similar
> configuration variable ? If that had to be manually done via distro
> or local.conf that would leave my original concern outstanding.

I'll spell this out from the ground up since I know you understand this
but I think others reading might not have thought about all of this
quite as much.

One of the bigger problems we have today is that as you add layers,
your build subtly changes and most users have any idea that it happens.
This means sstate becomes invalid, things rebuild and people don't
really understand or control what they're building.

In this case, changing the kernel to enable virtualisation when adding
a virtualisation layer isn't totally unexpected but there are other
cases which are more subtle and problematic. Even here, spelling it out
as a configuration option which users (or distro) opt into is a good
thing.

I'm fine with the warning in this patch series, that makes a lot of
sense. The naming of the class is horrible IMO though.

What I am a little more worried about is that we have to bbappend
recipes like linux-yocto. I have to ask the question, why not put the
configuration markup into the upstream recipe?

There still may be something in meta-virt that warns if key
configuration isn't enabled but the actual code that handles the option
perhaps shouldn't be there now its established?

In new layers pushing the boundaries of technology with things that are
rapidly changing, bbappends in layers make sense. In this case I have
to wonder why we don't just put some configuration options in linux-
yocto in OE-Core. Its not rapid changing, its well established and
fairly universally useful.

We could consider whether it should be based on DISTRO_FEATURE or we
whether we add 'PACKAGECONFIG' for the kernel?

Whilst there are easy ways to make the YP Compat tests pass, I do want
us to think about what actually makes sense...

Cheers,

Richard



