Return-Path: <Maxin.John@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40933E00559; Tue,  8 Jul 2014 07:03:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id C32DDE003D2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Jul 2014 07:02:55 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Tue, 8 Jul 2014
	16:02:53 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 02F63288F30;
	Tue,  8 Jul 2014 16:02:53 +0200 (CEST)
Date: Tue, 8 Jul 2014 16:02:53 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20140708140253.GA17317@sestofb10.enea.se>
References: <1404817370-56388-1-git-send-email-maxin.john@enea.com>
	<CADkTA4OdLy45ryGnn4QruPGMy-COy83+QQTK8JxNb2c6MEBaUw@mail.gmail.com>
	<20140708131143.GA21527@sestofb10.enea.se>
	<CADkTA4Mn4BJkRB5YV=3z+xUW8na4FMwMOraLqCKKq-9+qxi4uQ@mail.gmail.com>
	<CADkTA4NLi3kRAbGqCyp-1XW24QR8y-MyY0gbOCB49TSr+QfppA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4NLi3kRAbGqCyp-1XW24QR8y-MyY0gbOCB49TSr+QfppA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] linux-yocto/3.10/3.14/3.4: replaces module_autoload with KERNEL_MODULE_AUTOLOAD
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
X-List-Received-Date: Tue, 08 Jul 2014 14:03:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Bruce,

On Tue, Jul 08, 2014 at 09:49:03AM -0400, Bruce Ashfield wrote:
> On Tue, Jul 8, 2014 at 9:43 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > On Tue, Jul 8, 2014 at 9:11 AM, Maxin B. John <maxin.john@enea.com> wrote:
> >> Hi Bruce,
> >>
> >> On Tue, Jul 08, 2014 at 09:08:22AM -0400, Bruce Ashfield wrote:
> >>> On Tue, Jul 8, 2014 at 7:02 AM, Maxin B. John <maxin.john@enea.com> wrote:
> >>> > Replace module_autoload with KERNEL_MODULE_AUTOLOAD for "openvswitch".
> >>>
> >>>
> >>> Already merged:
> >>>
> >>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=a66fb848db693347ae2be936eccd2ac0c4f28a48
> >>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=7c193419ad22194755e8e9767e9ab480aa14f97c
> >>
> >> Yes, I saw those commits. Still, those patches somehow missed the openvswitch
> >> part.
> >
> > Only because I appear to have not pushed everything :( Thanks for
> > pointing it out!
> 
> I also amended my commit to add your Signed-off-by,  since our commits are
> the same.

Thank you!
 
> Cheers,
> Bruce

Warm Regards,
Maxin

<snip> 

