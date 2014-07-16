Return-Path: <Maxin.John@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8353E00563; Wed, 16 Jul 2014 08:01:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id A499DE00547
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Jul 2014 08:01:20 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 16 Jul 2014 17:01:15 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id DF377288F32;
	Wed, 16 Jul 2014 17:01:15 +0200 (CEST)
Date: Wed, 16 Jul 2014 17:01:15 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20140716150115.GA46878@sestofb10.enea.se>
References: <1404908262-4773-1-git-send-email-maxin.john@enea.com>
	<20140715162801.GA28780@sestofb10.enea.se>
	<CADkTA4Nqg74VAEqfBTAnzBRqrMn63yLRJto8Mwuj7UTmmq6A8w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4Nqg74VAEqfBTAnzBRqrMn63yLRJto8Mwuj7UTmmq6A8w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] kvm-image-minimal: Fix warning
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
X-List-Received-Date: Wed, 16 Jul 2014 15:01:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Bruce,

On Wed, Jul 16, 2014 at 10:32:54AM -0400, Bruce Ashfield wrote:
> On Tue, Jul 15, 2014 at 12:28 PM, Maxin B. John <maxin.john@enea.com> wrote:
> > Hi,
> >
> > On Wed, Jul 09, 2014 at 02:17:42PM +0200, Maxin B. John wrote:
> >> Fix this warning:
> >> WARNING: Function remove_packaging_data_files doesn't exist
> >>
> >> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> >> ---
> >>  recipes-extended/images/kvm-image-minimal.bb | 2 --
> >>  1 file changed, 2 deletions(-)
> >>
> >> diff --git a/recipes-extended/images/kvm-image-minimal.bb b/recipes-extended/images/kvm-image-minimal.bb
> >> index abc0fee..c96edca 100644
> >> --- a/recipes-extended/images/kvm-image-minimal.bb
> >> +++ b/recipes-extended/images/kvm-image-minimal.bb
> >> @@ -21,5 +21,3 @@ LICENSE = "MIT"
> >>  inherit core-image
> >>
> >>  IMAGE_ROOTFS_SIZE = "8192"
> >> -
> >> -ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
> >> --
> >
> > Gentle ping.
> 
> Sorry about that, holidays rot the mind!
> 
> I was poking around with this before I headed out for vacation, and
> didn't remember to
> return to it.

Ah.. I don't want to ruin your vacation :)
 
> I wanted to track down the replacement functionality for this, since
> we do want to try
> and restrict the size of the images for the minimal variants.
> 
> Now that the functionality has moved to lib/oe/* and triggers of
> package_management
> not being in IMAGE_FEATURES, we should be good by default.
> 
> Having that extra bit of information in the commit log would be ideal,
> since it lets us
> remember that the functionality is automatic and preserved.
> 
> Did you want to tweak the log ? or should I ?
I will update the commit log as per your suggestion and send a v2.

> Bruce
Best Regards,
Maxin


