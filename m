Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8673FE00750; Mon,  9 Mar 2015 11:34:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6AF3E003FA
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Mar 2015 11:34:03 -0700 (PDT)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t29IY0gb003473
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 9 Mar 2015 11:34:00 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>)
	id 1YV2Ub-0007mC-Rp; Mon, 09 Mar 2015 14:33:29 -0400
Date: Mon, 9 Mar 2015 14:33:29 -0400
From: Amy Fong <amy.fong@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20150309183329.GA29759@windriver.com>
References: <20150227214013.GA2160@windriver.com>
	<CADkTA4N4nrxOz7R7MgQ11m9hXLO4=0O98jk2o2mDi=m-RzY3Lg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4N4nrxOz7R7MgQ11m9hXLO4=0O98jk2o2mDi=m-RzY3Lg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/5] Package docker + docker-registry
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
X-List-Received-Date: Mon, 09 Mar 2015 18:34:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 02, 2015 at 03:40:11PM -0500, Bruce Ashfield wrote:
> On Fri, Feb 27, 2015 at 4:40 PM, Amy Fong <amy.fong@windriver.com> wrote:
> > This set of patches adds the packages docker, docker-registry
> > and required dependencies/rdependencies.
> >
> > The following were added to my BBLAYERS on top
> > of a basic yocto/poky build to compile these packages:
> >
> >   meta-virtualization \
> >   meta-cloud-services/meta-openstack \
> 
> This is creating a circular dependency. Which recipes in particular do we
> need from meta-openstack ?
> 
> We need to pull those recipes from meta-openstack to meta-virt, and then
> I can take the submission.
> 
> Cheers.
> 
> Bruce

Sorry, mail got buried.

3 packages:

python-flask
python-webob
python-werkzeug

Amy

