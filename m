Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D824AE00CEE; Thu, 21 Mar 2019 07:52:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.175 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D133E00B43
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Mar 2019 07:52:50 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id x13so5528441ljj.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Mar 2019 07:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+Kn28CilTOa6ANVZeo04KOQH9hC3i5uGE7PBsugioOU=;
	b=HH06zwS0nhj8D9ywY5Y1MvUWDki1jOdQWt3AS8Tl0JtHKakXIYpFFPiFlAe1IA1tle
	PJN8mFJWgNkseGPGOmxmZCMtg6jfp8viPJNYGqs4wKy0stZEHZdKJ2UdcuKQ4oMPMnTI
	QIfXKc7uQq1BdE3v4DI7wogfE52slSrYXBpppkl1oecUYzZj+ldArlC9fsE6ClyWm3Dj
	A72Rur0Gjr/4VeJSPcojxNcWW5bT/a/zXaesJDuV1cCMjl2L78IdXToBienfDKVYLM+r
	pqDcPIo3KAxbd0et3QkVSJu4DqxZERtvrXNo0d/oZe9ixY4zWQ9a3VDu+ElnmmP/E91Y
	NgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+Kn28CilTOa6ANVZeo04KOQH9hC3i5uGE7PBsugioOU=;
	b=YL7BZF+m2lAbuwLVQoO4ZUdkDNWbH0KUbuQ/m+3aNFlywTTC/+kyT4TbVNTSOkQs1s
	qwUzkiMHiRBmbkQYeZPK+JU/jxfUcJRli+jSYUHoV5/qE35I5bzBuuhrqFZp/OP7DStq
	OpA6H1PnB3vLnxwFI1tLDQqjRXRFzjBA165sxqhfDsdbrG4R57n7zPcf3sKXhyCtYKd8
	aGWurhOSjt1aSmHDw6KJ5wZHFne3uqltqdAlgrSqSC3uCpnd861D1izTXepUVWxj9mDa
	0IgbYK5PFccNByO994LlgVLczMPMN6nsTWs8rGuoBjPsF86BSBH1h0JjRKkc7+cwLnpq
	yjeg==
X-Gm-Message-State: APjAAAVnMRQkDSLm8VAbCEzh/J6ei8GobEYDwBewBG/f3/TdKTMvC8q/
	lqEIqCj221da+hSSiBWrZ//iVfwa/0JDJQBLTvk=
X-Google-Smtp-Source: APXvYqzSVzutqhVTxXn1IqtseyKL8p1s5e2ZraQwY8RLw2MFrXdb/u8gl1yTVIWAzswATMVUKs8NQujY/81gfC1blA4=
X-Received: by 2002:a2e:9196:: with SMTP id f22mr2300791ljg.82.1553179969473; 
	Thu, 21 Mar 2019 07:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190220130527.5770-1-pascal.bach@siemens.com>
	<CADkTA4MP0Wotw0ac+dPns81TBkWZWM9fqgdOULeqsvPAhNj-Hw@mail.gmail.com>
	<CADkTA4Mk6x_4DM5G=iMmcuuiNX---zR_cciaqEX-O5o+3SXOQg@mail.gmail.com>
	<75eba04c-bcad-3249-bc92-295d53fce913@windriver.com>
	<CADkTA4Mz4VaMdGzcQSFvdef2Om+pxS7c2jJkbwm+J-Z+XKwsZA@mail.gmail.com>
	<ba45a5a6-1446-f5b4-4887-77b22ad04370@windriver.com>
In-Reply-To: <ba45a5a6-1446-f5b4-4887-77b22ad04370@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 21 Mar 2019 10:52:38 -0400
Message-ID: <CADkTA4ObfGBVYutMuYTM8foD7iFqMv1+zNRgWyBPUqBO7MGoAQ@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker: update 18.09.0 -> 18.09.2
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
X-List-Received-Date: Thu, 21 Mar 2019 14:52:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 18, 2019 at 9:13 PM Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
>
>
> On 3/18/19 8:41 PM, Bruce Ashfield wrote:
> > On Mon, Mar 18, 2019 at 2:28 AM Hongzhi, Song
> > <hongzhi.song@windriver.com> wrote:
> >>
> >> On 2/20/19 9:47 PM, Bruce Ashfield wrote:
> >>> On Wed, Feb 20, 2019 at 8:42 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >>>> On Wed, Feb 20, 2019 at 8:06 AM Pascal Bach <pascal.bach@siemens.com> wrote:
> >>>>> Docker revision is taken from https://github.com/docker/engine/releases/tag/v18.09.2
> >>>>> and libnetwork is extracted from there.
> >>>>> I also switched the repo from moby/moby to docker/engine as it makes it easier to find the tags.
> >>>> In this case, I'm going to stick with moby. The reason that it was
> >>>> being used was
> >>>> to keep the linkage between moby and the -ce builds. Since we have various other
> >>>> components that are sometimes in sync, sometimes out of sync, having that common
> >>>> repository was important. The point of having the docker-ce and
> >>>> 'docker' split was
> >>>> that one tracked community, and one only tracks what docker "the
> >>>> company" was doing.
> >>> The formatting of that email came out horribly. Sorry about that.
> >>> (let's see if this one comes out more readable)
> >>>
> >>> I thought I should add that I'm working on a refresh of the docker
> >>> components as well, and was considering using some naming to make the
> >>> community/docker-ce split a bit more clear.
> >> Hi Bruce,
> >>
> >> Could I uprev docker to v18.09.3 compliant with moby?
> > I have patches ready for this already, I was traveling last week and
> > couldn't complete
> > them. I expect to have them done and tested by end of week.
> >
> > Bruce
>
>
> Ok, thanks
>

FYI: I just pushed the following commits to master-next of meta-virt:

d19fda3 docker: consolidate common depends/options
9e4957d docker: fixup redepends and clean rsuggests
1c424ca docker-ce: fixup redepends and clean rsuggests
9ce802c containerd: remove docker/lxc RRECOMMENDS
ceae7b6 docker-runc: drop docker RRECOMMENDS
2890f19 docker: uprev docker/moby to 18.09.3
7bddcb3 docker-ce: update to 18.09.3

I'm letting them soak overnight, and will push them on Friday.

Bruce

>
> Hongzhi
>
>
>
> >
> >>
> >> Hongzhi
> >>
> >>
> >>> So perhaps that would help
> >>> make hunting for the right SRCREV in moby make a bit more sense.
> >>>
> >>> Bruce
> >>>
> >>>> Bruce
> >>>>
> >>>>> What is odd is that the Copyright year in LICENSE went backwards in this release.
> >>>>>
> >>>>> I didn't touch runc and containerd as they are already updated.
> >>>>>
> >>>>> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>>> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> >>>>> ---
> >>>>>    recipes-containers/docker/docker-ce_git.bb |  6 +++---
> >>>>>    recipes-containers/docker/docker_git.bb    | 12 ++++++------
> >>>>>    2 files changed, 9 insertions(+), 9 deletions(-)
> >>>>>
> >>>>> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
> >>>>> index 05eac21..5e9f060 100644
> >>>>> --- a/recipes-containers/docker/docker-ce_git.bb
> >>>>> +++ b/recipes-containers/docker/docker-ce_git.bb
> >>>>> @@ -18,8 +18,8 @@ DESCRIPTION = "Linux container runtime \
> >>>>>     subtle and/or glaring issues. \
> >>>>>     "
> >>>>>
> >>>>> -SRCREV_docker = "6e632f7fc395d15bce46f426086e91c01598cf59"
> >>>>> -SRCREV_libnetwork = "6da50d1978302f04c3e2089e29112ea24812f05b"
> >>>>> +SRCREV_docker = "62479626f213818ba5b4565105a05277308587d5"
> >>>>> +SRCREV_libnetwork = "2cfbf9b1f98162a55829a21cc603c76072a75382"
> >>>>>    SRC_URI = "\
> >>>>>           git://github.com/docker/docker-ce.git;branch=18.09;name=docker \
> >>>>>           git://github.com/docker/libnetwork.git;branch=bump_18.09;name=libnetwork;destsuffix=git/libnetwork \
> >>>>> @@ -34,7 +34,7 @@ GO_IMPORT = "import"
> >>>>>
> >>>>>    S = "${WORKDIR}/git"
> >>>>>
> >>>>> -DOCKER_VERSION = "18.09.0-ce"
> >>>>> +DOCKER_VERSION = "18.09.2-ce"
> >>>>>    PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
> >>>>>
> >>>>>    DEPENDS = " \
> >>>>> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> >>>>> index 19e773b..5a0e483 100644
> >>>>> --- a/recipes-containers/docker/docker_git.bb
> >>>>> +++ b/recipes-containers/docker/docker_git.bb
> >>>>> @@ -18,11 +18,11 @@ DESCRIPTION = "Linux container runtime \
> >>>>>     subtle and/or glaring issues. \
> >>>>>     "
> >>>>>
> >>>>> -SRCREV_docker = "489b8eda6674523df8b82a210399b7d2954427d0"
> >>>>> -SRCREV_libnetwork = "6da50d1978302f04c3e2089e29112ea24812f05b"
> >>>>> -SRCREV_cli = "51668a30f26250ccfce31bcc13d9334eaafabe36"
> >>>>> +SRCREV_docker = "eb137ff1765faeb29c2d99025bfd8ed41836dd06"
> >>>>> +SRCREV_libnetwork = "2cfbf9b1f98162a55829a21cc603c76072a75382"
> >>>>> +SRCREV_cli = "af2647d55b1dff69f5684f5991b9690fddd75c69"
> >>>>>    SRC_URI = "\
> >>>>> -       git://github.com/moby/moby.git;nobranch=1;name=docker \
> >>>>> +       git://github.com/docker/engine.git;nobranch=1;name=docker \
> >>>>>           git://github.com/docker/libnetwork.git;branch=bump_18.09;name=libnetwork;destsuffix=git/libnetwork \
> >>>>>           git://github.com/docker/cli;branch=18.09;name=cli;destsuffix=git/cli \
> >>>>>           file://docker.init \
> >>>>> @@ -31,13 +31,13 @@ SRC_URI = "\
> >>>>>
> >>>>>    # Apache-2.0 for docker
> >>>>>    LICENSE = "Apache-2.0"
> >>>>> -LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
> >>>>> +LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=9740d093a080530b5c5c6573df9af45a"
> >>>>>
> >>>>>    GO_IMPORT = "import"
> >>>>>
> >>>>>    S = "${WORKDIR}/git"
> >>>>>
> >>>>> -DOCKER_VERSION = "18.09.0"
> >>>>> +DOCKER_VERSION = "18.09.2"
> >>>>>    PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
> >>>>>
> >>>>>    DEPENDS = " \
> >>>>> --
> >>>>> 2.11.0
> >>>>>
> >>>> --
> >>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>>> thee at its end
> >>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>
> >
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

