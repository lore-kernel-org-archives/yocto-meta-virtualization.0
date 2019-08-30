Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFCDFE00D89; Fri, 30 Aug 2019 06:03:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C8E6E0082A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 06:03:13 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 1002A5C01D2;
	Fri, 30 Aug 2019 15:03:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1567170191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Ayu7QH6I77OoYzFudzpO478l7XZrEpIL9pAd2DBV8Xg=;
	b=kynI+XYgUf70BhnFhkdf9kr9b/xRrgrr1o9PNqk39WMhxZUiPHXlIRtF0rxtwvwXKBdrkJ
	T0bwm1h2WwHAAjUZ+eemHEYzivernPGfi9iHsi1yQtCFqxnkkltoBtPm9DOgaGQ54JwRgp
	U1wz+1GSINv5neeGqGm6peiXJjHgF/4=
MIME-Version: 1.0
Date: Fri, 30 Aug 2019 15:03:11 +0200
From: Stefan Agner <stefan@agner.ch>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4Pvxdk3bzOo2xP4-SUGwF=EeCnq9yAo3egeKrT9iO8sKg@mail.gmail.com>
References: <20190830113203.49678-1-stefan@agner.ch>
	<20190830113203.49678-3-stefan@agner.ch>
	<CADkTA4Pvxdk3bzOo2xP4-SUGwF=EeCnq9yAo3egeKrT9iO8sKg@mail.gmail.com>
Message-ID: <8787b716780bd9bf5c28b65af35298d6@agner.ch>
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
X-List-Received-Date: Fri, 30 Aug 2019 13:03:14 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-08-30 14:42, Bruce Ashfield wrote:
> On Fri, Aug 30, 2019 at 7:36 AM Stefan Agner <stefan@agner.ch> wrote:
>>
>> From: Stefan Agner <stefan.agner@toradex.com>
>>
>> Use the docker/engine fork of moby which provides a stabilized version
>> of moby in its 19.03 branch.
> 
> I've mentioned before, this recipe really is going to stay on moby,
> not a curated version of moby or anything like that.

Hm, I guess you refer to:
https://lists.yoctoproject.org/pipermail/meta-virtualization/2019-March/004068.html

Generally I see your argumentation, and I think it is good to try to
build a recipe which tracks Dockers upstream projects.

However, I really don't think its a good idea to build from moby
directly since it has no proper release process.

IMHO, moby is more -dev branch rather than anything a OE recipe should
rely on. I tried first finding what matches best the Docker version
"19.03.2-rc1" in Moby, but since this is really a development branch its
not possible to pick a matching (or close to matching) git commit.

docker/engine is really just a fork with a proper release process. We
get cli and libnetwork also from the Docker company repos...

The fact that this recipe has the name "docker" and follows the docker
versioning, I really think it is more reasonable to track
https://github.com/docker/engine.

Btw, the reason I started investigate was that I see quite often errors
like this with the current version:
docker: Error response from daemon: OCI runtime create failed:
container_linux.go:345: starting container process caused
"process_linux.go:299: copying bootstrap data to pipe caused \"write
init-p: broken pipe\"": unknown.

--
Stefan



> 
> I already have some queued updated to docker here, so I'll take care
> of updating this recipe and stack your other patches on top.
> 
> Bruce
> 
>>
>> Bump all git hashes to what is used in Docker CE v19.03.2-rc1.
>> The SRCREVs are selected through an audit of moby and docker-ce to
>> synchronize the build points for the various components.
>>
>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> ---
>>  recipes-containers/docker/docker_git.bb | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
>> index e45f87e..3892c65 100644
>> --- a/recipes-containers/docker/docker_git.bb
>> +++ b/recipes-containers/docker/docker_git.bb
>> @@ -35,11 +35,11 @@ DESCRIPTION = "Linux container runtime \
>>  #     to a docker.inc recipe
>>
>>  # moby commit matches the docker-ce swarmkit bump on the 18.09 branch
>> -SRCREV_moby = "344b093258fcb2195fa393081e5224a6c766c798"
>> +SRCREV_moby = "ed20165a37b40ff1cfbe55e218344c5e89f30ee2"
>>  SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
>> -SRCREV_cli = "2f1931f9eb2d6bac2efd48d94739f2e9919d4d7d"
>> +SRCREV_cli = "578ab52ece34b084621954e0b543003410cdbe84"
>>  SRC_URI = "\
>> -       git://github.com/moby/moby.git;nobranch=1;name=moby \
>> +       git://github.com/docker/engine.git;branch=19.03;name=moby \
>>         git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork \
>>         git://github.com/docker/cli;branch=19.03;name=cli;destsuffix=git/cli \
>>         file://docker.init \
>> @@ -57,7 +57,7 @@ GO_IMPORT = "import"
>>
>>  S = "${WORKDIR}/git"
>>
>> -DOCKER_VERSION = "19.03.0-rc3"
>> +DOCKER_VERSION = "19.03.2-rc1"
>>  PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
>>
>>  PACKAGES =+ "${PN}-contrib"
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization

