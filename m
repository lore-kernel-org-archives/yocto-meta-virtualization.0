Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28B00E00C46; Fri, 30 Aug 2019 07:17:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1706E00BFF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 07:17:05 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id C45D25C259A;
	Fri, 30 Aug 2019 16:17:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1567174623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=25Ocs5NFPCG0VLQVNIFFb1Uouw/jbQqaIoJPxBeSdYg=;
	b=edtZroC78PEOGb/tMvQx98I9tvpwemG4jSkIfIkT0ZFgRMxNOYIa/770bj5RlCB/9x1SEp
	VE/SZkkhOpoD8cyoOrtw9hysUnH5uZNZbrwI6oP7/V6w99vlXo98cTiJK1e78ArVwyNwXq
	R9CyrYj4QGW9pCveCjbqfDQdpbMqMBA=
MIME-Version: 1.0
Date: Fri, 30 Aug 2019 16:17:03 +0200
From: Stefan Agner <stefan@agner.ch>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4M53CGL7U8_XV0KAYmSFgt8qg1vLmNsnjpH6YGOP2WkCQ@mail.gmail.com>
References: <20190830113203.49678-1-stefan@agner.ch>
	<20190830113203.49678-3-stefan@agner.ch>
	<CADkTA4Pvxdk3bzOo2xP4-SUGwF=EeCnq9yAo3egeKrT9iO8sKg@mail.gmail.com>
	<8787b716780bd9bf5c28b65af35298d6@agner.ch>
	<CADkTA4M53CGL7U8_XV0KAYmSFgt8qg1vLmNsnjpH6YGOP2WkCQ@mail.gmail.com>
Message-ID: <8f0ed242746f462b8c696b68ac7e6286@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
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
X-List-Received-Date: Fri, 30 Aug 2019 14:17:08 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-08-30 15:24, Bruce Ashfield wrote:
> On Fri, Aug 30, 2019 at 9:03 AM Stefan Agner <stefan@agner.ch> wrote:
>>
>> On 2019-08-30 14:42, Bruce Ashfield wrote:
>> > On Fri, Aug 30, 2019 at 7:36 AM Stefan Agner <stefan@agner.ch> wrote:
>> >>
>> >> From: Stefan Agner <stefan.agner@toradex.com>
>> >>
>> >> Use the docker/engine fork of moby which provides a stabilized version
>> >> of moby in its 19.03 branch.
>> >
>> > I've mentioned before, this recipe really is going to stay on moby,
>> > not a curated version of moby or anything like that.
>>
>> Hm, I guess you refer to:
>> https://lists.yoctoproject.org/pipermail/meta-virtualization/2019-March/004068.html
>>
>> Generally I see your argumentation, and I think it is good to try to
>> build a recipe which tracks Dockers upstream projects.
>>
>> However, I really don't think its a good idea to build from moby
>> directly since it has no proper release process.
> 
> That's actually what the point of that recipe is, it's tracking -dev completely.
> 

Ok.

>>
>> IMHO, moby is more -dev branch rather than anything a OE recipe should
>> rely on. I tried first finding what matches best the Docker version
>> "19.03.2-rc1" in Moby, but since this is really a development branch its
>> not possible to pick a matching (or close to matching) git commit.
>>
>> docker/engine is really just a fork with a proper release process. We
>> get cli and libnetwork also from the Docker company repos...
> 
> Yes, but there's docker-ce for folks that want to follow all the
> docker repos. I don't actually think we need the cli/libnetwork in
> that recipe anymore, but I haven't had
> time to experiment.
> 

Hm, yeah I was wondering about that too. But should be looked at
properly I guess.

>>
>> The fact that this recipe has the name "docker" and follows the docker
>> versioning, I really think it is more reasonable to track
>> https://github.com/docker/engine.
> 
> Yah, that is a problem. I need to just get on with it and rename the
> recipe moby. I said I was going to do it in the spring, but perhaps
> I'll just do it this weekend instead.
> 
> The problem is, a lot of things (and layers I don't know about)
> currently depend on "docker" not "virtual/docker" as I mentioned in my
> various other email, so I really need to create a 3rd recipe that
> follows the docker engine .. but it really is just a placeholder,
> since it isn't different than docker-ce on any significant level.  It
> probably leaves me as the only 'moby' user at that point, but that's
> ok too :D
> 
> i.e. I'd end up with "moby", "docker" and "docker-ce".
> 
> I could do that for the fall release and then clean things up in the spring.
> 
> Comments ? How does that sound ?
> 

Yes I really think the naming would resolve this confusion nicely. I
agree splitting up to moby, docker and docker-ce seems sensible.

>>
>> Btw, the reason I started investigate was that I see quite often errors
>> like this with the current version:
>> docker: Error response from daemon: OCI runtime create failed:
>> container_linux.go:345: starting container process caused
>> "process_linux.go:299: copying bootstrap data to pipe caused \"write
>> init-p: broken pipe\"": unknown.
> 
> Hmmm. I've never seen that here and I tend to stress things pretty
> heavily in the systems that I build. I assume you aren't seeing it
> with docker-ce ?

I was not able to find a command (combination) which makes it always
reproducible, so it seems to be a race condition of some sort. I haven't
tested with docker-ce. I think I mostly saw it on our lower end devices
(Cortex-A7). 

Given we are dealing with a pre-release I thought its not worth further
investigate but just move to the release and then keep an eye on it.

--
Stefan

> 
> Bruce
> 
>>
>> --
>> Stefan
>>
>>
>>
>> >
>> > I already have some queued updated to docker here, so I'll take care
>> > of updating this recipe and stack your other patches on top.
>> >
>> > Bruce
>> >
>> >>
>> >> Bump all git hashes to what is used in Docker CE v19.03.2-rc1.
>> >> The SRCREVs are selected through an audit of moby and docker-ce to
>> >> synchronize the build points for the various components.
>> >>
>> >> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> >> ---
>> >>  recipes-containers/docker/docker_git.bb | 8 ++++----
>> >>  1 file changed, 4 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
>> >> index e45f87e..3892c65 100644
>> >> --- a/recipes-containers/docker/docker_git.bb
>> >> +++ b/recipes-containers/docker/docker_git.bb
>> >> @@ -35,11 +35,11 @@ DESCRIPTION = "Linux container runtime \
>> >>  #     to a docker.inc recipe
>> >>
>> >>  # moby commit matches the docker-ce swarmkit bump on the 18.09 branch
>> >> -SRCREV_moby = "344b093258fcb2195fa393081e5224a6c766c798"
>> >> +SRCREV_moby = "ed20165a37b40ff1cfbe55e218344c5e89f30ee2"
>> >>  SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
>> >> -SRCREV_cli = "2f1931f9eb2d6bac2efd48d94739f2e9919d4d7d"
>> >> +SRCREV_cli = "578ab52ece34b084621954e0b543003410cdbe84"
>> >>  SRC_URI = "\
>> >> -       git://github.com/moby/moby.git;nobranch=1;name=moby \
>> >> +       git://github.com/docker/engine.git;branch=19.03;name=moby \
>> >>         git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork \
>> >>         git://github.com/docker/cli;branch=19.03;name=cli;destsuffix=git/cli \
>> >>         file://docker.init \
>> >> @@ -57,7 +57,7 @@ GO_IMPORT = "import"
>> >>
>> >>  S = "${WORKDIR}/git"
>> >>
>> >> -DOCKER_VERSION = "19.03.0-rc3"
>> >> +DOCKER_VERSION = "19.03.2-rc1"
>> >>  PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
>> >>
>> >>  PACKAGES =+ "${PN}-contrib"
>> >> --
>> >> 2.20.1
>> >>
>> >> --
>> >> _______________________________________________
>> >> meta-virtualization mailing list
>> >> meta-virtualization@yoctoproject.org
>> >> https://lists.yoctoproject.org/listinfo/meta-virtualization

