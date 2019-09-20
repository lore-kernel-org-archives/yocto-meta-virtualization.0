Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72AB5E00D82; Fri, 20 Sep 2019 00:16:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3538CE0097C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Sep 2019 00:16:15 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id EA4725C0623;
	Fri, 20 Sep 2019 09:16:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1568963774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=RLZJaMkqLmTXl9pdqMlsaC263mFXYJFWe9gdvRzgQX8=;
	b=PNFJO9uyaei6oZu4r0C7o9vZ/vdXSB9F9s2YWjgLkc2vhhCUcbnr7B+WjrXvbhfs99ZlyS
	GRaZl+AANMouSp6fX36wAGkyhGCkw9Ct6vEe9GTZ07QeMV87TWvxhHMUXeHl8kxy8NRQ4j
	knsVa63t2kj+8ut9A7h1Tl7EK/EW5TQ=
MIME-Version: 1.0
Date: Fri, 20 Sep 2019 09:16:13 +0200
From: Stefan Agner <stefan@agner.ch>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4M5cj=8XOjP=nri6Sec8nP1xY-zmcvaE92rUyS__PWkCg@mail.gmail.com>
References: <20190918075841.2099-1-stefan@agner.ch>
	<20190918075841.2099-2-stefan@agner.ch>
	<CADkTA4M5cj=8XOjP=nri6Sec8nP1xY-zmcvaE92rUyS__PWkCg@mail.gmail.com>
Message-ID: <adb2efc6a91bdc474164ba7b53a97f9b@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH v2 2/2] docker-ce: update to v19.03.2
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
X-List-Received-Date: Fri, 20 Sep 2019 07:16:18 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-09-18 19:52, Bruce Ashfield wrote:
> On Wed, Sep 18, 2019 at 3:59 AM Stefan Agner <stefan@agner.ch> wrote:
>>
>> From: Stefan Agner <stefan.agner@toradex.com>
>>
>> Bump the git hashes to Docker CE v19.03.2.
>>
>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> ---
>> Changes in v2:
>> - Bump to v19.03.2 final release
>> - Drop docker (non-ce) recipe patch as that recipe can not be bumped to a
>>   Docker stable patch release
> 
> Ack'd. I'll take care of the moby recipe shortly. I've pulled this in
> for testing.

Thx. Just FYI, this recipe currently does not build. So it would be nice
to have this fixed soon.

--
Stefan

> 
> Bruce
> 
>>
>>  recipes-containers/docker/docker-ce_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
>> index 215f114..52b146d 100644
>> --- a/recipes-containers/docker/docker-ce_git.bb
>> +++ b/recipes-containers/docker/docker-ce_git.bb
>> @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
>>   subtle and/or glaring issues. \
>>   "
>>
>> -SRCREV_docker = "2416d7f930859912c883f964b1cee6909635f951"
>> +SRCREV_docker = "6a30dfca03664a0b6bf0646a7d389ee7d0318e6e"
>>  SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
>>  SRC_URI = "\
>>         git://github.com/docker/docker-ce.git;branch=19.03;name=docker \
>> @@ -38,7 +38,7 @@ GO_IMPORT = "import"
>>
>>  S = "${WORKDIR}/git"
>>
>> -DOCKER_VERSION = "19.03.0-rc3-ce"
>> +DOCKER_VERSION = "19.03.2-ce"
>>  PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
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

