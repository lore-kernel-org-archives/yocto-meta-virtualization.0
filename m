Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B896DE00C03; Tue,  6 Oct 2015 09:17:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87A09E00843
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Oct 2015 09:16:54 -0700 (PDT)
Received: by ykft14 with SMTP id t14so208289066ykf.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Oct 2015 09:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=t/MxWyqZlxDOjIwvTwLJCQU4sU/UXEI54xPF1Ui7NPQ=;
	b=FpwHf+JKzXT22EuLL5vhKaWH2J3AevRpeOBz3f8vJDSijBoLTQMRtLj3sWvpRgKQMH
	141zJo63rHM0vWRXyuleAfmqgFnzflY5JVJYAul/j6+NmIC2tSIh+WUamBu30sPpXIm8
	3j1Ddz6KLfYez/Sl0UuyKhfFLopDatLc+Y26L3ILibxP3HnLQv0xber9xnfNQjfnZI87
	e8nQOjRntgUrssADT51p8SBGJ1XQRdpP9V7CeRkHOKHLzwNrL2YF+Sm7VTS2v+NsoQDj
	c/kn98aAPpSZMaEaCywQsHn+XxOiPbhUW7MfDipdxEW8yU1aLuttDdPFJGYfSVHzrrLT
	B+2g==
MIME-Version: 1.0
X-Received: by 10.129.4.207 with SMTP id 198mr2579385ywe.320.1444148213749;
	Tue, 06 Oct 2015 09:16:53 -0700 (PDT)
Received: by 10.13.217.201 with HTTP; Tue, 6 Oct 2015 09:16:53 -0700 (PDT)
In-Reply-To: <1443793858-17763-1-git-send-email-josep.puigdemont@enea.com>
References: <1443793858-17763-1-git-send-email-josep.puigdemont@enea.com>
Date: Tue, 6 Oct 2015 12:16:53 -0400
Message-ID: <CADkTA4OaCJ87G43CwNtrGz=_pYmei+8gAQLcTcaSsEGhAX=GRQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH 0/6] Updated for fido-kilo
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
X-List-Received-Date: Tue, 06 Oct 2015 16:17:02 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 2, 2015 at 9:50 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> Here are a few patches for fido-kilo.
>

merged.

Sorry for the delay, traveling to ELCe has kept me away from my
keyboard a lot in
the past few days.

> A couple of them are cherry-picked from master. On those I have added
> my own sign-off. I don't know if this is the proper procedure or
> whether I should add acked-by only, or nothing at all.
> Bruce, feel free to remove or change my sign-off as required.

I only tweaked the order slightly, but otherwise, left your added Sign-off ..
it's fine by me if it is in there.

>
> I've also backported the oslo.vmware recipe from master. Unfortunately
> I could not cherry pick the commit because the versions differ.
>

No problem either .. it all should be there now

Thanks for the series.

Bruce

> Jackie Huang (2):
>   python-jsonpointer: inherit setuptools instead of distutils
>   python-alembic: upgrade to 0.7.5.post2
>
> Josep Puigdemont (4):
>   python-oslo.vmware: add recipe
>   python-glance,glancestore: require oslo.vmware
>   python-nova: depends on psutil
>   nova: build dependency on libvirt
>
>  ...mbic_0.5.0.bb => python-alembic_0.7.5.post2.bb} |  7 +++---
>  .../recipes-devtools/python/python-glance_git.bb   |  1 +
>  .../python/python-glancestore_git.bb               |  1 +
>  .../python/python-jsonpointer_1.7.bb               |  2 +-
>  .../recipes-devtools/python/python-nova_git.bb     |  2 ++
>  .../python/python-oslo.vmware_0.11.2.bb            | 25 ++++++++++++++++++++++
>  6 files changed, 33 insertions(+), 5 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-alembic_0.5.0.bb => python-alembic_0.7.5.post2.bb} (61%)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.vmware_0.11.2.bb
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

