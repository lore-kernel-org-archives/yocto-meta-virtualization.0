Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF1BDE00DEB; Tue, 10 Sep 2019 16:13:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.214.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E00A5E00DE4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2019 16:13:29 -0700 (PDT)
Received: by mail-pl1-f195.google.com with SMTP id f19so9275877plr.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2019 16:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=APpXGudCopTtBGoDzJx9TpdlcOnaqDj2B4cp3Cg1dnk=;
	b=NvhKhZP5BkXc0Hr5Govm8C6UHK5FnlVsofN9FvGfNpfLJInc0nerLMEuz3UgeJXm2q
	kV4QdmvD2ayMjy+VnDyXfRWzNwu4gB2Lkax0sFoW2hcsRquvZBOQKc+I+8+puDrnwIMt
	F9PxwCYyaIR402vGvSmAQsN/UYVcrlNWLIw9yJuQPsneMPjvs9p/TWB3alF9opgQtUhK
	EavMTJDcDViqM4rd4PJoDysTGIbD9Ma386loqX1XIc8t+i4dhVvkVhhWBto4R0T2wr2n
	ks/2MJ0VKghcCE4paFGewZ0rnfIkwZQuLemiMPTw78P5WgJOari9bCTKG08W1ER7BL/Q
	N9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=APpXGudCopTtBGoDzJx9TpdlcOnaqDj2B4cp3Cg1dnk=;
	b=tse0D79lSasduSAtobCev3dkHAi9yq5LRDpyIiOcNADsNAxddIRMDf3oTO8ObhpgJS
	f64ok8qbtuSmrezjPmTYuzkQ1DDI73tQtRv2NSPEXBIhO3096Wf+yP3pMUz5Gcgex5ni
	/5OLhmzFOnmhCUiy6zIc0DNzxS2U2bwhtNBi+7ifnGftG8dRNN4pqDNPY3GfAkALQ9Pa
	bXhJKSSxEqYSXI5zmkRvVfx40DzBtFf0NyW0F7gv/buwoqN76UeY52+RzLOnHQdgJfMO
	RymGh2iC1AFMEPQJM9Nik0GuupCk4NpOXYPpoeSziyp2I6KScsW2CvO7jNvsRwsHyNGP
	akYA==
X-Gm-Message-State: APjAAAW5fknpA+fTTax0NX0un2cmpIqHU319O69QEWvJ6knAVWo2BDoc
	DeUKNfP2e/aq6Gh4YVxTUNOTxA==
X-Google-Smtp-Source: APXvYqzy2qe3X7nTqCF61qu+VV36Q/FIgDTQ4mMHDqd/mbF+r48cIU0w9915yNwbd75td2f3exucYQ==
X-Received: by 2002:a17:902:8602:: with SMTP id
	f2mr34260576plo.235.1568157209231; 
	Tue, 10 Sep 2019 16:13:29 -0700 (PDT)
Received: from [10.20.245.11] ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	h11sm16717497pgv.5.2019.09.10.16.13.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Sep 2019 16:13:28 -0700 (PDT)
To: Stefan Agner <stefan@agner.ch>, Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20190901203338.38768-1-stefan@agner.ch>
	<20190901203338.38768-7-stefan@agner.ch>
	<CADkTA4PFq2jB5P=ddSz3uix2yiQHTP83L1HG+GEvZOp+5p3fEQ@mail.gmail.com>
	<0419a9fd20ad8432e59738bf375386c3@agner.ch>
From: akuster <akuster@mvista.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster@mvista.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <9ce0198c-235f-da98-e73a-288c393c5f10@mvista.com>
Date: Tue, 10 Sep 2019 16:13:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0419a9fd20ad8432e59738bf375386c3@agner.ch>
Cc: meta-virtualization@yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 6/6] podmon: add the Pod Manager tool
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
X-List-Received-Date: Tue, 10 Sep 2019 23:13:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/9/19 2:30 PM, Stefan Agner wrote:
> On 2019-09-03 19:26, Bruce Ashfield wrote:
>> I'm assuming the subject should be "podman" and not "podmon".
Hey, Maybe he is from Jamaica mon ; )
> Whoops, thanks for pointing out.
>
>> On Sun, Sep 1, 2019 at 4:34 PM Stefan Agner <stefan@agner.ch> wrote:
>>> From: Stefan Agner <stefan.agner@toradex.com>
>>>
>>> Podman is a daemonless container engine for developing, managing, and
>>> running OCI Containers on your Linux System. Containers can either be
>>> run as root or in rootless mode.
>>>
>>> This patch adds the initial recipe for podman. Currently a minimal
>>> feature set is supported. It seems that libseccomp is mandatory, which
>>> makes meta-security a mandatory dependency for this recipe.
>>>
>>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>>> ---
>>>  recipes-containers/podman/podman_git.bb | 91 +++++++++++++++++++++++++
>>>  1 file changed, 91 insertions(+)
>>>  create mode 100644 recipes-containers/podman/podman_git.bb
>>>
>>> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
>>> new file mode 100644
>>> index 0000000..6f4e7d4
>>> --- /dev/null
>>> +++ b/recipes-containers/podman/podman_git.bb
>>> @@ -0,0 +1,91 @@
>>> +HOMEPAGE = "https://podman.io/"
>>> +SUMMARY =  "A daemonless container engine"
>>> +DESCRIPTION = "Podman is a daemonless container engine for developing, \
>>> +    managing, and running OCI Containers on your Linux System. Containers can \
>>> +    either be run as root or in rootless mode. Simply put: \
>>> +    `alias docker=podman`. \
>>> +    "
>>> +
>>> +DEPENDS = " \
>>> +    go-metalinter-native \
>>> +    go-md2man-native \
>>> +    gpgme \
>>> +    libseccomp \
>>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>>> +"
>>> +
>>> +SRCREV = "00057929f5acfd98341964d85722383363376d52"
>>> +SRC_URI = " \
>>> +    git://github.com/containers/libpod.git;branch=master \
>>> +"
>>> +
>>> +LICENSE = "Apache-2.0"
>>> +LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
>>> +
>>> +GO_IMPORT = "import"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +PV = "1.5.1+git${SRCREV}"
>>> +
>>> +PACKAGES =+ "${PN}-contrib"
>>> +
>>> +PODMAN_PKG = "github.com/containers/libpod"
>>> +BUILDTAGS = "seccomp systemd exclude_graphdriver_btrfs exclude_graphdriver_devicemapper"
>> On my other similar recipes, I've been asked to make this a ?= so it
>> can be easily overridden. Is that possible here ?
>>
> Yes, seems to work just fine.
>
>>> +
>>> +# overide LDFLAGS to allow criu to build without: "x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'"
>> Is this a debug statement left in, or is it relevant to podman ?
>>
> This actually applies to podman as well, so I copied the export and the
> comment from the criu recipe.
>
> Will fix the comment though to mention podman.
>
>
>>> +export LDFLAGS=""
>>> +
>>> +inherit go goarch
>>> +inherit systemd pkgconfig
>>> +
>>> +do_configure[noexec] = "1"
>>> +
>>> +EXTRA_OEMAKE = " \
>>> +     PREFIX=${prefix} BINDIR=${bindir} LIBEXECDIR=${libexecdir} \
>>> +     ETCDIR=${sysconfdir} TMPFILESDIR=${nonarch_libdir}/tmpfiles.d \
>>> +     SYSTEMDDIR=${systemd_unitdir}/system USERSYSTEMDDIR=${systemd_unitdir}/user \
>>> +"
>>> +
>>> +do_compile() {
>>> +       # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>>> +       # docker to download its dependencies but rather
>>> +       # use dependencies packaged independently.
> This comment is actually a leftover so removed this.
>
>>> +       cd ${S}/src
>>> +       rm -rf .gopath
>>> +       mkdir -p .gopath/src/"$(dirname "${PODMAN_PKG}")"
>>> +       ln -sf ../../../../import/ .gopath/src/"${PODMAN_PKG}"
>>> +
>>> +       ln -sf "../../../import/vendor/github.com/varlink/" ".gopath/src/github.com/varlink"
>>> +
>>> +       export GOPATH="${S}/src/.gopath"
>>> +       export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
>>> +
>>> +       cd ${S}/src/.gopath/src/"${PODMAN_PKG}"
>>> +
>>> +       make cmd/podman/varlink/iopodman.go GO=go
> After cleaning and rebuilding I actually noticed that the current state
> does not build. I must have interfered manually to make it build and
> forgot to fix-up.
>
> This make call needs this before executing:
> export GOARCH="${BUILD_GOARCH}"
>
>> I've been trying to squash out all the raw calls to make. Does this
>> work if oe_runmake is used ?
> With the above, oe_runmake seems to work just fine.
>
>> Also, out of curiosity, if GO=go isn't set .. what executable does it
>> try to run ?
> Without GO=go it seems to use "arm-...-linux-gnueabi-go", and fails with
> a exec format error:
>
> NOTE: make -j 40 PREFIX=/usr BINDIR=/usr/bin LIBEXECDIR=/usr/libexec
> ETCDIR=/etc TMPFILESDIR=/usr/lib/tmpfiles.d
> SYSTEMDDIR=/usr/lib/systemd/system USERSYSTEMDDIR=/usr/lib/systemd/user
> cmd/podman/varlink/iopodman.go
> GO111MODULE=off arm-tdx-linux-gnueabi-go generate
> ./cmd/podman/varlink/...
> fork/exec
> /home/ags/torizoncore/build-colibri-imx7/tmp-torizon/work/cortexa7t2hf-neon-tdx-linux-gnueabi/podman/1.5.1+git00057929f5acfd98341964d85722383363376d52-r0/go-tmp/go-build868339522/b001/exe/main:
> exec format error
> cmd/podman/varlink/generate.go:3: running "go": exit status 1
> make: *** [Makefile:475: cmd/podman/varlink/iopodman.go] Error 1
> ERROR: oe_runmake failed
>
>
>
>>> +
>>> +       # Pass the needed cflags/ldflags so that cgo
>>> +       # can find the needed headers files and libraries
>>> +       export GOARCH=${TARGET_GOARCH}
>>> +       export CGO_ENABLED="1"
>>> +       export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>>> +       export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>>> +
>>> +       make BUILDTAGS="${BUILDTAGS}"
>> Same here. Does oe_runmake work ?
> Yes, also here oe_runmake seems to do no harm.
>
> Thanks for reviewing!
>
> --
> Stefan
>
>> Bruce
>>
>>> +}
>>> +
>>> +do_install() {
>>> +       cd ${S}/src/.gopath/src/"${PODMAN_PKG}"
>>> +
>>> +       oe_runmake install install.docker DESTDIR="${D}"
>>> +}
>>> +
>>> +FILES_${PN} += " \
>>> +    ${systemd_unitdir}/system/* \
>>> +    ${systemd_unitdir}/user/* \
>>> +    ${nonarch_libdir}/tmpfiles.d/* \
>>> +    ${sysconfdir}/docker \
>>> +"
>>> +
>>> +RDEPENDS_${PN} += "conmon runc-opencontainers iptables cni skopeo"
>>> --
>>> 2.20.1
>>>
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization


