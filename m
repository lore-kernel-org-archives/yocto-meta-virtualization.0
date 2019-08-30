Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59C36E00E0A; Fri, 30 Aug 2019 06:24:44 -0700 (PDT)
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
	*      [209.85.208.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E449E00C4F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 06:24:42 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id l14so6465945ljj.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 06:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KonvKqpLVWAqoqY4/4rmbGn0ssPX4zXHwTkqtfzO/yI=;
	b=EET5SL9z70AoqwsFnSWlJrsoUHSGJ3UYtELDitgofWV3tBIz/VSWHp/rmldFL9QOay
	OhUNZMa5FPdgE3lKxXObFg7MELfIE8kD6cKkVXzMIWcaZYqLo6gZKukCUkTJOJ3rdUnn
	ddZeosSoFTkuaX+JqROCxEcra02Z7heXvjKh43cO8jwl6Z5ltpCF3p/UYjBMcWDitshN
	nqL1TykAMVCgBAz/hWrR+GWFOJJLU5J1TDi2WMJwvpiiDwstUeVXEBMS8o9iCnARb+C7
	cxg7nFtaiH9EEM8WTBsJdg+M0s1/Xc6QOR3YHHybay88C2hljiOUEwJqMKF/9QG1WuD+
	EdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KonvKqpLVWAqoqY4/4rmbGn0ssPX4zXHwTkqtfzO/yI=;
	b=Scoxzw7wMjwcBMeJNrYDkbsWX691nZ0uykW3axlp62/VS671fK6OC+7ceJu8AGMdyY
	g5kjGgQY8QYYAsJFs3WbbwneJX+nZWPKMuw9U4sUlw3WWIP/9DGUj2P/CpYHxQjbNqIM
	sj5ZWYyOhABCaeIJZeOSCn/OsLlvJO1TKmDUqoS0BssY27iGWhSvn+I5v53dQKVyqfF9
	oJgksUEDbp9LZyWehvxcxbaWWecXaHRzAS5P57VHG0J4UxynxJThpdqwUO1KooDdyemn
	MXQnqFv0tcJlGyXWSxRX7pFVP1++PQh/VdPJwA6mC2Gh8atzkQS+D6ks/tjiIM0cjUhf
	dWzg==
X-Gm-Message-State: APjAAAUFxigZy0QAHVxa0Yqeve+BvkA356YMIoT4ybwNPwRSFd1tSkzP
	QA+uiGvOSbZso7tYAYNzvYq4Wx77uFdao/cWopo=
X-Google-Smtp-Source: APXvYqyQ3LGtgwEqrJXMf/6J8ICnz8dyjBgk7+skQSuYAxUDS7gzSxXfwXERlqjq2bEuiaadc+ACCGotwOhOfl773dg=
X-Received: by 2002:a2e:9214:: with SMTP id k20mr8135300ljg.232.1567171481721; 
	Fri, 30 Aug 2019 06:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190830113203.49678-1-stefan@agner.ch>
	<20190830113203.49678-3-stefan@agner.ch>
	<CADkTA4Pvxdk3bzOo2xP4-SUGwF=EeCnq9yAo3egeKrT9iO8sKg@mail.gmail.com>
	<8787b716780bd9bf5c28b65af35298d6@agner.ch>
In-Reply-To: <8787b716780bd9bf5c28b65af35298d6@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 09:24:30 -0400
Message-ID: <CADkTA4M53CGL7U8_XV0KAYmSFgt8qg1vLmNsnjpH6YGOP2WkCQ@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 3/3] docker: update to v19.03.2-rc1
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
X-List-Received-Date: Fri, 30 Aug 2019 13:24:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 30, 2019 at 9:03 AM Stefan Agner <stefan@agner.ch> wrote:
>
> On 2019-08-30 14:42, Bruce Ashfield wrote:
> > On Fri, Aug 30, 2019 at 7:36 AM Stefan Agner <stefan@agner.ch> wrote:
> >>
> >> From: Stefan Agner <stefan.agner@toradex.com>
> >>
> >> Use the docker/engine fork of moby which provides a stabilized version
> >> of moby in its 19.03 branch.
> >
> > I've mentioned before, this recipe really is going to stay on moby,
> > not a curated version of moby or anything like that.
>
> Hm, I guess you refer to:
> https://lists.yoctoproject.org/pipermail/meta-virtualization/2019-March/004068.html
>
> Generally I see your argumentation, and I think it is good to try to
> build a recipe which tracks Dockers upstream projects.
>
> However, I really don't think its a good idea to build from moby
> directly since it has no proper release process.

That's actually what the point of that recipe is, it's tracking -dev completely.

>
> IMHO, moby is more -dev branch rather than anything a OE recipe should
> rely on. I tried first finding what matches best the Docker version
> "19.03.2-rc1" in Moby, but since this is really a development branch its
> not possible to pick a matching (or close to matching) git commit.
>
> docker/engine is really just a fork with a proper release process. We
> get cli and libnetwork also from the Docker company repos...

Yes, but there's docker-ce for folks that want to follow all the
docker repos. I don't actually think we need the cli/libnetwork in
that recipe anymore, but I haven't had
time to experiment.

>
> The fact that this recipe has the name "docker" and follows the docker
> versioning, I really think it is more reasonable to track
> https://github.com/docker/engine.

Yah, that is a problem. I need to just get on with it and rename the
recipe moby. I said I was going to do it in the spring, but perhaps
I'll just do it this weekend instead.

The problem is, a lot of things (and layers I don't know about)
currently depend on "docker" not "virtual/docker" as I mentioned in my
various other email, so I really need to create a 3rd recipe that
follows the docker engine .. but it really is just a placeholder,
since it isn't different than docker-ce on any significant level.  It
probably leaves me as the only 'moby' user at that point, but that's
ok too :D

i.e. I'd end up with "moby", "docker" and "docker-ce".

I could do that for the fall release and then clean things up in the spring.

Comments ? How does that sound ?

>
> Btw, the reason I started investigate was that I see quite often errors
> like this with the current version:
> docker: Error response from daemon: OCI runtime create failed:
> container_linux.go:345: starting container process caused
> "process_linux.go:299: copying bootstrap data to pipe caused \"write
> init-p: broken pipe\"": unknown.

Hmmm. I've never seen that here and I tend to stress things pretty
heavily in the systems that I build. I assume you aren't seeing it
with docker-ce ?

Bruce

>
> --
> Stefan
>
>
>
> >
> > I already have some queued updated to docker here, so I'll take care
> > of updating this recipe and stack your other patches on top.
> >
> > Bruce
> >
> >>
> >> Bump all git hashes to what is used in Docker CE v19.03.2-rc1.
> >> The SRCREVs are selected through an audit of moby and docker-ce to
> >> synchronize the build points for the various components.
> >>
> >> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> >> ---
> >>  recipes-containers/docker/docker_git.bb | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> >> index e45f87e..3892c65 100644
> >> --- a/recipes-containers/docker/docker_git.bb
> >> +++ b/recipes-containers/docker/docker_git.bb
> >> @@ -35,11 +35,11 @@ DESCRIPTION = "Linux container runtime \
> >>  #     to a docker.inc recipe
> >>
> >>  # moby commit matches the docker-ce swarmkit bump on the 18.09 branch
> >> -SRCREV_moby = "344b093258fcb2195fa393081e5224a6c766c798"
> >> +SRCREV_moby = "ed20165a37b40ff1cfbe55e218344c5e89f30ee2"
> >>  SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
> >> -SRCREV_cli = "2f1931f9eb2d6bac2efd48d94739f2e9919d4d7d"
> >> +SRCREV_cli = "578ab52ece34b084621954e0b543003410cdbe84"
> >>  SRC_URI = "\
> >> -       git://github.com/moby/moby.git;nobranch=1;name=moby \
> >> +       git://github.com/docker/engine.git;branch=19.03;name=moby \
> >>         git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork \
> >>         git://github.com/docker/cli;branch=19.03;name=cli;destsuffix=git/cli \
> >>         file://docker.init \
> >> @@ -57,7 +57,7 @@ GO_IMPORT = "import"
> >>
> >>  S = "${WORKDIR}/git"
> >>
> >> -DOCKER_VERSION = "19.03.0-rc3"
> >> +DOCKER_VERSION = "19.03.2-rc1"
> >>  PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
> >>
> >>  PACKAGES =+ "${PN}-contrib"
> >> --
> >> 2.20.1
> >>
> >> --
> >> _______________________________________________
> >> meta-virtualization mailing list
> >> meta-virtualization@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

