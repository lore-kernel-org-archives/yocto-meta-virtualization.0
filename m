Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ECC52E00A03; Wed, 31 Aug 2016 14:11:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 936CEE009EF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 14:11:50 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7VLBoAu015009
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 14:11:50 -0700
Received: from tal.localnet (128.224.20.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 31 Aug 2016 14:11:48 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 31 Aug 2016 17:11:47 -0400
Message-ID: <5574955.TienvFM2l3@tal>
Organization: Wind River 
User-Agent: KMail/4.13.3 (Linux/3.13.0-88-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <3047881.Lfg8Ytdqov@tal>
References: <1472667583-9767-1-git-send-email-mark.asselstine@windriver.com>
	<e3ddf5db-afef-7dde-f8d8-42c6c4958a12@windriver.com>
	<3047881.Lfg8Ytdqov@tal>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 2/2] docker: update license md5sum
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
X-List-Received-Date: Wed, 31 Aug 2016 21:11:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On August 31, 2016 17:09:45 Mark Asselstine wrote:
> On August 31, 2016 16:56:38 Bruce Ashfield wrote:
> > On 2016-08-31 2:19 PM, Mark Asselstine wrote:
> > > Seems upstream adjusted their LICENSE file. The license is still
> > > Apache version 2 so no worries about having to update the LICENSE
> > > string for the recipe.
> > 
> > Or is this using a common LIC file which changed ? My oe-core is
> > about two weeks out of date.
> 
> Has nothing to do with the SRC_URI, it is a changed md5sum on the fetched
> content, in this case the file named LICENSE.

OH, I see why you tied it back to the git hash. That just means that this 
mismatch has existed since that hash was changed. Again, just masked by the 
manipulation of ERROR_QA.

Mark

> 
> You are not seeing the issue because I am guessing you are building with
> meta- overc, which we restrict the ERROR_QA and thus don't include
> 'license- checksum'. Add 'license-checksum' to ERROR_QA in local.conf or
> meta- overc/conf/distro/overc.conf and you will see this.
> 
> Mark
> 
> > Bruce
> > 
> > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > > ---
> > > 
> > >  recipes-containers/docker/docker_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/recipes-containers/docker/docker_git.bb
> > > b/recipes-containers/docker/docker_git.bb index 4f85193..4be5e47 100644
> > > --- a/recipes-containers/docker/docker_git.bb
> > > +++ b/recipes-containers/docker/docker_git.bb
> > > @@ -28,7 +28,7 @@ SRC_URI = "\
> > > 
> > >  # Apache-2.0 for docker
> > >  LICENSE = "Apache-2.0"
> > > 
> > > -LIC_FILES_CHKSUM =
> > > "file://LICENSE;md5=cc2221abf0b96ea39dd68141b70f7937"
> > > +LIC_FILES_CHKSUM =
> > > "file://LICENSE;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
> > > 
> > >  S = "${WORKDIR}/git"


