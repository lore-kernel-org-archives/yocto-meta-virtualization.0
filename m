Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2B6EBE00D63; Mon,  9 Sep 2019 14:30:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 914F3E00D33
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 14:30:43 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 1CA5E5C02CE;
	Mon,  9 Sep 2019 23:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1568064642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=igWJIjo7Kwop6a8nHh2PeZOJHO1NGaQj2ZKOONWLPK0=;
	b=b0wkp3LT+4t9ciRpL0wsebueOsUmYTbcP7A3+0e7qjNFqj3NDGQjUdNv4afXiirsiPB997
	2SLIJ+AdWfZwe+HEhZqrXjjM2EeBQFPeuneIFMWOZo6prRg9UYLhVoKS6QUetjBUaBeWW+
	c9ElfGqpOcmvuliXpwXH0bx4LTKvJQo=
MIME-Version: 1.0
Date: Mon, 09 Sep 2019 23:30:42 +0200
From: Stefan Agner <stefan@agner.ch>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4PFq2jB5P=ddSz3uix2yiQHTP83L1HG+GEvZOp+5p3fEQ@mail.gmail.com>
References: <20190901203338.38768-1-stefan@agner.ch>
	<20190901203338.38768-7-stefan@agner.ch>
	<CADkTA4PFq2jB5P=ddSz3uix2yiQHTP83L1HG+GEvZOp+5p3fEQ@mail.gmail.com>
Message-ID: <0419a9fd20ad8432e59738bf375386c3@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
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
X-List-Received-Date: Mon, 09 Sep 2019 21:30:45 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-09-03 19:26, Bruce Ashfield wrote:
> I'm assuming the subject should be "podman" and not "podmon".

Whoops, thanks for pointing out.

> 
> On Sun, Sep 1, 2019 at 4:34 PM Stefan Agner <stefan@agner.ch> wrote:
>>
>> From: Stefan Agner <stefan.agner@toradex.com>
>>
>> Podman is a daemonless container engine for developing, managing, and
>> running OCI Containers on your Linux System. Containers can either be
>> run as root or in rootless mode.
>>
>> This patch adds the initial recipe for podman. Currently a minimal
>> feature set is supported. It seems that libseccomp is mandatory, which
>> makes meta-security a mandatory dependency for this recipe.
>>
>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> ---
>>  recipes-containers/podman/podman_git.bb | 91 +++++++++++++++++++++++++
>>  1 file changed, 91 insertions(+)
>>  create mode 100644 recipes-containers/podman/podman_git.bb
>>
>> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
>> new file mode 100644
>> index 0000000..6f4e7d4
>> --- /dev/null
>> +++ b/recipes-containers/podman/podman_git.bb
>> @@ -0,0 +1,91 @@
>> +HOMEPAGE = "https://podman.io/"
>> +SUMMARY =  "A daemonless container engine"
>> +DESCRIPTION = "Podman is a daemonless container engine for developing, \
>> +    managing, and running OCI Containers on your Linux System. Containers can \
>> +    either be run as root or in rootless mode. Simply put: \
>> +    `alias docker=podman`. \
>> +    "
>> +
>> +DEPENDS = " \
>> +    go-metalinter-native \
>> +    go-md2man-native \
>> +    gpgme \
>> +    libseccomp \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>> +"
>> +
>> +SRCREV = "00057929f5acfd98341964d85722383363376d52"
>> +SRC_URI = " \
>> +    git://github.com/containers/libpod.git;branch=master \
>> +"
>> +
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
>> +
>> +GO_IMPORT = "import"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +PV = "1.5.1+git${SRCREV}"
>> +
>> +PACKAGES =+ "${PN}-contrib"
>> +
>> +PODMAN_PKG = "github.com/containers/libpod"
>> +BUILDTAGS = "seccomp systemd exclude_graphdriver_btrfs exclude_graphdriver_devicemapper"
> 
> On my other similar recipes, I've been asked to make this a ?= so it
> can be easily overridden. Is that possible here ?
> 

Yes, seems to work just fine.

>> +
>> +# overide LDFLAGS to allow criu to build without: "x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'"
> 
> Is this a debug statement left in, or is it relevant to podman ?
> 

This actually applies to podman as well, so I copied the export and the
comment from the criu recipe.

Will fix the comment though to mention podman.


>> +export LDFLAGS=""
>> +
>> +inherit go goarch
>> +inherit systemd pkgconfig
>> +
>> +do_configure[noexec] = "1"
>> +
>> +EXTRA_OEMAKE = " \
>> +     PREFIX=${prefix} BINDIR=${bindir} LIBEXECDIR=${libexecdir} \
>> +     ETCDIR=${sysconfdir} TMPFILESDIR=${nonarch_libdir}/tmpfiles.d \
>> +     SYSTEMDDIR=${systemd_unitdir}/system USERSYSTEMDDIR=${systemd_unitdir}/user \
>> +"
>> +
>> +do_compile() {
>> +       # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>> +       # docker to download its dependencies but rather
>> +       # use dependencies packaged independently.

This comment is actually a leftover so removed this.

>> +       cd ${S}/src
>> +       rm -rf .gopath
>> +       mkdir -p .gopath/src/"$(dirname "${PODMAN_PKG}")"
>> +       ln -sf ../../../../import/ .gopath/src/"${PODMAN_PKG}"
>> +
>> +       ln -sf "../../../import/vendor/github.com/varlink/" ".gopath/src/github.com/varlink"
>> +
>> +       export GOPATH="${S}/src/.gopath"
>> +       export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
>> +
>> +       cd ${S}/src/.gopath/src/"${PODMAN_PKG}"
>> +
>> +       make cmd/podman/varlink/iopodman.go GO=go
> 

After cleaning and rebuilding I actually noticed that the current state
does not build. I must have interfered manually to make it build and
forgot to fix-up.

This make call needs this before executing:
export GOARCH="${BUILD_GOARCH}"

> I've been trying to squash out all the raw calls to make. Does this
> work if oe_runmake is used ?

With the above, oe_runmake seems to work just fine.

> 
> Also, out of curiosity, if GO=go isn't set .. what executable does it
> try to run ?

Without GO=go it seems to use "arm-...-linux-gnueabi-go", and fails with
a exec format error:

NOTE: make -j 40 PREFIX=/usr BINDIR=/usr/bin LIBEXECDIR=/usr/libexec
ETCDIR=/etc TMPFILESDIR=/usr/lib/tmpfiles.d
SYSTEMDDIR=/usr/lib/systemd/system USERSYSTEMDDIR=/usr/lib/systemd/user
cmd/podman/varlink/iopodman.go
GO111MODULE=off arm-tdx-linux-gnueabi-go generate
./cmd/podman/varlink/...
fork/exec
/home/ags/torizoncore/build-colibri-imx7/tmp-torizon/work/cortexa7t2hf-neon-tdx-linux-gnueabi/podman/1.5.1+git00057929f5acfd98341964d85722383363376d52-r0/go-tmp/go-build868339522/b001/exe/main:
exec format error
cmd/podman/varlink/generate.go:3: running "go": exit status 1
make: *** [Makefile:475: cmd/podman/varlink/iopodman.go] Error 1
ERROR: oe_runmake failed



> 
>> +
>> +       # Pass the needed cflags/ldflags so that cgo
>> +       # can find the needed headers files and libraries
>> +       export GOARCH=${TARGET_GOARCH}
>> +       export CGO_ENABLED="1"
>> +       export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>> +       export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>> +
>> +       make BUILDTAGS="${BUILDTAGS}"
> 
> Same here. Does oe_runmake work ?

Yes, also here oe_runmake seems to do no harm.

Thanks for reviewing!

--
Stefan

> 
> Bruce
> 
>> +}
>> +
>> +do_install() {
>> +       cd ${S}/src/.gopath/src/"${PODMAN_PKG}"
>> +
>> +       oe_runmake install install.docker DESTDIR="${D}"
>> +}
>> +
>> +FILES_${PN} += " \
>> +    ${systemd_unitdir}/system/* \
>> +    ${systemd_unitdir}/user/* \
>> +    ${nonarch_libdir}/tmpfiles.d/* \
>> +    ${sysconfdir}/docker \
>> +"
>> +
>> +RDEPENDS_${PN} += "conmon runc-opencontainers iptables cni skopeo"
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization

