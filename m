Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02409E00770; Wed,  7 May 2014 06:16:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 54D65E003C7
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 May 2014 06:16:44 -0700 (PDT)
Received: from iapetus.enea.se (172.16.141.137) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Wed, 7 May 2014
	15:16:42 +0200
Date: Wed, 7 May 2014 15:16:42 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20140507131642.GB18437@iapetus.enea.se>
References: <20140507124513.GA18437@iapetus.enea.se>
	<CADkTA4NXTB558rHETszFB9WuRwKEWRvr7gwRkDfhJB_fMhwxgA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4NXTB558rHETszFB9WuRwKEWRvr7gwRkDfhJB_fMhwxgA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Joe Slater <jslater@windriver.com>
Subject: Re: libvirt requires libssh2
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
X-List-Received-Date: Wed, 07 May 2014 13:16:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, May 07, 2014 at 09:10:47AM -0400, Bruce Ashfield wrote:
> On Wed, May 7, 2014 at 8:45 AM, Josep Puigdemont
> <josep.puigdemont@enea.com> wrote:
> > Hi,
> >
> > A default dependency on libssh2 for libvirt was added recently. Where is libssh2
> > provided? I can not find it in either meta-oe or oe-core.
> 
> Joe ? Did that leak in from something local to you ?
> 
> Regardless, I'll revert the change for now.

Maybe we can keep PACKAGECONFIG[libssh2]

/Josep
> 
> Bruce
> 
> >
> > Thanks,
> > Josep
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

