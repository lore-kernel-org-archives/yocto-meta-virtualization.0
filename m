Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E9DFE00D1C; Fri,  6 Sep 2019 05:07:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00C11E00D1C
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Sep 2019 05:07:01 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id E19B45C20B5;
	Fri,  6 Sep 2019 14:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1567771619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=6rNfQeh/9gzHQ5yk1qPNm0hEAftzVvzjr2vlHEFqVWw=;
	b=AICqA+D8Z6RSnJ5U8UzPTY8Vx6SH+Id0nnXo2uCEst8tbXapfeMkyLrM7v9D9uY4oJ+n9g
	KJ+RNlNu6DDjE/ZNWpHDymlSfigHnqpyXCY6GmbcVhYOe7ttu3h/3AvI7MvAj7Kj/FemSd
	1yZ1pDQrWj/kwFWN2iJ/il5WZyG8weo=
MIME-Version: 1.0
Date: Fri, 06 Sep 2019 14:06:59 +0200
From: Stefan Agner <stefan@agner.ch>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CADkTA4PUOB3nP5oJiwxc5qAKUHboEUfiGX-Wuo0R+9k_Sjuuqg@mail.gmail.com>
References: <20190901203338.38768-1-stefan@agner.ch>
	<20190901203338.38768-6-stefan@agner.ch>
	<bfacfb8a-fba3-325c-4a20-3d918d40bfb8@windriver.com>
	<CADkTA4PUOB3nP5oJiwxc5qAKUHboEUfiGX-Wuo0R+9k_Sjuuqg@mail.gmail.com>
Message-ID: <5ab839713acc05f61a0ad9ddbfbdd14c@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 5/6] cni: move cni tools to /usr/lib/cni
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
X-List-Received-Date: Fri, 06 Sep 2019 12:07:05 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-09-03 19:28, Bruce Ashfield wrote:
> On Sun, Sep 1, 2019 at 9:33 PM ChenQi <Qi.Chen@windriver.com> wrote:
>>
>> On 09/02/2019 04:33 AM, Stefan Agner wrote:
>> > From: Stefan Agner <stefan.agner@toradex.com>
>> >
>> > Use a standard location to store the cni tools and plugins. This
>> > is more in line how other distributions package cni.
>>
>> But from what I see, at least Fedora and Ubuntu are using /opt/cni/bin
>> directory.

Fedora uses /usr/libexec/cni:
https://koji.fedoraproject.org/koji/rpminfo?rpmID=18850786

As far as I can tell there is no upstream Debian/Ubuntu package for this
yet.

Arch Linux uses /usr/lib/cni:
https://www.archlinux.org/packages/community/x86_64/cni-plugins/

I haven't seen distribution typically use /opt.

>> Also, have you tested such change with simple k8s setup which makes use
>> of these plugins? E.g. flannel?

I haven't. In fact I am not familiar with k8s setups, so this would need
me some time to understand and test...

> 
> Indeed. I haven't seen anything that looks like a standard location
> for these. I'd be interested to hear how testing went.
> 
> Is this something that we can make configurable ? That would be my
> preference, that way we can be sure to not break anyone's use case.

I guess one always can do a bbappend...?

I don't think that we can configure at runtime (E.g. have the package
manager install it into different location depending on...)

--
Stefan


> 
> Bruce
> 
>>
>> Best Regards,
>> Chen Qi
>>
>> > Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> > ---
>> >   recipes-containers/cri-o/files/crio.conf | 2 +-
>> >   recipes-networking/cni/cni_git.bb        | 4 ++--
>> >   2 files changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/recipes-containers/cri-o/files/crio.conf b/recipes-containers/cri-o/files/crio.conf
>> > index 51d7f40..dd22465 100644
>> > --- a/recipes-containers/cri-o/files/crio.conf
>> > +++ b/recipes-containers/cri-o/files/crio.conf
>> > @@ -144,4 +144,4 @@ registries = [
>> >   network_dir = "/etc/cni/net.d/"
>> >
>> >   # plugin_dir is is where CNI plugin binaries are stored.
>> > -plugin_dir = "/opt/cni/bin/"
>> > +plugin_dir = "/usr/lib/cni/"
>> > diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
>> > index 5348b95..86e5e0f 100644
>> > --- a/recipes-networking/cni/cni_git.bb
>> > +++ b/recipes-networking/cni/cni_git.bb
>> > @@ -63,7 +63,7 @@ do_compile() {
>> >   }
>> >
>> >   do_install() {
>> > -    localbindir="/opt/cni/bin"
>> > +    localbindir="${libdir}/cni/"
>> >
>> >       install -d ${D}${localbindir}
>> >       install -d ${D}/${sysconfdir}/cni/net.d
>> > @@ -72,7 +72,7 @@ do_install() {
>> >       install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
>> >   }
>> >
>> > -FILES_${PN} += "/opt/cni/bin/*"
>> > +FILES_${PN} += "${libdir}/cni/*"
>> >
>> >   INSANE_SKIP_${PN} += "ldflags already-stripped"
>> >
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 
> 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

