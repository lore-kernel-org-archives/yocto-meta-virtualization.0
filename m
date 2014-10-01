Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 421B9E007DF; Tue, 30 Sep 2014 23:32:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 3D8BFE0034C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Sep 2014 23:32:37 -0700 (PDT)
Received: from iapetus.enea.se (172.16.141.175) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Wed, 1 Oct 2014
	08:32:31 +0200
Date: Wed, 1 Oct 2014 08:32:31 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20141001063231.GB926@iapetus.enea.se>
References: <1412082233-16687-1-git-send-email-josep.puigdemont@enea.com>
	<20140930130900.GA1825@iapetus.enea.se>
	<CADkTA4MSdXU_n3JEC+BTG36HuBjeX6saF2pu-ajhi7WTX6-q8Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4MSdXU_n3JEC+BTG36HuBjeX6saF2pu-ajhi7WTX6-q8Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: build API docs only when required
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
X-List-Received-Date: Wed, 01 Oct 2014 06:32:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Sep 30, 2014 at 02:09:57PM -0400, Bruce Ashfield wrote:
> On Tue, Sep 30, 2014 at 9:09 AM, Josep Puigdemont
> <josep.puigdemont@enea.com> wrote:
> > On Tue, Sep 30, 2014 at 03:03:53PM +0200, Josep Puigdemont wrote:
> >> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> >> ---
> >>  recipes-kernel/linux/linux-yocto_3.4.bbappend | 16 ----------------
> >>  1 file changed, 16 deletions(-)
> >>  delete mode 100644 recipes-kernel/linux/linux-yocto_3.4.bbappend
> >>
> >> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> >> deleted file mode 100644
> >> index 0b2ff53..0000000
> >> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> >> +++ /dev/null
> >> @@ -1,16 +0,0 @@
> >> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >> -
> >> -SRC_URI += "file://xt-checksum.scc \
> >> -            file://ebtables.scc \
> >> -         file://vswitch.scc \
> >> -         file://lxc.scc \
> >> -         "
> >> -KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
> >> -
> >> -KERNEL_MODULE_AUTOLOAD += "openvswitch"
> >> -KERNEL_MODULE_AUTOLOAD += "kvm"
> >> -KERNEL_MODULE_AUTOLOAD += "kvm-amd"
> >> -KERNEL_MODULE_AUTOLOAD += "kvm-intel"
> >> -
> >> -# xen kernel support
> >> -SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
> >
> > eeh, sorry, I sent the wrong patch with the wrong commig message!
> >
> > Still linux-yocto_3.4.bbappend should probably be removed since that kernel
> > is not suppoted in yocto on master, and a new bbappend for 3.17 should be added
> > too (same as for 3.14 seems to work on my machine).
> 
> I have the kernel bbappend changes made locally, since I'm just about to push a
> 3.17 series to oe-core .. I'll update meta-virt at the same time.

Excellent, thanks Bruce!

/Josep

> 
> Bruce
> 
> >
> > Sorry for the confusion.
> >
> > best regards,
> > /Josep
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 
> 
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"

