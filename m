Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57BCCE009D4; Thu,  3 Oct 2019 06:41:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7FE5DE00867
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Oct 2019 06:41:06 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id D088B5C0A54;
	Thu,  3 Oct 2019 15:41:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1570110064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=bg7BHdUWCNpSRX6ffBRdaBuDwG6alfP0JK4eO/ggS/8=;
	b=CzCwzHsR+z7mZevK5UyT47ay3ZQiLOKsNo6rOxqlXBSlOqi5LVzmPlf0Vu6atdS7wb3N3f
	KJxinQbCOonwDZRZF1JXUGXhfjzu9B2rL/fKDxoRyu6lCTNbc95g2DeK7vTr1qCshuz1aO
	K9QKexOVZ+W4NyRKg/kaFZLKXuxmdn0=
MIME-Version: 1.0
Date: Thu, 03 Oct 2019 15:41:04 +0200
From: Stefan Agner <stefan@agner.ch>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4N2vdQu5coA5y1goibwNSXHc78x-Lsmb3E04B8JFxb9LQ@mail.gmail.com>
References: <20190920071807.13139-1-stefan@agner.ch>
	<20190926143711.GC9611@gmail.com>
	<CADkTA4N2vdQu5coA5y1goibwNSXHc78x-Lsmb3E04B8JFxb9LQ@mail.gmail.com>
Message-ID: <65dc5c6826f0a2628d535c70acd20a41@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH v2 0/7] podman: add initial recipe
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
X-List-Received-Date: Thu, 03 Oct 2019 13:41:08 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-10-03 15:23, Bruce Ashfield wrote:
> On Thu, Sep 26, 2019 at 10:37 AM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>>
>>
>> In message: [meta-virtualization] [PATCH v2 0/7] podman: add initial recipe
>> on 20/09/2019 Stefan Agner wrote:
>>
>> > From: Stefan Agner <stefan.agner@toradex.com>
>> >
>> > This adds Podman a daemonless container engine for developing,
>> > managing, and running OCI Containers on your Linux System.
>> > Containers can either be run as root or in rootless mode.
>> > Simply put: `alias docker=podman`.
>> >
>> > Currently the build tags systemd (if in DISTRO_FEATURES),
>> > seccomp, varlink and remoteclient are enabled which allows to
>> > run podman with overlayfs as root and vfs in rootless mode.
>> > The storage drivers btrfs and device-mapper have not been
>> > tested and are disabled at the moment.
>> >
>> > --
>> > Stefan
>> >
>> > Changes in v2:
>> > - Add slirp4netns recipe for rootless networking support
>> > - Fix podman recipe to build properly (set GOARCH properly)
>> > - Fix podman recipe commit message and comments
>> > - Add varlink and remoteclient to build tags
>> > - Move cni binaries to /usr/libexec/cni and create symlink for /opt/cni/bin
>>
>>
>> FYI: I have this queued and under test. I'll follow up to the
>> individual patches if i have questions or issues that I can't fix
>> myself.
> 
> I just pushed the queue this morning. I stacked some commits on top to
> tweak things a bit, but otherwise, they are as sent in this series.
> 
> I wasn't able to fully test podman due to a CNI networking issue, so
> if you have a podman setup or log, I wouldn't mind seeing it so I can
> run some additional tests.

If it is just network, this should run:
podman run -it --net=none registry.hub.docker.com/arm32v7/debian:buster 

I remember I had also issues with networking at first and had to enable
some kernel configs which were missing in my config, maybe related to
that in your case as well?

CONFIG_MACVLAN=m
CONFIG_MACVTAP=m
CONFIG_VXLAN=m
CONFIG_IPVLAN=m

CONFIG_TUN=m
CONFIG_TAP=m
CONFIG_NLMON=m

CONFIG_BRIDGE_VLAN_FILTERING=y


Also I had to disable static building for proper cgroup support and add
seccomp by overwriting runc PACKAGECONFIG:

PACKAGECONFIG_pn-${PREFERRED_PROVIDER_virtual/runc} = "seccomp"

I will do some builds and tests with latest meta-virtualization.

--
Stefan


> 
> Bruce
> 
>>
>> Bruce
>>
>> >
>> > Stefan Agner (7):
>> >   conmon: initial add
>> >   go-metalinter: add recipe for gometalinter
>> >   go-md2man: add md2man
>> >   skopeo: add skopeo
>> >   cni: move cni tools to /usr/libexec/cni
>> >   slirp4netns: add slirp4netns user-mode networking
>> >   podman: add the Pod Manager tool
>> >
>> >  recipes-containers/conmon/conmon_2.0.0.bb     | 30 ++++++
>> >  ...ail-if-clean-is-called-without-a-bui.patch | 31 +++++++
>> >  recipes-containers/cri-o/files/crio.conf      |  2 +-
>> >  recipes-containers/podman/podman_git.bb       | 93 +++++++++++++++++++
>> >  recipes-containers/skopeo/skopeo_git.bb       | 73 +++++++++++++++
>> >  recipes-devtools/go/go-md2man_git.bb          | 20 ++++
>> >  recipes-devtools/go/go-metalinter_git.bb      | 24 +++++
>> >  recipes-networking/cni/cni_git.bb             |  8 +-
>> >  .../slirp4netns/slirp4netns_0.4.1.bb          | 16 ++++
>> >  9 files changed, 294 insertions(+), 3 deletions(-)
>> >  create mode 100644 recipes-containers/conmon/conmon_2.0.0.bb
>> >  create mode 100644 recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
>> >  create mode 100644 recipes-containers/podman/podman_git.bb
>> >  create mode 100644 recipes-containers/skopeo/skopeo_git.bb
>> >  create mode 100644 recipes-devtools/go/go-md2man_git.bb
>> >  create mode 100644 recipes-devtools/go/go-metalinter_git.bb
>> >  create mode 100644 recipes-networking/slirp4netns/slirp4netns_0.4.1.bb
>> >
>> > --
>> > 2.20.1
>> >
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization

