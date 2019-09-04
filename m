Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 695F4E00E6B; Tue,  3 Sep 2019 23:45:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D989CE003E1
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 23:44:58 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 1256F5C005C;
	Wed,  4 Sep 2019 08:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1567579497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=15k1fNG7TUlZS5qXtk18sNYeJjIO3kziQ7miRxV1i9Q=;
	b=fZlrZWfq44N//dKFiOTDx5v2TCzplna7BAG3VfcdiwauaQGKe0xiQQn1+1lccAVqM5pLyw
	V1r0+LwQWY/5WCCnxhCA+N2lKY5MeAOUVE4m2MsefJIKOmlxBXASiR9T4GCyYw8FbDL2SX
	PInOWS16WKTkSRuVcEEGB33de7PCPyI=
MIME-Version: 1.0
Date: Wed, 04 Sep 2019 08:44:57 +0200
From: Stefan Agner <stefan@agner.ch>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4P-KE9RaS02rqZP=fmvpNoxiZPPJZ1AdJr87yiWmsLCag@mail.gmail.com>
References: <20190901203338.38768-1-stefan@agner.ch>
	<CADkTA4P-KE9RaS02rqZP=fmvpNoxiZPPJZ1AdJr87yiWmsLCag@mail.gmail.com>
Message-ID: <c84b6ed99deffe32a484fcfede7a3542@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: meta-virtualization@yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 0/6] podman: add initial recipe
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
X-List-Received-Date: Wed, 04 Sep 2019 06:45:02 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-09-03 19:20, Bruce Ashfield wrote:
> On Sun, Sep 1, 2019 at 4:34 PM Stefan Agner <stefan@agner.ch> wrote:
>>
>> From: Stefan Agner <stefan.agner@toradex.com>
>>
>> This adds Podman a daemonless container engine for developing,
>> managing, and running OCI Containers on your Linux System.
>> Containers can either be run as root or in rootless mode.
>> Simply put: `alias docker=podman`.
>>
> 
> Also nice! This was also on my list, since I've been using runc/OCI
> containers without any daemons for quite some time, and I thought this
> would make a good addition to that support.
> 
>> Currently a minimal set of features is supported. It requires
> 
> Did you have a list of those features ? It might be a good idea to
> document them in a  README, so we'll know when someone is asking for
> something that isn't supported by design.

The feature list actually grew to a bit more than minimal during
development, so "minimal" is not quite accurate. But will be a bit more
clear on what works in the next revision.

--
Stefan

> 
> Bruce
> 
>> meta-security since libseccomp seems to be mandatory.
>>
>> --
>> Stefan
>>
>> Stefan Agner (6):
>>   conmon: initial add
>>   go-metalinter: add recipe for gometalinter
>>   go-md2man: add md2man
>>   skopeo: add skopeo
>>   cni: move cni tools to /usr/lib/cni
>>   podmon: add the Pod Manager tool
>>
>>  recipes-containers/conmon/conmon_2.0.0.bb     | 30 ++++++
>>  ...ail-if-clean-is-called-without-a-bui.patch | 31 +++++++
>>  recipes-containers/cri-o/files/crio.conf      |  2 +-
>>  recipes-containers/podman/podman_git.bb       | 91 +++++++++++++++++++
>>  recipes-containers/skopeo/skopeo_git.bb       | 73 +++++++++++++++
>>  recipes-devtools/go/go-md2man_git.bb          | 20 ++++
>>  recipes-devtools/go/go-metalinter_git.bb      | 24 +++++
>>  recipes-networking/cni/cni_git.bb             |  4 +-
>>  8 files changed, 272 insertions(+), 3 deletions(-)
>>  create mode 100644 recipes-containers/conmon/conmon_2.0.0.bb
>>  create mode 100644 recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
>>  create mode 100644 recipes-containers/podman/podman_git.bb
>>  create mode 100644 recipes-containers/skopeo/skopeo_git.bb
>>  create mode 100644 recipes-devtools/go/go-md2man_git.bb
>>  create mode 100644 recipes-devtools/go/go-metalinter_git.bb
>>
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization

