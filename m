Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A544E0097C; Mon,  9 Sep 2019 03:34:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D976AE008F2
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 03:34:05 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 20D265C35C1;
	Mon,  9 Sep 2019 12:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1568025244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=t/8Z8nbhwvyTpeTEAoBTq4tzUu/QvT8chYdjGpgcmtc=;
	b=tHxoHClCSHtcKh9HDpshh7KxtLwKXzNser+UP602rqB53P2cHHcu7KjO4lebqxt+O2SC+l
	PmzDeEhqLRbxYQyohefd8b6LcMlQ7qC2uDAN4joZY3VkCUgIuMbKYVAIhwZHjLw5J6nUjr
	EgmwQLARMVYZiG3mgVZ8FLaqDG9BsAE=
MIME-Version: 1.0
Date: Mon, 09 Sep 2019 12:34:04 +0200
From: Stefan Agner <stefan@agner.ch>
To: ChenQi <Qi.Chen@windriver.com>, mark.hatle@windriver.com
In-Reply-To: <9c1903af-72f6-13a8-b907-71989f119024@windriver.com>
References: <20190807011444.31930-1-Qi.Chen@windriver.com>
	<20190807011444.31930-2-Qi.Chen@windriver.com>
	<def0f1ad189d9ba70c01cac4043b4265@agner.ch>
	<9c1903af-72f6-13a8-b907-71989f119024@windriver.com>
Message-ID: <b2b76b2f2d007083f4260a1fa960fb0d@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH V2 2/2] runc: add PACKAGECONFIG to allow building as static or not
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
X-List-Received-Date: Mon, 09 Sep 2019 10:34:07 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-09-09 12:14, ChenQi wrote:
> On 09/09/2019 05:35 PM, Stefan Agner wrote:
>> Hi Chen,
>>
>> On 2019-08-07 03:14, Chen Qi wrote:
>>> Add a new PACKAGECONFIG, static, which when enabled will build
>>> runc as static. Default to enable it.
>>>
>>> We need this because we should allow users to build runc as not
>>> static so that when docker's cgroup driver is set to systemd,
>>> we don't get error.
>> Do you happen to know why we use statically linked runc by default? It
>> seems that distros nowadays use statically linked version of it.
>>
>> To some degree it seems that we overturn a distro decision here
>> (DISABLE_STATIC).
>>
>> --
>> Stefan
>>
> 
> Please refer to
> https://lists.yoctoproject.org/pipermail/meta-virtualization/2019-August/004338.html
> 

Thanks for the link!

> runc is one of those things that may need to be static in some configurations.
> Since it has security impact, updating runc (and the libc) should be done in
> paralell and this can cause problems otherwise.

Hm, I don't completely get that argument, as in OE we normally do full
image updates. So libc will be updated with runc anyways.

Also that argument you can make for every component, not sure why runc
is that special.

> 
> Now, that doesn't mean it HAS to be static, but it should be a configuration and
> may be wise to have as the default to be static.

...

> So PACKAGECONFIG is the right answer here.  I'm not sure what the right default
> for the recipe is.... but in the end the users configuration and distro can and
> should be able to select what they want.

IMHO, default should be dynamically linked since this is the default in
OE in general. Also since OE images are commonly updated as a whole and
in embedded we often care more about space saving.

Anyways, good there is a package config now, and now that I know the
reasons it is compiled statically by default I can safely flip that
switch for our distro.

--
Stefan


> Best Regards,
> Chen Qi
> 
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   ...-GOBUILDFLAGS-for-runc-and-remove-re.patch | 35 +++++++++++++++++++
>>>   ...ld-drop-recvtty-and-use-GOBUILDFLAGS.patch | 22 ------------
>>>   recipes-containers/runc/runc-docker_git.bb    |  2 +-
>>>   .../runc/runc-opencontainers_git.bb           |  1 +
>>>   recipes-containers/runc/runc.inc              | 10 ++++--
>>>   5 files changed, 45 insertions(+), 25 deletions(-)
>>>   create mode 100644
>>> recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
>>>   delete mode 100644
>>> recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
>>>
>>> diff --git
>>> a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
>>> b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
>>> new file mode 100644
>>> index 0000000..94cbb4c
>>> --- /dev/null
>>> +++
>>> b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
>>> @@ -0,0 +1,35 @@
>>> +From d2c47a973f354ffd505bb4e809c59e57b543726d Mon Sep 17 00:00:00 2001
>>> +From: Chen Qi <Qi.Chen@windriver.com>
>>> +Date: Tue, 6 Aug 2019 19:01:45 +0800
>>> +Subject: [PATCH] Makefile: respect GOBUILDFLAGS for runc and remove recvtty
>>> + from static
>>> +
>>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> +---
>>> + Makefile | 3 +--
>>> + 1 file changed, 1 insertion(+), 2 deletions(-)
>>> +
>>> +diff --git a/Makefile b/Makefile
>>> +index 0f26a1c8..a0c6b40b 100644
>>> +--- a/src/import/Makefile
>>> ++++ b/src/import/Makefile
>>> +@@ -30,7 +30,7 @@ SHELL := $(shell command -v bash 2>/dev/null)
>>> + .DEFAULT: runc
>>> +
>>> + runc: $(SOURCES)
>>> +-	$(GO) build -buildmode=pie $(EXTRA_FLAGS) -ldflags "-X
>>> main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)"
>>> -tags "$(BUILDTAGS)" -o runc .
>>> ++	$(GO) build $(GOBUILDFLAGS) $(EXTRA_FLAGS) -ldflags "-X
>>> main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)"
>>> -tags "$(BUILDTAGS)" -o runc .
>>> +
>>> + all: runc recvtty
>>> +
>>> +@@ -41,7 +41,6 @@ contrib/cmd/recvtty/recvtty: $(SOURCES)
>>> +
>>> + static: $(SOURCES)
>>> + 	CGO_ENABLED=1 $(GO) build $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo
>>> osusergo static_build" -installsuffix netgo -ldflags "-w -extldflags
>>> -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION}
>>> $(EXTRA_LDFLAGS)" -o runc .
>>> +-	CGO_ENABLED=1 $(GO) build $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo
>>> osusergo static_build" -installsuffix netgo -ldflags "-w -extldflags
>>> -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION}
>>> $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
>>> +
>>> + release:
>>> + 	script/release.sh -r release/$(VERSION) -v $(VERSION)
>>> +--
>>> +2.17.1
>>> +
>>> diff --git
>>> a/recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
>>> b/recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
>>> deleted file mode 100644
>>> index 9ba9957..0000000
>>> ---
>>> a/recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
>>> +++ /dev/null
>>> @@ -1,22 +0,0 @@
>>> -From a9a2b9e72027d0b2357f6dfe8b154762aaa8dd02 Mon Sep 17 00:00:00 2001
>>> -From: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> -Date: Thu, 19 Apr 2018 16:39:41 -0400
>>> -Subject: [PATCH] build: drop recvtty and use GOBUILDFLAGS
>>> -
>>> -Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> ----
>>> - Makefile | 3 +--
>>> - 1 file changed, 1 insertion(+), 2 deletions(-)
>>> -
>>> -Index: git/src/import/Makefile
>>> -===================================================================
>>> ---- git.orig/src/import/Makefile
>>> -+++ git/src/import/Makefile
>>> -@@ -41,7 +41,6 @@
>>> -
>>> - static: $(SOURCES)
>>> - 	CGO_ENABLED=1 $(GO) build $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo
>>> osusergo static_build" -installsuffix netgo -ldflags "-w -extldflags
>>> -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION}
>>> $(EXTRA_LDFLAGS)" -o runc .
>>> --	CGO_ENABLED=1 $(GO) build $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo
>>> osusergo static_build" -installsuffix netgo -ldflags "-w -extldflags
>>> -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION}
>>> $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
>>> -
>>> - release:
>>> - 	script/release.sh -r release/$(VERSION) -v $(VERSION)
>>> diff --git a/recipes-containers/runc/runc-docker_git.bb
>>> b/recipes-containers/runc/runc-docker_git.bb
>>> index 2bf6222..c9f460b 100644
>>> --- a/recipes-containers/runc/runc-docker_git.bb
>>> +++ b/recipes-containers/runc/runc-docker_git.bb
>>> @@ -5,7 +5,7 @@ include runc.inc
>>>   SRCREV_runc-docker = "425e105d5a03fabd737a126ad93d62a9eeede87f"
>>>   SRC_URI = "git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
>>>              file://0001-runc-Add-console-socket-dev-null.patch \
>>> -           file://0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch \
>>> +
>>> file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
>>> \
>>>              file://0001-runc-docker-SIGUSR1-daemonize.patch \
>>>             "
>>>   diff --git a/recipes-containers/runc/runc-opencontainers_git.bb
>>> b/recipes-containers/runc/runc-opencontainers_git.bb
>>> index 76ab794..361bc94 100644
>>> --- a/recipes-containers/runc/runc-opencontainers_git.bb
>>> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
>>> @@ -3,5 +3,6 @@ include runc.inc
>>>   SRCREV = "652297c7c7e6c94e8d064ad5916c32891a6fd388"
>>>   SRC_URI = " \
>>>       git://github.com/opencontainers/runc;branch=master \
>>> +    file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
>>>       "
>>>   RUNC_VERSION = "1.0.0-rc8"
>>> diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
>>> index 46fd09d..41ea41b 100644
>>> --- a/recipes-containers/runc/runc.inc
>>> +++ b/recipes-containers/runc/runc.inc
>>> @@ -14,8 +14,10 @@ inherit go
>>>   inherit goarch
>>>   inherit pkgconfig
>>>   -PACKAGECONFIG ??= ""
>>> +PACKAGECONFIG ??= "static"
>>>   PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
>>> +# This PACKAGECONFIG serves the purpose of whether building runc as
>>> static or not
>>> +PACKAGECONFIG[static] = ""
>>>     PROVIDES += "virtual/runc"
>>>   RPROVIDES_${PN} = "virtual/runc"
>>> @@ -54,7 +56,11 @@ do_compile() {
>>>   	export CFLAGS=""
>>>   	export LDFLAGS=""
>>>   -	oe_runmake static
>>> +	if ${@bb.utils.contains('PACKAGECONFIG', 'static', 'true', 'false', d)}; then
>>> +		oe_runmake static
>>> +	else
>>> +		oe_runmake runc
>>> +	fi
>>>   }
>>>     do_install() {
>>> -- 2.17.1

