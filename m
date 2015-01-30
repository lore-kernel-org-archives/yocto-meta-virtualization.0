Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C0AEE00828; Thu, 29 Jan 2015 22:35:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4394DE007CF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jan 2015 22:34:55 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56872486"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jan 2015 14:31:23 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0U6YCON015979;
	Fri, 30 Jan 2015 14:34:12 +0800
Received: from Fedora (10.167.226.40) by G08CNEXCHPEKD01.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.181.6;
	Fri, 30 Jan 2015 14:34:54 +0800
Date: Fri, 30 Jan 2015 14:34:51 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20150130143451.47190d5a@Fedora>
In-Reply-To: <CADkTA4PKG2aCnNcNY6DkGfBfyygDf3s2ayJCWqo-fJM5dFyHvA@mail.gmail.com>
References: <1422410616-4342-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<CADkTA4PKG2aCnNcNY6DkGfBfyygDf3s2ayJCWqo-fJM5dFyHvA@mail.gmail.com>
Organization: FNST
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/2] Don't compile extensions
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
X-List-Received-Date: Fri, 30 Jan 2015 06:35:00 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 30 Jan 2015 00:20:28 -0500
Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> On Tue, Jan 27, 2015 at 9:03 PM, Qian Lei <qianl.fnst@cn.fujitsu.com> wrote:
> > Ruby module mkmf is used in these extensions. But mkmf use native
> > libraries instead of target libraries. so we don't compile them.
> 
> Thanks for the fixes. They look fine to me, and I've merged them to the master
> branch.

I think they work fine if the host and target is the same architecture. You may
need to built them for other target. My target is qemu-x86 while my
host is x86-64.

> Cheers,
> 
> Bruce
> 
> >
> > Qian Lei (2):
> >   json: Don't compile extensions
> >   yajl-ruby: Don't compile extensions
> >
> >  .../ruby/json/0001-Dont-compile-extensions.patch     | 20
> > ++++++++++++++++++++ meta-openstack/recipes-devtools/ruby/json_git.bb
> > |  1 + .../yajl-ruby/0001-Don-t-compile-extensions.patch    | 20
> > ++++++++++++++++++++ .../recipes-devtools/ruby/yajl-ruby_git.bb
> > |  1 + 4 files changed, 42 insertions(+)
> >  create mode 100644
> > meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch
> > create mode 100644
> > meta-openstack/recipes-devtools/ruby/yajl-ruby/0001-Don-t-compile-extensions.patch
> >
> > --
> > 1.8.3.1
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 
> 



-- 
Qian Lei

